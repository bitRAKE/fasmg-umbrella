BUTTON_INCREMENT := 0x101
BUTTON_DECREMENT := 0x102

align 16, codepad #
Counter_Sample:
	virtual at rbp - .frame
				rq 4
		.td		MY_TD
		.td.count	dd ?
				align.assume rbp, 16
				align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init ; copy default structure
	mov [.td.count],0
	mov [.td.cfg.pszWindowTitle],<_R "Counter Sample">

;: create button array, let TaskDialog know:
	.btns TD_BUTTONS \
		"Increment", BUTTON_INCREMENT,\
		"Decrement", BUTTON_DECREMENT
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

;: handled messages:
	lea rax,[.OnButton]
	lea rcx,[.OnConstructed]
	mov [.td.msg.OnButton],rax
	mov [.td.msg.OnConstructed],rcx

	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

Counter_Sample.OnButton:
;	RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	Counter_Sample.td.GetLocal .count, rax
	or edx,-1
	cmp r8d,BUTTON_DECREMENT
	jz @F
	neg edx
	cmp r8d,BUTTON_INCREMENT
	jz @F
	xor eax,eax ; S_OK, close dialog
	retn

@@:	add [.count],edx

	;: ... fall through ... :

Counter_Sample.OnConstructed:
;	RCX:hWnd, RDX:TDN_DIALOG_CONSTRUCTED, R8:0, R9:0, object
	virtual at rbp - .frame
		rq 4
	.hTDlg	dq ?

	label .buffer:128
	rw sizeof .buffer
		align.assume rbp, 16
		align 16
	.frame := $ - $$
	end virtual
	enter .frame,0
	mov [.hTDlg],rcx
	Counter_Sample.td.GetLocal .count, rax
	wnsprintfW ADDR .buffer,sizeof .buffer,\
		<_W "We have %d bugs.">,DWORD [.count]
	SendMessageW [.hTDlg],TDM_SET_ELEMENT_TEXT,TDE_MAIN_INSTRUCTION,ADDR .buffer
	mov eax,S_FALSE ; do not close dialog (only for TDN_BUTTON_CLICKED)
	leave
	retn
