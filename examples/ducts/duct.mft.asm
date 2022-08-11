; forced redirection duct template
;	+ STDIN and STDOUT must be file|pipe handles
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

; display data parse was attempted on
duct.usage_unknown:
	duct.FRAME
	.buf.Create 1 shl 12 ; 4k buffer
	GetCommandLineW
	xchg r8,rax
	wsprintfW [.buf.head],\
		<_W 10,27,'[31mInvalid:',9,27,'[7m%s',27,'[m',10>,r8
	xchg r8,rax ; characters
	WriteConsoleW [.hErr],[.buf.head],r8,ADDR .P6,0
	.buf.Destroy
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
	xchg rsi,rax
	and qword [.options],0
	xor eax,eax
	xor ecx,ecx
	jmp .find_param

.quote: ; quoted arguments are skipped, no escape processing
	lodsw
	test eax,eax
	jz .usage_unknown ; unmatched quote error
	cmp eax,'"'
	jnz .quote
	inc ecx ; skip count
.find_param:
	lodsw
	test eax,eax
	jz .find_end
	cmp eax,'"'
	jz .quote
	cmp eax,' '
	ja .not_space ; ASSUME: all control characters are whitespace!
	jrcxz .skip_EXE ; leading space on non-quoted EXE (unlikely)
	mov [.options + 1],' '
	jmp .find_param
.skip_EXE:
	lodsw
	test eax,eax
	jz .usage_unknown ; invalid commandline error
	cmp eax,' '
	jbe .skip_EXE
.count_EXE:
	inc ecx ; skip count
.not_space:
	jrcxz .count_EXE ; one time
	cmp [.options + 1],' '
	jnz .find_param ; skip EXE name

	cmp [.options],0 ; extra characters after options error
	jnz .usage_unknown
	iterate <OPT,	BRANCH>,\
		'd',	.option_decode,\
		'D',	.option_decode,\
		'e',	.option_encode,\
		'E',	.option_encode,\

		cmp eax,OPT
		jz BRANCH
	end iterate
	jmp .usage_unknown

.option_encode:
	mov [.options],'e'
	jmp .find_param

.option_decode:
	mov [.options],'d'
	jmp .find_param

.find_end:
	cmp word [.options],'d '
	jz .opt_okay
	cmp word [.options],'e '
	jz .opt_okay
	jmp .usage_unknown
.opt_okay:

;-------------------------------------------------------------------------------

	.buf.Create 1 shl 16 ; 64k buffer
	.mtf.Init
.block_process:
	.buf.StreamIn
	cmp [.buf.busy],0
	jz .done
	mov rsi,[.buf.head]
	cmp [.options],'e'
	jnz @2F
@1:
	.mtf.Encode
	cmp [.buf.tail],rsi
	jnz @1B
	jmp @3F
@2:
	.mtf.Decode
	cmp [.buf.tail],rsi
	jnz @2B
@3:
	.buf.StreamOut
	jmp .block_process
.done:
	.buf.Destroy

;-------------------------------------------------------------------------------
	ExitProcess 0
	int3
