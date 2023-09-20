if __SOURCE__ = __FILE__ ;------------------------------------------- TEST CASES
format PE64 NX CONSOLE 6.2 at 0x1234_5678_0000 ; 64-bit addresses throughout
include 'umbrella.g'
main: entry $
push rax
GetStdHandle STD_OUTPUT_HANDLE
xchg rbx, rax
xor esi, esi ; failed test count, %ERRORLEVEL% on exit
label .P5:8 at rsp+32

iterate <EXPECTED,	NUMBER,				DESCRIPTION>,\
	FAIL,		<<0>>,				'empty, insufficient digits',\
	FAIL,		<<'.',0>>,			'non-number, insufficient digits',\
	FAIL,		<<'-',0>>,			'sign, insufficient digits',\
	FAIL,		0x1_0000_0000_0000_0000,	'overflow, radix',\
	FAIL,		0x8000_0000_0000_0000,		'overflow',\
	PASS,		0x7FFF_FFFF_FFFF_FFFF,		'maximum value',\
	PASS,		0,				'zero',\
	PASS,		-0x7FFF_FFFF_FFFF_FFFF,		'sign, prior pass complement',\
	PASS,		-0x8000_0000_0000_0000,		'minimum value',\
	FAIL,		-0x8000_0000_0000_0001,		'overflow',\
; Basically, same as unsigned prior result.
;	FAIL,		-0x1_0000_0000_0000_0000,	'overflow, radix',\

	virtual DATA.1
		label .%.string
		db 9,DESCRIPTION,', "'
		label .%.number
		match < ANY >, NUMBER
			db ANY
		else if NUMBER < 0
			repeat 1, N:-NUMBER
				db '-',`N,0
			end repeat
		else
			repeat 1, N:NUMBER
				db `N,0
			end repeat
		end if
		.%.strlen := $ - .%.string
	end virtual

	lea rdi, [.%.number]
	call atoi64_RDI
	match =PASS, EXPECTED
		; PASS (compile-time) != PASS (run-time)
		jz .%.bad_result
		virtual CONST.8
			.%.value dq NUMBER
		end virtual
		cmp [.%.value], rax
	end match
	; FAIL (compile-time) != FAIL (run-time), or value incorrect
	jnz .%.bad_result
	lea rdx, <_A 13,10,27,'[32m','pass',27,'[m'>
	WriteConsoleA rbx, rdx, .bytes, & .P5, 0
	jmp .%.continue
.%.bad_result:
	inc esi
	lea rdx, <_A 13,10,27,'[91m','FAIL',27,'[m'>
	WriteConsoleA rbx, rdx, .bytes, & .P5, 0
.%.continue:
	mov byte [.%.string + .%.strlen - 1], '"'
	WriteConsoleA rbx, & .%.string, .%.strlen, & .P5, 0
end iterate

; TODO: perform batch of random tests in boundary ranges
; [-0x2_0000_0000_0000_0000, 0x2_0000_0000_0000_0000]

ExitProcess rsi ; return failed tests
int3
end if;-------------------------------------------------------------- TEST CASES

if used atoi64_RDI
; Translate ASCII decimal digits (and sign) to signed-qword value,
; stop on any other byte value. (End of digits acts as token separator.)

; RAX is signed qword result
; RDX [0,9]
; RCX digits read
; ZF = 1, invalid result
align 16, codepad #
atoi64_RDI:
	xor ecx, ecx
	cmp byte [rdi], '-'
	setz cl
	add rdi, rcx
	bts rcx, 63
	xor eax, eax
	push rdi
.read_digits:
	movzx edx, byte [rdi]
	sub edx, '0'
	cmp edx, 10
	jnc .done
	imul rax, rax, 10
	jo .overflow
	add rdi, 1
	add rax, rdx
	cmp rax, rcx ; 0x8000_0000_0000_0000,	0x8000_0000_0000_0001
	jc .read_digits
.overflow:
	pop rdi ; digits
	push rdi ; force zero, fall through ...
.done:
	jecxz .positive ; note ECX!
	neg rax
.positive:
	pop rcx
	sub ecx, edi
	retn ; ZF=1, RCX=0 on error
; ZF=1, RCX=0 on error
; RDI updated
; RAX signed-qword

;repeat 1, B:$-atoi64_RDI
;	display 10,`B,' bytes, atoi64_RDI:'
;end repeat

end if ; used atoi64_RDI
