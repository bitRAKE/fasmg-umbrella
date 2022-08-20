;DllCanUnloadNow,\
;DllGetClassObject,\

PE.__IMPORTS equ 'Dwmapi',\
DwmAttachMilContent,\
DwmDefWindowProc,\
DwmDetachMilContent,\
DwmEnableBlurBehindWindow,\
DwmEnableComposition,\
DwmEnableMMCSS,\
DwmExtendFrameIntoClientArea,\
DwmFlush,\
DwmGetColorizationColor,\
DwmGetCompositionTimingInfo,\
DwmGetGraphicsStreamClient,\
DwmGetGraphicsStreamTransformHint,\
DwmGetTransportAttributes,\
DwmGetUnmetTabRequirements,\
DwmGetWindowAttribute,\
DwmInvalidateIconicBitmaps,\
DwmIsCompositionEnabled,\
DwmModifyPreviousDxFrameDuration,\
DwmQueryThumbnailSourceSize,\
DwmRegisterThumbnail,\
DwmRenderGesture,\
DwmSetDxFrameDuration,\
DwmSetIconicLivePreviewBitmap,\
DwmSetIconicThumbnail,\
DwmSetPresentParameters,\
DwmSetWindowAttribute,\
DwmShowContact,\
DwmTetherContact,\
DwmTetherTextContact,\
DwmTransitionOwnedWindow,\
DwmUnregisterThumbnail,\
DwmUpdateThumbnailProperties,\
DwmpAllocateSecurityDescriptor,\
DwmpDxGetWindowSharedSurface,\
DwmpDxUpdateWindowSharedSurface,\
DwmpDxgiIsThreadDesktopComposited,\
DwmpEnableDDASupport,\
DwmpFreeSecurityDescriptor,\
DwmpGetColorizationParameters,\
DwmpRenderFlick,\
DwmpSetColorizationParameters,\
DwmpUpdateProxyWindowForCapture

DWM_BB_ENABLE			:= 0x00000001
DWM_BB_BLURREGION		:= 0x00000002
DWM_BB_TRANSITIONONMAXIMIZED	:= 0x00000004

struct DWM_BLURBEHIND, packed ;: NO PADDING :
	dwFlags			dd ?
	fEnable			dd ?	; BOOL
	hRgnBlur		dq ?	; HRGN
	fTransitionOnMaximized	dd ?	; BOOL
ends

; enum DWMWINDOWATTRIBUTE
DWMWA_NCRENDERING_ENABLED		:= 1
DWMWA_NCRENDERING_POLICY		:= 2
DWMWA_TRANSITIONS_FORCEDISABLED		:= 3
DWMWA_ALLOW_NCPAINT			:= 4
DWMWA_CAPTION_BUTTON_BOUNDS		:= 5
DWMWA_NONCLIENT_RTL_LAYOUT		:= 6
DWMWA_FORCE_ICONIC_REPRESENTATION	:= 7
DWMWA_FLIP3D_POLICY			:= 8
DWMWA_EXTENDED_FRAME_BOUNDS		:= 9
DWMWA_HAS_ICONIC_BITMAP			:=10
DWMWA_DISALLOW_PEEK			:=11
DWMWA_EXCLUDED_FROM_PEEK		:=12
DWMWA_CLOAK				:=13
DWMWA_CLOAKED				:=14
DWMWA_FREEZE_REPRESENTATION		:=15
DWMWA_PASSIVE_UPDATE_MODE		:=16
DWMWA_USE_HOSTBACKDROPBRUSH		:=17
DWMWA_USE_IMMERSIVE_DARK_MODE		:=20
DWMWA_WINDOW_CORNER_PREFERENCE		:=33
DWMWA_BORDER_COLOR			:=34
DWMWA_CAPTION_COLOR			:=35
DWMWA_TEXT_COLOR			:=36
DWMWA_VISIBLE_FRAME_BORDER_THICKNESS	:=37
DWMWA_SYSTEMBACKDROP_TYPE		:=38
DWMWA_LAST				:=39

; enum DWM_WINDOW_CORNER_PREFERENCE
DWMWCP_DEFAULT		:= 0
DWMWCP_DONOTROUND	:= 1
DWMWCP_ROUND		:= 2
DWMWCP_ROUNDSMALL	:= 3

