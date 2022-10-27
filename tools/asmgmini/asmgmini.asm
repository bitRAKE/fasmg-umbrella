;
; Mostly based on Tomasz Grysztar's work:
;	Making a real-time assembler with fasmg.DLL (Unedited live session)
;	https://youtu.be/FyhxH-QuEhM	
;	https://board.flatassembler.net/topic.php?p=213962#213962
;	https://board.flatassembler.net/topic.php?t=21472
;
; I've made changes to extend the functionality of the UI. - bitRAKE
;	- size / sizing dynamics
;	- environment check
;	- sync edit controls on change
;	- psuedo-splitter dynamics
;
; TODO:
;	- make all the buffers dynamic
;	- fix redraw flicker
;	- double click to reset split
;	- drag-and-drop
;	- INCLUDE configure

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
	sub	eax,SPLIT_SIZE*3
	push	eax
	mul	[split_ratio]
	add	eax,eax
	adc	edx,0
	sub	[esp],edx
	push	edx
	mov	edi,[rect.bottom] ; height
	sub	edi,SPLIT_SIZE*2
	invoke	MoveWindow,esi,SPLIT_SIZE,SPLIT_SIZE,edx,edi,1

	invoke	GetDlgItem,[hwnd],ID_HEXADECIMAL
	pop	ecx
	add	ecx,SPLIT_SIZE
	mov	[split_rect.left],ecx
	mov	[split_rect.top],SPLIT_SIZE
	add	ecx,SPLIT_SIZE
	mov	[split_rect.right],ecx
	mov	[split_rect.bottom],edi
	pop	edx
	invoke	MoveWindow,eax,ecx,SPLIT_SIZE,edx,edi,1

	invoke	InvalidateRect,[hwnd],0,TRUE
        pop     edi esi ebx
        ret
endp

proc CalculatorDialog hwnd,msg,wparam,lparam
	locals
		rect	RECT
	endl
        push    ebx esi edi
;        cmp     [msg],WM_WINDOWPOSCHANGED 
;        je      poschanged
        cmp     [msg],WM_COMMAND
        je      command

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
        cmp     [msg],WM_INITDIALOG
        je      init
        xor     eax,eax
        jmp     finish

    lbdown:
	movsx	eax,word [lparam]
	movsx	ecx,word [lparam+2]
        invoke	PtInRect,split_rect,eax,ecx
	xchg	ecx,eax
	jecxz	@F
	bts	[split_flags],SPLIT_CAPTURING
	jc	processed
	invoke	SetCapture,[hwnd]
    @@: jmp     processed

    mmove:
	bt	[split_flags],SPLIT_CAPTURING
	jc	mmove_update
	movsx	eax,word [lparam]
	movsx	ecx,word [lparam+2]
        invoke	PtInRect,split_rect,eax,ecx
	xchg	ecx,eax
	jecxz	@F
        invoke	LoadCursor,0,IDC_SIZEWE
        invoke	SetCursor,eax
    @@: jmp     processed
    mmove_update:
	; calculate ratio with upper/lower bounds
        invoke	GetClientRect,[hwnd],ADDR rect
	mov	eax,[rect.right] ; width
	movsx	edx,word [lparam]
	mov	ecx,eax
	sar	eax,3
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
        invoke  SendDlgItemMessage,[hwnd],ID_EXPRESSION,EM_SETSEL,1,2

        invoke  CreateFile,_StdOut_txt,GENERIC_READ or GENERIC_WRITE,FILE_SHARE_DELETE,\
                0,CREATE_ALWAYS,FILE_ATTRIBUTE_TEMPORARY or FILE_FLAG_DELETE_ON_CLOSE,0
        mov [hStdOut],eax

        invoke  CreateFile,_StdErr_txt,GENERIC_READ or GENERIC_WRITE,FILE_SHARE_DELETE,\
                0,CREATE_ALWAYS,FILE_ATTRIBUTE_TEMPORARY or FILE_FLAG_DELETE_ON_CLOSE,0
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

	sub	eax,400 ; width limit
	jnc	sizing_height
	mov	edi,1001_0010b
	bt	edi,edx
	jc	@F
	sub	[ebx+RECT.right],eax	; 2,5,8
	jmp	sizing_height
    @@:	add	[ebx+RECT.left],eax	; 1,4,7
    sizing_height:
	sub	ecx,256 ; height limit
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
        invoke CloseHandle,[hStdOut]
        invoke CloseHandle,[hStdErr]
        invoke  EndDialog,[hwnd],0
    processed:
        mov     eax,1
    finish:
        pop     edi esi ebx
        ret
