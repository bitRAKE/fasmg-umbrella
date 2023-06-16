
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
		.hStdOut	dq ?
		.dwTemp		dd ?

		align.assume rsp, 16
		align 16 | 8

		.stack_offset := $ - $$
	end virtual
	sub rsp, .stack_offset

	mov rcx, -11 ; STD_OUTPUT_HANDLE
	call [GetStdHandle]
	mov [.hStdOut], rax

	mov [.P5], 0
	lea r9, [.dwTemp]
	mov r8d, _clear_screen.characters
	lea rdx, [_clear_screen]
	mov rcx, [.hStdOut]
	call [WriteConsoleA]

	mov ecx, 0
	call [ExitProcess]
	int3

section '.idata' import data readable

library kernel32, 'kernel32.dll'

import kernel32,\
	ExitProcess, 'ExitProcess',\
	GetStdHandle, 'GetStdHandle',\
	WriteConsoleA, 'WriteConsoleA'
