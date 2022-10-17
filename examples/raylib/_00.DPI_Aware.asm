format PE64 GUI 6.2 at 0x1234_5678_0000

; TODO: solve conflicting DLL functions, example raylib.CloseWindow should replace user32.CloseWindow
; when the macro is redefined we loose the ablity to forward reference macro!
; for now we use *_apiset without CloseWindow. :)
;	+ call [PE.IMPORT.{DLL}.{function}] doesn't work because of APISETS names!
;		+ multiple access not possible in general
;	+ gather mapping function -> dll (slow)
;	+ define all api macro at end?
define UMBRELLA_LIBRARY 'OneCore_apiset'

include 'umbrella.g'
include 'api\raylib.g'
include 'cpu\ext\avx2.inc'


struc _A line&
	local proxy, bytes
	collect CONST.1
		proxy db line
		bytes := $ - proxy
	end collect
	label .:bytes at proxy
end struc


macro CenterTextToRender text*,fontsize*,color*
	local proxy
	proxy _A text,0

	GetRenderWidth
	mov [.render.width],eax
	GetRenderHeight
	mov [.render.height],eax

	imul eax,eax,fontsize
	cdq
	div [.default.height]
	mov [.render.font.size],eax

	MeasureText ADDR proxy, DWORD [.render.font.size]
	mov edx,[.render.width]
	mov r8d,[.render.height]
	mov r9d,[.render.font.size]
	sub edx,eax
	sar edx,1
	sar r8d,1
	sub r8d,r9d
	DrawText ADDR proxy, rdx, r8, r9, color
end macro



WinMain: ENTRY $
	virtual at RBP-.frame
		repeat 5
			.P#% dq ?
		end repeat

		.display		dq ?
		.display.width		dd ?
		.display.height		dd ?

		.default.width		dd ?
		.default.height		dd ?

		.render.width		dd ?
		.render.height		dd ?
		.render.font.size	dd ?
				_align 16
		.frame := $-$$
	end virtual
	enter .frame,0

	mov	[.default.width], 800
	mov	[.default.height], 400

	; some flags must be configured prior to InitWindow
	SetConfigFlags FLAG_MSAA_4X_HINT or FLAG_VSYNC_HINT or FLAG_WINDOW_HIGHDPI
	InitWindow DWORD [.default.width], DWORD [.default.height],\
		_A "raylib [core] example - fullscreen toggle"
	jmp .while

.main_loop:
	IsKeyPressed KEY_ESCAPE
	test al,al
	jnz .escape_key

	IsKeyPressed KEY_ENTER
	test al,al
	jz .done_toggle_fullscreen
	IsKeyDown KEY_LEFT_ALT
	test al,al
	jnz .toggle_fullscreen
	IsKeyDown KEY_RIGHT_ALT
	test al,al
	jz .done_toggle_fullscreen
.toggle_fullscreen:
	; default window size if already fullscreen

	IsWindowFullscreen
	test al,al
	jnz .default_size

	; borderless window the size of display, if not fullscreen

	GetCurrentMonitor
	mov [.display], rax
	GetMonitorWidth [.display]
	mov [.display.width], eax
	GetMonitorHeight [.display]
	mov [.display.height], eax

;: HACK
; preserve DPI aware size for restore
; (assumes monitor DPI doesn't change while full screen)
push qword [.render.width]
pop qword [.default.width]

	SetWindowSize DWORD [.display.width], DWORD [.display.height]
	ToggleFullscreen
	jmp .done_toggle_fullscreen
.default_size:
	; TODO: calculate desired size based on window DPI
	GetWindowScaleDPI ; drawing changes based on DPI factor

	ToggleFullscreen
	SetWindowSize DWORD [.default.width], DWORD [.default.height]
.done_toggle_fullscreen:


        BeginDrawing
        ClearBackground RAYWHITE
	CenterTextToRender "Press Alt + Enter to Toggle full screen!", 30, DARKGRAY
	EndDrawing
.while:
	WindowShouldClose
	test al,al
	jz .main_loop
.escape_key:
	CloseWindow
	ExitProcess 0
	int3


; Note: DPI manifest is required for OpenGL window manager to get WM_DPICHANGED messages

section '.rsrc' resource data readable

directory \
	RT_MANIFEST,	manifests

resource manifests,\
	1,LANG_ENGLISH+SUBLANG_DEFAULT,manifest

resdata manifest
	file 'manifest.DPI.v2.xml'
endres
