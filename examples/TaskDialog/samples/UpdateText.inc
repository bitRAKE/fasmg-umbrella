BTN_UPDATECONTENT		:= 0x100 ;: low byte is TDE_* id for SendMessage
BTN_UPDATEEXPANDEDINFORMATION	:= 0x101
BTN_UPDATEFOOTER		:= 0x102
BTN_UPDATEMAININSTRUCTION	:= 0x103
BTN_UPDATEWINDOWTITLE		:= 0x3FF ; other

align 16, codepad #
Update_Text_Sample:
	virtual at rbp - .frame
					rq 4
		.td			MY_TD
		.td.verificationChecked	dd ?
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init
	or [.td.cfg.dwFlags],TDF_EXPANDED_BY_DEFAULT
; NOTE: also show text that cannot be changed at runtime
	iterate <FIELD,			QUOTED>,\
		pszWindowTitle,		"Update Text Sample (Window Title)",\
		pszMainInstruction,	"Main instruction",\
		pszContent,		"Content",\
		pszVerificationText,	"Verification text",\		;*
		pszExpandedInformation,	"Expanded information",\
		pszExpandedControlText,	"Expanded control text",\	;*
		pszCollapsedControlText,"Collapsed control text",\	;*
		pszFooter,		"Footer"

		mov [.td.cfg.FIELD],<_R QUOTED>
	end iterate

	.btns TD_BUTTONS \
		"Window title",		BTN_UPDATEWINDOWTITLE,\
		"Main instruction",	BTN_UPDATEMAININSTRUCTION,\
		"Content",		BTN_UPDATECONTENT,\
		"Footer",		BTN_UPDATEFOOTER,\
		"Expanded info",	BTN_UPDATEEXPANDEDINFORMATION
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax
	TaskDialogIndirect ADDR .td.cfg,0,0,ADDR .td.verificationChecked
	leave
	retn

.OnButton: ; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	cmp r8,IDCANCEL			; same as message box result button ids
	jnz @F
	xor eax,eax			; S_OK, close dialog
	retn
@@:	enter 32,0			;: translate button id to update message
	cmp r8,0x104
	jnc .OnButton.title
	movzx r8,r8l
	cmp r8,.Table.Items
	jnc @F
	lea r9,[.Table]
	movzx r9,word [r9+r8*2]
	SendMessageW rcx,TDM_SET_ELEMENT_TEXT,r8,r9
	jmp @F
.OnButton.title:
	SetWindowTextW	rcx,<_W "Update Text Sample (Updated Title)">
@@:	mov eax,S_FALSE			; do not close dialog
	leave
	retn

.Table:
iterate QUOTED,\
	"Content (updated)",\
	"Expanded information (updated)",\
	"Footer (updated)",\
	"Main instruction (updated)"
	.% RSTRING QUOTED
	dw .%
end iterate
.Table.Items := ($ - .Table) shr 1
