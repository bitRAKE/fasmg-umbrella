; Move-to-Front Transform
; https://wikipedia.org/wiki/Move-to-front_transform

struc(NAMED) MTF
namespace NAMED

list rb 256

macro Init reg:RAX
	local fill
	xor reg32.reg, reg32.reg
	lea rdi,[NAMED.list]
fill:	mov [rdi + reg], reg8low.reg
	inc reg8low.reg
	jnz fill
end macro


macro Encode
	local move,done
	lodsb
	or ecx,-1
	push rdi
	repnz scasb
	pop rdi
	not ecx
	dec ecx
	mov [rsi-1],cl		; store index of byte found
	jrcxz done
move:
	mov ah,[rdi+rcx-1]
	mov [rdi+rcx],ah
	loop move
	mov [rdi],al
done:
end macro


macro Decode
	local move,done
	movzx ecx,byte [rsi]
	mov al,[rdi+rcx]
	jrcxz done
move:
	mov ah,[rdi+rcx-1]
	mov [rdi+rcx],ah
	loop move
	mov [rdi],al
done:
	mov [rsi],al		; store byte found at index
	lodsb ; add rsi,1
end macro

end namespace ; NAMED
end struc ; MTF
