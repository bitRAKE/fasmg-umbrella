format PE64 GUI 6.2 at 0x1234_56780000
include 'umbrella.g'

LANG_INDONESIAN := 0x21
LANG_HINDI := 0x39
LANG_BENGALI := 0x45
SUBLANG_RUSSIAN_RUSSIA := 0x01 shl 10


start:	entry $
virtual at rbp - .frame
			rq 4
	.frame := $ - $$

	.0		INITCOMMONCONTROLSEX
	.hModule	dq ?
	.hWndParent	dq ?
end virtual
	pop rax ; no return

;-----------------------------------------------------------------------------;
; Default windows API processing finds langauge resources closely matching    ;
; current thread associated language. For testing we can configure the        ;
; preferred language for the thread regardless of system settings:            ;
;	include '..\LanguageSelector.inc'                                     ;
;-----------------------------------------------------------------------------;

;	SetThreadPreferredUILanguages MUI_LANGUAGE_ID,
;	SetProcessPreferredUILanguages MUI_LANGUAGE_ID, ADDR language, ADDR count

;	SetThreadUILanguage LANG_BENGALI or SUBLANG_DEFAULT
;	SetThreadUILanguage LANG_GERMAN or SUBLANG_DEFAULT
;	SetThreadUILanguage LANG_ENGLISH or SUBLANG_DEFAULT
;	SetThreadUILanguage LANG_FRENCH or SUBLANG_DEFAULT
;	SetThreadUILanguage LANG_RUSSIAN or SUBLANG_DEFAULT
;	SetThreadUILanguage LANG_CHINESE or SUBLANG_SYS_DEFAULT

	GetModuleHandleW 0 ; this module
	mov rbp, (0x0000FFFF shl 32) + 8 ; INITCOMMONCONTROLSEX
	push rax ; preserve hModule
	enter .frame, 0 ; store INITCOMMONCONTROLSEX structure on stack, create shadow space
	GetDesktopWindow
	mov [.hWndParent], rax
	InitCommonControlsEx rbp
	test eax, eax ; BOOL
	jz .quit

	DialogBoxParamW [.hModule], IDD_MAIN, [.hWndParent], ADDR DialogProcW
	xchg ecx, eax
.quit:	test ecx, ecx
	setle cl ; <=0 is an error
	movzx ecx, cl ; EXIT_SUCCESS | EXIT_FAILURE
	ExitProcess rcx
	int3

DialogProcW:
	xor eax, eax ; FALSE, clear carry flag, common case ;)
	iterate msg, WM_INITDIALOG,WM_CLOSE
		cmp edx, msg
		jz .#msg
	end iterate
	retn
.WM_CLOSE:
	enter 32, 0
	EndDialog rcx, 1 ; no error
	leave

.WM_INITDIALOG:
	push 1 ; set focus to default control
	pop rax
	retn

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;

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

section '.rsrc' resource from 'ex01.res' data readable
