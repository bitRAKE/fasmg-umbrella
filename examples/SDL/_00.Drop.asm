
; https://wiki.libsdl.org/SDL_DropEvent#code_examples

include 'SDL_HLL.inc'
WinMain: ENTRY $
	virtual at RBP-.frame
		repeat 6
		.P#%		dq ?
		end repeat

		.window		_SDL_Window
		.event		_SDL_Event
				_align 16
		.frame := $-$$
	end virtual
	enter .frame,0
	SDL_InitSubSystem SDL_INIT_EVERYTHING
	lea rbx,<_A 'Could not initialize SDL: %s'>
	test eax,eax
	js .SDL_fatal

	.window.Create <_A 'SDL_DropEvent usage, please drop the file on window'>,\
		SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,\
		640, 480, SDL_WINDOW_OPENGL
	lea rbx,<_A 'Could not create window: %s'>
	cmp [.window],0
	jz .SDL_fatal

	SDL_EventState SDL_DROPFILE, SDL_ENABLE
.main_loop:
	.event.Poll
	iterate EVT, SDL_QUIT, SDL_DROPFILE
		cmp [.event.type],EVT
		jz .EVT
	end iterate
	SDL_Delay 0
	jmp .main_loop

.SDL_DROPFILE:
	SDL_ShowSimpleMessageBox SDL_MESSAGEBOX_INFORMATION,\
		<_A 'File dropped on window'>,[.event.drop.file_],[.window]
	SDL_free [.event.drop.file_]
	jmp .main_loop

.SDL_QUIT:
	SDL_DestroyWindow [.window]
        SDL_Quit ; end sub-systems
	ExitProcess 0
	int3

.SDL_fatal:
	SDL_GetError
	xchg rdx,rax
	SDL_Log rbx, rdx
        SDL_Quit ; end sub-systems
	ExitProcess 1
	int3
