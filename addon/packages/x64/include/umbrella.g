
calminstruction (target) AreaContent? area*
        local string, empty
        load string, area: 0, sizeof area
        publish target, string
end calminstruction

; Advanced Data Model
;
; We start with creating virtual areas to capture data throughout. Then program
; layout determines where different types of data appears in the object file.
; Merging of sections or late sections (relative to code) can be realized. Late
; sections need to be POSTPONED.
;	+ need granularity coverage for all useful ranges and data types
;		+ CONST - read only data
;		+ DATA - initialized read/write data
;		+ BSS - uninitialized read/write data
;	+ ordering of data within PE is arbitrary
;	+ uses base fasmg syntax
;	+ warn of non-zero data in BSS

iterate grain, 64,32,16,8,4,2,1
	virtual at CONST.grain.BASE
	CONST.grain::
	end virtual

	virtual at DATA.grain.BASE
	DATA.grain::
	end virtual

	virtual at BSS.grain.BASE
	BSS.grain::
	end virtual
end iterate

; Delayed definition of *.DATA and *.SIZE to capture all area expansions, and
; enable layout flexiblity.
postpone
	iterate grain, 64,32,16,8,4,2,1
		CONST.grain.DATA AreaContent CONST.grain
		DATA.grain.DATA AreaContent DATA.grain
		BSS.grain.DATA AreaContent BSS.grain
		if BSS.grain.DATA <> 0
			display 10,10,'Warning: initialized data in BBS.',`grain,' ignored!',10
		end if
		BSS.grain.SIZE := sizeof BSS.grain
	end iterate
end postpone

;-------------------------------------------------------------------------------

;format PE64 CONSOLE 6.2 at 0x1_4000_0000
include 'format\format.inc'
include 'encoding\utf8.inc'

; prefer advanced functionality macros
include '..\..\utility\@@.inc'
include '..\..\utility\align.inc'
include 'macro\codepad.inc' ; for use with align

include 'macro\struct.inc'
Struct.CheckAlignment = 1

include 'macro\resource.inc'

; HACK : don't use TCHAR - only for existing /equates/*
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

; HACK : superfluous renaming (should be replaced in time - don't use abiguous A/W symbols)
iterate <NAME_OUT,	NAME_IN>,\
	WNDCLASSEXW,	WNDCLASSEX

	struc NAME_OUT any&
		. NAME_IN any
	end struc
end iterate

UNICODE := 1
include 'equates\WinUser.g'
include 'equates\windef.g'

include 'macro\rstrings.inc'
dummy RSTRING ; zero id

include 'macro\fixed_array.g'

; Macros are written to process 64-bit/32-bit register inputs. yet, sometimes
; conversion to register parts is convenient. Root namespaces are globally accessible.
define reg8low reg8low
define reg8high reg8high
define reg16low reg16low
define reg32 reg32
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

include 'macro\win64abi.g'

;---------------------------------------------------------------- Object Layout:

if CONST.DATA.SIZE <> 0
	section '.rdata' data readable ; ---------------------------------------
end if

iterate grain, 64,32,16,8,4,2,1
	CONST.grain.BASE:
		db CONST.grain.DATA
end iterate
CONST.DATA.SIZE := $ - CONST.64.BASE
repeat 1, N:CONST.DATA.SIZE
	display 10,9,`N,' bytes for constant data'
end repeat


if DATA.DATA.SIZE <> 0 ; merge both read/write sections
	section '.data' data readable writeable ; ------------------------------
else if BSS.DATA.SIZE <> 0 ; create uninitialized data section
	section '.data' udata readable writeable ; -----------------------------
end if

iterate grain, 64,32,16,8,4,2,1
	DATA.grain.BASE:
		db DATA.grain.DATA
end iterate
DATA.DATA.SIZE := $ - DATA.64.BASE
repeat 1, N:DATA.DATA.SIZE
	display 10,9,`N,' bytes for initialized data'
end repeat

align 64
iterate grain, 64,32,16,8,4,2,1
	BSS.grain.BASE:
		rb BSS.grain.SIZE
end iterate
BSS.DATA.SIZE := $ - BSS.64.BASE
repeat 1, N:BSS.DATA.SIZE
	display 10,9,`N,' bytes for uninitialized data'
end repeat


section '.text' code readable executable ; -------------------------------------

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
; TODO : abstract imports so this section can be located anywhere in object

	include 'api\__import64.g' ; build import table

; NOTE : Assume user wants 32-bit addressing if they specifying a low base,
; don't output fixups to force loader to do what is implied.
; (CAUTION: zero base always relocates.)
	if (PE.IMAGE_BASE - PE.RELOCATION) > 0x30_0000 \
	| (PE.IMAGE_BASE - PE.RELOCATION) = 0 \
	& PE.RELOCATION_INDEX ; no more relocations possible

		section '.reloc' fixups data readable discardable
		repeat 1,D:PE.NUMBER_OF_RELOCATIONS
			display 10,9,`D,' relocations needed.'
		end repeat
	else
		display 10,9,"No relocations needed."
	end if
end postpone
