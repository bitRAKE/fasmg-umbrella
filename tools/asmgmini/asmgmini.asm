;
; Mostly based on Tomasz Grysztar's work:
;	Making a real-time assembler with fasmg.DLL (Unedited live session)
;	https://youtu.be/FyhxH-QuEhM	
;	https://board.flatassembler.net/topic.php?p=213962#213962
;	https://board.flatassembler.net/topic.php?t=21472
;
; I've made changes to extend the functionality of the UI. - bitRAKE
;	+ size / sizing dynamics
;	+ psuedo-splitter dynamics
;	+ sync edit controls on change
;	+ environment check
;	+ ESC to exit
;	+ remove caption, allow movement with all boarders :-)
;	- fix redraw flicker (almost)
;	- add context menu
;	- drag-and-drop
;
; TODO:
;	- double click to reset split
;	- alternate triggers for assembling
;		- hotkey: [ALT] Enter
;	- INCLUDE configure
;	- make all the buffers dynamic
;	- output mode aware:
;		- binary: line sync
;		- display: no sync
;		- error: error sync
;
; PROBLEMS:
;	- generally crash/freeze, need a method to terminate fasmg processing
;	- tabs selects all text of edit control, use Ctrl+Tab to enter a tab char
;	- it's possible to break the device context: window/menu decoration
;	  ceases to function correctly -- fast sizing can do it. Win11

; some global configuration
WINDOW_LIMIT_WIDTH	:= 400
WINDOW_LIMIT_HEIGHT	:= 250

BORDER_SIZE		:= 12		; defines borders, perhaps base on some system metric?


format PE GUI 4.0
entry start

include 'win32a.inc'

struct MEMORY_REGION
        address dd ?
        size dd ?
ends

EXPRESSION_MAX_LENGTH = 32767

IDR_CALCULATOR = 37

ID_EXPRESSION  = 100
ID_HEXADECIMAL = 116
ID_VERSION     = 199


section '.text' code readable executable

  start:
        invoke  VirtualAlloc,0,100000h,MEM_RESERVE,PAGE_READWRITE
        mov     [aout.address],eax
        mov     [aout.size],0
        invoke  VirtualAlloc,0,100000h,MEM_RESERVE,PAGE_READWRITE
        mov     [conv.address],eax
        mov     [conv.size],0

        invoke  GetModuleHandle,0
        invoke  DialogBoxParam,eax,IDR_CALCULATOR,HWND_DESKTOP,CalculatorDialog,0
        invoke  ExitProcess,0


proc ResizeControls hwnd
	locals
		rect RECT
	endl
        push    ebx esi edi
        invoke	GetClientRect,[hwnd],ADDR rect

	invoke	GetDlgItem,[hwnd],ID_EXPRESSION
	xchg	esi,eax
	mov	eax,[rect.right] ; width
	sub	eax,BORDER_SIZE*3
	push	eax
	mul	[split_ratio]
	add	eax,eax
	adc	edx,0
	sub	[esp],edx
	push	edx
	mov	edi,[rect.bottom] ; height
	sub	edi,BORDER_SIZE*2
	invoke	MoveWindow,esi,BORDER_SIZE,BORDER_SIZE,edx,edi,FALSE

	invoke	GetDlgItem,[hwnd],ID_HEXADECIMAL
	pop	ecx
	add	ecx,BORDER_SIZE
	mov	[split_rect.left],ecx
	mov	[split_rect.top],BORDER_SIZE
	add	ecx,BORDER_SIZE
	mov	[split_rect.right],ecx
	mov	[split_rect.bottom],edi
	pop	edx
	invoke	MoveWindow,eax,ecx,BORDER_SIZE,edx,edi,FALSE

	invoke	InvalidateRect,[hwnd],0,FALSE
        pop     edi esi ebx
        ret
endp

proc CalculatorDialog hwnd,msg,wparam,lparam
	locals
		rect	RECT
		pt	POINT
	endl
        push    ebx esi edi
