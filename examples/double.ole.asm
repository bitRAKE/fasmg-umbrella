format PE64 CONSOLE 6.2 at 0x1_0000
include 'umbrella.g'
include 'api\oleaut32.g'
LOCALE_USER_DEFAULT := 0x0400
include 'cpu\ext\avx2.inc'

main: entry $
	virtual at rbp - .frame
				rq 4
		.P5		dq ?
		.P6		dq ?
		.frame := $ - $$
	end virtual
	enter .frame, 0
	GetStdHandle STD_OUTPUT_HANDLE
	xchg rbx, rax

; Try a number of floating point examples to show conversion features:
; (verify against, https://en.wikipedia.org/wiki/Double-precision_floating-point_format)

	iterate try,\
	\;	subnormals:
		0x0000000000000001,\	; minimum positive
		0x000FFFFFFFFFFFFF,\	; maximum positive
	\;	normals:
		0x0000000000000000,\	; +0
		0x8000000000000000,\	; −0
		0x0010000000000000,\	; minimum positive
		0x7FEFFFFFFFFFFFFF,\	; maximum positive
		0x400921FB54442D18,\	; pi
	\;	non-numbers:
		0x7FF0000000000000,\	; +∞
		0xFFF0000000000000,\	; −∞
		0x7FF0000000000001,\	; sNaN
		0x7FF8000000000001,\	; qNaN
		0x7FFFFFFFFFFFFFFF	; NaN

		virtual CONST.8
			.% dq try
		end virtual

		vmovsd xmm0, [.%]
		VarBstrFromR8 rcx, LOCALE_USER_DEFAULT, 0, & .myBstr
		test eax, eax ; HRESULT
		js .%.skip
		SysStringLen [.myBstr]
		xchg r8d, eax
		WriteConsoleW rbx, [.myBstr], r8, & .P5, 0
		SysFreeString [.myBstr]
	.%.skip:
		WriteConsoleW rbx, .newline, 2, & .P5, 0
	end iterate

	ExitProcess 0
	int3

	virtual BSS.8
		.myBstr dq ?
	end virtual
	virtual CONST.2
		.newline dw 13,10
	end virtual

; and to convert in the other direction (OLECHAR are just wchar_t):
;	VarR8FromStr  & string.wchar_t, LOCALE_USER_DEFAULT, 0, & .myDouble
