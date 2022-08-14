
; https://board.flatassembler.net/topic.php?t=22376

; test various dispatch routines:
;	+ byte granular, 256 branches processed
;	+ various source inputs
;		+ PRNG
;		+ file data
;	+ high priority thread
;	+ dialog app, with menu and stat display

; Force a low base address as to not restrict any creative code techniques.

format PE64 GUI 6.2 at 0x1_0000
include 'umbrella.inc.g'

include 'cpu\ext\avx2.inc'
include 'cpu\ext\bmi2.inc'
include 'cpu\ext\rdseed.inc'
include 'cpu\ext\rdrand.inc'
; RDTSCP forces all older instructions to retire before reading the time-stamp counter.
include 'cpu\ext\rdtscp.inc' ; CPUID Fn8000_0001_EDX[RDTSCP] = 1


; random buffer needs to be filled outside of dispatcher thread
include 'xoshiro256.inc';,define xoshiro256.state _Thread.xo_ctx

STACK 0,0 ; effects thread creation stack
HEAP 0,0

__CACHE_LINE__ := 64


; we need a common system to include different dispatch methods easily
;	+ include code
;	+ define menu item
;		- string
;		- id
; adding a new method just requires updating ITERATE table below:

METHODS.MENU_BASE := 0x0100
iterate <_FILE_,		_NAME_>,\
	'_bflat.inc',		'Branch Flat',\
	'_bbinary.inc',		'Branch Binary',\
	'_table.inc',		'Table',\
	'_code_xH.inc',		'Code xH'

	align 64
	THREAD.%:
	match METHOD,THREAD.%
;		include _FILE_
	end match
	if % = %%
		METHODS := %%
		_MENU_ equ menuitem _NAME_,METHODS.MENU_BASE+%,MFR_END
	else
		_MENU_ equ menuitem _NAME_,METHODS.MENU_BASE+%
	end if
end iterate

collect DATA.8
	ThreadProcs:
end collect
repeat METHODS
collect DATA.8
	dq THREAD.%
end collect
end repeat



align __CACHE_LINE__
DialogProcW:
	xor eax,eax ; FALSE, clear carry flag, common case
	iterate MSG, WM_ERASEBKGND,WM_COMMAND,WM_CLOSE,WM_INITDIALOG
		cmp edx,MSG
		jz .MSG
	end iterate
	retn

.WM_CLOSE:
	enter 32,0
	EndDialog rcx, 0 ; no error
	leave
	mov eax,1
	retn

.WM_INITDIALOG:
	virtual at RBP-.frame
			rq 4
			_align 16
		.frame := $ - $$
			dq ?,?	; RBP,RETN
		.hDlg	dq ?
		.sAff	dq ?	; SystemAffinityMask
		.pAff	dq ?	; ProcessAffinityMask
	end virtual
	enter .frame,0
	mov [.hDlg],rcx
	GetProcessAffinityMask -1, ADDR .pAff, ADDR .sAff ; BOOL
	xchg ecx,eax
	jrcxz .fatal
	bsr rdx,[.pAff] ; select last processor for aux thread
	bsf rcx,[.pAff] ; select first processor for GUI thread
	xor eax,eax
	bts rax,rdx
	cmp rdx,rcx
	jz .fatal
	xor edx,edx
	bts rdx,rcx
	mov [g_auxAff],rax
	SetProcessAffinityMask -1, rdx ; BOOL
	xchg ecx,eax
	jrcxz .fatal
	mov eax,1 ; set focus to default control
@@:	leave
	retn
.fatal:
	EndDialog [.hDlg], -1
	xor eax,eax
	jmp @B



; do default painting, then put text on top of it ...
DialogProcW.WM_ERASEBKGND:
	virtual at RBP-.frame
				rq 4
		.P5		dq ?
		.P6		dq ?

		.rect		RECT
				_align 16
		.frame := $ - $$
				dq ?,? ; RBP,RETN
		.hDlg		dq ?
		.hDC		dq ?
		.oldFont	dq ?
	end virtual
	enter .frame,0
	mov [.hDlg],rcx
	mov [.hDC],r8

	GetClientRect [.hDlg], ADDR .rect
	GetStockObject WHITE_BRUSH
	FillRect [.hDC], ADDR .rect, rax
	; change RECT bounds to position text
	add [.rect.top],5
	add [.rect.left],5

