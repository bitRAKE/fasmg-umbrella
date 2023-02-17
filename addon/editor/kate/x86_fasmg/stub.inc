macro display? D&
if __source__=__file__
	db `D,13,10
end if
end macro

macro macro?! all&
if __source__=__file__
	display all
end if
	esc macro all
end macro

; relative to "\fasmg\packages\x86\include\"
; or          "\addon\packages\x86\include\"
include '../../utility/xcalm.inc'

calminstruction calminstruction?! text&
	local B
	match B,text
	jno done
	arrange B,=display B
	assemble B
done:	arrange B,=calminstruction text
	assemble B
end calminstruction
