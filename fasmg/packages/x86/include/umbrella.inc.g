; windows OneCore/UWP api support
;	+ no TCHAR or API renaming - use A or W directly

include 'format/format.inc'

include 'encoding/utf8.inc'

include '../../utility/@@.inc'
include 'macro/struct.inc'
include 'macro/resource.inc'

Struct.CheckAlignment = 1

; don't use TCHAR - only for existing /equates/*
; (which will be replaced in time ... )
struc? TCHAR args:?&
	. du args
end struc

macro TCHAR args:?&
	du args
end macro

sizeof.TCHAR = 2


include 'equates/kernel64.inc'
include 'equates/user64.inc'
include 'equates/gdi64.inc'
include 'equates/comctl64.inc'
include 'equates/comdlg64.inc'
include 'equates/shell64.inc'
include 'equates/advapi64.inc'
include 'equates/wsock32.inc'


include 'macro\collect.inc'
collect __CONST
end collect
collect __DATA
end collect
collect __BSS
end collect


include 'macro\rstrings.inc'
dummy RSTRING ; zero id


;S_FALSE := 1 ; because TRUE/FALSE is so 1900
;S_OK := 0


; macros are written to process 64-bit register inputs. yet, sometimes conversion to 32-bit part is convinent.
iterate <reg,rlow>, ax,al, cx,cl, dx,dl, bx,bl, sp,spl, bp,bpl, si,sil, di,dil
define reg32.r#reg? e#reg
;define reg16low.r#reg? reg
;define reg8low.r#reg? rlow
;define reg8hi.r#reg? rlow
end iterate
repeat 8, i:8
define reg32.r#i? r#i#d
;define reg16low.r#i? r#i#w
;define reg8low.r#i? r#i#l
;define reg8hi.r#i? r#i#h
end repeat


; constant fixed size arrays for any data type
struc FIXED_ARRAY line
	local items,max
	label .:items
	max = 0
	iterate item,line
		.% item ; zero implied padding
		if $ - .% > max
			max = $ - .%
		end if
		rb .stride - ($ - .%)
		if % = %%
			items := %%
		end if
	end iterate
	.stride	:= max
end struc




; TODO: doing something like "ExitProcess,0" produces a strange error - need to catch that to make the error very verbose?

macro win64abi api*,line&
	iterate P,line
		repeat 1,I:%%-%+1
		indx I
		win64abi_parm I,P
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
	match [any],arg
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
; TODO: batch into granulatity group
		collect __CONST
			label llabl
			any
		end collect
		if index < 5
			lea reg,[llabl]
		else
			lea reg,[llabl]
			mov [.P#index],reg
		end if
	else match =_W any,arg
		collect __CONST
			align 2
			label llabl
			du any,0
		end collect
		if index < 5
			lea reg,[llabl]
		else
			lea reg,[llabl]
			mov [.P#index],reg
		end if
	else match =_A any,arg
		collect __CONST
			label llabl
			db any,0
		end collect
		if index < 5
			lea reg,[llabl]
		else
			lea reg,[llabl]
			mov [.P#index],reg
		end if
	else match =_R any,arg
		word_id RSTRING any
		if index < 5
			mov reg32.reg,word_id
		else
			mov [.P#index],word_id
		end if
	else match =_T any,arg
		collect __CONST
			align sizeof.TCHAR
			label llabl
			TCHAR any,0
		end collect
		if index < 5
			lea reg,[llabl]
		else
			lea reg,[llabl]
			mov [.P#index],reg
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


; this version factors out variable terms in address space, and assumes base is infinitely alignable (use wisely)
macro _align? value*,something:db ?
	while ($-$$) and (value-1)
		something
	end while
end macro

macro lea? line&
; NOTE: spaces needed for possible line breaks! Use most general configuration!
	match any =, =< values =>,line
		local nstart,nend
		match =_T V,values
			collect __CONST
				align sizeof.TCHAR
				label nstart
				TCHAR V,0
				label nend
			end collect
		else match =_A V,values
			collect __CONST
				nstart db V,0
				label nend
			end collect
		else match =_W V,values
			collect __CONST
				nstart du V,0
				label nend
			end collect
		else
			collect __CONST
				label nstart
				values
				label nend
			end collect
		end match
		lea any,[nstart]
		.bytes = nend - nstart
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

section '.text' code readable executable
postpone
	; build import table
	match ,UMBRELLA_LIBRARY
		include 'api\OneCoreUAP.inc.g'
	else
		eval "include 'api\",UMBRELLA_LIBRARY,".inc.g'"
	end match

	; Assume user wants 32-bit addressing if they specifying a low base,
	; don't output fixups to force loader to do what is implied.
	if PE.IMAGE_BASE > 0x30_0000
	section '.reloc' fixups data readable discardable
	if $=$$
		dd 0,8 ; if there are no fixups, generate dummy entry
		display 10,9,"No relocations needed."
	else
		repeat 1,D:PE.NUMBER_OF_RELOCATIONS
			display 10,9,`D,' relocations needed.'
		end repeat
	end if
	end if
end postpone
