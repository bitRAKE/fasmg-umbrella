; this test loads the latest RichEdit control library, creates TextServices
; interface, and then QueryInterface an array of IID's to determine what
; versions of support exist.
;
; Besides the recommended interfaces - ITextServices, ITextDocument - several
; other interfaces are can supported:
;	IRichEditOle
;	ITextInputSupport
;	ITextStories
;	IRicheditWindowlessAccessiblity

format PE64 CONSOLE 6.2 at 0x1_0000
;	define UMBRELLA_LIBRARY "OneCoreUAP_apiset"
;	define UMBRELLA_LIBRARY "WindowsApp"
;	define UMBRELLA_LIBRARY "WindowsApp_downlevel"
;	define UMBRELLA_LIBRARY "OneCore"
;	define UMBRELLA_LIBRARY "OneCore_apiset"

; default, broadest coverage, but might not work on earier windows depending on api use
;	define UMBRELLA_LIBRARY "OneCoreUAP"

include 'umbrella.g'
include 'cpu\ext\avx2.inc'

include 'com\IUnknown.g'
include 'com\imp_ITextHost.g'

InterfaceListQuery:
	virtual at rbp - .frame
			rq 4
		.P5	dq ?

		.hOut	dq ?
		?.unk0	IUnknown
		?.unk1	IUnknown

		.chars	dd ?

		align.assume rbp, 16
		align 16
	.frame := $ - $$
	end virtual
	push rsi rbx
	enter .frame,0
	mov [.unk0],rcx
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut],rax

;	lea rsi,[GUIDS] ; global list base address, but it lacks strings

	lea rsi,[UUID_Table]
	mov ebx,sizeof UUID_Table - 16
.scan_interfaces:
	.unk0->QueryInterface ADDR rsi+rbx, ADDR .unk1
	test eax,eax
	js .skip
	.unk1->Release

	; display iid name, uuid
	mov edx,ebx
	shr edx,2
	mov edx,[UUID_DisplayVector+rdx]
	add rdx,rsi
	movzx r8,byte[rdx-1]
	WriteConsoleA [.hOut],rdx,r8,ADDR .chars,0
.skip:
	sub ebx,16
	jns .scan_interfaces


	leave
	pop rbx rsi
	retn


WinMain:entry $
	virtual at rbp - .frame
			rq 4
		.P5	dq ?

		.hOut	dq ?
		.hMod	dq ?
		.fn	dq ?

		?.host		ITextHost2
		?.unknown	IUnknown

		.chars	dd ?

		align.assume rbp, 16
		align 16
	.frame := $ - $$
	end virtual
	enter .frame,0
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut],rax

	LoadLibraryA <_A 'msftedit'>
	mov [.hMod],rax
	test rax,rax
	jz .no_module

	CoInitializeEx 0, COINIT_APARTMENTTHREADED
	test eax,eax
	js .no_coinit

	GetProcAddress [.hMod],<_A 'CreateTextServices'>
	mov [.fn],rax
	xchg rcx,rax
	jrcxz .no_service

	call xITextHost2.xITextHost2
	jrcxz .no_host
	mov [.host],rcx

	and [.unknown],0
	call [.fn], 0, [.host], ADDR .unknown
	test eax,eax
	jns .start_testing
.no_create:
	lea rcx,<_W 'call to CreateTextServices failed'>
	push rcx rax
	call Display__HRESULT
	jmp @F
.no_host:
	lea rcx,<_W "couldn't create ITextHost2">
	push rcx
	call Display__LastError
	jmp @F
.no_service:
	lea rcx,<_W "function CreateTextServices not available">
	push rcx
	call Display__LastError
@@:
	CoUninitialize
	jmp @F
.no_coinit:
	lea rcx,<_W 'CoInitialize failed'>
	push rcx rax
	call Display__HRESULT
@@:
	mov rcx,[.hMod]
	jrcxz .fatal
	FreeLibrary rcx
	jmp .fatal
.no_module:
	lea rcx,<_W "DLL msftedit didn't load">
	push rcx
	call Display__LastError
.fatal:
	ExitProcess 1
	int3


.start_testing:
	mov rcx,[.unknown]
	call InterfaceListQuery

	GetProcAddress [.hMod],<_A 'ShutdownTextServices'>
	test rax,rax
	jz @F
	call rax,[.unknown]
@@:
	.host->Release
	CoUninitialize
	FreeLibrary rcx
	ExitProcess 0
	int3



; Push custom string address of message to preceed error message from system.
Display__LastError:
	push [rsp] ; copy return address to match stack frame
	; duplicate frame below and use that function's offsets
	enter Display__HRESULT.frame,0
	GetLastError
	mov qword [Display__HRESULT.err],rax
	jmp Display__HRESULT.error_proceesed

; Push custom string address of message to preceed error message from system.
; Push HRESULT from a COM interface.
Display__HRESULT:
	virtual at rbp - .frame
			rq 4
		.P5	dq ?
		.P6	dq ?
		.P7	dq ?
		.P8	dq ?

		.hOut	dq ?
		.fmt	dq ?
		.chars	dd ?
		.status	dd ?

		align.assume rbp, 16
		align 16
	.frame := $ - $$
			rq 2 ; rbp,ret
		.err	dd ?,?
		.msg	dq ?
	.parm_bytes := $ - .err
	end virtual
	enter .frame,0

	; lower FACILITY_WINDOWS errors to system errors:
	mov eax,[.err+2]
	and eax,0x1FFF ; HRESULT_FACILITY
	cmp eax,8 ; FACILITY_WINDOWS
	jnz .error_proceesed
	mov word [.err+2],0
  .error_proceesed:
	GetStdHandle STD_OUTPUT_HANDLE
	mov [.hOut],rax
	FormatMessageW FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS,\
		0, dword [.err], 0, ADDR .fmt, 0, 0
	test eax,eax
	jnz @F

