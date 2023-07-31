
; send message to child control in another process

format PE64 NX GUI 6.2 at 0x1_0000
include 'umbrella.g'

my_message db "Eat Tacos!",13,10
my_message.bytes := $ - my_message

WinMain: ENTRY $
	pop rax

; first put custom message to clipboard:

○	OpenClipboard 0 ; current task clipboard
	test eax, eax ; BOOL
	jz .no_clipboard

○	GlobalAlloc GMEM_MOVEABLE, my_message.bytes
	test rax, rax
	jz .no_mem
	xchg rbx, rax

○	GlobalLock rbx
	test rax, rax
	jz .no_lock

	xchg rdi, rax
	lea rsi, [my_message]
	mov ecx, my_message.bytes
	rep movsb

○	GlobalUnlock rbx
○	SetClipboardData CF_TEXT, rbx ; clipboard owner now owns global memory
○	CloseClipboard

	; find _any_ FASMW IDE window
○	FindWindowA <_A "FASMW_IDE32">, 0
	xchg rcx, rax
	jrcxz .no_ide

	; find _any_ child FEDIT control
○	FindWindowExA rcx, 0, <_A "FEDIT">, 0
	xchg rcx,rax
	jrcxz .no_edit

○	SendMessageA rcx, WM_PASTE, 0, 0

○	Sleep 1000

○	ExitProcess 0

; say hello to debugger:

.no_clipboard:
.no_mem:
.no_lock:
.no_ide:
.no_edit:
	DebugBreak
	int3

macro ○ line&
	OutputDebugStringA <_A `line>
	line
end macro


if 0
	EnumWindows ADDR myEnumWindows_Callback, 0
	EnumChildWindows [rsi], ADDR myEnumChildren_Callback, 0



myEnumWindows_Callback:

	; does window match "FASMW_IDE32" class?
	;	+ name to destination tree

	mov eax, 1 ; enumerate all the top-level windows
	retn


myEnumChildren_Callback:

	; does window match "FEDIT" class?
	;	+ name to destination tree

	mov eax, 1 ; enumerate all the child windows
	retn

end if


