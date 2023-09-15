
calminstruction (target) AreaContent? area*
        local string
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

postpone
	iterate grain, 64,32,16,8,4,2,1
		CONST.grain.DATA AreaContent CONST.grain
		DATA.grain.DATA AreaContent DATA.grain
		BSS.grain.DATA AreaContent BSS.grain
		if BSS.grain.DATA <> 0
			display 10,10,'warning: BBS.',`grain,' initialized data ignored',10
		end if
		BSS.grain.SIZE := sizeof BSS.grain
	end iterate
end postpone

;----------------------------------------------------------------------- Layout:

format PE64 CONSOLE 6.2 at 0x1_4000_0000
include 'format\format.inc'
include 'macro\import64.inc'
include '..\..\utility\align.inc'

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

iterate grain, 64,32,16,8,4,2,1
	BSS.grain.BASE:
		rb BSS.grain.SIZE
end iterate
BSS.DATA.SIZE := $ - BSS.64.BASE
repeat 1, N:BSS.DATA.SIZE
	display 10,9,`N,' bytes for uninitialized data'
end repeat


section '.text' code readable executable ; -------------------------------------


postpone ; this section at end of output
section '.idata' import data readable ; ----------------------------------------

library kernel32, 'kernel32.dll'

import kernel32,\
	ExitProcess, 'ExitProcess',\
	GetConsoleMode, 'GetConsoleMode',\
	GetStdHandle, 'GetStdHandle',\
	SetConsoleMode, 'SetConsoleMode',\
	WriteConsoleA, 'WriteConsoleA'
end postpone
