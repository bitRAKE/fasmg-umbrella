macro movbe? dest*,src*
	x86.parse_operand@dest dest
	x86.parse_operand@src src
	if @dest.size & @src.size & @src.size <> @dest.size
		err 'operand sizes do not match'
	end if
	if @dest.type = 'reg' & @src.type = 'mem' & @dest.size > 1
		x86.select_operand_prefix@src @dest.size
		x86.store_instruction@src <0Fh,38h,0F0h>,@dest.rm
	else if @dest.type = 'mem' & @src.type = 'reg' & @src.size > 1
		x86.select_operand_prefix@dest @src.size
		x86.store_instruction@dest <0Fh,38h,0F1h>,@src.rm
	else
		err 'invalid combination of operands'
	end if
end macro
