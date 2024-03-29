
; [bug] fasmg: unable to get uninitialized area contents
; https://board.flatassembler.net/topic.php?t=22901

FIX_BUG		:= 0
USE_CALM	:= 0
EMPTY		:= 0 ; empty doesn't produce error

virtual at Reserved.BASE
Reserved::
 	if FIX_BUG
		db -1
	end if
end virtual

Reserved.BASE:
if ~EMPTY | FIX_BUG
	virtual Reserved
		rb 16 ; bug only happens when the whole area is uninitialized
	end virtual
end if

if USE_CALM
	contents AreaContent Reserved
else
	load contents:sizeof Reserved from Reserved:Reserved.BASE
end if

db contents

calminstruction(target) AreaContent? area*
	local string
	load string, area: 0, sizeof area
	publish target, string
end calminstruction
