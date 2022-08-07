; forced redirection duct template
;	+ STDIN and STDOUT must be file handles
;	+ messages are sent to STDERR
;
format PE64 CONSOLE 6.2 at 0x1234_56780000
define UMBRELLA_LIBRARY "OneCoreUAP_downlevel" ; _downlevel is used for wsprintf?
include 'umbrella.inc.g'


include 'buffer.g'
include 'mtf.g'

macro duct.FRAME
virtual at RBP-.frame
			rq 4
	.P5		dq ?
	.P6		dq ?

	.hIn		dq ?
	.hOut		dq ?
	.hErr		dq ?
	.options	rb 8

	.buf	Buffer
	.mtf	MTF

	_align 16
	.frame := $ - $$
end virtual
end macro

duct.usage:
	duct.FRAME
	lea rdx,<db 10,\
		"Usage: duct.exe {options} < [input] > [output]",10,\
		9,	'd',9,	'decode',10,\
		9,	'e',9,	'encode',10>
	WriteFile [.hErr],rdx,.bytes,0,0
duct.fatal:
	ExitProcess 1
	int3

duct: entry $
	duct.FRAME
	enter .frame,0

	GetStdHandle STD_ERROR_HANDLE
	mov [.hErr],rax
	inc rax ; INVALID_HANDLE_VALUE
	jz .fatal

	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut],rax
	inc rax ; INVALID_HANDLE_VALUE
	jz .usage

	GetStdHandle STD_INPUT_HANDLE
	mov [.hIn],rax
	inc rax ; INVALID_HANDLE_VALUE
	jz .usage

	GetFileType [.hOut]
	cmp eax,FILE_TYPE_DISK
	jz @F
	cmp eax,FILE_TYPE_PIPE
	jnz .usage
@@:
	GetFileType [.hIn]
	cmp eax,FILE_TYPE_DISK
	jz @F
	cmp eax,FILE_TYPE_PIPE
	jnz .usage
@@:
;-------------------------------------------------------------------------------
; process commandline:
	GetCommandLineW
	xchg rdi,rax
	xor eax,eax
	repnz scasw
	and qword [.options],0
@@:	sub rdi,2
	cmp word [rdi],'d'
	jz .option_decode
	cmp word [rdi],'D'
	jz .option_decode
	cmp word [rdi],'e'
	jz .option_encode
	cmp word [rdi],'E'
	jz .option_encode

	cmp word [rdi],' '
	ja .not_space ; ASSUME: all control characters are whitespace!
	cmp [.options],0
	jz @B
	mov [.options + 1],' '
	jmp @B
.not_space:
	cmp word [rdi],'"' ; who quotes an option?
	jz @B
	cmp word [.options],' d'
	jz .opt_okay
	cmp word [.options],' e'
	jz .opt_okay
	jmp .usage

.option_encode:
	cmp [.options],0
	jnz .usage
	mov [.options],'e'
	jmp @B

.option_decode:
	cmp [.options],0
	jnz .usage
	mov [.options],'d'
	jmp @B

.opt_okay:

;-------------------------------------------------------------------------------

	.buf.Create 1 shl 16 ; 64k buffer
	.mtf.Init
.block_process:
	.buf.StreamIn
	cmp [.buf.busy],0
	jz .done
	mov rsi,[.buf.head]

@0:
	cmp [.options],'e'
	jnz @1F
	.mtf.Encode
	jmp @2F
@1:
	.mtf.Decode

@2:	cmp [.buf.tail],rsi
	jnz @0B

	.buf.StreamOut
	jmp .block_process
.done:
	.buf.Destroy

;-------------------------------------------------------------------------------

	ExitProcess 0
	int3
