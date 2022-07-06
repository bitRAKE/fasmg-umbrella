
; ITextHost2 interface for use with CreateTextServices

include 'TextServ.inc.g'
define xITextHost2
namespace xITextHost2

struct object
	vt	dq ?
	ref	dd ?
ends
assert object.vt = 0 ; model requires it to be first

;: instance of type, to be called by class factory
xITextHost2:
	enter 32,0
	CoTaskMemAlloc sizeof object
	xchg rcx,rax
	jrcxz @F
	lea rax,[vftable]
	mov [rcx+object.vt],rax
	mov [rcx+object.ref],1
@@:	leave
	retn

QueryInterface:
	test r8,r8
	jz .E_INVALIDARG
	mov r10,[rdx]
	mov r11,[rdx+8]
	; compare against all supported interfaces ...
	iterate iid, IID_IUnknown,IID_ITextHost2,IID_ITextHost
		cmp qword [iid],r10
		jnz .%
		cmp qword [iid+8],r11
		jz .S_OK
	.%:
	end iterate
    .S_OK:
	mov	[r8],rcx
	call	AddRef
	push	S_OK
	pop	rax
	retn

    .E_INVALIDARG:
	mov eax,E_INVALIDARG
	retn

    .E_NOINTERFACE:
	and qword [r8],0
	mov eax,E_NOINTERFACE
	retn

AddRef:
	push 1
	pop rax
	lock xadd [rcx+object.ref],eax
	retn

Release:
	push -1
	pop rax
	lock xadd [rcx+object.ref],eax
	jnz @F
	enter 32,0
	CoTaskMemFree rcx
	leave
@@:	retn


;: get the DC for the host
TxGetDC:
	xor eax,eax
	retn ; HDC


;: release the DC gotten from the host
TxReleaseDC:
;	ReleaseDC
	xor eax,eax
	retn ; INT


;: show the scroll bar
TxShowScrollBar: ; INT fnBar, BOOL fShow
	xor eax,eax ; FALSE
	retn ; BOOL


;: enable the scroll bar
TxEnableScrollBar: ; INT fuSBFlags, INT fuArrowflags
	xor eax,eax ; FALSE
	retn ; BOOL


;: set the scroll range
TxSetScrollRange: ; INT fnBar, LONG nMinPos, INT nMaxPos, BOOL fRedraw
	xor eax,eax ; FALSE
	retn ; BOOL


;: set the scroll position
TxSetScrollPos: ; INT fnBar, INT nPos, BOOL fRedraw
	xor eax,eax ; FALSE
	retn ; BOOL


;: invalidate rectangle
TxInvalidateRect: ; LPCRECT prc, BOOL fMode
	retn ; void


;: send a WM_PAINT to the window
TxViewChange: ; BOOL fUpdate
	retn ; void


;: create the caret
TxCreateCaret: ; HBITMAP hbmp, INT xWidth, INT yHeight
	push 1
	pop rax ; TRUE
	retn ; BOOL


;: show the caret
TxShowCaret: ; BOOL fShow
	push 1
	pop rax ; TRUE
	retn ; BOOL


;: set the caret position
TxSetCaretPos: ; INT x, INT y
	push 1
	pop rax ; TRUE
	retn ; BOOL


;: create a timer with the specified timeout
TxSetTimer: ; UINT idTimer, UINT uTimeout
;	SetTimer [],rdx,r8,0
	push 1
	pop rax ; TRUE
	retn ; BOOL


;: destroy a timer
TxKillTimer: ; UINT idTimer
;	mov edx,edx ; truncate
;	mov rcx,[rcx+XXX.timer]
;	jmp [NtUserKillTime]
	retn ; void


;: scroll the content of the specified window's client area
TxScrollWindowEx: ; INT dx, INT dy, LPCRECT lprcScroll,	LPCRECT lprcClip, HRGN hrgnUpdate, LPRECT lprcUpdate, UINT fuScroll
	retn ; void


;: get mouse capture
TxSetCapture: ; BOOL fCapture
;	test edx,edx
;	jz .release
;	CapturePointer
;	leave
;	retn ; void
;.release:
;	ReleasePointerCapture
;	leave
	retn ; void