DWMWA_COLOR_DEFAULT	:= 0xFFFFFFFF
DWMWA_COLOR_NONE	:= 0xFFFFFFFE

; enum DWM_SYSTEMBACKDROP_TYPE
DWMSBT_AUTO		:= 0
DWMSBT_NONE		:= 1
DWMSBT_MAINWINDOW	:= 2
DWMSBT_TRANSIENTWINDOW	:= 3
DWMSBT_TABBEDWINDOW	:= 4

; enum DWMNCRENDERINGPOLICY
DWMNCRP_USEWINDOWSTYLE	:= 0
DWMNCRP_DISABLED	:= 1
DWMNCRP_ENABLED		:= 2
DWMNCRP_LAST		:= 3

; enum DWMFLIP3DWINDOWPOLICY
DWMFLIP3D_DEFAULT	:= 0
DWMFLIP3D_EXCLUDEBELOW	:= 1
DWMFLIP3D_EXCLUDEABOVE	:= 2
DWMFLIP3D_LAST		:= 3

DWM_CLOAKED_APP		:= 0x00000001
DWM_CLOAKED_SHELL	:= 0x00000002
DWM_CLOAKED_INHERITED	:= 0x00000004

; dwFlags for DWM_THUMBNAIL_PROPERTIES
DWM_TNP_RECTDESTINATION		:= 0x00000001
DWM_TNP_RECTSOURCE		:= 0x00000002
DWM_TNP_OPACITY			:= 0x00000004
DWM_TNP_VISIBLE			:= 0x00000008
DWM_TNP_SOURCECLIENTAREAONLY	:= 0x00000010

struct DWM_THUMBNAIL_PROPERTIES, packed ;: NO PADDING : 45
	dwFlags			dd ?
	rcDestination		RECT
	rcSource		RECT
	opacity			db ?	; BYTE
	fVisible		dd ?	; BOOL
	fSourceClientAreaOnly	dd ?	; BOOL
ends

struct UNSIGNED_RATIO
	uiNumerator	dd ?	; UINT32
	uiDenominator	dd ?	; UINT32
ends

struct DWM_TIMING_INFO, packed ;: NO PADDING : 292
	cbSize			dd ?	; UINT32
	rateRefresh		UNSIGNED_RATIO
	qpcRefreshPeriod	dq ?	; QPC_TIME
	rateCompose		UNSIGNED_RATIO
	qpcVBlank		dq ?	; QPC_TIME
	cRefresh		dq ?	; DWM_FRAME_COUNT
	cDXRefresh		dd ?	; UINT
	qpcCompose		dq ?	; QPC_TIME
	cFrame			dq ?	; DWM_FRAME_COUNT
	cDXPresent		dd ?	; UINT
	cRefreshFrame		dq ?	; DWM_FRAME_COUNT
	cFrameSubmitted		dq ?	; DWM_FRAME_COUNT
	cDXPresentSubmitted	dd ?	; UINT
	cFrameConfirmed		dq ?	; DWM_FRAME_COUNT
	cDXPresentConfirmed	dd ?	; UINT
	cRefreshConfirmed	dq ?	; DWM_FRAME_COUNT
	cDXRefreshConfirmed	dd ?	; UINT
	cFramesLate		dq ?	; DWM_FRAME_COUNT
	cFramesOutstanding	dd ?	; UINT
	cFrameDisplayed		dq ?	; DWM_FRAME_COUNT
	qpcFrameDisplayed	dq ?	; QPC_TIME
	cRefreshFrameDisplayed	dq ?	; DWM_FRAME_COUNT
	cFrameComplete		dq ?	; DWM_FRAME_COUNT
	qpcFrameComplete	dq ?	; QPC_TIME
	cFramePending		dq ?	; DWM_FRAME_COUNT
	qpcFramePending		dq ?	; QPC_TIME
	cFramesDisplayed	dq ?	; DWM_FRAME_COUNT
	cFramesComplete		dq ?	; DWM_FRAME_COUNT
	cFramesPending		dq ?	; DWM_FRAME_COUNT
	cFramesAvailable	dq ?	; DWM_FRAME_COUNT
	cFramesDropped		dq ?	; DWM_FRAME_COUNT
	cFramesMissed		dq ?	; DWM_FRAME_COUNT
	cRefreshNextDisplayed	dq ?	; DWM_FRAME_COUNT
	cRefreshNextPresented	dq ?	; DWM_FRAME_COUNT
	cRefreshesDisplayed	dq ?	; DWM_FRAME_COUNT
	cRefreshesPresented	dq ?	; DWM_FRAME_COUNT
	cRefreshStarted		dq ?	; DWM_FRAME_COUNT
	cPixelsReceived		dq ?	; ULONGLONG
	cPixelsDrawn		dq ?	; ULONGLONG
	cBuffersEmpty		dq ?	; DWM_FRAME_COUNT
