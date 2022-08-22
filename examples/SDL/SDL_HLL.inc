
; common SDL2 abstractions for HLL-type use

format PE64 GUI 6.2 at 0x1234_5678_0000
include 'umbrella.g'
include 'api\SDL2.g'
include 'cpu\ext\avx2.inc'


; common error checking, redefining has broad effect

macro _SDL2_CC_CHECK_RETURN_ CC*,reg:RAX
	local passed
	test reg,reg
	j#CC passed
	int3 ; say, Hi! to debugger
	SDL_GetError
passed:
end macro




struc(NAMED) _SDL_Window
NAMED dq ?
namespace NAMED

macro Create uft8*,X:SDL_WINDOWPOS_UNDEFINED,Y:SDL_WINDOWPOS_UNDEFINED,W*,H*,flags:0
	SDL_CreateWindow utf8,X,Y,W,H,flags
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax
end macro

macro CreateWithRenderer W*,H*,flags:0,render*
	SDL_CreateWindowAndRenderer W,H,flags,ADDR NAMED,render
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -1
end macro

macro Flash op*
	SDL_FlashWindow [NAMED],op
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro From any*
	SDL_CreateWindowFrom any
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax
end macro


macro FromID id*
	SDL_GetWindowFromID id
	mov [NAMED],rax
end macro
macro GetID
	SDL_GetWindowID [NAMED] ; U32
	_SDL2_CC_CHECK_RETURN_ NZ,eax ; zero on failure
end macro

macro FromGrabbed
	SDL_GetGrabbedWindow
	mov [NAMED],rax
end macro
macro GetGrab
	SDL_GetWindowGrab [NAMED] ; SDL_bool
end macro
macro SetGrab bool*
	SDL_SetWindowGrab [NAMED],bool
end macro

macro Borders top*,left*,bottom*,right*
	SDL_GetWindowBordersSize [NAMED],ADDR top,ADDR left,ADDR bottom,ADDR right
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro Brightness
	SDL_GetWindowBrightness [NAMED] ; float
end macro

macro Get name*
	SDL_GetWindowData [NAMED],name
end macro

macro Index
	SDL_GetWindowDisplayIndex [NAMED]
	_SDL2_CC_CHECK_RETURN_ NS,eax ; + or -code
end macro

macro Mode pMode*
	SDL_GetWindowDisplayIndex [NAMED],pMode
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro FullScreen flags:0
	SDL_SetWindowFullscreen [NAMED],flags
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro Flags
	SDL_GetWindowFlags [NAMED] ; U32
end macro

macro GetGamma R16*,G16*,B16*
	SDL_GetWindowGammaRamp [NAMED],ADDR R16,ADDR G16,ADDR B16
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro
macro SetGamma R16*,G16*,B16*
	SDL_GetWindowGammaRamp [NAMED],ADDR R16,ADDR G16,ADDR B16
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro GetMaxSize W32:0,H32:0
	SDL_GetWindowMaximumSize [NAMED],ADDR W32,ADDR H32
end macro



macro Destroy
	SDL_DestroyWindow [NAMED] ; void
end macro

end namespace ; NAMED
end struc ; _SDL_Window






struc(NAMED) _SDL_Renderer
NAMED dq ?
namespace NAMED

macro Clear
	SDL_RenderClear [NAMED]
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro Present
	SDL_RenderPresent [NAMED]
end macro

macro SetColor _R8*,_G8*,_B8*,_A8*
	SDL_SetRenderDrawColor [NAMED],_R8,_G8,_B8,_A8
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

end namespace ; NAMED
end struc ; _SDL_Renderer

