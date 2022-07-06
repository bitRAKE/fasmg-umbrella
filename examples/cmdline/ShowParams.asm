format PE64 CONSOLE 6.2 at 0x1234_56780000
; _downlevel is used for wsprintfW, otherwise icu.dll needs to be used
define UMBRELLA_LIBRARY "OneCoreUAP_downlevel"
include 'umbrella.inc.g'

struct UNICODE_STRING
	Length		dw ?	; USHORT, bytes
	MaximumLength	dw ?	; USHORT, bytes
			dw ?,?	;
	Buffer		dq ?	; PWSTR ; array of MaximumLength words
ends

Main:
	virtual at RBP-.frame
				rq 4
		.P5		dq ?

		.hStdOut	dq ?
		.cmdsW		dq ?
		.argc		dd ?
		.kitten		dd ?

		_align 16
		.frame := $ - $$
	end virtual
	push rbx rdi
	enter .frame,0
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hStdOut],rax
	WriteConsoleW [.hStdOut],ADDR mess0,mess0.chars,ADDR .kitten,0

; replace GetCommandlineW, Windows XP through Windows 11:

	; use TEB to get ProcessEnvironmentBlock (PEB)
	mov rax,[gs:0x60]
	; use PEB to get ProcessParameters (RTL_USER_PROCESS_PARAMETERS)
	mov rax,[rax+0x20]
	; access UNICODE_STRING CommandLine member of structure
	virtual at rax+0x70
		.cmdline UNICODE_STRING
	end virtual
	mov rdx,[.cmdline.Buffer]
	movzx r8,[.cmdline.Length]
	shr r8,1
	mov [.cmdsW],rdx
	WriteConsoleW [.hStdOut],rdx,r8,ADDR .kitten,0

	xchg rcx,rax
	CommandLineToArgvW [.cmdsW],ADDR .argc
	xchg rdi,rax
	xor ebx,ebx
.parm_loop:
	cmp [.argc],ebx
	jz .parm_loop_exit
	cmp qword [rdi+rbx*8],0 ; this should never happen?
	jz .parm_loop_skip

	wsprintfW ADDR buffer,<_W 10,27,'[m',27,'[32mParameter %d:',9,27,'[7m%s'>,rbx,[rdi+rbx*8]
	xchg r8,rax ; characters
	WriteConsoleW [.hStdOut],ADDR buffer,r8,ADDR .kitten,0
.parm_loop_skip:
	inc ebx
	jmp .parm_loop
.parm_loop_exit:
	LocalFree rdi

	; be nice, and reset text attributes
	WriteConsoleW [.hStdOut],ADDR mess1,mess1.chars,ADDR .kitten,0
	leave
	pop rdi rbx
	retn

; invert text to make spaces output more explicit
collect CONST.2
	mess0:
		du 27,'[31mCommand-line:'
		du 27,'[7m',9
	mess0.chars := ($ - mess0) shr 1

	mess1:
		du 27,'[m'
	mess1.chars := ($ - mess1) shr 1
end collect

collect BSS.64
	buffer rw 1024
end collect
