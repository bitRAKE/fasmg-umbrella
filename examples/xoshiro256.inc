
; see: https://prng.di.unimi.it/

; Requirements:
;	include 'macro\collect.inc'

;define state rbp ; redefined this based on usage
if ~ defined xoshiro256.state
	; no forward reference
	define xoshiro256.state
	redefine xoshiro256.state rbp
end if

namespace xoshiro256

align 64 ; 65 bytes!
next:	mov r11,[state+1*8]
	mov rdx,[state+0*8]
	mov rax,[state+3*8]
	mov r10,r11
	mov r9,r11
	mov r8,rdx
	shl r10,17

	xor r11,[state + 2*8]
	xor rdx,rax
	xor r9,r11
	xor r8,rdx
	ror r11,19
	xor rdx,r10

	add rax,[state+0*8]
	mov [state+1*8],r9
	mov [state+0*8],r8
	mov [state+3*8],r11
	mov [state+2*8],rdx
	retn ; return result and flags based on result


; Jump functions for the generator are equivalent to 2^K calls of next()
; it can be used to generate 2^(256-K) non-overlapping subsequences for
; parallel computations.

iterate <FUNCTION,DATAS>,\
	jump128,<\
		0x180EC6D33CFD0ABA,0xD5A61266F0C9392C,\
		0xA9582618E03FC9AA,0x39ABDC4529B1661C>,\
	jump192,<\
		0x76E15D3EFEFDCBBF,0xC5004E441C522FB3,\
		0x77710069854EE241,0x39109BB02ACBE635>

	if used FUNCTION
		collect DATA.32
			xoshiro256.% dq DATAS
		end collect

		align 16
		FUNCTION: ; 38 bytes
			xor ecx,ecx
			vpxor xmm0,xmm0,xmm0
		.scan:
			bt dword [xoshiro256.%],ecx
			jnc .skip
			vpxor ymm0,ymm0,qqword [state]
		.skip:
;			push rcx
			call next
;			pop rcx
			inc cl
			jnz .scan
			vmovdqa [state],ymm0
;			vzeroupper
			retn
	end if ; used FUNCTION
end iterate

; build test cases to confirm algorithms

;macro xoshiro256.data
;namespace xoshiro256
;	s dq ?,?,?,?
;end namespace ; xoshiro256
;end macro

; [1,2)
;	or rax,0x3FF
;	ror rax,10		; favor high random bits
;	shr rax,2		; clear top two bits

end namespace ; xoshiro256
