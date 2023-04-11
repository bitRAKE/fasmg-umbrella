BUTTON_ADMIN_STUFF := 0x101

align 16, codepad #
Elevation_Required_Sample:
	virtual at rbp - .frame
			rq 4
		.td	MY_TD
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init ; copy default structure

	mov [.td.cfg.pszWindowTitle],<_R "Elevation Required Sample">
	mov [.td.cfg.pszContent],<_R "Just a button with a shield ...">

	.btns TD_BUTTONS \
		"Admin Stuff", BUTTON_ADMIN_STUFF
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

	lea rax,[.OnConstructed]
	mov [.td.msg.OnConstructed],rax

	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

.OnConstructed: ; RCX:hWnd, RDX:TDN_DIALOG_CONSTRUCTED, R8:0, R9:0, object
	enter 32,0
	SendMessageW rcx,TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE,BUTTON_ADMIN_STUFF,TRUE
	leave
	retn
