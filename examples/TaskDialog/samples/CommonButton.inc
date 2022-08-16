align 16,0xCC
Common_Buttons_Sample:
	virtual at RBP-.frame
			rq 4
		.td	MY_TD
		_align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	.td.Init ; copy default structure

	mov [.td.cfg.pszWindowTitle],<_R "Common Buttons Sample">
	mov [.td.cfg.dwCommonButtons],TDCBF_OK_BUTTON or TDCBF_YES_BUTTON or TDCBF_NO_BUTTON or TDCBF_CANCEL_BUTTON or TDCBF_RETRY_BUTTON or TDCBF_CLOSE_BUTTON

	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax

	TaskDialogIndirect ADDR .td.cfg,0,0,0
	leave
	retn

.Cancel:
	xor eax,eax
	retn

.OnButton: ; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0
	cmp r8,IDCANCEL ; same as message box result button ids
	jz .Cancel
	enter 32,0
	lea r9,[.Table]
	cmp r8d,sizeof .Table
	jnc .id_unknown
	lea r9,[r9+r8*2] ; resource id words
.id_unknown:
	movzx r9,word [r9]
	SendMessageW rcx,TDM_SET_ELEMENT_TEXT,TDE_MAIN_INSTRUCTION,r9
	mov eax,S_FALSE ; do not close dialog
	leave
	retn

	; note: Cancel doesn't update as that code is used to exit dialog.
	iterate ID, <>,Ok,Cancel,<>,Retry,<>,Yes,No,Close
		match ,ID
			.% RSTRING "Unknown"
		else
			.% RSTRING `ID," clicked"
		end match

		if % = 1
			assert ID+0 = 0 ; code requires unknown at zero offset
			.Table.Data equ .%
		else
			.Table.Data reequ .Table.Data,.%
		end if

		if % = %%
			collect CONST.2
				label Common_Buttons_Sample.Table:%%
				dw Common_Buttons_Sample.Table.Data
			end collect
		end if
	end iterate
