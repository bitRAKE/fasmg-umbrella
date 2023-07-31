
; removing the titlebar on tool windows
;	+ more screen space by combining menu with window controls
;	- moving window requires holding shift

format PE64 NX ASLR GUI 6.2 at 0x1234_5678_0000 on 'NUL'
include 'umbrella.g'

Main: ENTRY $
	virtual at rbp - .frame
		repeat 12
			.P#%	dq ?
		end repeat

		.hWndParent	dq ?
			align.assume rbp, 16
			align 16
		.frame := $ - $$
		assert sizeof MSG <= 8*6 ; confirm stack space
		.mgs	MSG
	end virtual
	enter .frame,0
	GetDesktopWindow
	mov [.hWndParent], rax

	GetModuleHandleW 0 ; get dynamic base
	mov [.wc.hInstance], rax

	LoadIconW 0, IDI_HAND
	mov [.wc.hIcon], rax
	mov [.wc.hIconSm], rax

	LoadCursorW 0, IDC_ARROW ; replace the busy cursor
	mov [.wc.hCursor], rax

	RegisterClassExW ADDR .wc ; ATOM
	test ax, ax
	jz .fatal

; Add icons to the window menu to simulate standard window controls:

	LoadMenuIndirectW ADDR .MenuTemplate
	mov [g_hMenu], rax
	InsertMenuItemW [g_hMenu], 0, TRUE, ADDR .mII
	mov [.mII.fType], MFT_RIGHTJUSTIFY
	iterate <BITMAP,		COMMAND>,\
		HBMMENU_MBAR_MINIMIZE,	IDM_SYS_MINIMIZE,\
		HBMMENU_MBAR_RESTORE,	IDM_SYS_RESTORE,\
		HBMMENU_MBAR_CLOSE,	IDM_SYS_CLOSE
		mov [.mII.hbmpItem], BITMAP
		mov [.mII.wID], COMMAND
		InsertMenuItemW [g_hMenu], -1, TRUE, ADDR .mII
	end iterate

.STYLE	= WS_POPUP\		; undecorated window
	or WS_VISIBLE\		; don't need ShowWindow
\;	or WS_THICKFRAME	; sizing border, round corners!
	or WS_SYSMENU\		; Alt+Space to view
	or WS_MAXIMIZEBOX or WS_MINIMIZEBOX ; enable menu items w/o caption

	CreateWindowExW 0,[.wc.lpszClassName],<_W 'The Title'>,.STYLE,\
		144,128,256,256,[.hWndParent],[g_hMenu],[.wc.hInstance],0
	test rax,rax
	jnz @F
.fatal:
	ExitProcess 1 ; EXIT_FAILURE
	int3

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


WndMainProc:
	enter 32, 0
	iterate MSG, WM_NCHITTEST, WM_COMMAND, WM_KEYDOWN, WM_DESTROY
		cmp edx, MSG
		jz .MSG
	end iterate
.default:
	DefWindowProcW rcx,rdx,r8,r9 ; forward result
	leave
	retn

.WM_NCHITTEST:
	DefWindowProcW rcx,rdx,r8,r9
	cmp eax, HTMENU
	jnz @F
	; TODO: additional icon selection
	GetKeyState VK_SHIFT ; shift required to move window
	test ax, ax
	mov eax, HTMENU
	jns @F
	mov eax, HTCAPTION
@@:	leave
	retn


.WM_COMMAND:
	cmp r8w, IDM_FILE_QUIT
	jz .WM_DESTROY
	cmp r8w, 0xF000
	jc .default
	SendMessageW rcx, WM_SYSCOMMAND, r8, r9 ; mimic standard WS_SYSMENU use
	jmp .processed

.WM_KEYDOWN:
	cmp r8d,VK_ESCAPE ; easy exit of demo
	jnz .default
.WM_DESTROY:
	PostQuitMessage 0
.processed:
	xor eax,eax
	leave
	retn


virtual DATA.8
	g_hMenu dq ?

	Main.wc WNDCLASSEXW\
		cbSize:		sizeof Main.wc,\
		style:		CS_HREDRAW or CS_VREDRAW,\
		lpfnWndProc:	WndMainProc,\
		hbrBackground:	COLOR_BTNTEXT + 1,\; black client area
		lpszClassName:	Main.ClassName

	Main.mII MENUITEMINFO \
		cbSize: 	sizeof MENUITEMINFO,\
		fMask:		MIIM_FTYPE or MIIM_BITMAP or MIIM_ID,\
		fType:		0,\
		fState:		MFS_ENABLED,\
		wID:		IDM_SYS_SYSTEM,\
		hbmpItem:	HBMMENU_SYSTEM

	Main.ClassName du 'bitRAKE.2023',0
	align 64
