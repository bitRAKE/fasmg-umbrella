
; show restricted console input

format PE64 CONSOLE 6.2 at 0x1_0000
include 'umbrella.g'

ENABLE_LINE_INPUT := 0x0002
ENABLE_ECHO_INPUT := 0x0004

; get any character w/o echo, ignore other input: mouse, control keys, ...
getch:
	virtual at rbp - .frame
				rq 4
		.P5		dq ?

		.hIn		dq ?
		.dwRead		dd ?
		.oldInMode	dd ?
		.buffer		dw ? ; just need space for a single character
				align.assume rbp, 16
				align 16
		.frame = $ - $$
	end virtual
	enter .frame, 0
	GetStdHandle STD_INPUT_HANDLE
	mov [.hIn], rax

	GetConsoleMode [.hIn], & .oldInMode
	mov edx, not (ENABLE_LINE_INPUT or ENABLE_ECHO_INPUT)
	and edx, [.oldInMode]
	SetConsoleMode [.hIn], rdx

	ReadConsoleW [.hIn], & .buffer, (sizeof .buffer)/2, & .dwRead, 0
	test eax, eax
	jnz .okay
	; non-console handle?
	mov [.buffer], ax ; force zero return
.okay:
	SetConsoleMode [.hIn], DWORD [.oldInMode]
	movzx eax, [.buffer]
	leave
	retn


align 32, codepad #
digit_table db '0123456789ABCDEFGHIJKLMNOPQRSTUV' ; "base32hex", RFC 2938, Sec.3-1

UINT64__Baseform:
; RAX: number to convert
; RCX: number base to use [2,32] radix
; RDI: string buffer of length [65,14] bytes
	push 0 ; sentinel
.A:	xor edx,edx
	div rcx
	push qword [digit_table+rdx] ; #32#
	test rax,rax
	jnz .A

.B:	pop rax
	stosb
	test al,al
	jnz .B
	retn


;-------------------------------------------------------------------------------
main: ENTRY $
	virtual at rbp - .frame
				rq 4
		.P5		dq ?

		.hOut		dq ?

		.buffer		rb 16
		.dwRead		dd ?
				align.assume rbp, 16
				align 16
		.frame = $ - $$
	end virtual
	enter .frame, 0
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut], rax


@@:
	call getch

; display character hexadecimal
cmp eax, 0x20 ; <space> to quit
jz @F
mov ecx, 16
lea rdi, [.buffer]
call UINT64__Baseform

mov byte [rdi-1], ' '
lea edx, [.buffer]
sub edi, edx
	WriteConsoleA [.hOut], rdx, rdi, & .dwRead, 0

	jmp @B
@@:
	ExitProcess 0
	int3
