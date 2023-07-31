; My Task Dialog Wrapper:
;	+ very low code overhead
;	+ supports multiple advanced TaskDialog configurations per stack frame
;	+ simple technique to access additional parameters in an isolated way
;	+ requires RSTRING and collect macros

struc(NAMED) MY_TD CONFIG,HANDLER:?
namespace NAMED

cfg TASKDIALOGCONFIG CONFIG

;label msg_vTable:td_end - $	;: TASKDIALOG_NOTIFICATIONS:
iterate MESSAGE,\		; WPARAM	LPARAM
	OnCreate,\		; 0		0
	OnNavigate,\		; 0		0
	OnButton,\		; int		0
	OnHyperlink,\		; 0		*WCHAR
	OnTimer,\		; DWORD		0
	OnDestroy,\		; 0		0
	OnRadio,\		; int		0
	OnConstructed,\		; 0		0
	OnVerification,\	; BOOL		0
	OnHelp,\		; 0		0
	OnExpand		; BOOL		0

	msg.MESSAGE dq HANDLER
end iterate
;td_end:


macro Init ; 27 bytes ; don't change registers
	push rdi rsi rcx
	lea rsi,[MyTD_Template] ; global
	lea rdi,[NAMED.cfg]
	mov ecx,((sizeof MyTD_Template)+3) shr 2 ; 62
	rep movsd

	; Local notification table pointer is passed to callback, meaning any
	; message handler can access other local data from this pointer.
	lea rcx,[NAMED.msg.OnCreate]
	mov [NAMED.cfg.lpCallbackData],rcx
	pop rcx rsi rdi
end macro ; Init


; helper macro for message handler access of other local data
; (name requires TD name prefix)
macro GetLocal name*,reg*
	label name:(sizeof NAMED#name) at reg + NAMED#name - NAMED.msg.OnCreate
end macro

end namespace ; NAMED
end struc ; MY_TD



align 64, codepad #
; universal callback processing (minimal environmental impact)
TaskDialog__Callback: ; HWND,UINT,WPARAM,LPARAM,LONG_PTR
	virtual at RSP
				dq ? ; RET
				rq 4
		.lpRefData	dq ?
	end virtual
	mov rax,[.lpRefData]
	cmp edx,TDN_EXPANDO_BUTTON_CLICKED + 1
	jnc .fatal
	jmp qword [rax+rdx*8]

; Presently, only two notifications respond to the return value:
;	TDN_BUTTON_CLICKED:
;		S_OK		close dialog and return button id
;		S_FALSE		continue dialog processing
;	TDN_TIMER:
;		S_OK		continue to advance timer
;		S_FALSE		reset tick count
align 16, codepad #
.S_OK:	xor eax,eax
	retn

.fatal:	int3 ; HACK: not nice, but never happens?



virtual DATA.64
; perform as much static initialization of global structure as possible
;	+ center within parent window
;	+ always allow ESC, Alt-F4, Close Button
label MyTD_Template:MyTD_Template_end - $
MyTD_Template MY_TD <\
	cbSize:		sizeof TASKDIALOGCONFIG,\
	dwFlags:	TDF_POSITION_RELATIVE_TO_WINDOW or TDF_ALLOW_DIALOG_CANCELLATION,\
	pfCallback:	TaskDialog__Callback\
	>,\
	TaskDialog__Callback.S_OK
MyTD_Template_end:
align 64,0xFF
end virtual


; Create an array of TASKDIALOG_BUTTON items. Works for regular buttons and
; radio type. Note: no alignment in 64-bit.
;	+ sizeof NAMED resolves to button count
;	+ NAMED.% resolves to individual resource ids
struc(NAMED) TD_BUTTONS line&
	local total,gather
	iterate <QUOTED,ID>, line
		NAMED.% RSTRING QUOTED
		gather equ ID,NAMED.%,0	; 64-bit only
;		gather equ ID,NAMED.%	; 32-bit only
		total = %%
	end iterate
	virtual CONST.4
		label NAMED:total
		irpv G,gather
			dd G
		end irpv
	end virtual
end struc