;: set the focus to the text window
TxSetFocus:
	retn ; void


;: establish a new cursor shape
TxSetCursor: ; HCURSOR hcur, BOOL fText
	retn ; void


;: converts screen coordinates of a specified point to the client coordinates 
TxScreenToClient: ; LPPOINT lppt
	xor eax,eax ; FALSE
	retn ; BOOL


;: converts the client coordinates of a specified point to screen coordinates
TxClientToScreen: ; LPPOINT lppt
	xor eax,eax ; FALSE
	retn ; BOOL


;: request host to activate text services
TxActivate: ; LONG* plOldState
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: request host to deactivate text services
TxDeactivate: ; LONG lNewState
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: retrieves the coordinates of a window's client area
TxGetClientRect: ; LPRECT prc
	; TODO:
	xor eax,eax ; S_OK
	retn ; HRESULT


;: get the view rectangle relative to the inset
TxGetViewInset: ; LPRECT prc
	xor eax,eax ; S_OK
	mov qword [rdx+8],1
	mov [rdx],rax
	retn ; HRESULT


;: get the default character format for the text
TxGetCharFormat: ; const CHARFORMATW** ppCF
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: get the default paragraph format for the text
TxGetParaFormat: ; const PARAFORMAT** ppPF
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: get the background color for the window
TxGetSysColor: ; int nIndex
;	GetSysColor rdx
	xor eax,eax
	retn ; COLORREF


;: get the background (either opaque or transparent)
TxGetBackStyle: ; TXTBACKSTYLE* pstyle
;	mov dword [rdx],TXTBACK_TRANSPARENT
	and dword [rdx],0
	xor eax,eax ; S_OK
	retn ; HRESULT


;: get the maximum length for the text
TxGetMaxLength: ; DWORD* plength
	mov dword [rdx],0x7FFFFFF
	xor eax,eax ; S_OK
	retn ; HRESULT


;: get the bits representing requested scroll bars for the window
TxGetScrollBars: ; DWORD* pdwScrollBar
	and dword [rdx],0
	xor eax,eax ; S_OK
	retn ; HRESULT


;: get the character to display for password input
TxGetPasswordChar: ; _Out_ TCHAR* pch
	mov word [rdx],0
	xor eax,eax ; S_OK
	retn ; HRESULT


;: get the accelerator character
TxGetAcceleratorPos: ; LONG* pcp
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: get the native size
TxGetExtent: ; LPSIZEL lpExtent
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: notify host that default character format has changed
OnTxCharFormatChange: ; const CHARFORMATW* pCF
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: notify host that default paragraph format has changed
OnTxParaFormatChange: ; const PARAFORMAT* pPF
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: bulk access to bit properties
TxGetPropertyBits: ; DWORD dwMask, DWORD* pdwBits
	and edx,TXTBIT_RICHTEXT or TXTBIT_D2DDWRITE
	mov [r8],edx
	xor eax,eax ; S_OK
	retn ; HRESULT


;: notify host of events
TxNotify: ; DWORD iNotify, void* pv
	xor eax,eax ; S_OK
	retn ; HRESULT


;: East Asia methods for getting the input context
TxImmGetContext:
;	mov rcx,[rcx+32]
;	{ get input window }
;	ImmGetContext rcx
	xor eax,eax ; NULL
	retn ; HIMC
TxImmReleaseContext: ; HIMC himc
;	{ get input window }
;	ImmReleaseContext rcx,rdx
	retn ; void


;: returns HIMETRIC size of the control bar
TxGetSelectionBarWidth: ; LONG* lSelBarWidth
	and dword [rdx],0
	xor eax,eax ; S_OK
	retn ; HRESULT


;: is a double click in the message queue?
TxIsDoubleClickPending:
	xor eax,eax ; FALSE
	retn ; BOOL


;: get the overall window for this control	 
TxGetWindow: ; HWND* phwnd
;	mov [rdx],rax
	xor eax,eax ; S_OK
	retn ; HRESULT


;: set control window to foreground
TxSetForegroundWindow:
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: get logical palette for control
TxGetPalette:
	xor eax,eax ; NULL
	retn ; HPALETTE