ends

; enum DWM_SOURCE_FRAME_SAMPLING
DWM_SOURCE_FRAME_SAMPLING_POINT		:= 0
DWM_SOURCE_FRAME_SAMPLING_COVERAGE	:= 1
DWM_SOURCE_FRAME_SAMPLING_LAST		:= 2

;c_DwmMaxQueuedBuffers	:= 8
;c_DwmMaxMonitors	:= 16
;c_DwmMaxAdapters	:= 16

struct DWM_PRESENT_PARAMETERS
	cbSize			dd ?	; UINT32
	fQueue			dd ?	; BOOL
	cRefreshStart		dq ?	; DWM_FRAME_COUNT
	cBuffer			dd ?	; UINT
	fUseSourceRate		dd ?	; BOOL
	rateSource		UNSIGNED_RATIO
	cRefreshesPerFrame	dd ?	; UINT
	eSampling		dd ?	; enum DWM_SOURCE_FRAME_SAMPLING
ends

DWM_FRAME_DURATION_DEFAULT := -1

DWM_EC_DISABLECOMPOSITION := 0
DWM_EC_ENABLECOMPOSITION  := 1

DWM_SIT_DISPLAYFRAME := 0x00000001

struct MilMatrix3x2D
	S_11	dq ?	; double
	S_12	dq ?	; double
	S_21	dq ?	; double
	S_22	dq ?	; double
	DX	dq ?	; double
	DY	dq ?	; double
ends ; MilMatrix3x2D

; enum DWMTRANSITION_OWNEDWINDOW_TARGET
DWMTRANSITION_OWNEDWINDOW_NULL       := -1
DWMTRANSITION_OWNEDWINDOW_REPOSITION := 0

; enum GESTURE_TYPE
GT_PEN_TAP                 := 0
GT_PEN_DOUBLETAP           := 1
GT_PEN_RIGHTTAP            := 2
GT_PEN_PRESSANDHOLD        := 3
GT_PEN_PRESSANDHOLDABORT   := 4
GT_TOUCH_TAP               := 5
GT_TOUCH_DOUBLETAP         := 6
GT_TOUCH_RIGHTTAP          := 7
GT_TOUCH_PRESSANDHOLD      := 8
GT_TOUCH_PRESSANDHOLDABORT := 9
GT_TOUCH_PRESSANDTAP       := 10

; enum DWM_SHOWCONTACT
DWMSC_DOWN      := 0x00000001
DWMSC_UP        := 0x00000002
DWMSC_DRAG      := 0x00000004
DWMSC_HOLD      := 0x00000008
DWMSC_PENBARREL := 0x00000010
DWMSC_NONE      := 0x00000000
DWMSC_ALL       := 0xFFFFFFFF

; enum DWM_TAB_WINDOW_REQUIREMENTS
DWMTWR_NONE			:= 0x0000
DWMTWR_IMPLEMENTED_BY_SYSTEM	:= 0x0001
DWMTWR_WINDOW_RELATIONSHIP	:= 0x0002
DWMTWR_WINDOW_STYLES		:= 0x0004
DWMTWR_WINDOW_REGION		:= 0x0008
DWMTWR_WINDOW_DWM_ATTRIBUTES	:= 0x0010
DWMTWR_WINDOW_MARGINS		:= 0x0020
DWMTWR_TABBING_ENABLED		:= 0x0040
DWMTWR_USER_POLICY		:= 0x0080
DWMTWR_GROUP_POLICY		:= 0x0100
DWMTWR_APP_COMPAT		:= 0x0200
