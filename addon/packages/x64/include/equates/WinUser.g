if ~ definite _INC_WINUSER_
_INC_WINUSER_ := 1



; WM_NCHITTEST and MOUSEHOOKSTRUCT Mouse Position Codes
HTERROR		:= -2
HTTRANSPARENT	:= -1
HTNOWHERE	:= 0
HTCLIENT	:= 1
HTCAPTION	:= 2
HTSYSMENU	:= 3
HTSIZE		:= 4
HTMENU		:= 5
HTHSCROLL	:= 6
HTVSCROLL	:= 7
HTMINBUTTON	:= 8
HTMAXBUTTON	:= 9

HTLEFT		:= 10
HTRIGHT		:= 11
HTTOP		:= 12
HTTOPLEFT	:= 13
HTTOPRIGHT	:= 14
HTBOTTOM	:= 15
HTBOTTOMLEFT	:= 16
HTBOTTOMRIGHT	:= 17

HTSIZEFIRST	:= HTLEFT
HTSIZELAST	:= HTBOTTOMRIGHT

HTBORDER	:= 18
HTOBJECT	:= 19
HTCLOSE		:= 20
HTHELP		:= 21

; legacy names
;HTGROWBOX	:= HTSIZE
;HTREDUCE	:= HTMINBUTTON
;HTZOOM		:= HTMAXBUTTON




MSGFLT_RESET	:= 0
MSGFLT_ALLOW	:= 1
MSGFLT_DISALLOW	:= 2

WM_SETTINGCHANGE := WM_WININICHANGE

WM_DWMCOMPOSITIONCHANGED	:= 0x031E
WM_DWMNCRENDERINGCHANGED	:= 0x031F
WM_DWMCOLORIZATIONCOLORCHANGED	:= 0x0320
WM_DWMWINDOWMAXIMIZEDCHANGE	:= 0x0321

WM_DWMSENDICONICTHUMBNAIL		:= 0x0323
WM_DWMSENDICONICLIVEPREVIEWBITMAP	:= 0x0326



struct NONCLIENTMETRICS
	cbSize			dd ?
	iBorderWidth		dd ?
	iScrollWidth		dd ?
	iScrollHeight		dd ?
	iCaptionWidth		dd ?
	iCaptionHeight		dd ?
	lfCaptionFont		LOGFONT
	iSmCaptionWidth		dd ?
	iSmCaptionHeight	dd ?
	lfSmCaptionFont		LOGFONT
	iMenuWidth		dd ?
	iMenuHeight		dd ?
	lfMenuFont		LOGFONT
	lfStatusFont		LOGFONT
	lfMessageFont		LOGFONT
	iPaddedBorderWidth	dd ?
ends
if definite UNICODE
	assert sizeof NONCLIENTMETRICS = 504

	define MONITORINFOEX MONITORINFOEXW
	define GetMonitorInfo GetMonitorInfoW
else
	assert sizeof NONCLIENTMETRICS = 344
	define MONITORINFOEX MONITORINFOEXA
	define GetMonitorInfo GetMonitorInfoA
end if



; Multimonitor API.

MONITOR_DEFAULTTONULL		:= 0x00000000
MONITOR_DEFAULTTOPRIMARY	:= 0x00000001
MONITOR_DEFAULTTONEAREST	:= 0x00000002

MONITORINFOF_PRIMARY	:= 0x00000001

CCHDEVICENAME	:= 32

struct MONITORINFO
	cbSize		dd ?
	rcMonitor	RECT
	rcWork		RECT
	dwFlags		dd ?
ends

struct MONITORINFOEXA
	cbSize		dd ?
	rcMonitor	RECT
	rcWork		RECT
	dwFlags		dd ?
	szDevice	rb CCHDEVICENAME
ends

struct MONITORINFOEXW
	cbSize		dd ?
	rcMonitor	RECT
	rcWork		RECT
	dwFlags		dd ?
	szDevice	rw CCHDEVICENAME
ends



end if ; _INC_WINUSER_