;	LoadLibraryA <_A 'ntdsbmsg'>
;	xchg rcx,rax
;	jrcxz .E_UNEXPECTED
;	mov [.hMod],rcx
;	FormatMessageA FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_HMODULE or FORMAT_MESSAGE_IGNORE_INSERTS,\
;		rcx, [.err], 0, ADDR .fmt, 0, 0
;	mov rcx,[.hMod]
;	mov dword [.hMod],eax
;	FreeLibrary rcx
;	cmp dword [.hMod],0
;	jz .E_UNEXPECTED

	virtual DATA.2
		.UNEXPECTED du 'E_UNEXPECTED',0
		.pattern du '{0} : {1}',10,0
	end virtual
	LocalAlloc LPTR,32
	vmovdqu ymm0, qqword [.UNEXPECTED]
	vmovdqu [rax],ymm0
	mov [.fmt],rax
@@:	; use icu.dll for format string for output
	u_strlen ADDR .pattern ; chars
	xchg r8,rax
	mov [.status],0 ; U_ZERO_ERROR
	u_formatMessage <_A 'en_US'>, .pattern, r8, ADDR buffer, sizeof buffer,\
		ADDR .status, [.msg], [.fmt]
	xchg r8,rax
	WriteConsoleW [.hOut],ADDR buffer,r8,ADDR .chars,0
	LocalFree [.fmt]
	leave
	retn .parm_bytes

; missing:
;	ITextStories
;	IRicheditWindowlessAccessiblity

macro uuid_table_gen ; a single use macro allows full fasmg complexity
purge uuid_table_gen
label UUID_Table:UUID_Table_end - $
iterate <iid,uuid>,\
	ITextServices3,		19DAE8DB-DDC7-4130-833F-E6ABBB8101FC,\
	ITextServices2,		8D33F741-CF58-11CE-A89D-00AA006CADC5,\
	ITextServices,		8D33F740-CF58-11CE-A89D-00AA006CADC5,\
	\
	ITextHostEx,		13E670F6-1A5A-11CF-ABEB-00AA00B65EA1,\
	ITextHost2,		13E670F5-1A5A-11CF-ABEB-00AA00B65EA1,\
	ITextHost,		C5BDD8D0-D26E-11CE-A89E-00AA006CADC5,\
	\
	IGripperHost2,		9AFB662D-C536-42D5-9A82-638D5F4C23EC,\
	IGripperHost,		7B684B1A-3563-4EBE-B541-F2A1D4E85A9F,\
	\
	ITextDocument4,		619C20F2-CB3B-4521-981F-2865B1B93F04,\
	ITextDocument3,		75AB03A1-A6F8-441D-AA18-0A851D6E5E3C,\
	ITextDocument2,		F2311112-8C89-49C9-9118-F057CBB814EE,\
	ITextDocument,		BEEE4DDB-90B2-408C-A2F6-0A0AC31E33E4,\
	\
	ITextDocument TOM,	8CC497C0-A1DF-11CE-8098-00AA0047BE5D,\
	ITextSelection,		8CC497C1-A1DF-11CE-8098-00AA0047BE5D,\
	ITextRange,		8CC497C2-A1DF-11CE-8098-00AA0047BE5D,\
	ITextFont,		8CC497C3-A1DF-11CE-8098-00AA0047BE5D,\
	ITextPara,		8CC497C4-A1DF-11CE-8098-00AA0047BE5D,\
	ITextStoryRanges,	8CC497C5-A1DF-11CE-8098-00AA0047BE5D,\
	ITextDocument2 TOM,	C241F5E0-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextSelection2,	C241F5E1-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextRange2,		C241F5E2-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextFont2,		C241F5E3-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextPara2,		C241F5E4-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextStoryRanges2,	C241F5E5-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextStrings,		C241F5E7-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextRow,		C241F5EF-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextDisplays,		C241F5F2-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextStory,		C241F5F3-7206-11D8-A2C7-00A0D1D6C6B3,\
	ITextDocument2Old,	01C25500-4268-11D1-883A-3C8B00C10000,\
	\
	ITextInputSupport,	B8E0C04E-5BFC-4065-B424-80901C24CD6E,\
	IRichEditOle,		00020D00-0000-0000-C000-000000000046

	; contruct three tables: values, string pointers, and strings
	UUID uuid
	if % = %%
		UUID_Table_end:
		UUID_DisplayVector:
		repeat %%
			dd .% - UUID_Table
		end repeat
		repeat %%
			indx %
			db .%.i
			.% db `uuid,' ',`iid,10
			.%.i := $ - .%
		end repeat
	end if
end iterate
end macro
virtual CONST.16
	uuid_table_gen	; single use macro
	align 16	; compensate for unknown size
end virtual

virtual BSS.64
	buffer rw 1024
end virtual
