if ~ definite _INC_WINUSER_
_INC_WINUSER_ := 1

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
