
; recommended seed generator for xoshiro256,
; also availible in: java, rust, go, ...

; https://prng.di.unimi.it/splitmix64.c
; license: http://creativecommons.org/publicdomain/zero/1.0/

if used SplitMix64.Next
namespace SplitMix64
	collect DATA.8
		x dq ? ; seed with any value
	end collect

align 16
Next:	mov rax,0x9E3779B97F4A7C15
	add rax,[x]
	mov [x],rax
	iterate <SHIFT,CONSTANT>,\
		30,	0xBF58476D1CE4E5B9,\
		27,	0x94D049BB133111EB,\
		31,	1

		mov rdx,rax
		shr rax,SHIFT
		xor rax,rdx
		if CONSTANT <> 1
			mov rdx,CONSTANT
			imul rax,rdx
		end if
	end iterate
	retn
end namespace ; SplitMix64
end if
