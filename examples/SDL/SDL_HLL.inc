
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



; https://wiki.libsdl.org/APIByCategory

; https://wiki.libsdl.org/CategoryVideo
struc(NAMED) _SDL_Window
NAMED dq ?
namespace NAMED

macro Create title_utf8*,X:SDL_WINDOWPOS_UNDEFINED,Y:SDL_WINDOWPOS_UNDEFINED,W*,H*,flags:0
	SDL_CreateWindow title_utf8,X,Y,W,H,flags
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax
end macro

macro CreateWithRenderer W*,H*,render*,flags:0
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



; https://wiki.libsdl.org/SDL_Renderer
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

macro Point X*,Y*
	SDL_RenderDrawPoint [NAMED],X,Y
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

end namespace ; NAMED
end struc ; _SDL_Renderer



; https://wiki.libsdl.org/CategorySurface
struc(NAMED) _SDL_Surface
NAMED dq ?
namespace NAMED

macro CreateRGBA width*,height*,depth:32,\
	rMASK:DWORD 0x000000FF, gMASK:DWORD 0x0000FF00,\
	bMASK:DWORD 0x00FF0000, aMASK:DWORD 0xFF000000

	SDL_CreateRGBSurface 0,width,height,depth,rMASK,gMASK,bMASK,aMASK
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax ; zero on failure
end macro

macro LoadBMP pathname*
	SDL_LoadBMP pathname
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax ; zero on failure
end macro
macro SaveBMP pathname*
	SDL_SaveBMP [NAMED],pathname
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro MUSTLOCK
	SDL_MUSTLOCK [NAMED] ; SDL_bool
end macro
macro Lock
	SDL_LockSurface [NAMED]
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro
macro Unlock
	SDL_UnlockSurface [NAMED] ; void
end macro

macro Free
	SDL_FreeSurface [NAMED] ; void
end macro

end namespace ; NAMED
end struc ; _SDL_Surface



; https://wiki.libsdl.org/SDL_Texture
struc(NAMED) _SDL_Texture RENDERER*
NAMED dq ?
namespace NAMED

macro Create format*,access*,W*,H*
	SDL_CreateTexture RENDERER,format,access,W,H
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax ; zero on failure
end macro

macro FromSurface surface*
	SDL_CreateTextureFromSurface RENDERER,surface
	mov [NAMED],rax
	_SDL2_CC_CHECK_RETURN_ NZ,rax ; zero on failure
end macro

macro Render source:0,destination:0
	SDL_RenderCopy RENDERER,[NAMED],source,destination
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro Query format:0,access:0,W:0,H:0
	SDL_QueryTexture [NAMED],format,access,W,H
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

macro Lock rect:0,pixels*,pitch*
	SDL_LockTexture [NAMED],rect,pixels,pitch
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro
macro Unlock
	SDL_UnlockTexture [NAMED] ; void
end macro

macro Update rect:0,pixels*,pitch*
	SDL_UpdateTexture [NAMED],rect,pixels,pitch
	_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
end macro

iterate FUNC, AlphaMod,BlendMode,ColorMod
	macro Get#FUNC value
		SDL_GetTexture#FUNC [NAMED],value
		_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
	end macro
	macro Set#FUNC value
		SDL_SetTexture#FUNC [NAMED],value
		_SDL2_CC_CHECK_RETURN_ Z,eax ; 0 or -code
	end macro
end iterate

macro Destroy
	SDL_DestroyTexture [NAMED] ; void
end macro

end namespace ; NAMED
end struc ; _SDL_Texture



; https://wiki.libsdl.org/CategoryEvents
struc(NAMED) _SDL_Event
NAMED SDL_Event
namespace NAMED

macro Poll
	SDL_PollEvent ADDR NAMED ; 1 or 0
end macro

macro Push
	SDL_PushEvent ADDR NAMED
	_SDL2_CC_CHECK_RETURN_ NS,eax ; 0/1 or -code
end macro

macro Peep count*,action*,min:SDL_FIRSTEVENT,max:SDL_LASTEVENT
	SDL_PeepEvents ADDR NAMED,count,action,min,max
	_SDL2_CC_CHECK_RETURN_ NS,eax ; + or -code
end macro

macro Wait
	SDL_WaitEvent ADDR NAMED ; 1 or 0
	_SDL2_CC_CHECK_RETURN_ NZ,eax ; 0 on error
end macro

macro WaitTimeout time
	SDL_WaitEventTimeout ADDR NAMED,time ; 1 or 0 (error or timeout)
end macro

end namespace ; NAMED
end struc ; _SDL_Event
