format PE64 CONSOLE 6.2 at 0x1_0000
define UMBRELLA_LIBRARY "windowscoreheadless"
include 'umbrella.inc.g'

collect CONST.1
	digit_table db '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
end collect

UINT64__Baseform:
; RAX number to convert
; RCX number base to use [2,36]
; RDI string buffer of length [65,14] bytes
	push 0
.A:	xor edx,edx
	div rcx
	push qword [digit_table+rdx]
	test rax,rax
	jnz .A

.B:	pop rax
	stosb
	test al,al
	jnz .B
	retn
; RCX unchanged
; RAX 0
; RDI end of null-terminated string

UINT64__Baseform_FixedWidth:
; RAX number to convert
; RCX number base to use [2,36]
; RSI number of characters to output
; RDI string buffer of length [65,14] bytes
	push 0
.A:	xor edx,edx
	div rcx
	push qword [digit_table+rdx]
	dec esi
	jnz .A

.B:	pop rax
	stosb
	test al,al
	jnz .B
	retn
; RCX unchanged
; RAX 0
; RDI end of null-terminated string


WinMain:entry $
	virtual at RBP-.FRAME
			rq 4
		.P5	dq ?

		.hStdOut	dq ?
		.rit		dd ?
		.i		dd ?
		.j		dd ?

		_align 16
		.FRAME := $ - $$
	end virtual
	push rsi rdi
	enter	.FRAME,0
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hStdOut],rax

; see: https://en.wikipedia.org/wiki/ANSI_escape_code
; https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences?redirectedfrom=MSDN
; https://ss64.com/nt/syntax-ansi.html
;	! version before 1511/1903 should use a third party terminal
;	- windows 1511 to 1903, requires registry change to enable ANSI colors
;	- windows 10, has 24-bit color support

; older version of windows require features to be enabled
if definite Have_an_older_Windows_version.
	ENABLE_VIRTUAL_TERMINAL_PROCESSING := 0x0004
	ENABLE_VIRTUAL_TERMINAL_INPUT := 0x0200

	GetConsoleMode [.hStdOut],ADDR .dwMode
	or [.dwMode],ENABLE_VIRTUAL_TERMINAL_PROCESSING or DISABLE_NEWLINE_AUTO_RETURN
	SetConsoleMode [.hStdOut],[.dwMode]

	GetConsoleMode [.hStdIn],ADDR .dwMode
	or [.dwMode],ENABLE_VIRTUAL_TERMINAL_INPUT
	SetConsoleMode [.hStdIn],[.dwMode]
end if

	collect CONST.1
	.msg db \
		27,'[32m',\
		'green',10,\
		27,'[38;5;10m',\
		'also green',10,\
		27,'[38;2;0;255;0m',\
		'also green',10,\
		27,'[6;31m',\
		'bright blinky red',10,\
		27,'[m',\
		'back to noral text',10
	.msg_bytes := $ - .msg
	end  collect
	WriteConsoleA [.hStdOut],ADDR .msg,.msg_bytes,ADDR .rit,0

	mov [.i],0
.lines:
	mov [.j],0
.parts:
	imul eax,[.i],10
	add eax,[.j]
	cmp eax,107
	ja .break

;	movzx r8,al
;	movzx r9,al
;	wsprintfA ADDR buffer,<_A 27,'[%dm %3d',27,'[m'>,r8,r9
;	xchg r8,rax

; SHLWAPI *sprintf*, functions are supported in headless, but we can do it ourselves:

	lea rdi,[buffer+2]
	mov byte [rdi-2],27
	mov byte [rdi-1],'['
	push rax
	mov ecx,10
	call UINT64__Baseform
	scasb
	mov byte [rdi-2],'m'
	mov byte [rdi-1],' '
	pop rax
	mov esi,3
	call UINT64__Baseform_FixedWidth
	mov byte [rdi-1],27
	mov ax,'[m'
	stosw
	push rdi
	pop r8
	sub r8,buffer

	WriteConsoleA [.hStdOut],ADDR buffer,r8,ADDR .rit,0

	inc [.j]
	cmp [.j],10
	jnz .parts
.break:
	define .Linefeed (.msg + .msg_bytes - 1)
	WriteConsoleA [.hStdOut],ADDR .Linefeed,1,ADDR .rit,0

	inc [.i]
	cmp [.i],11
	jnz .lines



	xor eax,eax
	leave
	pop rdi rsi
	retn

collect BSS.64
	buffer rw 1024
end collect
