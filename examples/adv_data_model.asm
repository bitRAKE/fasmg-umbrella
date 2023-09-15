include 'adv_data_model.g'

virtual CONST.1
	_clear_screen db 27,'[H',27,'[J'
	_clear_screen.characters := $ - _clear_screen
end virtual

virtual BSS.2
	TestLabel0:
		db 0
		align 2
end virtual
virtual BSS.2
	TestLabel1:
		db 0
		align 2
end virtual

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

mov ax, [TestLabel0]
mov cx, [TestLabel1]


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
