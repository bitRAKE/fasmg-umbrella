format PE64 GUI 5.0 at 0x1234_56780000
include 'umbrella.g'
include 'com\IUnknown.g'
include 'equates\TaskDialog.g'

include 'mytd.inc'
;include '..\..\utility\listing.inc'

; this is mainly to counter my problems naming stuff
iterate <_FILE,			FUNCTION,		B_ID>,\
	"CommonButton",		Common_Buttons,		COMMONBUTTONS,\
	"Counter",		Counter,		COUNTER,\
	"Elevation",		Elevation_Required,	ELEVATIONREQUIRED,\
	"EnableDisable",	Enable_Disable,		ENABLEDISABLE,\
	"Error",		Error,			ERROR,\
	"Icons",		Icons,			ICONS,\
	"Progress",		Progress,		PROGRESS,\
	"ProgressEffects",	Progress_Effects,	PROGRESSEFFECTS,\
	"Timer",		Timer,			TIMER,\
	"UpdateText",		Update_Text,		UPDATETEXT

	BUTTON_#B_ID := % + 0xFF ; must be 0x100+ by design
	eval 'include "samples\',_FILE,'.inc"'
	GATHER equ dq FUNCTION#_Sample
	if % = %%
		collect CONST.8
			label WinMain.Table:%%
			irpv G,GATHER
				G
			end irpv
		end collect
	end if
end iterate

align 16,0xCC
WinMain:ENTRY $
	virtual at RBP-.frame
			rq 4
		.td	MY_TD
		; if results are needed:
		.td.selectedButtonId		dd ?	; int
		.td.selectedRadioButtonId	dd ?	; int
		.td.verificationChecked		dd ?	; BOOL

		_align 16
		.frame := $ - $$
	end virtual
	enter .frame,0

; Need to initialize MyTD_Template with application dynamic data before use.
; Can't use GetDesktopWindow: limits window frame! No TDF_CAN_BE_MINIMIZED!
	xor eax,eax
	mov [MyTD_Template.cfg.hwndParent],rax
	GetModuleHandleW 0 ; hModule = hInstance = BaseAddress
	mov [MyTD_Template.cfg.hInstance],rax

	.td.Init ; copy default structure
	mov [.td.cfg.pszWindowTitle],\
		<_R "TaskDialog Samples (originally by Kenny Kerr)">
	mov [.td.cfg.pszMainInstruction],\
		<_R "Pick a sample to try:">
	mov [.td.cfg.pszContent],\
		<_R "Use dialog close button, ESC or Alt-F4 keys to exit a sample.">
	mov [.td.cfg.pszFooter],\
		<_R 'x86-64 by <a href="https://github.com/bitRAKE">bitRAKE</a> with flat assembler g.'>
	or [.td.cfg.dwFlags],TDF_USE_COMMAND_LINKS or TDF_CAN_BE_MINIMIZED or TDF_ENABLE_HYPERLINKS

;: create button array, let TaskDialog know:
	.btns TD_BUTTONS \
		"Common Buttons Sample",	BUTTON_COMMONBUTTONS,\
		"Counter Sample",		BUTTON_COUNTER,\
		"Elevation Required Sample",	BUTTON_ELEVATIONREQUIRED,\
		"Enable/Disable Sample",	BUTTON_ENABLEDISABLE,\
		"Error Sample",			BUTTON_ERROR,\
		"Icons Sample",			BUTTON_ICONS,\
		"Progress Sample",		BUTTON_PROGRESS,\
		"Progress Effects Sample",	BUTTON_PROGRESSEFFECTS,\
		"Timer Sample",			BUTTON_TIMER,\
		"Update Text Sample",		BUTTON_UPDATETEXT

	lea rax,[.btns]
	mov [.td.cfg.pButtons],rax
	mov [.td.cfg.cButtons],sizeof .btns

;: handled messages:
	lea rax,[.OnConstructed]
	mov [.td.msg.OnConstructed],rax
	lea rax,[.OnHyperlink]
	mov [.td.msg.OnHyperlink],rax
	lea rax,[.OnButton]
	mov [.td.msg.OnButton],rax

	TaskDialogIndirect \
		ADDR .td.cfg,\
		ADDR .td.selectedButtonId,\
		ADDR .td.selectedRadioButtonId,\
		ADDR .td.verificationChecked

	xchg ecx,eax
	ExitProcess rcx
	int3

;------ Message Handlers:

; modify template in order that other TaskDialogs are owned by {this}
.OnConstructed:; RCX:hWnd, RDX:TDN_DIALOG_CONSTRUCTED, R8:0, R9:0, object
	mov [MyTD_Template.cfg.hwndParent],rcx
	retn

; data driven for maximum laziness ...
WinMain.OnButton:; RCX:hWnd, RDX:TDN_BUTTON_CLICKED, R8:{control id}, R9:0, object
	lea rax,[WinMain.Table]
	movzx edx,r8l
	shr r8,9
	jnc .not_ours
	jnz .not_ours
	cmp edx,sizeof WinMain.Table
	jnc .not_ours
	enter 32,0
	call qword [rax + rdx*8] ; HRESULT
	leave
	; if sample was successful then continue, else TODO: report error
	test eax,eax
	jnz .not_ours
	inc eax ; S_OK -> S_FALSE ; do not close dialog
	retn
.not_ours:
	xor eax,eax ; S_OK ; close window
	retn

; oh, the vanity!
WinMain.OnHyperlink:; RCX:hWnd, RDX:TDN_HYPERLINK_CLICKED, R8:0, R9:url, object
	virtual at RBP-.frame
			rq 4
		.P5	dq ?
		.P6	dq ?
		.frame := $ - $$
	end virtual
	xchg r8,r9
	enter .frame,0
	ShellExecuteW rcx,<_W "Open">,r8,0,0,SW_SHOWNORMAL
	leave
	retn



section '.rsrc' resource data readable
IDR_ICON := 0x1FF

directory \
	RT_ICON,	icons,\
	RT_GROUP_ICON,	group_icons,\
	RT_STRING,	strings,\
	RT_MANIFEST,	manifests

resource icons,\
	1,LANG_NEUTRAL,dip_chip_icon.48,\
	2,LANG_NEUTRAL,dip_chip_icon.32,\
	3,LANG_NEUTRAL,dip_chip_icon.24,\ 
	4,LANG_NEUTRAL,dip_chip_icon.16

resource group_icons,\
	IDR_ICON,LANG_NEUTRAL,dip_chip_icon

resource_RSTRINGS strings ; generate tables

resource manifests,\
	1,LANG_ENGLISH+SUBLANG_DEFAULT,manifest

include 'resource\dip_chip_icon.inc'
include 'resource\manifest.inc'
