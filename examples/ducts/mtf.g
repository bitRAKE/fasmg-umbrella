; Move-to-Front Transform
; https://wikipedia.org/wiki/Move-to-front_transform

struc(NAMED) MTF
namespace NAMED

list rb 256

macro Init reg:RAX
	local fill
	xor reg32.reg, reg32.reg
fill:	mov [NAMED.list + reg], reg8low.reg
	inc reg8low.reg
	jnz fill
end macro


macro Encode
	local move,done,scan
	lodsb
	or ecx,-1
scan:	inc ecx
	cmp [NAMED.list+rcx],al
	jnz scan
	mov [rsi-1],cl		; store index of byte found
	jrcxz done
move:	mov ah,[NAMED.list+rcx-1]
	mov [NAMED.list+rcx],ah
	loop move
	mov [NAMED.list],al
done:
end macro


macro Decode
	local move,done
	movzx ecx,byte [rsi]
	mov al,[NAMED.list+rcx]
	jrcxz done
move:
	mov ah,[NAMED.list+rcx-1]
	mov [NAMED.list+rcx],ah
	loop move
	mov [NAMED.list],al
done:	mov [rsi],al		; store byte found at index
	lodsb ; add rsi,1
end macro

end namespace ; NAMED
end struc ; MTF
