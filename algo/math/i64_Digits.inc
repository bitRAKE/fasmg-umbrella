if __SOURCE__ = __FILE__ ;------------------------------------------- TEST CASES
format PE64 NX CONSOLE 6.2 at 0x1234_5678_0000 ; 64-bit addresses throughout
include 'umbrella.g'
main: entry $
push rax
fpu_setup ; required!
GetStdHandle STD_OUTPUT_HANDLE
xchg rbx, rax
xor esi, esi ; failed test count, %ERRORLEVEL% on exit
label .P5:8 at rsp+32

iterate <EXPECTED,	NUMBER>,		\
\;	1,		0,			\
\;	1,		9,			\
\;	2,		10,			\
\;	2,		99,			\
\;	3,		100,			\
\;	3,		999,			\
\;	4,		1000,			\
\;	4,		9999,			\
\;	5,		10000,			\
\;	5,		99999,			\
\;	6,		100000,			\
\;	6,		999999,			\
\;	7,		1000000,		\
\;	7,		9999999,		\
\;	8,		10000000,		\
\;	8,		99999999,		\
\;	9,		100000000,		\
\;	9,		999999999,		\
\;	10,		1000000000,		\
\;	10,		9999999999,		\
\;	11,		10000000000,		\
\;	11,		99999999999,		\
\;	12,		100000000000,		\
\;	12,		999999999999,		\
\;	13,		1000000000000,		\
\;	13,		9999999999999,		\
\;	14,		10000000000000,		\
\;	14,		99999999999999,		\
\;	15,		100000000000000,	\
\;	15,		999999999999999,	\
\;	16,		1000000000000000,	\
\;	16,		9999999999999999,	\
\;	17,		10000000000000000,	\
\;	17,		99999999999999999,	\
\;	18,		100000000000000000,	\
	18,		999999999999999998,	\; 19
	18,		999999999999999999,	\; 19, ERROR!
	19,		1000000000000000000,	\; 19
	19,		((1 shl 63)-1),		\; 19, signed limit
	19,		9999999999999999999,	\;-0x800..
	20,		10000000000000000000,	\;-0x800..
;	20,		99999999999999999999

	virtual DATA.1
		label .%.string
		repeat 1, N:NUMBER, E:EXPECTED
			db 9,'< 10^',`E,' = ',`N,13,10
		end repeat
		.%.strlen := $ - .%.string
	end virtual

	mov rcx, NUMBER
	call i64__Digits
	cmp rax, EXPECTED
	jnz .%.bad_result
	lea rdx, <_A 27,'[32m','pass',27,'[m'>
	; FAIL (compile-time) = FAIL (run-time), or value correct
	jz .%.continue
.%.bad_result:
	lea rdx, <_A 27,'[91m','FAIL',27,'[m'>
	inc esi ; test case did not pass
.%.continue:
	WriteConsoleA rbx, rdx, .bytes, & .P5, 0
	WriteConsoleA rbx, & .%.string, .%.strlen, & .P5, 0
end iterate

ExitProcess rsi ; return failed tests
int3
end if;-------------------------------------------------------------- TEST CASES


macro fpu_setup ; required
	fnstcw [rsp]
	and word [rsp], not 11_11_0000_0000b
	or word [rsp], 10_11_0000_0000b ; round to inf, extended
	fldcw [rsp]
end macro

align 16, codepad #
i64__Digits: ; 20 bytes, zero cache-misses, mostly correct

; TODO: process negative values

	jrcxz .zero
	push rcx
	fldlg2 ; log_10(2) constant
	fild qword [rsp]
	fyl2x
	fistp qword [rsp]
	pop rax
	retn
align 16, codepad #
.zero:
	push 1
	pop rax
	retn

align 16, codepad #
u64__Digits:
	mov rax, 99_9999_9999_9999_9999
	cmp rcx, rax
	jc i64__Digits
	push 18
	pop rax
	jz .18
	mov rdx, 1000_0000_0000_0000_0000
	cmp rcx, rdx
	jc .19
	inc eax
.19:	inc eax
.18:	retn




