align 16, codepad #
Progress_Sample:
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
	mov [.td.cfg.pszWindowTitle],<_R "Progress Sample">
	or [.td.cfg.dwFlags],TDF_SHOW_PROGRESS_BAR or TDF_CALLBACK_TIMER
	lea rax,[.OnTimer]
	mov [.td.msg.OnTimer],rax
	lea rax,[.OnConstructed]
	mov [.td.msg.OnConstructed],rax
	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

.MaxRange := 5000
.MinRange := 0

.OnConstructed: ; RCX:hWnd, RDX:TDN_DIALOG_CONSTRUCTED, R8:0, R9:0, object
	enter 32,0
	SendMessageW rcx,TDM_SET_PROGRESS_BAR_RANGE,0,(.MaxRange shl 16)+.MinRange
	leave
	retn

.OnTimer:
	cmp r8,.MaxRange
	jbe .update_progress
	mov eax,S_FALSE ; reset timer
	retn

Progress_Sample.update_progress:
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
	mov [.ppos],r8

	push rax
	pop r9
	Progress_Sample.td.GetLocal .count, r9

	mov ecx,Progress_Sample.MaxRange
	imul eax,r8d,100
	cdq
	div ecx
	mov [.count],eax

	wnsprintfW ADDR .buffer, sizeof .buffer,\
		<_W "%d%%">, DWORD [.count]
	SendMessageW [.hTDlg], TDM_SET_ELEMENT_TEXT, TDE_MAIN_INSTRUCTION, ADDR .buffer
	SendMessageW [.hTDlg], TDM_SET_PROGRESS_BAR_POS, [.ppos], 0
	xor eax,eax ; S_OK ; continue to advance timer
	leave
	retn