;: gets whether Input Method Editor (IME) input is allowed and if edit styles include ES_SELFIME
TxGetEastAsianFlags: ; LONG* pFlags
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: routes the cursor change to the winhost
TxSetCursor2: ; HCURSOR hcur, BOOL bText
	push rdx
	pop rcx
	jrcxz @F
;	ext_ms_win_rtcore_ntuser_cursor_l1_1_0_dll
@@:	xor eax,eax ; NULL
	retn ; HCURSOR


;: notification that text services has been freed
TxFreeTextServicesNotification:
	retn ; void


;: gets whether a rich edit control is in a dialog box
TxGetEditStyle: ; DWORD dwItem, DWORD* pdwData
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: get window style bits
TxGetWindowStyles: ; DWORD* pdwStyle, DWORD* pdwExStyle
	and dword [rdx],0
	and dword [r8],0
	xor eax,eax ; S_OK
	retn ; HRESULT


;: Show / hide drop caret (D2D-only)
TxShowDropCaret: ; BOOL fShow, HDC hdc, LPCRECT prc
	mov eax,E_NOTIMPL
	retn ; HRESULT


;: destroy caret (D2D-only)
TxDestroyCaret:
	xor eax,eax ; S_OK
	retn ; HRESULT


;: get horizontal scroll extent
TxGetHorzExtent: ; LONG* plHorzExtent
	mov eax,E_NOTIMPL
	retn ; HRESULT

end namespace ; xITextHost2


collect __DATA
align 16
xITextHost2.vftable dq \
	xITextHost2.QueryInterface,\
	xITextHost2.AddRef,\
	xITextHost2.Release,\
	xITextHost2.TxGetDC,\
	xITextHost2.TxReleaseDC,\
	xITextHost2.TxShowScrollBar,\
	xITextHost2.TxEnableScrollBar,\
	xITextHost2.TxSetScrollRange,\
	xITextHost2.TxSetScrollPos,\
	xITextHost2.TxInvalidateRect ,\
	xITextHost2.TxViewChange,\
	xITextHost2.TxCreateCaret,\
	xITextHost2.TxShowCaret,\
	xITextHost2.TxSetCaretPos,\
	xITextHost2.TxSetTimer,\
	xITextHost2.TxKillTimer,\
	xITextHost2.TxScrollWindowEx,\
	xITextHost2.TxSetCapture,\
	xITextHost2.TxSetFocus,\
	xITextHost2.TxSetCursor,\
	xITextHost2.TxScreenToClient,\
	xITextHost2.TxClientToScreen,\
	xITextHost2.TxActivate,\
	xITextHost2.TxDeactivate,\
	xITextHost2.TxGetClientRect,\
	xITextHost2.TxGetViewInset,\
	xITextHost2.TxGetCharFormat,\
	xITextHost2.TxGetParaFormat,\
	xITextHost2.TxGetSysColor,\
	xITextHost2.TxGetBackStyle,\
	xITextHost2.TxGetMaxLength,\
	xITextHost2.TxGetScrollBars,\
	xITextHost2.TxGetPasswordChar,\
	xITextHost2.TxGetAcceleratorPos,\
	xITextHost2.TxGetExtent,\
	xITextHost2.OnTxCharFormatChange,\
	xITextHost2.OnTxParaFormatChange,\
	xITextHost2.TxGetPropertyBits,\
	xITextHost2.TxNotify,\
	xITextHost2.TxImmGetContext,\
	xITextHost2.TxImmReleaseContext,\
	xITextHost2.TxGetSelectionBarWidth,\
	\;	ITextHost2 functions:
	xITextHost2.TxIsDoubleClickPending,\
	xITextHost2.TxGetWindow,\
	xITextHost2.TxSetForegroundWindow,\
	xITextHost2.TxGetPalette,\
	xITextHost2.TxGetEastAsianFlags,\
	xITextHost2.TxSetCursor2,\
	xITextHost2.TxFreeTextServicesNotification,\
	xITextHost2.TxGetEditStyle,\
	xITextHost2.TxGetWindowStyles,\
	xITextHost2.TxShowDropCaret,\
	xITextHost2.TxDestroyCaret,\
	xITextHost2.TxGetHorzExtent
end collect
