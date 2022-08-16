; TaskDialog (Vista+, comctl32.dll)
;
; Emulating the features on older versions of windows:
; http://www.naughter.com/xtaskdialog.html

; import
;	TaskDialog, 0x0010ee90, None
;	TaskDialogIndirect, 0x00002ad0, None


; note: these are psuedo-resource ids (words)
TD_WARNING_ICON     := 0xFFFF
TD_ERROR_ICON       := 0xFFFE
TD_INFORMATION_ICON := 0xFFFD
TD_SHIELD_ICON      := 0xFFFC
;	undocumented
;:= 0xFFFB security blue shield
;:= 0xFFFA security yellow ! shield
;:= 0xFFF9 security red X shield
;:= 0xFFF8 security green check shield
;:= 0xFFF7 security gray shield

; TASKDIALOG_MESSAGES
TDM_NAVIGATE_PAGE			:= WM_USER + 101 ;
TDM_CLICK_BUTTON			:= WM_USER + 102 ; wParam = Button ID
TDM_SET_MARQUEE_PROGRESS_BAR		:= WM_USER + 103 ; wParam = 0 (nonMarque) wParam != 0 (Marquee)
TDM_SET_PROGRESS_BAR_STATE		:= WM_USER + 104 ; wParam = new progress state
TDM_SET_PROGRESS_BAR_RANGE		:= WM_USER + 105 ; lParam = MAKELPARAM(nMinRange, nMaxRange)
TDM_SET_PROGRESS_BAR_POS		:= WM_USER + 106 ; wParam = new position
TDM_SET_PROGRESS_BAR_MARQUEE		:= WM_USER + 107 ; wParam = 0 (stop marquee), wParam != 0 (start marquee), lparam = speed (milliseconds between repaints)
TDM_SET_ELEMENT_TEXT			:= WM_USER + 108 ; wParam = element (TASKDIALOG_ELEMENTS), lParam = new element text (LPCWSTR)
;
TDM_CLICK_RADIO_BUTTON			:= WM_USER + 110 ; wParam = Radio Button ID
TDM_ENABLE_BUTTON			:= WM_USER + 111 ; lParam = 0 (disable), lParam != 0 (enable), wParam = Button ID
TDM_ENABLE_RADIO_BUTTON			:= WM_USER + 112 ; lParam = 0 (disable), lParam != 0 (enable), wParam = Radio Button ID
TDM_CLICK_VERIFICATION			:= WM_USER + 113 ; wParam = 0 (unchecked), 1 (checked), lParam = 1 (set key focus)
TDM_UPDATE_ELEMENT_TEXT			:= WM_USER + 114 ; wParam = element (TASKDIALOG_ELEMENTS), lParam = new element text (LPCWSTR)
TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE	:= WM_USER + 115 ; wParam = Button ID, lParam = 0 (elevation not required), lParam != 0 (elevation required)
TDM_UPDATE_ICON				:= WM_USER + 116 ; wParam = icon element (TASKDIALOG_ICON_ELEMENTS), lParam = new icon (hIcon if TDF_USE_HICON_* was set, PCWSTR otherwise)

; TASKDIALOG_ELEMENTS
TDE_CONTENT			:= 0
TDE_EXPANDED_INFORMATION	:= 1
TDE_FOOTER			:= 2
TDE_MAIN_INSTRUCTION		:= 3

; TASKDIALOG_ICON_ELEMENTS
TDIE_ICON_MAIN			:= 0
TDIE_ICON_FOOTER		:= 1

