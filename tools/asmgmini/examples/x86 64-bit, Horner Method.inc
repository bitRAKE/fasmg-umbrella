include 'cpu\x64.inc'
include 'cpu\ext\avx2.inc'
include 'cpu\ext\fma.inc'

use64
align 16

; https://en.wikipedia.org/wiki/Horner%27s_method
; https://www.geeksforgeeks.org/horners-method-polynomial-evaluation/

@0:	vfmadd132pd ymm0, ymm2, ymm1
@1:	vbroadcastsd ymm2, [rdx+rcx*8]
	loop @0B
	vaddpd ymm0, ymm0, ymm2
@2:	retn

HornerMethodPD:
	mov ecx, [rdx]
	vxorpd ymm0, ymm0, ymm0
	jrcxz @2B
	jmp @1B

;---------------------------------------
db $-$$ ; total code size

; Example Usage: Evaluate value of 2x^3 - 6x^2 + 2x - 1,
; for x = {0.0, 1.0, 2.0, 3.0}
	lea rdx, [Ex0]
	vmovapd ymm1, [x]
	call HornerMethodPD
; Output: ymm0 = {-1.0, -3.0, -5.0, 5.0}

align 8
Ex0 dd 4, ?
	dq -1.0, 2.0, -6.0, 2.0

align 32
x:	dq 0.0, 1.0, 2.0, 3.0