;        cmp     [msg],WM_WINDOWPOSCHANGED 
;        je      poschanged
        cmp     [msg],WM_COMMAND
        je      command
        cmp     [msg],WM_RBUTTONUP
        je      rb_up

        cmp     [msg],WM_LBUTTONDOWN
        je      lbdown
        cmp     [msg],WM_MOUSEMOVE
        je      mmove
        cmp     [msg],WM_LBUTTONUP
        je      lbup
        cmp     [msg],WM_CAPTURECHANGED
        je      nocap

        cmp     [msg],WM_SIZING
        je      sizing
        cmp     [msg],WM_SIZE
        je      size
        cmp     [msg],WM_CLOSE
        je      close

	iterate message, WM_CTLCOLORDLG,WM_CTLCOLOREDIT,WM_CTLCOLORSTATIC ;,WM_CTLCOLORSCROLLBAR,WM_CTLCOLORLISTBOX,WM_CTLCOLORBTN
		cmp     [msg],message
		je      ctlcolor
	end iterate

        cmp     [msg],WM_DROPFILES
        je      fdrop
        cmp     [msg],WM_INITDIALOG
        je      init

        xor     eax,eax
        jmp     finish


    rb_up:
	test	[wparam],MK_LBUTTON+MK_MBUTTON ;+MK_XBUTTON1+MK_XBUTTON2
	jnz     processed ; avoid multi-button confusion
	movsx	eax,word [lparam]
	movsx	edx,word [lparam+2]
	mov	[pt.x],eax
	mov	[pt.y],edx
	invoke ClientToScreen,[hwnd],ADDR pt
	invoke TrackPopupMenuEx,[g_hSubMenu],TPM_RETURNCMD\
		or TPM_CENTERALIGN or TPM_VCENTERALIGN,[pt.x],[pt.y],[hwnd],0
	;invoke CheckMenuItem
	cmp	eax,IDM_TRIGGER_NONE
	cmp	eax,IDM_TRIGGER_ANY
	cmp	eax,IDM_TRIGGER_HOT
	cmp	eax,IDM_ALWAYS_TOP
	jmp     processed


    lbdown:
	movsx	eax,word [lparam]
	movsx	ecx,word [lparam+2]
        invoke	PtInRect,split_rect,eax,ecx

	xchg	ecx,eax
	jecxz	@F
	bts	[split_flags],SPLIT_CAPTURING
	jc	processed
	invoke	SetCapture,[hwnd]
	jmp     processed
    @@:	invoke	PostMessage,[hwnd],WM_NCLBUTTONDOWN,2,[lparam] ; HTCAPTION
	invoke	LoadCursor,0,IDC_HAND
        invoke	SetCursor,eax
	jmp     processed

    mmove:
	bt	[split_flags],SPLIT_CAPTURING
	jc	mmove_update
	movsx	eax,word [lparam]
	movsx	ecx,word [lparam+2]
        invoke	PtInRect,split_rect,eax,ecx
	mov	edx,IDC_HAND
	xchg	ecx,eax
	jecxz	@F
	mov	edx,IDC_SIZEWE
    @@: invoke	LoadCursor,0,edx
        invoke	SetCursor,eax
	jmp     processed
    mmove_update:
	; calculate ratio with upper/lower bounds
        invoke	GetClientRect,[hwnd],ADDR rect
	mov	eax,[rect.right] ; width
	movsx	edx,word [lparam]
	mov	ecx,eax
	sar	eax,4 ; this can be tuned based on minimal window size, and desired appearance
	cmp	edx,eax
	cmovc	edx,eax
	sub	eax,[rect.right]
	neg	eax
	cmp	edx,eax
	cmovnc	edx,eax
	div	ecx
	mov	[split_ratio],eax
	stdcall ResizeControls,[hwnd]
        jmp     processed

    lbup:
	btr	[split_flags],SPLIT_CAPTURING
	jnc	processed
	invoke	ReleaseCapture
        jmp     processed

    nocap: ; WM_CAPTURECHANGED
	btr	[split_flags],SPLIT_CAPTURING
	jnc	@F
	invoke	InvalidateRect,[hwnd],0,TRUE
    @@:	jmp	processed

    ctlcolor: ; hDC, hCtl
