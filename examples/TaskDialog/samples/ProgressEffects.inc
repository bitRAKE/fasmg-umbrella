BUTTON_STATE	:= 0x100
BUTTON_MODE	:= 0x101

align 16, codepad #
Progress_Effects_Sample:
	virtual at rbp - .frame
				rq 4
		.td		MY_TD

		;: dialog-time state variables:
		.td.marquee	dd ?
		.td.state	dd ?
			align.assume rbp, 16
			align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init ; copy default structure
	mov [.td.marquee],0
	mov [.td.state],(((3 shl 11) + 2) shl 11) + 1

	mov [.td.cfg.pszWindowTitle],<_R "Progress Effects Sample">
	or [.td.cfg.dwFlags],TDF_SHOW_PROGRESS_BAR
	.btns TD_BUTTONS \
		"Cycle State", BUTTON_STATE,\
		"Toggle Mode", BUTTON_MODE
	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax
	lea rax,[.OnConstructed]
	mov [.td.msg.OnConstructed],rax
	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

.OnButton: ; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	cmp r8d,BUTTON_STATE
	jz CycleState
	cmp r8d,BUTTON_MODE
	jz ToggleMode
	xor eax,eax ; S_OK, close dialog
	retn

macro COMMON_LEADIN
	virtual at rbp - .frame
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
	mov [.hTDlg],rcx

	; access parent local data (RBX base):
	Progress_Effects_Sample.td.GetLocal .marquee, rbx
	Progress_Effects_Sample.td.GetLocal .state, rbx
end macro


Progress_Effects_Sample.OnConstructed:
	COMMON_LEADIN
	jmp ToggleMode.off


; three states, if we use the carry bit that is 11-bits per state! :-)
CycleState:; PBST_NORMAL -> PBST_PAUSED -> PBST_ERROR -> PBST_NORMAL
	COMMON_LEADIN
	clc
	rcl [.state],11 ; bit lost is always a zero bit
	movzx r8,byte [.state] ; only need two bits really
	SendMessageW [.hTDlg], TDM_SET_PROGRESS_BAR_STATE, r8, 0
	jmp ToggleMode.xit


ToggleMode:
	COMMON_LEADIN
	xor [.marquee],1
	mov r8d,[.marquee]
	SendMessageW [.hTDlg], TDM_SET_MARQUEE_PROGRESS_BAR, r8, 0
	test [.marquee],-1
	jz .off
	SendMessageW [.hTDlg], TDM_SET_PROGRESS_BAR_MARQUEE, 1, 0
	jmp .xit
.off:	SendMessageW [.hTDlg], TDM_SET_PROGRESS_BAR_POS, 25, 0
.xit:
	lea r9,<_A "_W_T_F!",0,"Normal",0,0,"Error",0,0,0,"Paused">
	movzx eax,byte [.state]
	lea r9,[r9+rax*8]

	lea r8,<_A "False",0,"True (only togglable in Normal state)">
	imul eax,[.marquee],6
	add rax,r8

	wnsprintfW ADDR .buffer, sizeof .buffer,\
		<_W "State: %S",10,"Marquee: %S" >, r9, rax
	SendMessageW [.hTDlg], TDM_SET_ELEMENT_TEXT, TDE_MAIN_INSTRUCTION, ADDR .buffer
	mov eax,S_FALSE ; do not close dialog
	leave
	pop rbx
	retn

purge COMMON_LEADIN
