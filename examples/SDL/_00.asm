include 'SDL_HLL.inc'

WinMain: ENTRY $
	virtual at RBP-.frame
		repeat 5
		.P#%		dq ?
		end repeat

		.window		_SDL_Window
		.render		_SDL_Renderer
				_align 16
		.frame := $-$$
	end virtual
	enter .frame,0

	; start sub-systems
	SDL_Init SDL_INIT_VIDEO
	test eax,eax
	js .SDL_fatal

	.window.CreateWithRenderer 512, 512, ADDR .render
	.render.SetColor 255, 0, 0, 255
	.render.Clear
	.render.Present

        SDL_Delay 5000

        SDL_Quit ; end sub-systems
	ExitProcess 0
	int3

.SDL_fatal:
	SDL_GetError
	xchg r8,rax
	SDL_ShowSimpleMessageBox SDL_MESSAGEBOX_ERROR, <_A 'SDL Error'>, r8, 0
        SDL_Quit ; end sub-systems
	ExitProcess 1
	int3
