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


macro Encode reg:RSI
	local move,done,scan
	mov al,[reg]
	or ecx,-1
scan:	inc ecx
	cmp [NAMED.list+rcx],al
	jnz scan
	mov [reg],cl		; store index of byte found
	jrcxz done
move:	mov ah,[NAMED.list+rcx-1]
	mov [NAMED.list+rcx],ah
	loop move
	mov [NAMED.list],al
done:	inc reg
end macro


macro Decode reg:RSI
	local move,done
	movzx ecx,byte [reg]
	mov al,[NAMED.list+rcx]
	jrcxz done
move:
	mov ah,[NAMED.list+rcx-1]
	mov [NAMED.list+rcx],ah
	loop move
	mov [NAMED.list],al
done:	mov [reg],al		; store byte found at index
	inc reg
end macro

end namespace ; NAMED
end struc ; MTF
