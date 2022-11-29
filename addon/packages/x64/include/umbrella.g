; windows OneCore/UWP api support
;	+ no TCHAR or API renaming - use A or W directly

include 'format\format.inc'
define __ImageBase PE.IMAGE_BASE ; HINSTANCE constant

include 'encoding\utf8.inc'

include '..\..\utility\@@.inc'
include 'macro\struct.inc'
include 'macro\resource.inc'

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


include 'equates\kernel64.inc'
include 'equates\user64.inc'
include 'equates\gdi64.inc'
include 'equates\comctl64.inc'
include 'equates\comdlg64.inc'
include 'equates\shell64.inc'
include 'equates\advapi64.inc'
include 'equates\wsock32.inc'

; superfluous renaming
iterate <NAME_OUT,	NAME_IN>,\
	WNDCLASSEXW,	WNDCLASSEX

	struc NAME_OUT any&
		. NAME_IN any
	end struc
end iterate

UNICODE := 1
include 'equates\WinUser.g'



include 'macro\rstrings.inc'
dummy RSTRING ; zero id

include 'macro\collect.inc'

; initialize data collections
repeat 7
repeat 1,I:1 shl (7-%)
	collect CONST.I		; read-only
	end collect
	collect DATA.I		; initialized read-write
	end collect
	collect BSS.I		; uninitialized read-write
	end collect
end repeat
end repeat


macro push? line&
	iterate item,line
		push item
	end iterate
end macro
macro rpop? line&
	iterate item,line
		indx %%-%+1
		pop item
	end iterate
end macro


; Macros are written to process 64-bit/32-bit register inputs. yet, sometimes
; conversion to register parts is convenient.
iterate <reg,	rhigh,	rlow>,\
	ax,	ah,	al,\
	cx,	ch,	cl,\
	dx,	dh,	dl,\
	bx,	bh,	bl,\
	sp,	,	spl,\
	bp,	,	bpl,\
	si,	,	sil,\
	di,	,	dil

	define reg16low.e#reg?	reg
	define reg8low.e#reg?	rlow

	define reg32.r#reg?	e#reg
	define reg16low.r#reg?	reg
	define reg8low.r#reg?	rlow

	match ,rhigh
	else
		define reg8high.r#reg?	rhigh
		define reg8high.e#reg?	rhigh
	end match
end iterate
repeat 8, i:8
	define reg32.r#i? r#i#d
	define reg16low.r#i? r#i#w
	define reg8low.r#i? r#i#b
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
		match =_A V,values
			collect CONST.1
				nstart db V,0
				label nend
			end collect
		else match =_W V,values
			collect CONST.2
				nstart du V,0
				label nend
			end collect
		else ; TODO: could assume granularity group based on size
			collect CONST.1
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

; If needed, resource data should be at end of program:
;	+ resource file
;	+ instruction stream defined resource
;		+ with resource strings:
;			RT_STRING, strings		; directory entry
;			resource_RSTRINGS strings	; generate tables
;
;section '.rsrc' resource from 'file.res' data readable
;section '.rsrc' resource data readable
;include 'rsrc\rsrc.inc.g'


; Base API needs to be primary in order that it may be over written by later APIs
; user controls API ordering in this way.
match =UMBRELLA_LIBRARY,UMBRELLA_LIBRARY
	include 'api\OneCoreUAP.g'
else
	eval "include 'api\",UMBRELLA_LIBRARY,".g'"
end match
postpone
	; The following defines the section layout for the executable:

	; Grouping starts at cacheline size and decreases to one. This insures each
	; successive group is aligned.
	;
	; "How can multiple sections of file be generated in parallel?"
	; https://flatassembler.net/docs.php?article=fasmg
	section '.rdata' data readable ; granularity groups for constant data
		CONST.64
		CONST.32
		CONST.16
		CONST.8
		CONST.4
		CONST.2
		CONST.1
		if $ = $$ ; loader doesn't like zero length sections
			db 0
		end if

	section '.data' data readable writeable ; granularity groups for variable data
		DATA.64
		DATA.32
		DATA.16
		DATA.8
		DATA.4
		DATA.2
		DATA.1

		align 64

		BSS.64
		BSS.32
		BSS.16
		BSS.8
		BSS.4
		BSS.2
		BSS.1
		if $ = $$ ; loader doesn't like zero length sections
			db ?
		end if

	include 'api\__import64.g' ; build import table

	; Assume user wants 32-bit addressing if they specifying a low base,
	; don't output fixups to force loader to do what is implied.
	if (PE.IMAGE_BASE - PE.RELOCATION) > 0x30_0000
	section '.reloc' fixups data readable discardable
	if $ = $$ ; loader doesn't like zero length sections
		dd 0,8 ; if there are no fixups, generate dummy entry
		display 10,9,"No relocations needed."
	else
		repeat 1,D:PE.NUMBER_OF_RELOCATIONS
			display 10,9,`D,' relocations needed.'
		end repeat
	end if
	end if
end postpone
