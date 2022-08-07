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
	mov cl,0xFF
	push rdi
	repnz scasb
	not ecx
	mov [rsi-1],cl
move:
	cmp [rsp],rdi
	jz done
	mov ch,[rdi-1]
	mov [rdi],ch
	dec rdi
	jmp move
done:
	mov [rdi],cl
	pop rdi ; add rsp,8 ; value didn't change
end macro


macro Decode
	push rdi
	lea rdi,[NAMED.list]
	repnz scasb
	pop rdi
	xchg eax,ecx

	stosb
	rep movsb
end macro

end namespace ; NAMED
end struc ; MTF
