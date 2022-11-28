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
;	+ always on top option
;	+ add context menu
;	- fix redraw flicker (almost)
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

BORDER_SIZE		:= 12	; defines borders, perhaps base on some system metric?

assert WINDOW_LIMIT_WIDTH > BORDER_SIZE*3 + 2*32
assert WINDOW_LIMIT_HEIGHT > BORDER_SIZE*2 + 32



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


proc ToggleExtendedStyle hwnd,style
	invoke GetWindowLongA,[hwnd],GWL_EXSTYLE
	xor eax,[style]
	invoke SetWindowLongA,[hwnd],GWL_EXSTYLE,eax
	ret
endp


macro ToggleCheckMenuItem hMenu,uID
	local _set
	xor eax,eax
_set:	invoke CheckMenuItem,hMenu,uID,eax
	xor eax,MF_CHECKED
	jg _set
end macro


proc ResizeControls hwnd, bRepaint
	locals
		rect RECT
	endl
        push    ebx esi edi
        invoke	GetClientRect,[hwnd],ADDR rect

	bt	[split_flags],SPLIT_OUTPUT_FIXED
	jnc	@F
	mov	edx,[rect.right] ; width
	sub	edx,[split_pixels]
	or	eax,-1
	div	[rect.right]
	mov	[split_ratio],eax
    @@:
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
	invoke	MoveWindow,esi,BORDER_SIZE,BORDER_SIZE,edx,edi,FALSE ;[bRepaint]

	invoke	GetDlgItem,[hwnd],ID_HEXADECIMAL
	pop	ecx
	add	ecx,BORDER_SIZE
	mov	[split_rect.left],ecx
	mov	[split_rect.top],BORDER_SIZE
	add	ecx,BORDER_SIZE
	mov	[split_rect.right],ecx
	mov	[split_rect.bottom],edi
	pop	edx
	invoke	MoveWindow,eax,ecx,BORDER_SIZE,edx,edi,FALSE ;[bRepaint]

	invoke	InvalidateRect,[hwnd],0,[bRepaint]
        pop     edi esi ebx
        ret
endp


proc CalculatorDialog hwnd,msg,wparam,lparam
	locals
		rect	RECT
		pt	POINT
	endl
        push    ebx esi edi
        cmp     [msg],WM_WINDOWPOSCHANGING 
        je      poschanging
        cmp     [msg],WM_WINDOWPOSCHANGED
        je      poschanged
 
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

	iterate message, WM_CTLCOLORDLG,WM_CTLCOLOREDIT,WM_CTLCOLORSTATIC ;,WM_CTLCOLORSCROLLBAR,WM_CTLCOLORLISTBOX,WM_CTLCOLORBTN
		cmp     [msg],message
		je      ctlcolor.message
	end iterate

        cmp     [msg],WM_DROPFILES
        je      fdrop
        cmp     [msg],WM_CLOSE
        je      close
        cmp     [msg],WM_INITDIALOG
        je      init

default_processing:
	xor eax,eax
	jmp finish


	iterate <MESSAGE, 		BACK,	TEXT,	BRUSH>,\
		WM_CTLCOLORDLG,		-1,	-1,	$7C8C94,\
		WM_CTLCOLOREDIT,	$DCB59C,$344058,$DCB59C,\
		WM_CTLCOLORSTATIC,	$BC7142,$140C07,$BC7142

		ctlcolor.MESSAGE: ; hDC, hCtl
			if BACK <> -1
				invoke SetBkColor,[wparam], BACK
			end if
			if TEXT <> -1
				invoke SetTextColor,[wparam], TEXT
			end if
			if BRUSH <> -1
				invoke CreateSolidBrush, BRUSH
				jmp finish
			else
				jmp	default_processing
			end if
	end iterate


	poschanged:
		mov     ebx,[lparam] ;*WINDOWPOS
		test	[ebx+WINDOWPOS.flags],SWP_NOSIZE
		jnz	default_processing
		stdcall ResizeControls,[hwnd],TRUE
		jmp     default_processing

	poschanging:
		mov     ebx,[lparam] ;*WINDOWPOS
		test	[ebx+WINDOWPOS.flags],SWP_NOSIZE
		jnz	default_processing
		cmp	[ebx+WINDOWPOS.cy],WINDOW_LIMIT_HEIGHT
		jc	poschanging_invalid
		mov	esi,WINDOW_LIMIT_WIDTH
		bt	[split_flags],SPLIT_OUTPUT_FIXED
		jnc	@F
		shr	esi,1
		add	esi,[split_pixels]
	@@:	cmp	[ebx+WINDOWPOS.cx],esi
		jnc	default_processing

	poschanging_invalid:
		or [ebx+WINDOWPOS.flags],SWP_NOSIZE or SWP_NOMOVE
		jmp     default_processing


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
	xchg	ecx,eax
	jecxz	@F
	iterate CMD, IDM_WIDTH_FIXED,IDM_WIDTH_RATIO,\
		IDM_TRIGGER_NONE,IDM_TRIGGER_ANY,IDM_TRIGGER_HOT,\
		IDM_INVALIDATE,IDM_ALWAYS_TOP,IDM_QUIT
		cmp ecx,CMD
		jz rb_up.CMD
	end iterate
	cmp	ecx,IDM_EXAMPLE + 1
	jc	@F
	cmp	ecx,IDM_EXAMPLE + EXAMPLES + 1
	jc	.IDM_EXAMPLE
