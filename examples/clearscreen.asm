
; basic example using fasmg's lowest level windows support

format PE64 CONSOLE 6.2 at 0x1_4000_0000
include 'format\format.inc'
include 'macro\import64.inc'
include '..\..\utility\align.inc'

section '.data' data readable writeable

_clear_screen db 27,'[H',27,'[J'
_clear_screen.characters := $ - _clear_screen

section '.text' code readable executable

main:
	entry $
	virtual at rsp
			dq ?	; shadow space
			dq ?
			dq ?
			dq ?
		.P5	dq ?	; fifth parameter

	; some local space on the stack for temporary data:
		.hStdIn		dq ?
		.hStdOut	dq ?
		.dwTemp		dd ?
		.mode		dd ?

		align.assume rsp, 16
		align 16 | 8

		.stack_offset := $ - $$
	end virtual
	sub rsp, .stack_offset

	mov rcx, -10 ; STD_INPUT_HANDLE
	call [GetStdHandle]
	mov [.hStdIn], rax

	mov rcx, -11 ; STD_OUTPUT_HANDLE
	call [GetStdHandle]
	mov [.hStdOut], rax

; https://learn.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences

	lea rdx, [.mode]
	mov rcx, [.hStdIn]
	call [GetConsoleMode]
	xchg ecx, eax ; BOOL
	jrcxz .fail

	mov edx, [.mode]
	or edx, 0x0200 ; ENABLE_VIRTUAL_TERMINAL_INPUT
	mov rcx, [.hStdIn]
	call [SetConsoleMode]
	xchg ecx, eax ; BOOL
	jrcxz .fail

	lea rdx, [.mode]
	mov rcx, [.hStdOut]
	call [GetConsoleMode]
	xchg ecx, eax ; BOOL
	jrcxz .fail

	mov edx, [.mode]
	or edx, 0x000C ; ENABLE_VIRTUAL_TERMINAL_PROCESSING or DISABLE_NEWLINE_AUTO_RETURN
	mov rcx, [.hStdOut]
	call [SetConsoleMode]
	xchg ecx, eax ; BOOL
	jrcxz .fail

	mov [.P5], 0
	lea r9, [.dwTemp]
	mov r8d, _clear_screen.characters
	lea rdx, [_clear_screen]
	mov rcx, [.hStdOut]
	call [WriteConsoleA]
.fail:
	mov ecx, 0
	call [ExitProcess]
	int3

section '.idata' import data readable

library kernel32, 'kernel32.dll'

import kernel32,\
	ExitProcess, 'ExitProcess',\
	GetConsoleMode, 'GetConsoleMode',\
	GetStdHandle, 'GetStdHandle',\
	SetConsoleMode, 'SetConsoleMode',\
	WriteConsoleA, 'WriteConsoleA'
