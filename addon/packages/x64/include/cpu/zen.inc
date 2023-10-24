if ~ defined x86.mode
	include 'cpu\x64.inc'
end if

include 'cpu\ext\avx2.inc'
include 'cpu\ext\adx.inc'
include 'cpu\ext\aes.inc'
include 'cpu\ext\bmi2.inc'
include 'cpu\ext\f16c.inc'
include 'cpu\ext\fma.inc'
include 'cpu\ext\movbe.inc'
include 'cpu\ext\pclmulqdq.inc'
include 'cpu\ext\rdrand.inc'
include 'cpu\ext\rdseed.inc'
; RDTSCP forces all older instructions to retire before reading the time-stamp counter.
include 'cpu\ext\rdtscp.inc' ; CPUID Fn8000_0001_EDX[RDTSCP] = 1

; MOVBE, CPUID.01H:ECX.MOVBE[bit 22]
; PREFETCHW CLFLUSHOPT SHA CLZERO

calminstruction clzero? dest*
	call	x86.parse_operand@dest, dest
	check	@dest.type = 'reg' & @dest.rm = 0 & @dest.size <> 1
	jyes	_prefix
	err	'operand must be rAX'
	exit
_prefix:
	call	x86.store_operand_prefix, @dest.size
	emit	1, 0Fh
	emit	1, 1
	emit	1, 0FCh
end calminstruction

calminstruction mwaitx?
	emit	1, 0Fh
	emit	1, 1
	emit	1, 0FBh
end calminstruction

calminstruction monitorx?
	emit	1, 0Fh
	emit	1, 1
	emit	1, 0FAh
end calminstruction


; SSE4a ; AMD-only, from K10, CPUID.80000001H:ECX.SSE4A[Bit 6] flag

macro extrq? dest*,src*,sel
	SSE.parse_operand @dest,dest
	if @dest.type = 'mmreg' & @dest.size = 16
		match ,sel ; 66 0F 79 /r
			SSE.parse_operand @src,src
			if @src.type = 'mmreg' & @src.size = 16
				@src.opcode_prefix = 66h
				x86.store_instruction <0Fh,79h>,@src,@dest.rm
			else
				err 'invalid combination of operands'
			end if
		else ; xmm,ib,ib ; 66 0F 78 /0 ib ib
			x86.parse_operand @aux1,src
			x86.parse_operand @aux2,sel
			if @aux1.type <> 'imm' | @aux1.size and not 1 \
			| @aux2.type <> 'imm' | @aux2.size and not 1
				err 'invalid combination of operands'
			else
				@dest.opcode_prefix = 66h
				x86.store_instruction <0Fh,78h>,@dest,0,2,(@aux2.imm shl 8) or @aux1.imm
			end if
		end match
	else
		err 'invalid combination of operands'
	end if
end macro

macro insertq? dest*,src*,sel1,sel2
	SSE.parse_operand @dest,dest
	SSE.parse_operand @src,src
	if @dest.type = 'mmreg' & @src.type = 'mmreg'
		if (@dest.size or @src.size) <> 16
			err 'invalid operand size'
		end if
		match ,sel1 sel2
			@src.opcode_prefix = 0F2h
			x86.store_instruction <0Fh,79h>,@src,@dest.rm
		else
			x86.parse_operand @aux1,sel1
			x86.parse_operand @aux2,sel2
			if @aux1.type <> 'imm' | @aux1.size and not 1 \
			| @aux2.type <> 'imm' | @aux2.size and not 1
				err 'invalid combination of operands'
			else
				@src.opcode_prefix = 0F2h
				x86.store_instruction <0Fh,78h>,@src,@dest.rm,2,(@aux2.imm shl 8) or @aux1.imm
			end if
		end match
	else
		err 'invalid combination of operands'
	end if
end macro

iterate instr, movntss,movntsd
	macro instr? dest*,src*
		SSE.parse_operand @dest,dest
		SSE.parse_operand @src,src
		if @dest.type = 'mem' & @dest.size = 4*% \
		& @src.type = 'mmreg' & @src.size = 16
			@dest.opcode_prefix = 0F4h - %
			x86.store_instruction <0Fh,2Bh>,@dest,@src.rm
		else
			err 'invalid combination of operands'
		end if
	end macro
end iterate