end virtual


; HBITMAP
HBMMENU_SYSTEM:=1
HBMMENU_MBAR_RESTORE:=2
HBMMENU_MBAR_MINIMIZE:=3
; HBMMENU_MBAR_?:=4
HBMMENU_MBAR_CLOSE:=5
HBMMENU_MBAR_CLOSE_D:=6
HBMMENU_MBAR_MINIMIZE_D:=7
HBMMENU_POPUP_CLOSE:=8
HBMMENU_POPUP_RESTORE:=9
HBMMENU_POPUP_MAXIMIZE:=10
HBMMENU_POPUP_MINIMIZE:=11
HBMMENU_CALLBACK:=-1

struc(NAMED) menuex_template? helpid:0
	local level
	align 4
	label NAMED:-1
	namespace NAMED
	dd 4_0001h, helpid ; MENUEX_TEMPLATE_HEADER
	level = 1

	macro ? text, id:0, flags:0, state:MFS_ENABLED, type:MFT_STRING, IGNORE&
		match ,text
			; do nothing (could auto-MFR_END?)
		else match - ANY, text id
			; MENUEX_TEMPLATE_ITEM
			dd MFT_SEPARATOR,0,0,0
		else ; MENUEX_TEMPLATE_ITEM
			dd type, state,	id
			dw flags
			du text,0
			align 4
		end match
		if flags and MFR_END
			level = level - 1
		end if
		if flags and MFR_POPUP
			level = level + 1
			dd 0 ; dwHelpId
		end if
		if level = 0
			purge ?
			end namespace ; NAMED
		end if
	end macro
end struc ; menuex_template?

IDM_SYS_SYSTEM		:= 0xF090 ; SC_MOUSEMENU | SC_KEYMENU
IDM_SYS_RESTORE		:= 0xF120 ; SC_RESTORE
IDM_SYS_MINIMIZE	:= 0xF020 ; SC_MINIMIZE
IDM_SYS_CLOSE		:= 0xF060 ; SC_CLOSE

IDM_FILE_NEW		:= 0101h
IDM_FILE_OPEN		:= 0102h
IDM_FILE_SAVE		:= 0103h
IDM_FILE_SAVEAS		:= 0104h
IDM_FILE_CLOSE		:= 0105h
IDM_FILE_QUIT		:= 0106h

IDM_SETTINGS_TWRAP	:= 0201h

IDM_HELP_ABOUT		:= 0301h

macro MAKE_MainMenuTemplate
define _ ,9,
?Main.MenuTemplate MENUEX_TEMPLATE
	'&File', 0, MFR_POPUP
		'&New' _	'Ctrl+N', IDM_FILE_NEW
		------------------------
		'&Open...' _	'Ctrl+O', IDM_FILE_OPEN
		'Open &Recent', 0, MFR_POPUP
			'[todo]', 0, MFR_END
		------------------------
		'&Save' _	'Ctrl+S', IDM_FILE_SAVE
		'Save &as...' _	'Ctrl+Shift+S', IDM_FILE_SAVEAS
		------------------------
		'&Close' _	'Ctrl+W', IDM_FILE_CLOSE
		------------------------
		'&Quit' _	'Ctrl+Q', IDM_FILE_QUIT, MFR_END

	'Setti&ngs', 0, MFR_POPUP
		'&Toggle Wrap', IDM_SETTINGS_TWRAP, MFR_END

	'&Help', 0, MFR_POPUP or MFR_END
		'&About', IDM_HELP_ABOUT, MFR_END

restore _
purge MAKE_MainMenuTemplate
end macro
virtual CONST.4
	MAKE_MainMenuTemplate
end virtual


SECTION '.rsrc' RESOURCE DATA READABLE

directory				\
	RT_VERSION,	versions,	\
	RT_MANIFEST,	manifests

resource versions,\
	1,LANG_NEUTRAL,version

resource manifests,\
	1, LANG_ENGLISH or SUBLANG_DEFAULT, manifest


include 'resource\version.inc'
include 'resource\manifest.inc'
