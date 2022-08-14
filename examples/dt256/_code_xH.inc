
; code based
; single jmp/call

namespace METHOD

align 16
get_data:
	lodsb
	mov bh,al
	call rbx
	jmp get_data

repeat 256
	Branch.%:
		push i-129
		pop rax
		jmp work
end repeat

end namespace ; METHOD
