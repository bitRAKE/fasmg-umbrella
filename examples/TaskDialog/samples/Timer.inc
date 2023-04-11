BUTTON_RESET := 0x100

align 16, codepad #
Timer_Sample:
	virtual at RBP-.frame
				rq 4
		.td		MY_TD
		; dialog-time state variables
		; (note prefix matches TD name so handlers can access it)
		.td.reset	dd ?
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init		; copy default structure
	mov [.td.reset],S_OK	; initialize dialog-time state

	mov [.td.cfg.pszWindowTitle],<_R "Timer Sample">
	or [.td.cfg.dwFlags],TDF_CALLBACK_TIMER

	.btns TD_BUTTONS \
		<"Reset">, BUTTON_RESET
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

	lea rax,[.OnTimer]
	mov [.td.msg.OnTimer],rax
	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax
	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

Timer_Sample.OnButton: ; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	cmp r8d,BUTTON_RESET
	jz @F
	xor eax,eax			; S_OK, close dialog
	retn
@@:	Timer_Sample.td.GetLocal .reset, rax
	mov dword [.reset],S_FALSE	; reset timer, after next update
	mov eax,1			; don't close dialog
	retn

Timer_Sample.OnTimer:
	virtual at RBP-.frame
				rq 4
		.P5		dq ?,?
		.hTDlg		dq ?
		label .buffer:128
				rw sizeof .buffer
		.frame := $ - $$
	end virtual
	push rbx
	enter .frame,0
	xchg rbx,rax		; preserve [.lpRefData]
	Timer_Sample.td.GetLocal .reset, rbx
	mov [.hTDlg],rcx

	xchg rax,r8
	xor edx,edx
	mov ecx,1000
	div ecx
	xchg r9,rax
	xchg eax,edx
	wnsprintfW ADDR .buffer, sizeof .buffer,\
		<_W "Time elapsed: %d.%.3d seconds">, r9, rax
	SendMessageW [.hTDlg], TDM_SET_ELEMENT_TEXT, TDE_MAIN_INSTRUCTION, ADDR .buffer

; 0 ; S_OK	; continue to advance timer
; 1 ; S_FALSE	; reset timer
	mov eax,[.reset]
	mov [.reset],S_OK
	leave
	pop rbx
	retn
