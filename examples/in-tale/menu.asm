format PE64 GUI 5.0 at 0x1234_56780000
include 'win64wx.inc'
include 'encoding\utf8.inc'

macro LANGUAGE lang*,sublang*
	LANG := lang
	SUBLANG := sublang
end macro
LANG_INDONESIAN := 0x21
LANG_HINDI := 0x39
LANG_BENGALI := 0x45

section '.rsrc' resource data readable

IDD_MAIN	:= 42

IDM_MULTI	:= 24

IDM__FILE		:= 0x4100
IDM_NEW			:= 0x0101
IDM_OPEN		:= 0x0102
IDM_SAVE		:= 0x0103
IDM_SAVEAS		:= 0x0104
IDM_SAVEASCOMP		:= 0x0105
IDM_IMPORT		:= 0x0106
IDM_EXPORT		:= 0x0107
IDM__MRU		:= 0x4180
IDM_0MRU		:= 0x0181
IDM_1MRU		:= 0x0182
IDM_2MRU		:= 0x0183
IDM_EXIT		:= 0x0108

IDM__EDIT		:= 0x4200
IDM_TEST		:= 0x0201
IDM_DELETE		:= 0x0202
IDM_FONTS		:= 0x0203
IDM_SETPATHS		:= 0x0204
IDM_CONFIG		:= 0x0205

IDM__SEARCH		:= 0x4300
IDM_FIND		:= 0x0301
IDM_FINDUPWARD		:= 0x0302
IDM_FINDDOWNWARD	:= 0x0303
IDM_QUERYCONSTANT	:= 0x0304

IDM__VIEW		:= 0x4400
IDM_STATUSBAR		:= 0x0401
IDM_SHOWHIDETOOLBAR	:= 0x0402
IDM_BINARYPANE		:= 0x0403
IDM_EXPAND_ALL		:= 0x0404
IDM_COLLAPSE_ALL	:= 0x0405
IDM_WORD_WRAP		:= 0x0406
IDM_REFRESH		:= 0x0407

IDM__HELP		:= 0x4500
IDM_ABOUT		:= 0x0501


directory				\
	RT_MENU,	menus,		\
	RT_DIALOG,	dialogs,	\
	RT_MANIFEST,	manifests

resource menus,\
	IDM_MULTI,LANG or SUBLANG,multiMenu

resource dialogs,\
	IDD_MAIN,LANG or SUBLANG,dialog_example

resource manifests,\
	1,LANG_ENGLISH or SUBLANG_DEFAULT,manifest

menu multiMenu
	menuitem RMS__FILE,IDM__FILE,MFR_POPUP
		menuitem	RMS_NEW,		IDM_NEW
                menuseparator
		menuitem	RMS_OPEN,		IDM_OPEN
		menuitem	RMS_SAVE,		IDM_SAVE
		menuitem	RMS_SAVEAS,		IDM_SAVEAS
		menuitem	RMS_SAVEASCOMP,		IDM_SAVEASCOMP
                menuseparator
		menuitem	RMS_IMPORT,		IDM_IMPORT
		menuitem	RMS_EXPORT,		IDM_EXPORT
                menuseparator
		menuitem RMS__MRU,IDM__MRU,MFR_POPUP
			menuitem	"1",	IDM_0MRU
			menuitem	"2",	IDM_1MRU
			menuitem	"3",	IDM_2MRU,MFR_END
                menuseparator
                menuitem	RMS_EXIT,		IDM_EXIT,MFR_END

	menuitem RMS__EDIT,IDM__EDIT,MFR_POPUP
		menuitem	RMS_TEST,		IDM_TEST
                menuseparator
		menuitem	RMS_DELETE,		IDM_DELETE
                menuseparator
		menuitem	RMS_FONTS,		IDM_FONTS
		menuitem	RMS_SETPATHS,		IDM_SETPATHS
                menuseparator
		menuitem	RMS_CONFIG,		IDM_CONFIG,MFR_END

	menuitem RMS__SEARCH,IDM__SEARCH,MFR_POPUP
		menuitem	RMS_FIND,		IDM_FIND
                menuseparator
		menuitem	RMS_FINDUPWARD,		IDM_FINDUPWARD
		menuitem	RMS_FINDDOWNWARD,	IDM_FINDDOWNWARD
                menuseparator
		menuitem	RMS_QUERYCONSTANT,	IDM_QUERYCONSTANT,MFR_END

	menuitem RMS__VIEW,IDM__VIEW,MFR_POPUP
		menuitem	RMS_STATUSBAR,		IDM_STATUSBAR
		menuitem	RMS_SHOWHIDETOOLBAR,	IDM_SHOWHIDETOOLBAR
		menuitem	RMS_BINARYPANE,		IDM_BINARYPANE
                menuseparator
		menuitem	RMS_EXPAND_ALL,		IDM_EXPAND_ALL
		menuitem	RMS_COLLAPSE_ALL,	IDM_COLLAPSE_ALL
                menuseparator
		menuitem	RMS_WORD_WRAP,		IDM_WORD_WRAP
                menuseparator
		menuitem	RMS_REFRESH,		IDM_REFRESH,MFR_END

	menuitem RMS__HELP,IDM__HELP,MFR_POPUP or MFR_END
		menuitem	RMS_ABOUT,		IDM_ABOUT,MFR_END

dialog dialog_example,'In-Tale: Menu',0,0,256,128,\
	WS_VISIBLE or WS_CAPTION or WS_POPUP or WS_SYSMENU or DS_CENTERMOUSE,\
	WS_EX_TOOLWINDOW,IDM_MULTI,'Segoe UI',11
	; nothing
enddialog

resdata manifest
	file 'manifest.xml'
endres

;:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:

section '.text' code readable executable

DialogProcW:
	xor eax,eax ; FALSE, clear carry flag, common case ;)
	iterate msg,WM_INITDIALOG,WM_CLOSE
		cmp edx,msg
		jz .#msg
	end iterate
	retn
.WM_CLOSE:
	enter 32,0
	xor edx,edx ; no error
	call [EndDialog]
	leave
.WM_INITDIALOG:
	push 1 ; set focus to default control
	pop rax
	retn


start:	entry $
virtual at RBP-.FRAME
			rq 4
	.FRAME := $ - $$
	.iccx		INITCOMMONCONTROLSEX
	.hModule	dq ?
	.hWndParent	dq ?
end virtual
	pop	rax ; no return
	xor	ecx,ecx
	call	[GetModuleHandle]
	mov	rbp,(0x0000FFFF shl 32) + 8
	push	rax
	enter	32,0
	call	[GetDesktopWindow]
	push	rbp
	pop	rcx
	mov	[.hWndParent],rax
	call	[InitCommonControlsEx] ; BOOL
	xchg	ecx,eax
	jrcxz	.quit
	mov	rcx,[.hModule]
	push	IDD_MAIN
	pop	rdx
	mov	r8,[.hWndParent]
	lea	r9,[DialogProcW]
	call	[DialogBoxParamW]
	xchg	ecx,eax
.quit:	call	[ExitProcess]
	int3

;section '.reloc' fixups data readable discardable
_end _winx.entry
