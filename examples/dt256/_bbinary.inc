
; branching with solution space partitioning
; (every target passes through (taken or not taken) eight branches)

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



; efficient branching
	mov ah,al
	lahf

; 0000 z
; 1000-1111 s
; 1001|1010|1100|1111 pe
; 1000|1011|1101|1110 po
;	0001-0111 ns
;	0001|0010|0100|0111 po
;	0011|0101|0110 pe


	shl al,1
	jc .carry
	js ._carry.sign
	jpo ._carry_sign.parity
._carry_sign_parity:


._carry.sign:
	jpo ._carry.sign.parity
._carry.sign_parity:

._carry.sign.parity:

._carry_sign.parity:



.carry:
	js .carry.sign
	jpo .carry_sign.parity
.carry_sign_parity:

.carry_sign.parity:


.carry.sign:
	jpo .carry.sign.parity
.carry.sign_parity:

.carry.sign.parity:




