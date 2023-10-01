format PE64 NX ASLR CONSOLE 6.2 at 0x1234_5678_0000 ; 64-bit addresses throughout
include 'umbrella.g'
include 'equates\winerror.g'

include 'algo\string\StdErr.inc'

postpone ; kind of hack to put symbols in the global/outer namespace
GLOBAL
end postpone
macro GLOBAL
purge GLOBAL ; one time
end macro


FLAG_BREAK	:= 1 shl 0
virtual BSS.4
	g_Flags dd ?
end virtual

; TODO:		i/o test matrix
;	INPUT:		file	pipe	console	:OUTPUT
;	file		?	?	ok
;	pipe		?	?	ok
;	console		?	?	ok

; This is a little tricky because we want to allow all forms of input, but
; the progrom flow is different for each:
;
; User console input is terminated with an empty line, and line ending chars
; are not included in processing.
;
; File input end by a successful read of size zero.
;
; Pipe input end with error message that the pipe is broken.

if 0 ; not needed
CtrlHandler:
	cmp ecx, CTRL_C_EVENT
	jnz .done
	bts [g_Flags], FLAG_BREAK ; one-time, then prior handling
	jc .done
	enter .frame, 0
	leave
	mov eax, 1 ; TRUE, message handled
	retn
.done:
	xor eax, eax ; FALSE, try next handler
	retn
end if

main: entry $
	virtual at rsp
				rq 4
		.P5		dq ?

	align.assume rsp, 16
	align 16 | 8
	.frame := $ - $$
				dq ?	; return address
		.bytesRead	dd ?
		.bytesWrote	dd ?
	end virtual
	sub rsp, .frame

	iterate <NAMED,	TYPE>,\
		Input,	STD_INPUT_HANDLE,\
		Output,	STD_OUTPUT_HANDLE,\
		Error,	STD_ERROR_HANDLE

		macro GLOBAL
			GLOBAL
			virtual BSS.8
				g_h#NAMED dq ?
			end virtual
			virtual BSS.4
				g_#NAMED#Mode dd ?
			end virtual
		end macro

		GetStdHandle TYPE
		cmp rax, INVALID_HANDLE_VALUE
		jz .fail
		mov [g_h#NAMED], rax
		xchg rcx, rax
		GetFileType rcx
		mov [g_#NAMED#Mode], eax
	end iterate

	cmp [g_InputMode], FILE_TYPE_CHAR
	jnz .not_console_input
;	SetConsoleCtrlHandler & CtrlHandler, TRUE
	lea rdx, <_A "Capturing user input (empty line to stop):",13,10>
	WriteFile [g_hError], rdx, .bytes, & .bytesWrote, 0
.not_console_input:
	VirtualAlloc 0, BUFFER_SIZE, MEM_COMMIT or MEM_RESERVE, PAGE_READWRITE
	test rax, rax ; shouldn't happen
	jnz .process
.fail:
	ExitProcess 1
	int3

	macro GLOBAL
		GLOBAL
		BUFFER_SIZE := 1 shl 16 ; 64K, read/write buffer
		virtual BSS.8
			io_buffer	dq ?
		end virtual
	end macro

.process:
	mov [io_buffer], rax

; initialize model

	jmp .try_read
.more_bytes:

;DEBUG echo
WriteFile [g_hOutput], rsi, 1, & .bytesWrote, 0

	xor eax, eax
	lodsb

; process bytes into model

.try_bytes:
	sub [.bytesRead], 1
	jnc .more_bytes
.try_read:
	mov rsi, [io_buffer]
	ReadFile [g_hInput], rsi, BUFFER_SIZE, & .bytesRead, 0
	test eax, eax ; BOOL
	jz .io_read_end
	cmp [.bytesRead], 0
	jz .io_read_break

; in console mode reduce by line end chars(CR LR) and detect end of input:

	cmp [g_InputMode], FILE_TYPE_CHAR
	jnz .try_bytes
	sub [.bytesRead], 3
	jnc .more_bytes
	jmp .io_read_break
.io_read_end:

; Input type determines error(s) we can ignore based on expectation.

	GetLastError
	cmp [g_InputMode], FILE_TYPE_PIPE
	jnz .io_read_error
	cmp eax, ERROR_BROKEN_PIPE
	jz .io_read_break
.io_read_error:
	call StdErr_WriteErrorUTF8
	ExitProcess 1
	int3
.io_read_break:


; TODO: ... process model to output ...


	ExitProcess 0
	int3
