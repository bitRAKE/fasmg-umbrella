
; multi-monitor window boarder snapping
;	- turn off with shift key
;	- range configurable

; requires:
;	.P7
;	window\utility.inc

struc(NAMED) MagneticWindow SNAP_PIXELS:20
namespace NAMED

macro BeginDrag hWnd*,X,Y
	match ,X ; typical packed signed word coordinates
		movsx eax,r9w	; signed x-coordinate
		sar r9d,16	; signed y-coordinate
		mov [NAMED.HotSpot.x],eax
		mov [NAMED.HotSpot.y],r9d
	else match ,Y ; POINT reg/mem
		push X
		pop qword [NAMED.HotSpot]
	else ; verbose values reg/imm
		mov [NAMED.HotSpot.x],X
		mov [NAMED.HotSpot.y],Y
	end match
	SetCapture hWnd
	mov [NAMED.Dragging],1
end macro

macro EndDrag
	mov [NAMED.Dragging],0
	ReleaseCapture
end macro

macro Drag hWnd*,X,Y
	local skip,no_snap,rect,point
	test [NAMED.Dragging],-1
	jz skip
	; use parameter space of message handler
	label rect:RECT		at .P5
	label point:POINT	at .P7
	match ,X ; typical packed signed word coordinates
		movsx eax,r9w	; signed x-coordinate
		sar r9d,16	; signed y-coordinate
		sub eax,[NAMED.HotSpot.x]
		sub r9d,[NAMED.HotSpot.y]
		mov dword [point + 0],eax
		mov dword [point + 4],r9d
	else match ,Y ; POINT reg/mem
		push X
		pop [point]
	else ; verbose values reg/imm
		mov dword [point + 0],X
		mov dword [point + 4],Y
	end match

	GetCapture
	cmp hWnd,rax
	jnz skip

	match ,X
	else
		vmovq xmm0,[point]
		vmovq xmm1,qword [NAMED.HotSpot]
		vpsubd xmm0,xmm0,xmm1
		vmovq [point],xmm0
	end match

	xchg rcx,rax
	ClientToScreen rcx, ADDR point

	; With the shift key pressed, snapping does not happen.
	GetAsyncKeyState VK_SHIFT
	test ax,ax
	js no_snap

; TODO: fit window RECT for DWM decoration offsets

	GetWindowRect hWnd, ADDR rect
	GetWorkAreaRect hWnd ; XMM0
	jrcxz no_snap

if 0 ; unfinshed ...
	vmovdqa		xmm5,dqword [rect]
	vpshufd		xmm1,dqword [point],01_00_01_00b	; A

	vpshufd		xmm4,xmm5,01_00_0000b	; top,		left,	?, ?
	vpshufd		xmm5,xmm5,11_10_0000b	; bottom,	right,	?, ?

	vpbroadcastd	xmm3,[NAMED.Snap]

	vpsubd		xmm5,xmm5,xmm4		; height,	width,	?, ?
	vpsubd		xmm5,xmm0,xmm5		; B

	vpsubd		xmm2,xmm5,xmm1
	vpabsd		xmm2,xmm2
	vpcmpgtd	xmm2,xmm3,xmm2
	vblendvps	xmm0,xmm1,xmm5,xmm2
; how to select which? mask?
	vmovlps		[point],xmm0 ; *PS because of blend?
else
	vmovq		xmm5,[point]
	vpbroadcastd	xmm3,[NAMED.Snap]

	vmovq		xmm1,xmm0
	vmovq		xmm4,[rect]

	vpsubd		xmm2,xmm1,xmm5
	vpabsd		xmm2,xmm2
	vpcmpgtd	xmm2,xmm3,xmm2
	vblendvps	xmm5,xmm5,xmm1,xmm2

	vmovq		xmm2,[rect + 8]
	vpshufd		xmm1,xmm0,11_10b
	vpsubd		xmm2,xmm4,xmm2
	vpaddd		xmm1,xmm2,xmm1

	vpsubd		xmm2,xmm1,xmm5
	vpabsd		xmm2,xmm2
	vpcmpgtd	xmm2,xmm3,xmm2
	vblendvps	xmm0,xmm5,xmm1,xmm2

	vmovlps		[point],xmm0
end if

no_snap:
	mov r8d,dword [point + 0]
	mov r9d,dword [point + 4]
	SetWindowPos hWnd, 0, r8, r9, 0, 0, SWP_NOSIZE
skip:
end macro

end namespace ; NAMED

virtual DATA.16
	NAMED.HotSpot	POINT
	NAMED.Snap	dd SNAP_PIXELS	; unsigned
	NAMED.Dragging	db ?		; 0 or 1
	align 16
end virtual

end struc ; MagneticWindow
