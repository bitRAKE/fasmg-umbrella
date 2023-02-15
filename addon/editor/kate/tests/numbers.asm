
; test both fasmg assembling of representation and syntax highlighting

; binary
dq 0b
dq 0B
dq 0_1b
dq 0'1B
dq 1_0_1b
dq 1_0'1B
dq 01'00'01'B

; octal
dd 01_23_45'67_O
dd 01'23'45'67'o

; decimal
dq 1,-1,+1
dq 1D,-1D,+1D
dq 1d,-1d,+1d
dq 1_0d,-1_1d,+1_2d
dq 1'0d,-1'1d,+1'2d

; hexadecimal
dq 0x12_34_56_78
dq 0xFE_DC_BA_98
dq 0x12'34'56'78
dq 0xfe'dc'ba'98
dq 0FE_DC_BA_98H
dq 0fe'dc'ba98'H
dq 0FE_DC_BA_98h
dq 0fe'dc'ba'98h
dq $FE_DC_BA_98
dq $fe'dc'ba'98
dq $FE_DC_BA_98
dq $fe'dc'ba'98

; floats - 'F' is allowed only when 'E' not present
dq 0.1
dq 0.1e1
dq 0.1e-1
dq -1f
dq -0.1_1f
dq -0.1e1
dq -0.1e-1
dq +1F
dq +1.1F
dq +1.1'2E1
dq +1.1E+1_1


; Caution: all number formats can be forced to a variable name by preceeding
; them with a question mark - these are not numbers.

struc tester value*
	local ?0
	label value at ?0
	?0:
end struc
?1 tester ?2.3