@@:	jmp     processed

	.IDM_WIDTH_FIXED:
		invoke	GetClientRect,[hwnd],ADDR rect
		mov	eax,[rect.right] ; width
		mov	ecx,eax
		mul	[split_ratio]
;		add	eax,eax
		sub	ecx,edx
		mov	[split_pixels],ecx
	.IDM_WIDTH_RATIO:
		btc	[split_flags],SPLIT_OUTPUT_FIXED
		ToggleCheckMenuItem [g_hSubMenu],IDM_WIDTH_FIXED
		ToggleCheckMenuItem [g_hSubMenu],IDM_WIDTH_RATIO
		jmp     processed
	.IDM_TRIGGER_NONE:
	.IDM_TRIGGER_ANY:
	.IDM_TRIGGER_HOT:
		jmp     processed
	.IDM_INVALIDATE: ; debug feature; TODO: respond to key F5, too
		stdcall ResizeControls,[hwnd],TRUE
		jmp     command.EN_CHANGE
	.IDM_ALWAYS_TOP:
		stdcall ToggleExtendedStyle,[hwnd],WS_EX_TOPMOST
		mov edx,HWND_TOPMOST
		test eax,WS_EX_TOPMOST
		jz @F
		mov edx,HWND_NOTOPMOST
	@@:	invoke SetWindowPos,[hwnd],edx,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE
		ToggleCheckMenuItem [g_hSubMenu],IDM_ALWAYS_TOP
		jmp     processed
	.IDM_QUIT:
		invoke	PostMessage,[hwnd],WM_CLOSE,0,0
		jmp     processed
	.IDM_EXAMPLE:
		movzx	ecx,cl
		invoke  SendDlgItemMessage,[hwnd],ID_EXPRESSION,WM_SETTEXT,0,[Examples + 4*ecx]
		; update secondary window with existing code
		jmp     command.EN_CHANGE



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

processed_IDC_HAND:
	mov	eax,IDC_HAND
processed_cursor:
	invoke	LoadCursor,0,eax
        invoke	SetCursor,eax
	jmp     processed


