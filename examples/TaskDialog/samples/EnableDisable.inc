BUTTON_ENABLE	:= 0x101
BUTTON_DISABLE	:= 0x102

RBUTTON_ABLE	:= 0x103

align 16, codepad #
Enable_Disable_Sample:
	virtual at rbp - .frame
				rq 4
		.td		MY_TD
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init ; copy default structure
	mov [.td.cfg.pszWindowTitle],<_R "Enable/Disable Sample">

;: create button array, let TaskDialog know:
	.btns TD_BUTTONS \
		"Enable", BUTTON_ENABLE,\
		"Disable", BUTTON_DISABLE
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

;: create radio buttons similarly:
	.rbtns TD_BUTTONS \
		"Radio button", RBUTTON_ABLE
	lea rax,[.rbtns]
	mov [.td.cfg.pRadioButtons],rax
	mov [.td.cfg.cRadioButtons],sizeof .rbtns

;: handled messages:
	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax

	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

.OnButton: ; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	mov eax,1
	cmp r8d,BUTTON_ENABLE
	jz @F
	xor eax,1
	cmp r8d,BUTTON_DISABLE
	jz @F
;	xor eax,eax ; S_OK, close dialog
	retn

@@:	enter 48,0
	label .hTDlg:8 at rbp-16
	label .state:8 at rbp-8
	mov [.hTDlg],rcx
	mov [.state],rax

	SendMessageW [.hTDlg],TDM_ENABLE_RADIO_BUTTON,RBUTTON_ABLE,[.state]
	SendMessageW [.hTDlg],TDM_ENABLE_BUTTON,BUTTON_DISABLE,[.state]
	xor byte [.state],1
	SendMessageW [.hTDlg],TDM_ENABLE_BUTTON,BUTTON_ENABLE,[.state]

	mov eax,S_FALSE ; do not close dialog
	leave
	retn