;	invoke SetBkMode,[wparam],1 ; transparent
	invoke SetBkColor,[wparam],$BFE3B4
	invoke SetTextColor,[wparam],$222222
	invoke CreateSolidBrush,$BFE3B4
	jmp	finish

    fdrop: ; hDrop, 0 ; add files to queue
;	invoke DragQueryFileA,[wparam],0xFFFFFFFF,std_buf,1 ; count of files
;	invoke DragQueryFileA,[wparam],ebx,0,0 ; file string length
;	invoke DragQueryFileA,[wparam],ebx,std_buf,sizeof std_buf
	invoke DragFinish,[wparam]
	jmp	processed

    init:
	invoke GetEnvironmentVariable,'INCLUDE',std_buf,1
	test eax,eax
	jz @F
	mov byte [__enverr],0 ; clear error notice if INCLUDE defined
@@:
        invoke  fasmg_GetVersion
	invoke  wsprintf,std_buf,__version,eax
        invoke  SendDlgItemMessage,[hwnd],ID_EXPRESSION,WM_SETTEXT,0,std_buf

        invoke  CreateFile,_StdOut_txt,GENERIC_READ or GENERIC_WRITE,FILE_SHARE_DELETE,\
                0,CREATE_ALWAYS,FILE_ATTRIBUTE_TEMPORARY or FILE_FLAG_DELETE_ON_CLOSE,0
        mov [hStdOut],eax

        invoke  CreateFile,_StdErr_txt,GENERIC_READ or GENERIC_WRITE,FILE_SHARE_DELETE,\
                0,CREATE_ALWAYS,FILE_ATTRIBUTE_TEMPORARY or FILE_FLAG_DELETE_ON_CLOSE,0

	invoke LoadMenuIndirectA,ContextMenuTemplate
	mov	[g_hMenu],eax
	invoke	GetSubMenu,eax,0
	mov	[g_hSubMenu],eax

        mov [hStdErr],eax

    size:
	stdcall ResizeControls,[hwnd]
        jmp     processed

    sizing:
        mov     ebx,[lparam]		;*RECT
	mov	edx,[wparam]		; edge

        mov     eax,[ebx+RECT.right]
        mov     ecx,[ebx+RECT.bottom]
        sub     eax,[ebx+RECT.left]	; width
        sub     ecx,[ebx+RECT.top]	; height

        ; Note: to prevent the window from 'walking', limits must be applied
        ; to the edges being changed. (see WMSZ_* values)

	sub	eax,WINDOW_LIMIT_WIDTH
	jnc	sizing_height
	mov	edi,1001_0010b
	bt	edi,edx
	jc	@F
	sub	[ebx+RECT.right],eax	; 2,5,8
	jmp	sizing_height
    @@:	add	[ebx+RECT.left],eax	; 1,4,7
    sizing_height:
	sub	ecx,WINDOW_LIMIT_HEIGHT
	jnc	sizing_done
	cmp	[wparam],6
	jc	@F
	sub	[ebx+RECT.bottom],ecx	; 6,7,8
	jmp	sizing_done
    @@:	add	[ebx+RECT.top],ecx	; 3,4,5
    sizing_done:
        jmp     processed


    command:
        cmp     [wparam],IDCANCEL
        je      close
        cmp     [wparam],IDOK
        je      processed

        cmp     [wparam],ID_EXPRESSION + EN_CHANGE shl 16
        jne     processed

        invoke  SendDlgItemMessage,[hwnd],ID_EXPRESSION,WM_GETTEXT,\
		EXPRESSION_MAX_LENGTH,expression_buffer

        invoke SetFilePointer,[hStdOut],0,0,FILE_BEGIN
        invoke SetFilePointer,[hStdErr],0,0,FILE_BEGIN
        invoke SetEndOfFile,[hStdOut]
        invoke SetEndOfFile,[hStdErr]
        invoke  fasmg_Assemble,\
                source_string,\         ; source string
                NULL,\                  ; source path
                aout,\                  ; output region
                NULL,\                  ; output path
                [hStdOut],\             ; stdout
                [hStdErr]               ; stderr
        test    eax,eax
        jnz     error

        mov     eax,[aout.size]
        lea     eax,[eax*8+8]
        cmp     eax,[conv.size]
        jbe     convert_output
        mov     [conv.size],eax
        invoke  VirtualAlloc,[conv.address],eax,MEM_COMMIT,PAGE_READWRITE
        test    eax,eax
        jnz     convert_output
        invoke  VirtualFree,[conv.address],0,MEM_RELEASE
        invoke  VirtualAlloc,0,[conv.size],MEM_COMMIT,PAGE_READWRITE
        test    eax,eax
        jz      error
        mov     [conv.address],eax
    convert_output:

        mov     esi,[aout.address]
        mov     ecx,[aout.size]
        jecxz   nobytes
        mov     edi,[conv.address]
        lea     ebx,[esi+ecx-4]
     listing:
        mov     ecx,[ebx-4]
        sub     ecx,[ebx]
        jecxz   hex_ready
      to_hex:
        lodsb
        mov     dl,al
        shr     al,4
        cmp     al,10
        sbb     al,69h
        das
        stosb
        mov     al,dl
        and     al,0Fh
        cmp     al,10
        sbb     al,69h
        das
        stosb
        mov     al,' '
        stosb
        loop    to_hex
      hex_ready:
        mov     ax,$0A0D
        stosw
        sub     ebx,4
        cmp     esi,ebx
        jb      listing
        xor     al,al
        stosb
        cmp     [aout.address],esi
        jz      nobytes
        invoke  SendDlgItemMessage,[hwnd],ID_HEXADECIMAL,WM_SETTEXT,0,[conv.address]
        jmp     linescroll
    nobytes:
        invoke	SetFilePointer,[hStdOut],0,0,FILE_BEGIN
        mov	[std_buf_read],0
        invoke	ReadFile,[hStdOut],std_buf,std_buf_bytes,std_buf_read,0
        jmp	bufout
    error:
        invoke	SetFilePointer,[hStdErr],0,0,FILE_BEGIN
        mov	[std_buf_read],0
        invoke	ReadFile,[hStdErr],std_buf,std_buf_bytes,std_buf_read,0
    bufout:
        mov	eax,[std_buf_read]
        mov	byte[std_buf+eax],0
        invoke  SendDlgItemMessage,[hwnd],ID_HEXADECIMAL,WM_SETTEXT,0,std_buf
    linescroll:
        invoke  SendDlgItemMessage,[hwnd],ID_EXPRESSION,EM_GETFIRSTVISIBLELINE,0,0
        invoke  SendDlgItemMessage,[hwnd],ID_HEXADECIMAL,EM_LINESCROLL,0,eax
        jmp     processed
	
    close:
	invoke DestroyMenu,[g_hMenu]
        invoke CloseHandle,[hStdOut]
        invoke CloseHandle,[hStdErr]
        invoke  EndDialog,[hwnd],0
    processed:
        mov     eax,1
    finish:
        pop     edi esi ebx
        ret
