; xoshiro threading test template
; showing how to distribute random context

format PE64 CONSOLE 6.2 at 0x1234_56780000
; _downlevel is used for wsprintfW
define UMBRELLA_LIBRARY "OneCoreUAP_downlevel"
include 'umbrella.inc.g'

include 'cpu\ext\avx2.inc'
;include 'cpu\ext\bmi2.inc'
include 'cpu/ext/rdseed.inc'
include 'cpu/ext/rdrand.inc'
; RDTSCP forces all older instructions to retire before reading the time-stamp counter.
include 'cpu\ext\rdtscp.inc' ; CPUID Fn8000_0001_EDX[RDTSCP] = 1


; use thread state for random context
include 'xoshiro256.inc',define xoshiro256.state _Thread.xo_ctx


STACK 0,0 ; effects thread creation stack
HEAP 0,0

__CACHE_LINE__ := 64

; trying to make thread local data more accessible
macro ThreadData_at base*
	virtual at base
		.id	dd ?
		.flags	dd ?
		.tsc	dq ?	; cached time
			dq ?	; non-cached time
			dq ?
		.xo_ctx: rb 32

;		.f0	dq ?
;		.fx	dt ?
;		.fy	dt ?

		if ~ definite ThreadData.bytes
			_align __CACHE_LINE__
			ThreadData.bytes := $ - $$
		end if
	end virtual
end macro

align __CACHE_LINE__
_Thread:
	.UNROLL := 100

	push rbp
	mov rbp,rcx
	ThreadData_at RBP
	mov [.flags],0
.reset:
;TIME░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░START░
	rdtscp
	mov dword [.tsc],eax
	mov dword [.tsc+4],edx
; 40/80 cycle overhead

	call xoshiro256.next

;TIME░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░END░
	rdtscp

	mov [.id],ecx
	shl rdx,32
	add rax,rdx
	sub rax,[.tsc]

	; now that cachelines are loaded, try again
	btc [.flags],0
	sbb rdx,rdx
	mov [.tsc+rdx*8+8],rax
	jnc .reset

	pop rbp
	retn






_1000.0 dq 1000.0

; resolve statistics for specific value amongst threads, using relative offset
ItemStats:
	virtual at RBP-.frame
			rq 4
	.P5		dq ?
	.hOut		dq ?

	.sum		dq ?
	.min		dq ?
	.max		dq ?

	.avg.i		dq ?
	.avg.h		dq ?
	.dev.i		dq ?
	.dev.h		dq ?

	.avg		dq ? ; mean
	.dev		dq ? ; deviation
	.var		dq ? ; variance
		_align 16
	.frame := $ - $$
	end virtual
	enter .frame,0
	mov [.sum],0
	mov [.min],-1
	mov [.max],0

	imul ebx,edi,ThreadData.bytes
	jmp @9F
.inti:
	mov rdx,[rsi + rbx]

	cmp [.max],rdx
	jnc @F
	mov [.max],rdx
@@:
	cmp rdx,[.min]
	jnc @F
	mov [.min],rdx
@@:
	add [.sum],rdx
@9:
	sub ebx,ThreadData.bytes
	jns .inti

	vcvtsi2sd xmm0,xmm0,[.sum]
	vcvtsi2sd xmm1,xmm1,rdi
	vdivsd xmm0,xmm0,xmm1
	vmovsd [.avg],xmm0

	vcvttsd2si rax,xmm0
	mov [.avg.i],rax
	vcvtsi2sd xmm1,xmm1,rax
	vsubsd xmm0,xmm0,xmm1
	vmulsd xmm0,xmm0,[_1000.0]
	vcvttsd2si rax,xmm0
	mov [.avg.h],rax

	vxorpd xmm0,xmm0,xmm0
	imul ebx,edi,ThreadData.bytes
	jmp @9F
.varf:
	vcvtsi2sd xmm1,xmm1,qword [rsi + rbx]
	vsubsd xmm1,xmm1,[.avg]
	vmulsd xmm1,xmm1,xmm1
	vaddsd xmm0,xmm0,xmm1
@9:
	sub ebx,ThreadData.bytes
	jns .varf
	vcvtsi2sd xmm1,xmm1,rdi
	vdivsd xmm0,xmm0,xmm1
	vmovsd [.var],xmm0
	vsqrtsd xmm0,xmm0,xmm0
	vmovsd [.dev],xmm0

	vcvttsd2si rax,xmm0
	mov [.dev.i],rax
	vcvtsi2sd xmm1,xmm1,rax
	vsubsd xmm0,xmm0,xmm1
	vmulsd xmm0,xmm0,[_1000.0]
	vcvttsd2si rax,xmm0
	mov [.dev.h],rax

	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut],rax
	wvsprintfW ADDR buffer,<_W \
		9,"%ld minimum",\
		9,"%ld maximum",\
		9,"%ld.%.3d average",\
		9,"%ld.%.3d deviation",10>,ADDR .min
	lea r8,[rax*2] ; UCS-2 characters to byte count
	WriteFile [.hOut],ADDR buffer,r8,0,0
	leave
	retn




