
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