endp


; MFT_SEPARATOR is the default
struc(NAMED) menuex_template? helpid:0
	local _level,first
	align 4
	label NAMED:-1
	namespace NAMED
	dd (first shl 16) or 1, helpid ; MENUEX_TEMPLATE_HEADER
	_level = -1
	macro item? text, id, flags:0, state:0, type:0
		if _level = -1
			first := $ - NAMED - 4
			_level = 1
		end if
		; MENUEX_TEMPLATE_ITEM
		match ,text id
			dd MFT_SEPARATOR,0,0,0
		else
			dd type, state,	id
			dw flags
			du text,0
			align 4
		end match
		if flags and MFR_END
			_level = _level - 1
		end if
		if flags and MFR_POPUP
			_level = _level + 1
			dd 0 ; dwHelpId
		end if
		if _level = 0
			purge item?
			end namespace ; NAMED
		end if
	end macro ; item?
end struc ; menuex_template?

section '.data' data readable writeable

g_hHeap		dd ?
g_hMenu		dd ?
g_hSubMenu	dd ?

; looking forward, a single configuration file/dialog seems a better choice?
IDM_WIDTH_FIXED		:= 0100h
IDM_WIDTH_RATIO		:= 0110h

IDM_TRIGGER_NONE	:= 0200h
IDM_TRIGGER_ANY		:= 0210h
IDM_TRIGGER_HOT		:= 0220h
IDM_ALWAYS_TOP		:= 0230h

