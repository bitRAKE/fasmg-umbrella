
; linear branching
; some targets pass through 255 branches

namespace METHOD

align 16
get_data:
	lodsb

repeat 256,i:0
	cmp al,i
	jz B#i
end repeat
	int3 ; should never happen

repeat 256,i:0
	B#i:
		push i-128
		pop rax
		call work
		jmp get_data
end repeat

end namespace ; METHOD
