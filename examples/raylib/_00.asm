format PE64 GUI 6.2 at 0x1234_5678_0000
define UMBRELLA_LIBRARY 'OneCore_apiset'
include 'umbrella.g'
include 'api\raylib.g'
include 'cpu\ext\avx2.inc'

WinMain: ENTRY $
	virtual at RBP-.frame
		repeat 5
		.P#%		dq ?
		end repeat

		.default.width	dq ?
		.default.height	dq ?

		.display	dq ?
		.display.width	dq ?
		.display.height	dq ?

				_align 16
		.frame := $-$$
	end virtual
	enter .frame,0

	mov	[.default.width], 800
	mov	[.default.height], 450

	InitWindow [.default.width], [.default.height],\
		_A "raylib [core] example - fullscreen toggle"
	SetTargetFPS 60
	jmp .while

.main_loop:
	IsKeyPressed KEY_ENTER
	test eax,eax
	jz .done_toggle_fullscreen
	IsKeyDown KEY_LEFT_ALT
	test eax,eax
	jnz .toggle_fullscreen
	IsKeyDown KEY_RIGHT_ALT
	test eax,eax
	jz .done_toggle_fullscreen
.toggle_fullscreen:
	; default window size if already fullscreen

	IsWindowFullscreen
	test eax,eax
	jnz .default_size

	; borderless window the size of display, if not fullscreen

	GetCurrentMonitor
	mov [.display], rax
	GetMonitorWidth [.display]
	mov [.display.width], rax
	GetMonitorHeight [.display]
	mov [.display.height], rax

	SetWindowSize [.display.width], [.display.height]
	ToggleFullscreen
	jmp .done_toggle_fullscreen
.default_size:
	ToggleFullscreen
	SetWindowSize [.default.width], [.default.height]
.done_toggle_fullscreen:


        BeginDrawing
        ClearBackground RAYWHITE
        DrawText _A "Press Alt + Enter to Toggle full screen!",\
		190, 200, 20, LIGHTGRAY
        EndDrawing
.while:
	WindowShouldClose
	test eax,eax
	jz .main_loop
	CloseWindow
	ExitProcess 0
	int3
