
; TODO : finish CALM version

; TODO: doing something like "ExitProcess,0" produces a strange error - need to catch that to make the error very verbose?

macro win64abi api*,line&
	iterate P, line
		repeat 1, I:%%-%+1
		indx I
		win64abi_parm I, P
		end repeat
	end iterate
	call [api]
end macro

macro call? function,line&
	iterate P,line
		repeat 1,I:%%-%+1
		indx I
		win64abi_parm I,P
		end repeat
	end iterate
	call function
end macro

; don't try to overload x86 instructions, irregular types should be built-up prior (i.e. instead of supporting ( SIGNED {size}? [] --> MOVSX ) just do the MOVSX)
macro win64abi_parm index*,arg&
local llabl,word_id,dest
iterate reg, rcx,rdx,r8,r9,rax,r10,r11
	if index < 5
		indx index
	else
		indx 5 + ((index-4) mod (%%-4))
	end if

;repeat 1, I:index
;display 10,`I,' ',`reg,' ',`arg
;end repeat

	match =& any,arg ; C-like shortcut for address
		if index < 5
			lea reg,[any]
		else
			lea reg,[any]
			mov [.P#index],reg
		end if
	else match [any],arg
		if index < 5
			mov reg,[any]
		else
			push [any]
			pop [.P#index]
		end if
	else match =ADDR? any,arg
		if index < 5
			lea reg,[any]
		else
			lea reg,[any]
			mov [.P#index],reg
		end if
	else match =CONST? any,arg
		lea reg,< any >
		if 4 < index
			mov [.P#index],reg
		end if
	else match =_W any,arg
		lea reg,< arg >
		if 4 < index
			mov [.P#index],reg
		end if
	else match =_A any,arg
		lea reg,< arg >
		if 4 < index
			mov [.P#index],reg
		end if
	else match =_R any,arg
		word_id RSTRING any
		if index < 5
			mov reg32.reg,word_id
		else
			mov [.P#index],word_id
		end if
	else
		x86.parse_operand@src arg
		if @src.type = 'reg'
			if index < 5
				match =reg?,arg
				else
; TODO: reg rax -> XCHG
					mov reg,arg
				end match
			else
				mov [.P#index],arg
			end if
		else if @src.type = 'mem'
			match =DWORD? any,arg
				mov reg32.reg,arg
				if index > 4
					mov [.P#index],reg
				end if
			else
				display 10,'MEMORY! Implement more types'
			end match
		else if @src.type = 'imm'
			if arg = 0
				if index < 5
					xor reg32.reg,reg32.reg
				else
					and [.P#index],0
				end if
			else if arg = -1
				if index < 5
					or reg,-1
				else
					or [.P#index],-1
				end if
			else if -$81 < arg & arg < $80
				push arg
				if index < 5
					pop reg
				else
					pop [.P#index]
				end if
			else if -1 < arg & arg < $10000_0000 & index < 5
				mov reg32.reg,arg
			else if -$8000_0001 < arg & arg < $8000_0000
				if index < 5
					mov reg,arg
				else
					mov [.P#index],arg
				end if
			else ; only use proxy in extreme case
				mov reg,arg
				if index > 4
					mov [.P#index],reg
				end if
			end if
		end if
	end match
break
end iterate
end macro


macro lea? line&
; NOTE: spaces needed for possible line breaks! Use most general configuration!
	match any =, =< values =>,line
		local nstart,nend
		.bytes = nend - nstart ; early, so .bytes can be in string
		match =_A V,values
			virtual CONST.1
				nstart db V,0
				label nend
			end virtual
		else match =_W V,values
			virtual CONST.2
				nstart du V,0
				label nend
			end virtual
		else ; TODO: could assume granularity group based on size
			virtual CONST.1
				label nstart
				values
				label nend
			end virtual
		end match
		lea any,[nstart]
	else
		lea line
	end match
end macro

macro mov? line&
; NOTE: spaces needed for possible line breaks! Use most general configuration!
	match any =, =< values =>,line
		local word_id
		match =_R V,values
			word_id RSTRING V
		else
			err ; unsupported type
		end match
		if word_id < $80
			push word_id
			pop any
		else
			mov any,word_id
		end if
	else
		mov line
	end match
end macro
