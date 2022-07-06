
; Text Service Interface

; no code generation, only interfaces

if ~ definite INC_TEXTSERV
INC_TEXTSERV := 1

TXTBACK_TRANSPARENT:=0
TXTBACK_OPAQUE:=1

TXTHITRESULT_NOHIT:=0
TXTHITRESULT_TRANSPARENT:=1
TXTHITRESULT_CLOSE:=2
TXTHITRESULT_HIT:=3

TXTNS_FITTOCONTENT2:=0
TXTNS_FITTOCONTENT:=1
TXTNS_ROUNDTOLINE:=2
TXTNS_FITTOCONTENT3:=3
TXTNS_FITTOCONTENTWSP:=4
TXTNS_INCLUDELASTLINE	:=0x40000000
TXTNS_EMU		:=0x80000000

TXTVIEW_ACTIVE:=0
TXTVIEW_INACTIVE:=-1

CN_GENERIC	:= 0
CN_TEXTCHANGED	:= 1
CN_NEWUNDO	:= 2
CN_NEWREDO	:= 4

struct CHANGENOTIFY
	dwChangeType	dd ?,?
	pvCookieData	dq ?
ends

; TxGetPropertyBits and OnTxPropertyBitsChange methods can pass the following bits:

TXTBIT_RICHTEXT			:= 0x00000001	; rich-text control
TXTBIT_MULTILINE		:= 0x00000002	; single vs multi-line control
TXTBIT_READONLY			:= 0x00000004	; read only text
TXTBIT_SHOWACCELERATOR		:= 0x00000008	; underline accelerator character
TXTBIT_USEPASSWORD		:= 0x00000010	; use password char to display text
TXTBIT_HIDESELECTION		:= 0x00000020	; show selection when inactive
TXTBIT_SAVESELECTION		:= 0x00000040	; remember selection when inactive
TXTBIT_AUTOWORDSEL		:= 0x00000080	; auto-word selection 
TXTBIT_VERTICAL			:= 0x00000100	; vertical
TXTBIT_SELBARCHANGE		:= 0x00000200	; notification that the selection bar width has changed. FUTURE: move this bit to the end to maintain the division between  properties and notifications
TXTBIT_WORDWRAP			:= 0x00000400	; if set, then multi-line controls should wrap words to fit the available display
TXTBIT_ALLOWBEEP		:= 0x00000800	; enable/disable beeping
TXTBIT_DISABLEDRAG		:= 0x00001000	; disable/enable dragging
TXTBIT_VIEWINSETCHANGE		:= 0x00002000	; the inset cchanged
TXTBIT_BACKSTYLECHANGE		:= 0x00004000	;
TXTBIT_MAXLENGTHCHANGE		:= 0x00008000	;
TXTBIT_SCROLLBARCHANGE		:= 0x00010000	;
TXTBIT_CHARFORMATCHANGE		:= 0x00020000	;
TXTBIT_PARAFORMATCHANGE		:= 0x00040000	;
TXTBIT_EXTENTCHANGE		:= 0x00080000	;
TXTBIT_CLIENTRECTCHANGE		:= 0x00100000	; the client rectangle changed
TXTBIT_USECURRENTBKG		:= 0x00200000	; tells the renderer to use the current background color rather than the system default for an entire line
TXTBIT_NOTHREADREFCOUNT		:= 0x00400000	; don't reference TLS data on behalf of this instance
TXTBIT_SHOWPASSWORD		:= 0x00800000	; Show password string
TXTBIT_D2DDWRITE		:= 0x01000000	; Use D2D/DWrite for this instance (and not GDI/Uniscribe)
TXTBIT_D2DSIMPLETYPOGRAPHY	:= 0x02000000	; Don't glyph all. Only valid if D2DDWRITE is set
TXTBIT_D2DPIXELSNAPPED		:= 0x04000000	; Don't do subpixel. Only valid if D2DDWRITE is set
TXTBIT_D2DSUBPIXELLINES		:= 0x08000000	; Don't pixel-snap text lines and underline, strikethrough in the secondary text flow direction (usually vertical) Only valid if D2DDWRITE is set and D2DPIXELSNAPPED is not set
TXTBIT_FLASHLASTPASSWORDCHAR	:= 0x10000000	; Show last password char momentarily
TXTBIT_ADVANCEDINPUT		:= 0x20000000	; Use advanced input features
TXTBIT_UNDOCUMENTED1		:= 0x40000000
TXTBIT_UNDOCUMENTED2		:= 0x80000000