WinMain.fatal:
	ExitProcess 1
	int3

WinMain:entry $
	virtual at RBP-.frame
			rq 4
	.P5		dq ?
	.P6		dq ?

	.hThread	rq 64	; handles
	.tID		rq 64	; IDs

	.sAff		dq ?	; SystemAffinityMask
	.pAff		dq ?	; ProcessAffinityMask

	.hOut		dq ?
		_align 16
	.frame := $ - $$
	end virtual
	enter .frame,0

; Windows 11 no longer constrains an application to one processor group.
; Insure process affinity is system affinity (note: this will fail when there are multiple processor groups being utilized):

	GetProcessAffinityMask -1,ADDR .pAff,ADDR .sAff
	xchg ecx,eax
	jrcxz .fatal
	SetProcessAffinityMask -1,[.sAff]
	xchg ecx,eax
	jrcxz .fatal

	xor edi,edi
	xor ebx,ebx
.more_threads:
	bt dword [.sAff],ebx
	jnc .next_thread
	imul eax,edi,ThreadData.bytes
	lea r9,[ThreadData]
	add r9,rax
	CreateThread 0,0, ADDR _Thread, r9, CREATE_SUSPENDED, ADDR .tID+rdi*8
	mov [.hThread + rdi*8],rax
	xchg rcx,rax
	jrcxz .next_thread
	xor edx,edx
	bts rdx,rbx
	SetThreadAffinityMask rcx, rdx
	xchg ecx,eax
	jrcxz .bad_thread
	inc edi
	jmp .next_thread
.bad_thread:
	CloseHandle [.hThread + rdi*8]
.next_thread:
	inc ebx
	cmp ebx,64
	jc .more_threads

	; RDI : number of valid threads

	; set YMM0 to PRNG seed
	mov ecx,4
.seed_loop:
        rdseed rax
        jc @f
        rdrand rax
        jc @f
        rdtsc
        xor eax,edx
        mul qword [dword 0x7FFE0008] ; use KUSER_SHARED_DATA.InterruptTime
@@:	push rax
	loop .seed_loop
	vmovdqu ymm0,[rsp]
	add rsp,32

	mov ebx,edi
@@:
	; spread random generator context to keep thread values unique
	push rbp
	lea rbp,[ThreadData - ThreadData.bytes]
	imul eax,ebx,ThreadData.bytes
	add rbp,rax
	; seed thread PRNG state with prior value, and jump ahead
	vmovdqa [xoshiro256.state],ymm0
;	call xoshiro256.jump128 ; evenly spaced for 128-threads
	call xoshiro256.jump192 ; evenly spaced for 64-threads
	pop rbp

	ResumeThread [.hThread + (rbx-1)*8] ; this shouldn't error
	dec ebx
	jnz @B


MAXIMUM_WAIT_OBJECTS	:= 0x0000_0040 ; same as maximum thread count
;WAIT_ABANDONED		:= 0x0000_0080
;WAIT_TIMEOUT		:= 0x0000_0102
;WAIT_FAILED		:= 0xFFFF_FFFF

	; INFINITE wait for all threads to exit
	WaitForMultipleObjects rdi, ADDR .hThread, 1, -1
	cmp eax,WAIT_ABANDONED+MAXIMUM_WAIT_OBJECTS
	jnc .fatal



	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut],rax

	xor ebx,ebx
.write_result:
	imul eax,ebx,ThreadData.bytes
	lea rsi,[ThreadData]
	add rsi,rax

	wvsprintfW ADDR buffer,<_W "%2d: %d (%d)",10>,rsi
	lea r8,[rax*2] ; UCS-2 characters to byte count
	WriteFile [.hOut],ADDR buffer,r8,0,0

	inc ebx
	cmp ebx,edi
	jnz .write_result

	lea rdx,<du 10,"Uncached Statistics:",10>
	WriteFile [.hOut],rdx,.bytes,0,0
	lea rsi,[ThreadData.tsc + 8]
	call ItemStats

	lea rdx,<du 10,"Cached Statistics:",10>
	WriteFile [.hOut],rdx,.bytes,0,0
	lea rsi,[ThreadData.tsc]
	call ItemStats

	ExitProcess 0
	int3


collect BSS.64
	buffer rw 1024 ; api limits to 1k characters

	align __CACHE_LINE__ ; in case it's larger than 64
	ThreadData rb ThreadData.bytes*64
	ThreadData_at ThreadData
end collect