endp


section '.data' data readable writeable

    SPLIT_SIZE		:= 8		; defines borders

    SPLIT_CAPTURING	:= 0		; active movement
    split_flags 	dd ?

    split_ratio 	dd 0x8000_0000	; 1:1 ; scaled fraction
    split_rect		RECT		; client coordinate of splitter area

    hStdOut rd 1
    hStdErr rd 1
    std_buf_read rd 1

    _StdOut_txt: db "stdout.txt",0
    _StdErr_txt: db "stderr.txt",0
    __version db '; flat assembler  version g.%s',13,10,\
	13,10,\
	"include 'cpu\x64.inc'",13,10,\
	"include 'cpu\ext\avx2.inc'",13,10,\
	"use64",13,10,\
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

  library kernel,'KERNEL32.DLL',\
          user,'USER32.DLL',\
          fasmg,'FASMG.DLL'

  import kernel,\
         CloseHandle,'CloseHandle',\
         CreateFile,'CreateFileA',\
         GetEnvironmentVariable,'GetEnvironmentVariableA',\
         GetModuleHandle,'GetModuleHandleA',\
         ReadFile,'ReadFile',\
         SetEndOfFile,'SetEndOfFile',\
         SetFilePointer,'SetFilePointer',\
         VirtualAlloc,'VirtualAlloc',\
         VirtualFree,'VirtualFree',\
         ExitProcess,'ExitProcess'

  import user,\
	DefWindowProc,'DefWindowProcA',\
	DialogBoxParam,'DialogBoxParamA',\
	EndDialog,'EndDialog',\
	GetClientRect,'GetClientRect',\
	GetDlgItem,'GetDlgItem',\
	InvalidateRect,'InvalidateRect',\
	LoadCursor,'LoadCursorA',\
	MoveWindow,'MoveWindow',\
	PtInRect,'PtInRect',\
	ReleaseCapture,'ReleaseCapture',\
	SendDlgItemMessage,'SendDlgItemMessageA',\
	SendMessage,'SendMessageA',\
	SetCapture,'SetCapture',\
	SetCursor,'SetCursor',\
	wsprintf,'wsprintfA'

  import fasmg,\
         fasmg_GetVersion,'fasmg_GetVersion',\
         fasmg_Assemble,'fasmg_Assemble'


section '.rsrc' resource data readable

  directory RT_DIALOG,dialogs

  resource dialogs,\
           IDR_CALCULATOR,LANG_ENGLISH+SUBLANG_DEFAULT,calculator_dialog

  dialog calculator_dialog,'fasmg-powered mini assembler',0,0,400,300,\
	WS_POPUP or WS_CAPTION or WS_SYSMENU or WS_VISIBLE or WS_THICKFRAME \
	or DS_CENTER or DS_SETFONT or DS_MODALFRAME, 0, 0, 'Consolas', 12
    ; positioning here is overriden at init:
    dialogitem 'EDIT','',ID_EXPRESSION,2,2,194,296,\
	WS_VISIBLE+WS_BORDER+WS_TABSTOP+WS_VSCROLL+WS_HSCROLL+ES_AUTOHSCROLL+ES_MULTILINE+ES_WANTRETURN+ES_AUTOVSCROLL
    dialogitem 'EDIT','',ID_HEXADECIMAL,202,2,194,296,\
	WS_VISIBLE+WS_BORDER+WS_TABSTOP+WS_VSCROLL+WS_HSCROLL+ES_READONLY+ES_MULTILINE
  enddialog
