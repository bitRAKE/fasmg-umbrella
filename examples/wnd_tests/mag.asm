
; tests for magnetic (snapping) window feature

format PE64 GUI 6.2 at 0x1234_5678_0000
include 'umbrella.g'
include 'api\dwmapi.g' ; restricted to DWM compatible systems
include 'cpu\ext\avx2.inc'

include 'algo\window\utility.inc'
include 'algo\window\magnetic.g'
WndProc:
	virtual at rbp - .frame
			rq 4
		.P5	dq ?
		.P6	dq ?
		.P7	dq ?

		.mag	MagneticWindow 24 ; set snap distance

			align.assume rbp, 16
			align 16
		.frame := $ - $$
			dq ?,?
		.hWnd	dq ?
	end virtual
	enter .frame,0
	mov [.hWnd],rcx
	iterate MSG, WM_COMMAND,\
		WM_LBUTTONDOWN,WM_LBUTTONUP,WM_MOUSEMOVE,\
		WM_KEYDOWN,WM_DESTROY
		cmp edx,MSG
		jz .MSG
	end iterate
.default:
	DefWindowProcW rcx,rdx,r8,r9
	; forward result
	leave
	retn

.WM_KEYDOWN:
	cmp r8d,VK_ESCAPE
	jnz .default
.WM_DESTROY:
	PostQuitMessage 0
.processed:
	xor eax,eax
	leave
	retn

.WM_COMMAND:
	cmp r8w,IDM_SNAP3
	jc .default
	cmp r8w,IDM_SNAP6+1
	jnc .default
	mov cl,r8b
	mov eax,1
	shl eax,cl
	mov [.mag.Snap],eax
	jmp .processed

.WM_LBUTTONDOWN:
	.mag.BeginDrag [.hWnd] ; use R9 mouse coordinates
	jmp .processed

.WM_MOUSEMOVE:
	.mag.Drag [.hWnd] ; use R9 mouse coordinates
	jmp .processed

.WM_LBUTTONUP:
	.mag.EndDrag
	jmp .processed



collect DATA.64
	WinMain.wc WNDCLASSEXW	\
		cbSize:		sizeof WNDCLASSEX,\
		style:		CS_HREDRAW or CS_VREDRAW,\
		lpfnWndProc:	WndProc,\
		hbrBackground:	COLOR_BTNTEXT + 1,\
		hInstance:	__ImageBase,\
		lpszMenuName:	IDM_MAIN,\
		lpszClassName:	ClassName

	ClassName du 'bitRAKE.2022',0
	align 64
end collect

WinMain.fatal:
	ExitProcess 255
	int3
WinMain: ENTRY $
	virtual at rbp - .frame
			rq 4
		repeat 12-4,i:5
		.P#i	dq ?
		end repeat

		.hWnd	dq ?
			align.assume rbp, 16
			align 16
		.frame := $ - $$
		assert sizeof MSG <= 8*6
		.mgs	MSG
	end virtual
	enter .frame,0
	GetDesktopWindow
	mov [.hWnd],rax
	RegisterClassExW ADDR .wc ; ATOM
	movzx ecx,ax
	jrcxz .fatal
	CreateWindowExW 0,rcx,0,WS_POPUP,0,0,0,0,[.hWnd],0,[.wc.hInstance],rbp
	mov [.hWnd],rax
	test rax,rax
	jz .fatal

	GetMenu [.hWnd]
	xchg rcx,rax
	jrcxz @F
	EnableMenuItem rcx,IDM__EXIT,MF_BYCOMMAND or MF_GRAYED

if 0 ; WS_POPUP windows don't have non-client rendering ...
	; disable non-client rendering (i.e. drop shadow, rounded corners)
	mov dword [.P5],DWMNCRP_DISABLED
	DwmSetWindowAttribute [.hWnd], DWMWA_NCRENDERING_POLICY, ADDR .P5, 4
end if

	GetCursorPos ADDR .P5
	CenterWindowPos_FromPoint [.P5], [.hWnd], HWND_TOPMOST, 256, 256, SWP_SHOWWINDOW
	jmp @F
.message_loop:
	TranslateMessage rbp
	DispatchMessageW rbp
@@:	GetMessageW rbp, 0, 0, 0
	test eax,eax ; S = error, Z = done
	ja .message_loop
	sets cl ; EXIT_FAILURE | EXIT_SUCCESS
	movzx ecx,cl
	ExitProcess rcx
	int3


SECTION '.rsrc' RESOURCE DATA READABLE

IDM_MAIN	:= 24

IDM__SNAP	:= 0x4100
IDM_SNAP3	:= 0x0103
IDM_SNAP4	:= 0x0104
IDM_SNAP5	:= 0x0105
IDM_SNAP6	:= 0x0106
IDM__EXIT	:= 0x4200

directory				\
	RT_MENU,	menus,		\
	RT_VERSION,	versions,	\
	RT_MANIFEST,	manifests

resource menus,\
	IDM_MAIN, LANG_ENGLISH or SUBLANG_DEFAULT, mainMenu

resource versions,\
	1,LANG_NEUTRAL,version

resource manifests,\
	1, LANG_ENGLISH or SUBLANG_DEFAULT, manifest

menu mainMenu
	menuitem 'Snap Pixels',IDM__SNAP,MFR_POPUP
		menuitem	'8',		IDM_SNAP3
		menuitem	'16',		IDM_SNAP4
		menuitem	'32',		IDM_SNAP5
		menuitem	'64',		IDM_SNAP6,MFR_END
	menuitem 'Esc or ALT-F4 to exit',IDM__EXIT,MFR_END

include 'resource\version.inc'
include 'resource\manifest.inc'