; TASKDIALOG_FLAGS
TDF_ENABLE_HYPERLINKS		:= 0x0001
TDF_USE_HICON_MAIN		:= 0x0002
TDF_USE_HICON_FOOTER		:= 0x0004
TDF_ALLOW_DIALOG_CANCELLATION	:= 0x0008
TDF_USE_COMMAND_LINKS		:= 0x0010
TDF_USE_COMMAND_LINKS_NO_ICON	:= 0x0020
TDF_EXPAND_FOOTER_AREA		:= 0x0040
TDF_EXPANDED_BY_DEFAULT		:= 0x0080
TDF_VERIFICATION_FLAG_CHECKED	:= 0x0100
TDF_SHOW_PROGRESS_BAR		:= 0x0200
TDF_SHOW_MARQUEE_PROGRESS_BAR	:= 0x0400
TDF_CALLBACK_TIMER		:= 0x0800
TDF_POSITION_RELATIVE_TO_WINDOW	:= 0x1000
TDF_RTL_LAYOUT			:= 0x2000
TDF_NO_DEFAULT_RADIO_BUTTON	:= 0x4000
TDF_CAN_BE_MINIMIZED		:= 0x8000
TDF_NO_SET_FOREGROUND	:=	0x0010000 ; Don't call SetForegroundWindow() when activating the dialog
TDF_SIZE_TO_CONTENT	:=	0x1000000 ; used by ShellMessageBox to emulate MessageBox sizing behavior

; TASKDIALOG_COMMON_BUTTON_FLAGS
TDCBF_OK_BUTTON     :=0x01
TDCBF_YES_BUTTON    :=0x02
TDCBF_NO_BUTTON     :=0x04
TDCBF_CANCEL_BUTTON :=0x08
TDCBF_RETRY_BUTTON  :=0x10
TDCBF_CLOSE_BUTTON  :=0x20

; TASKDIALOG_NOTIFICATIONS
TDN_CREATED			:= 0
TDN_NAVIGATED			:= 1
TDN_BUTTON_CLICKED		:= 2	; wParam = Button ID
TDN_HYPERLINK_CLICKED		:= 3	; lParam = (LPCWSTR)pszHREF
TDN_TIMER			:= 4	; wParam = Milliseconds since dialog created or timer reset
TDN_DESTROYED			:= 5
TDN_RADIO_BUTTON_CLICKED	:= 6	; wParam = Radio Button ID
TDN_DIALOG_CONSTRUCTED		:= 7
TDN_VERIFICATION_CLICKED	:= 8	; wParam = 1 if checkbox checked, 0 if not, lParam is unused and always 0
TDN_HELP			:= 9
TDN_EXPANDO_BUTTON_CLICKED	:= 10 	; wParam = 0 (dialog is now collapsed), wParam != 0 (dialog is now expanded)

struct TASKDIALOG_BUTTON, packed ;: NO PADDING :
	nButtonID	dd ? ; int
	pszButtonText	dq ? ; PCWSTR
ends

struct TASKDIALOGCONFIG, packed ;: NO PADDING :
	cbSize			dd ? ; UINT
	hwndParent		dq ? ; HWND (owner, not parent)
	hInstance		dq ? ; HINSTANCE
	dwFlags			dd ? ; TASKDIALOG_FLAGS
	dwCommonButtons		dd ? ; TASKDIALOG_COMMON_BUTTON_FLAGS
	pszWindowTitle		dq ? ; PCWSTR
	union
		hMainIcon	dq ? ; HICON
		pszMainIcon	dq ? ; PCWSTR
	ends
	pszMainInstruction	dq ? ; PCWSTR
	pszContent		dq ? ; PCWSTR
	cButtons		dd ? ; UINT
	pButtons		dq ? ;*const TASKDIALOG_BUTTON	11
	nDefaultButton		dd ? ; int
	cRadioButtons		dd ? ; UINT
	pRadioButtons		dq ? ;*const TASKDIALOG_BUTTON
	nDefaultRadioButton	dd ? ; int
	pszVerificationText	dq ? ; PCWSTR
	pszExpandedInformation	dq ? ; PCWSTR
	pszExpandedControlText	dq ? ; PCWSTR
	pszCollapsedControlText	dq ? ; PCWSTR
	union
		hFooterIcon	dq ? ; HICON
		pszFooterIcon	dq ? ; PCWSTR
	ends
	pszFooter		dq ? ; PCWSTR
	pfCallback		dq ? ; PFTASKDIALOGCALLBACK hwnd,msg,wParam,lParam,lpRefData
	lpCallbackData		dq ? ; LONG_PTR
	cxWidth			dd ? ; UINT
ends ; TASKDIALOGCONFIG