?ContextMenuTemplate menuex_template
	item 'dummy', 0, MFR_POPUP or MFR_END
		item 'Output Width',	0,MFR_POPUP
			item 'Fixed',		IDM_WIDTH_FIXED
			item 'Ratio',		IDM_WIDTH_RATIO,MFR_END,MFS_CHECKED
		item 'Update Trigger',	0,MFR_POPUP
			item 'Any Key',		IDM_TRIGGER_ANY,,MFS_CHECKED
			item 'Set Key',		IDM_TRIGGER_HOT
			item 'None',		IDM_TRIGGER_NONE,MFR_END
		item
		item 'Always on Top',	IDM_ALWAYS_TOP, MFR_END, MFS_CHECKED



    SPLIT_CAPTURING	:= 0		; active movement
    split_flags 	dd ?

    split_ratio 	dd 0x8000_0000	; 1:1 ; scaled fraction
    split_rect		RECT		; client coordinate of splitter area

    hStdOut rd 1
    hStdErr rd 1
    std_buf_read rd 1

    _StdOut_txt: db "stdout.txt",0
    _StdErr_txt: db "stderr.txt",0
    __version db \
	'; fasmg-powered mini assembler using,',13,10,\
	'; flat assembler  version g.%s',13,10,\
	13,10
    __enverr db '; Warning: INCLUDE environment variable not defined.',13,10,0

    error_string:
        db 0

    source_string:
        file 'header.inc'
        db 10
    expression_buffer db EXPRESSION_MAX_LENGTH dup ?

    aout MEMORY_REGION
    conv MEMORY_REGION

    std_buf_bytes = 4096
    std_buf rb std_buf_bytes


section '.idata' import data readable writeable

  library	fasmg,'FASMG.DLL',\
		gdi32,'GDI32.DLL',\
		kernel32,'KERNEL32.DLL',\
		shell32,'SHELL32.DLL',\
		user32,'USER32.DLL'

	import fasmg,\
		fasmg_GetVersion,'fasmg_GetVersion',\
		fasmg_Assemble,'fasmg_Assemble'

	include 'api\gdi32.inc'
	include 'api\kernel32.inc'
	include 'api\shell32.inc'
	include 'api\user32.inc'


section '.rsrc' resource data readable

  directory RT_DIALOG,dialogs

  resource dialogs,\
           IDR_CALCULATOR,LANG_ENGLISH+SUBLANG_DEFAULT,calculator_dialog

  WS_EDIT_COMMON := WS_VISIBLE+WS_VSCROLL+WS_HSCROLL+ES_AUTOVSCROLL+ES_AUTOHSCROLL+ES_MULTILINE
  dialog calculator_dialog,'',0,0,400,300,\
	WS_POPUP or WS_VISIBLE or WS_THICKFRAME or DS_CENTER or DS_SETFONT,\
	WS_EX_ACCEPTFILES or WS_EX_TOPMOST,\
	0, 'Consolas', 12
    ; positioning here is overriden at init:
    dialogitem 'EDIT','',ID_EXPRESSION,0,0,0,0,WS_EDIT_COMMON or ES_WANTRETURN
    dialogitem 'EDIT','',ID_HEXADECIMAL,0,0,0,0,WS_EDIT_COMMON or ES_READONLY
  enddialog
