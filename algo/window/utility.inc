
; utility functions for windows
;
;	~ assumptions of macro use:
;		+ stack is aligned with valid shadow at TOS
;
;	~ macro wrappers act as an adapter
;		+ provide default values
;		+ hide internal ABI

macro CenterWindowPos hWnd*,hwndAfter*,width*,height*,flags:SWP_NOACTIVATE
	push rbp,flags,height,width,hwndAfter,hWnd
	call _CenterWindowPos
end macro
if used _CenterWindowPos
align 16
_CenterWindowPos:
	virtual at RSP
				dq ?,?
		; these are passed on the stack
		.hWnd		dq ?
		.hwndAfter	dq ?
		.width		dd ?,?
		.height		dd ?,?
		.flags		dd ?,?
		.RETN		dq ?
		.parm_bytes := $ - $$
	end virtual
	pop rax
	push rbp rbp
	mov [.RETN],rax
	GetWorkAreaRect [.hWnd] ; XMM0 RECT
	jrcxz .fail

	vpshufd xmm1,xmm0,11_10b		; bottom, right
	vpshufd xmm2,dqword[.width],10_00b	; height, width
	vpsubd xmm1,xmm1,xmm0
	vpsubd xmm1,xmm1,xmm2
	vpsrad xmm1,xmm1,1
	vpaddd xmm0,xmm1,xmm0
	vmovd r8d,xmm0
	vpextrd r9d,xmm0,1

	; note parameters after shadow space have not moved
	SetWindowPos [.hWnd], [.hwndAfter], r8, r9 ; [.width], [.height], [.flags]
.fail:
	push [.RETN]
	retn .parm_bytes
end if ; _CenterWindowPos



; work rectangle for display containing most of window
macro GetWorkAreaRect hWnd*
	call _GetWorkAreaRect,hWnd
end macro
if used _GetWorkAreaRect
align 16
_GetWorkAreaRect:
; RCX: hWnd, RCX = 0 on fail, does not use shadow space
	virtual at RBP-.frame
			rq 4
		.mi	MONITORINFO
			_align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	MonitorFromWindow rcx, MONITOR_DEFAULTTONEAREST ; HMONITOR
	xchg rcx,rax
	jrcxz .fail
	vpxor xmm0,xmm0,xmm0
	mov qword [.mi.cbSize], sizeof MONITORINFO ; 40
	vmovups qqword [.mi + 8],ymm0
	GetMonitorInfoW rcx, ADDR .mi ; BOOL
	xchg ecx,eax
	jrcxz .fail
	vmovdqu xmm0,dqword[.mi.rcWork]
.fail:	leave
	retn
end if ; _GetWorkAreaRect



macro CenterWindowPos_FromPoint point,hWnd*,hwndAfter*,width*,height*,flags:SWP_NOACTIVATE
	push rbp,flags,height,width,hwndAfter,hWnd
	call _CenterWindowPos_FromPoint, point
end macro
if used _CenterWindowPos_FromPoint
align 16
_CenterWindowPos_FromPoint:
	virtual at RSP
				dq ?,?
		; these are passed on the stack
		.hWnd		dq ?
		.hwndAfter	dq ?
		.width		dd ?,?
		.height		dd ?,?
		.flags		dd ?,?
		.RETN		dq ?
		.parm_bytes := $ - $$
	end virtual
	pop rax
	push rbp rbp
	mov [.RETN],rax
	GetWorkAreaRect_FromPoint rcx ; XMM0 RECT
	jrcxz .fail

	vpshufd xmm1,xmm0,11_10b		; bottom, right
	vpshufd xmm2,dqword[.width],10_00b	; height, width
	vpsubd xmm1,xmm1,xmm0
	vpsubd xmm1,xmm1,xmm2
	vpsrad xmm1,xmm1,1
	vpaddd xmm0,xmm1,xmm0
	vmovd r8d,xmm0
	vpextrd r9d,xmm0,1

	; note parameters after shadow space have not moved
	SetWindowPos [.hWnd], [.hwndAfter], r8, r9 ; [.width], [.height], [.flags]
.fail:
	push [.RETN]
	retn .parm_bytes
end if ; _CenterWindowPos



; work rectangle for display containing point
macro GetWorkAreaRect_FromPoint point*
	call _GetWorkAreaRect_FromPoint,point
end macro
if used _GetWorkAreaRect_FromPoint
align 16
_GetWorkAreaRect_FromPoint:
; RCX: POINT address, RCX = 0 on fail, does not use shadow space
	virtual at RBP-.frame
			rq 4
		.mi	MONITORINFO
			_align 16
		.frame := $ - $$
	end virtual
	enter .frame,0
	; note: POINT is passed in register!
	MonitorFromPoint rcx, MONITOR_DEFAULTTONEAREST
	xchg rcx,rax
	jrcxz .fail
	vpxor xmm0,xmm0,xmm0
	mov qword [.mi.cbSize], sizeof MONITORINFO ; 40
	vmovups qqword [.mi + 8],ymm0
	GetMonitorInfoW rcx, ADDR .mi ; BOOL
	xchg ecx,eax
	jrcxz .fail
	vmovdqu xmm0,dqword[.mi.rcWork]
.fail:	leave
	retn
end if ; _GetWorkAreaRect_FromPoint











; return all RECTs in case any are needed:
;	XMMO: window RECT without decoration (lie to windows to get correct position)
;	XMM1: window RECT with decoration (what window reports, false)
;	XMM2: window extended RECT (what windows draws)
macro GetUndecoratedWindowRect hWnd*
	call _GetWorkAreaRect,hWnd
end macro
if used _GetUndecoratedWindowRect
_GetUndecoratedWindowRect:
	virtual at RBP-.frame
				rq 4
		.frame		RECT
		.rect		RECT
				_align 16
		.frame := $ - $$
				dq ?,?
		.hWnd		dq ?
	end virtual
	enter .frame,0
	mov [.hWnd],rcx
	GetWindowRect [.hWnd], ADDR .rect
	DwmGetWindowAttribute [.hWnd],\
		DWMWA_EXTENDED_FRAME_BOUNDS, ADDR .frame, sizeof RECT
	vmovdqa xmm1,dqword [.rect]	; window w/o
	vmovdqa xmm2,dqword [.frame]	; actual gfx area changed by windows
	vpsubd xmm3,xmm2,xmm1		; border
	vpaddd xmm0,xmm0,xmm1
	leave
	retn

        vmovq   xmm1, qword ptr [rdx]           # xmm1 = mem[0],zero

        vmovq   xmm0, qword ptr [rdi]           # xmm0 = mem[0],zero
        vmovq   xmm2, qword ptr [rdi + 8]       # xmm2 = mem[0],zero
        vpsubd  xmm0, xmm0, xmm1
        vmovq   xmm1, qword ptr [rdx + 8]       # xmm1 = mem[0],zero
        vpsubd  xmm1, xmm1, xmm2
        vpunpcklqdq     xmm2, xmm0, xmm1        # xmm2 = xmm0[0],xmm1[0]
        vmovdqu xmmword ptr [rsi], xmm2

        vmovq   xmm2, qword ptr [rdx]           # xmm2 = mem[0],zero
        vpsubd  xmm0, xmm2, xmm0
        vmovq   qword ptr [rdx], xmm0
        vmovq   xmm0, qword ptr [rsi]           # xmm0 = mem[0],zero
        vmovq   xmm2, qword ptr [rdx + 8]       # xmm2 = mem[0],zero
        vpaddd  xmm0, xmm0, xmm2
        vpaddd  xmm0, xmm1, xmm0
        vmovq   qword ptr [rdx + 8], xmm0

end if
