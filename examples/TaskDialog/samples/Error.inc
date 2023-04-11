BUTTON_SENDFEEDBACK	:= 0x100
BUTTON_NOTHANKS		:= 0x101

align 16, codepad #
Error_Sample:
	virtual at rbp-.frame
				rq 4
		.td		MY_TD
		.td.vflag	dd ?	; BOOL
			align 8
		.td.td2		MY_TD
		.td.td2.count	dd ?
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init ; copy default structure

	mov [.td.cfg.pszWindowTitle],<_R "Error Sample (page 1)">
	mov [.td.cfg.pszMainInstruction],<_R "An unexpected error occured. Please send feedback now!">
	mov [.td.cfg.pszVerificationText],<_R "Don't ask me again">
	mov [.td.cfg.pszContent],<_R "Error message goes here...">
	mov [.td.cfg.pszExpandedInformation],<_R "Stack trace goes here...">
	or [.td.cfg.dwFlags],TDF_USE_COMMAND_LINKS or TDF_VERIFICATION_FLAG_CHECKED or TDF_EXPAND_FOOTER_AREA

	.btns TD_BUTTONS \
		<"Send Feedback",10,"I'm in a giving mood">, BUTTON_SENDFEEDBACK,\
		<"No Thanks",10,"I don't feel like being helpful">, BUTTON_NOTHANKS
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax
	TaskDialogIndirect ADDR .td.cfg,0,0,ADDR .td.vflag
	leave
	retn

.OnButton: ; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	cmp r8d,BUTTON_SENDFEEDBACK
	jz SendFeedbackDialog
	xor eax,eax ; S_OK, close dialog
	retn


; Configue page 2 and transfer to it ... Slightly tricky because we want to
; reference data for second page from first page reference in RAX.
SendFeedbackDialog:
	Error_Sample.td.GetLocal .td2.cfg,rax
	virtual at .td2.cfg ; mirror parent order above
		.td		MY_TD
		.td.count	dd ?
	end virtual
	enter 32,0
	.td.Init
	mov [.td.cfg.pszWindowTitle],\
		<_R "Error Sample (page 2)">
	mov [.td.cfg.pszContent],\
		<_R "Copying your passwords  ;-)">
	or [.td.cfg.dwFlags],\
		TDF_SHOW_PROGRESS_BAR or TDF_CALLBACK_TIMER
	lea rdx,[.OnTimer]
	mov [.td.msg.OnTimer],rdx
	lea rdx,[.OnNavigate]
	mov [.td.msg.OnNavigate],rdx
	SendMessageW rcx,TDM_NAVIGATE_PAGE,0,ADDR .td.cfg
	mov eax,S_FALSE ; don't close parent dialog
	leave
	retn

.MaxRange := 5000
.MinRange := 0

.OnNavigate:
	enter 32,0
	SendMessageW rcx,TDM_SET_PROGRESS_BAR_RANGE,0,(.MaxRange shl 16)+.MinRange
	leave
	retn

SendFeedbackDialog.OnTimer:
	virtual at rbp - .frame
				rq 4
		.hTDlg		dq ?
		.ppos		dq ?
		label .buffer:128
				rw sizeof .buffer
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	mov [.hTDlg],rcx
	cmp r8,SendFeedbackDialog.MaxRange
	ja .finished

	xchg r9,rax
	SendFeedbackDialog.td.GetLocal .count,r9

	mov ecx,SendFeedbackDialog.MaxRange
	imul eax,r8d,100
	cdq
	div ecx
	mov [.count],eax
	mov [.ppos],r8

	wnsprintfW ADDR .buffer, sizeof .buffer,\
		<_W "Sending... %d%%">, DWORD [.count]
	SendMessageW [.hTDlg], TDM_SET_ELEMENT_TEXT, TDE_MAIN_INSTRUCTION, ADDR .buffer
	jmp @F
.finished:
	SendMessageW [.hTDlg], TDM_SET_ELEMENT_TEXT, TDE_MAIN_INSTRUCTION,\
		<_R "Thanks for the feedback!">
	SendMessageW [.hTDlg], TDM_SET_ELEMENT_TEXT, TDE_CONTENT,\
		<_R "Our developers will get right on that...">
	mov [.ppos],SendFeedbackDialog.MaxRange
@@:	SendMessageW [.hTDlg], TDM_SET_PROGRESS_BAR_POS, [.ppos], 0
	xor eax,eax ; S_OK ; continue to advance timer
	leave
	retn