mmove:
	bt	[split_flags],SPLIT_CAPTURING
	jc	mmove_update
	movsx	eax,word [lparam]
	movsx	ecx,word [lparam+2]
        invoke	PtInRect,split_rect,eax,ecx
	xchg	ecx,eax
	jecxz	processed_IDC_HAND
	mov	eax,IDC_SIZEWE
	jmp     processed_cursor

    mmove_update:
	; update ratio and fixed size with upper/lower bounds
        invoke	GetClientRect,[hwnd],ADDR rect
	mov	eax,[rect.right] ; width
	movsx	edx,word [lparam] ; client-x
	bt	[split_flags],SPLIT_OUTPUT_FIXED
	jnc	@F
	sub	edx,eax
	neg	edx
	; TODO: upper/lower bound
	mov	[split_pixels],edx
	jmp	mmove_update_finalize
    @@:
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
    mmove_update_finalize:
	stdcall ResizeControls,[hwnd],FALSE
        jmp     processed

    lbup:
	btr	[split_flags],SPLIT_CAPTURING
	jnc	processed
	invoke	ReleaseCapture
	invoke	InvalidateRect,[hwnd],0,TRUE
        jmp     processed

    nocap: ; WM_CAPTURECHANGED
	btr	[split_flags],SPLIT_CAPTURING
	jnc	@F
	invoke	InvalidateRect,[hwnd],0,TRUE
    @@:	jmp	processed




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
        mov [hStdErr],eax

	invoke LoadMenuIndirectA,ContextMenuTemplate
	mov	[g_hMenu],eax
	invoke	GetSubMenu,eax,0
	mov	[g_hSubMenu],eax

	stdcall ResizeControls,[hwnd],TRUE
        jmp     processed


    command:
        cmp     [wparam],ID_EXPRESSION + EN_CHANGE shl 16
        jne     processed
    .EN_CHANGE:
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

        mov     ecx,[aout.size]
	test	ecx,ecx
        jz	nobytes
        mov     esi,[aout.address]
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
    linescroll:
        invoke  SendDlgItemMessage,[hwnd],ID_EXPRESSION,EM_GETFIRSTVISIBLELINE,0,0
        invoke  SendDlgItemMessage,[hwnd],ID_HEXADECIMAL,EM_LINESCROLL,0,eax
        jmp     processed

    error:
	mov	esi,[hStdErr]
	jmp	@F
    nobytes:
	mov	esi,[hStdOut]
    @@: invoke	SetFilePointer,esi,0,0,FILE_BEGIN
        mov	[std_buf_read],0
        invoke	ReadFile,esi,std_buf,std_buf_bytes,std_buf_read,0
        mov	eax,[std_buf_read]
        mov	byte[std_buf+eax],0
        invoke  SendDlgItemMessage,[hwnd],ID_HEXADECIMAL,WM_SETTEXT,0,std_buf
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

IDM_INVALIDATE		:= 0300h
IDM_EXAMPLE		:= 0400h - 1 ; output 0-based numbering for table lookup
IDM_ALWAYS_TOP		:= 0500h
IDM_QUIT		:= 0F30h

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
	item 'Invalidate Window', IDM_INVALIDATE
	item
	item 'Always on Top', IDM_ALWAYS_TOP, , MFS_CHECKED
	item
	item 'Load Example',	0,MFR_POPUP
		repeat EXAMPLES
			if % = %%
				item Examples.%.Text,IDM_EXAMPLE+%,MFR_END
			else
				item Examples.%.Text,IDM_EXAMPLE+%
			end if
		end repeat
	item
	item 'Quit', IDM_QUIT, MFR_END

; We want to use the file names to create user friendly display for examples,
; and simplify inclusion of additional/alternate examples:
Examples:
iterate FNAME,\
	'calculator',\
	'x86 16-bit, Horizontal Slice',\
	'x86 64-bit, Binomial',\
	'x86 64-bit, Horner Method'

	if % = 1
		EXAMPLES := %%
		repeat EXAMPLES
			dd .%
		end repeat
	end if
	.%: eval 'file "examples\',FNAME,'.g"'
	db 0
	.%.Text equ FNAME
end iterate



align 4
SPLIT_CAPTURING		:= 0		; active movement
SPLIT_OUTPUT_FIXED	:= 1		; or ratioed
split_flags	 	dd ?

split_ratio 		dd 0xC000_0000	; 1:1 ; scaled fraction
split_pixels		dd 127		; from right client edge
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

  WS_EDIT_COMMON := WS_VISIBLE+WS_BORDER+WS_VSCROLL+WS_HSCROLL+ES_AUTOVSCROLL+ES_AUTOHSCROLL+ES_MULTILINE
  dialog calculator_dialog,'',0,0,400,300,\
	WS_POPUP or WS_VISIBLE or WS_THICKFRAME or DS_CENTER or DS_SETFONT,\
	WS_EX_ACCEPTFILES or WS_EX_TOPMOST,\
	0, 'Consolas', 12
    ; positioning here is overriden at init:
    dialogitem 'EDIT','',ID_EXPRESSION,0,0,0,0,WS_EDIT_COMMON or ES_WANTRETURN
    dialogitem 'EDIT','',ID_HEXADECIMAL,0,0,0,0,WS_EDIT_COMMON or ES_READONLY
  enddialog
