
; For a more extensive descriptions of name decoration techniques:
;	Calling Conventions, Section 8. Name Mangling
;	By Agner Fog. Technical University of Denmark.
;	https://www.agner.org/optimize/calling_conventions.pdf

format PE64 CONSOLE
include 'umbrella.g'
include 'api\dbghelp.g'

struc(named) ARRAY_W line&
	local count
	align 8
	label named:count
	namespace named
	iterate L, line
		if % = 1
			count := %%
			repeat %%
				dq ?%
			end repeat
			dq 0 ; terminator
		end if
		; character count w/o null
		dw ((?%.end - ?%) shr 1)-1
		?% du L,0
		?%.end:
	end iterate
	end namespace ; named
end struc

collect CONST.2
manglednames ARRAY_W \
	"??_7FooBase@Leap@@6B@",\
	"??4FooBase@Leap@@QAEAAV01@ABV01@@Z",\
	"??_R0?AVbad_alloc@std@@@8",\
	"??0CAboutDlg@@QAE@XZ",\
	"?get@Foo@Leap@@QAEHXZ"
end collect


main: entry $
virtual at rbp - .frame
			rq 4
	.P5		dq ? ; TODO: api macro should error on incorrect size
	.P6		dq ?
	.frame := $ -$$
			rq 2
	.hOut		dq ?
	.argv		dq ?
	.argc		dd ?
end virtual
	enter .frame, 0
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut], rax
	GetCommandLineW
	xchg rcx, rax
	CommandLineToArgvW rcx, ADDR .argc
	mov [.argv], rax
	lea rsi, [manglednames]
	cmp [.argc], 2
	jc @F
	xchg rsi, rax
	lodsq ; skip EXE name
	jmp @F
.demangled:
	lea r9, [.P6]
	lea rax, [unName]
	mov [r9], rax
	wvnsprintfW ADDR buffer, sizeof buffer, <_W 10,'[32mdemangled[m = %s',10>, r9
	xchg r8,rax ; characters
	WriteConsoleW [.hOut], ADDR buffer, r8, ADDR .P6, 0

.still_mangled:
	lea r9, [rsi-8] ; prior array string
	wvnsprintfW ADDR buffer, sizeof buffer, rdi, r9
	xchg r8,rax ; characters
	WriteConsoleW [.hOut], ADDR buffer, r8, ADDR .P6, 0

@@:	lodsq
	test rax, rax
	jz .finished
	xchg rcx, rax
	UnDecorateSymbolNameW rcx, ADDR unName, sizeof unName, UNDNAME_COMPLETE
	lea rdi, <_W 10,'  [91mmangled[m = %s',10>
	test eax, eax
	jz .still_mangled
	lea rdi, <_W '  mangled = %s',10>
	jmp .demangled
.finished:
	cmp [.argc], 2
	jnc @F
	lea rdx, <_W 10,'[91mEnjoy above demangled symbol examples, or pass quoted string(s) on the command line to demangle other(s).[m',10>
	mov r8d, (.bytes - 2) shr 1
	WriteConsoleW [.hOut], rdx, r8, ADDR .P6, 0
@@:
	ExitProcess 0
	int3

collect BSS.64
	label unName:4096 ; characters
		rw sizeof unName
	label buffer:4096 ; characters
		rw sizeof buffer
end collect
