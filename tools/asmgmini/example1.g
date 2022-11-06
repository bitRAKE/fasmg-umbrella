	align 16
@1:	vfmadd132pd ymm0, ymm2, ymm1
@0:	vbroadcastsd ymm2, [rdx+rcx*8]
	loop @1B
	vaddpd ymm0, ymm0, ymm2
@2:	retn

HornerMethodPD:
	mov ecx, [rdx]
	vxorpd ymm0, ymm0, ymm0
	jrcxz @2B
	jmp @0B

db $-$$
