; On my system SDL_WINDOW_FULLSCREEN is bad. It effect multiple monitors
; in an incorrect way: all system monitors have their display mode altered
; (some in unstable ways), and the window is always move to the primary
; display - no matter where it was prior. SDL_WINDOW_FULLSCREEN_DESKTOP
; on the other hand, plays nice with other applications, but changes the
; window size.

include 'SDL_HLL.inc'

SDLK_RETURN := 13
SDLK_ESCAPE := 27

include 'cpu\ext\rdseed.inc'
include 'algo\random\xoshiro256.inc' ; RBP is random context
include 'algo\random\splitmix64.inc'

WinMain: ENTRY $
	virtual at RBP-.frame
		repeat 6
		.P#%		dq ?
		end repeat

		.window		_SDL_Window
		.render		_SDL_Renderer
		.event		_SDL_Event

		.width		dq ?
		.height		dq ?
				_align 16
		.frame := $-$$
	end virtual
	mov spl,0 ; 256 alignment
	pop rax
	enter .frame,0 ; now, RBP is aligned 256 ;-)

	; seed random context
	xor ecx,ecx
@@:	rdseed rax
	dec cl
	jnbe @B
	jc @F
	rdtsc
	rol rax,32
	xor rax,rdx
@@:	mov [SplitMix64.x],rax
	repeat 4
		call SplitMix64.Next
		mov [xoshiro256.state + 8*(%-1)],rax
	end repeat

	mov [.width],640
	mov [.height],480

	SDL_InitSubSystem SDL_INIT_EVERYTHING
	lea rbx,<_A 'Could not initialize SDL: %s'>
	test eax,eax
	js .SDL_fatal
	.window.CreateWithRenderer [.width], [.height], ADDR .render
	.render.SetColor 0, 0, 0, 0
	.render.Clear
	.render.Present
.main_loop:
	.event.Poll
	iterate EVT, SDL_QUIT, SDL_KEYDOWN
		cmp [.event.type],EVT
		jz .EVT
	end iterate
.main_update:
	; get window size
	SDL_GetWindowSize [.window], ADDR .width, ADDR .height

	; get random color
	call xoshiro256.next
	movzx edx,al
	shr rax,8
	movzx r8,al
	shr rax,8
	movzx r9,al
	shr rax,8
	.render.SetColor rdx, r8, r9, rax

	; get random point
	call xoshiro256.next
	xor edx,edx
	div [.height]
	mov r8,rdx
	div [.width]
	.render.Point rdx,r8

	.render.Present
	SDL_Delay 0
	jmp .main_loop

.SDL_KEYDOWN:
	iterate KEY, SDLK_ESCAPE,SDLK_RETURN
		cmp [.event.key.keysym.sym],KEY
		jz .KEY
	end iterate
	jmp .main_update

; ALT-Return toggles fullscreen mode, +<shift> for fullscreen window
; note: fullscreen is mode change of the display to match window size
.SDLK_RETURN:
	test [.event.key.keysym.mod],KMOD_ALT
	jz .main_update
	SDL_GetWindowFlags [.window]
	xor edx,edx
	test eax,SDL_WINDOW_FULLSCREEN
	jnz @F
	or edx,SDL_WINDOW_FULLSCREEN
	test [.event.key.keysym.mod],KMOD_SHIFT
	jz @F
	mov edx,SDL_WINDOW_FULLSCREEN_DESKTOP
@@:	SDL_SetWindowFullscreen [.window], rdx
	jmp .main_update

.SDLK_ESCAPE:
	; exit program
.SDL_QUIT:
	SDL_DestroyRenderer [.render]
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