ITextServices			interface 8D33F740-CF58-11CE-A89D-00AA006CADC5,\
	EXTENDS__IUnknown,\
	TxSendMessage,\
	TxDraw,\
	TxGetHScroll,\
	TxGetVScroll,\
	OnTxSetCursor,\
	TxQueryHitPoint,\
	OnTxInPlaceActivate,\
	OnTxInPlaceDeactivate,\
	OnTxUIActivate,\
	OnTxUIDeactivate,\
	TxGetText,\
	TxSetText,\
	TxGetCurTargetX,\
	TxGetBaseLinePos,\
	TxGetNaturalSize,\
	TxGetDropTarget,\
	OnTxPropertyBitsChange,\
	TxGetCachedSize

ITextServices2			interface 8D33F741-CF58-11CE-A89D-00AA006CADC5,\
	EXTENDS__ITextServices,TxGetNaturalSize2,TxDrawD2D

;: UNDOCUMENTED
ITextServices3			interface 19DAE8DB-DDC7-4130-833F-E6ABBB8101FC,\
	EXTENDS__ITextServices2,TxDrawWithRenderer ; (struct ITextRenderTarget * __ptr64,struct _RECTL const * __ptr64,struct tagRECT * __ptr64,long) __ptr64
;: UNDOCUMENTED


CARET_NONE	:= 0
CARET_CUSTOM	:= 1
CARET_RTL	:= 2
CARET_ITALIC	:= 32
CARET_NULL	:= 64
CARET_ROTATE90	:= 128

ITextHost			interface C5BDD8D0-D26E-11CE-A89E-00AA006CADC5,\
	EXTENDS__IUnknown,\
	TxGetDC,\
	TxReleaseDC,\
	TxShowScrollBar,\
	TxEnableScrollBar,\
	TxSetScrollRange,\
	TxSetScrollPos ,\
	TxInvalidateRect,\
	TxViewChange,\
	TxCreateCaret,\
	TxShowCaret,\
	TxSetCaretPos,\
	TxSetTimer,\
	TxKillTimer,\
	TxScrollWindowEx,\
	TxSetCapture,\
	TxSetFocus,\
	TxSetCursor,\
	TxScreenToClient,\
	TxClientToScreen,\
	TxActivate,\
	TxDeactivate,\
	TxGetClientRect,\
	TxGetViewInset,\
	TxGetCharFormat,\
	TxGetParaFormat,\
	TxGetSysColor,\
	TxGetBackStyle,\
	TxGetMaxLength,\
	TxGetScrollBars,\
	TxGetPasswordChar,\
	TxGetAcceleratorPos,\
	TxGetExtent,\
	OnTxCharFormatChange,\
	OnTxParaFormatChange,\
	TxGetPropertyBits,\
	TxNotify,\
	TxImmGetContext,\
	TxImmReleaseContext,\
	TxGetSelectionBarWidth

ITextHost2			interface 13E670F5-1A5A-11CF-ABEB-00AA00B65EA1,\
	EXTENDS__ITextHost,\
	TxIsDoubleClickPending,\
	TxGetWindow,\
	TxSetForegroundWindow,\
	TxGetPalette,\
	TxGetEastAsianFlags,\
	TxSetCursor2,\
	TxFreeTextServicesNotification,\
	TxGetEditStyle,\
	TxGetWindowStyles,\
	TxShowDropCaret,\
	TxDestroyCaret,\
	TxGetHorzExtent

ITextHostEx			interface 13E670F6-1A5A-11CF-ABEB-00AA00B65EA1,\
	EXTENDS__ITextHost2


IRicheditWindowlessAccessibility interface 983E572D-20CD-460B-9104-83111592DD10,\
	EXTENDS__IUnknown,CreateProvider

IRichEditUiaInformation		interface 23969A9D-8546-4032-A1BB-73750CBF3333,\
	EXTENDS__IUnknown,GetBoundaryRectangle,IsVisible

IRicheditUiaOverrides		interface F2FB5CC0-B5A9-437F-9BA2-47632082269F,\
	EXTENDS__IUnknown,GetPropertyOverrideValue

end if ; INC_TEXTSERV