;	calculate total dispatches, dispatches per second
;	wsprintfW

	SendMessageW [.hDlg], WM_GETFONT, 0, 0
	SelectObject [.hDC], rax
	mov [.oldFont],rax
	DrawTextExW [.hDC], <_W \
		'Using %s with random data ...',10,\
		9,'Dispatches/sec:',9,'%d',10,\
		9,'Total Dispatches:',9,'%d'>, -1, ADDR .rect,\
		DT_NOPREFIX or DT_NOCLIP or DT_EXPANDTABS, 0
	SelectObject [.hDC], [.oldFont]
	push 1
	pop rax
	leave
	retn

DialogProcW.WM_COMMAND:
	iterate CMD, IDM_PRNG,IDM_FILE
		cmp r8w,CMD
		jz .CMD
	end iterate
	cmp r8w,METHODS.MENU_BASE
	jbe @F
	cmp r8w,METHODS.MENU_BASE+METHODS
	jbe DialogProcW.WM_COMMAND.METHOD
@@:	; return FALSE
	retn

DialogProcW.WM_COMMAND.IDM_PRNG:
	; change data
	retn

DialogProcW.WM_COMMAND.IDM_FILE:
	; change file
	retn

DialogProcW.WM_COMMAND.METHOD:
	virtual at RBP-.frame
				rq 4
		.P5		dq ?
		.P6		dq ?
				_align 16
		.frame := $ - $$
				rq 2
		.index		dw ?
	end virtual
	enter .frame,0
	sub r8w,METHODS.MENU_BASE+1
	mov [.index],r8w

	mov rcx,[g_hThread]
	jrcxz .no_thread
	TerminateThread rcx,0 ; BOOL
	xchg ecx,eax
	jrcxz .fatal
	mov [g_AuxData.dCount],0 ; clear thread stats
.no_thread:
	movzx eax,[.index]
	CreateThread 0,0, [ThreadProcs + rax*8], g_AuxData, CREATE_SUSPENDED, g_idThread
	mov [g_hThread],rax
	xchg rcx,rax
	jrcxz .fatal
	SetThreadAffinityMask rcx, [g_auxAff]
	xchg ecx,eax
	jrcxz .bad_thread
	ResumeThread [g_hThread]
.fatal:
	leave
	retn
.bad_thread:
	CloseHandle [g_hThread]
	mov [g_hThread],0
	jmp .fatal


struct ThreadData
	pBytes		dq ?
	dCount		dq ?
ends

collect BSS.64
	g_AuxData	ThreadData
	align 64
end collect

collect BSS.8
	g_auxAff	dq ?	; processor selected for aux thread
	g_hThread	dq ?	;
	g_idThread	dd ?,?	;
end collect


WinMain: ENTRY $
	mov rbp,(0x0000FFFF shl 32) + 8 ; INITCOMMONCONTROLSEX structure
	enter 32,0
	InitCommonControlsEx rbp ; BOOL
	xchg ecx,eax
	jrcxz .F
	GetDesktopWindow
	DialogBoxParamW 0,IDD_MAIN,rax,ADDR DialogProcW ; no parm
	xchg ecx,eax
.F:	ExitProcess
	int3


SECTION '.rsrc' RESOURCE DATA READABLE

IDD_MAIN	:= 42
IDM_MAIN	:= 24

IDM__METHOD	:= 0x4100
IDM_BFLAT	:= 0x0101
IDM_BBINARY	:= 0x0102
IDM_TABLE	:= 0x0103
IDM_CODE_XH	:= 0x0104

IDM__DATA	:= 0x4200
IDM_PRNG	:= 0x0201
IDM_FILE	:= 0x0202

directory				\
	RT_MENU,	menus,		\
	RT_DIALOG,	dialogs,	\
	RT_MANIFEST,	manifests

resource menus,\
	IDM_MAIN, LANG_ENGLISH or SUBLANG_DEFAULT, mainMenu

resource dialogs,\
	IDD_MAIN, LANG_ENGLISH or SUBLANG_DEFAULT, mainDialog

resource manifests,\
	1, LANG_ENGLISH or SUBLANG_DEFAULT, manifest

menu mainMenu
	menuitem 'Method',IDM__METHOD,MFR_POPUP
		irpv M,_MENU_ ; dynamically generate method submenu
			M
		end irpv
	menuitem 'Data Source',IDM__DATA,MFR_POPUP or MFR_END
		menuitem	'Random',		IDM_PRNG
                menuseparator
		menuitem	'File ...',		IDM_FILE,MFR_END

dialog mainDialog,'Dispatch Tester:',0,0,256,32,\
	WS_VISIBLE or WS_CAPTION or WS_POPUP or WS_SYSMENU or DS_CENTERMOUSE,\
	WS_EX_TOOLWINDOW,IDM_MAIN,'Segoe UI',11
	; nothing, just menu and font selection
enddialog

resdata manifest
	file 'manifest.xml'
endres
