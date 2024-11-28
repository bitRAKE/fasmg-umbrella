
; https://board.flatassembler.net/topic.php?p=241807#241807

if __SOURCE__ = __FILE__ ; self-test
	virtual
	TTT::
	file __FILE__
	end virtual

	iterate <TAG,		VALUE>,\
		"{{VEGE}}",	"<<PEPPER>>",\
		"{{ANIMAL}}",	"{{VEGE}}<<BEAR>>",\
		"{{COMMAND}}",	"{{ANIMAL}}<<TESTING>>"

		define tags	TAG
		define values	VALUE
	end iterate

	MultiTagRep TTT
end if

macro MultiTagRep area*,limit:100
	local DRAFT,now,replacements

	virtual area
		load now:$-$$ from $$
	end virtual
	repeat limit
		virtual at 0
			DRAFT.%::
			db now
		end virtual

		virtual at 0 as 'result'
			TagReplaced DRAFT.%,replacements
			load now:$-$$ from $$
		end virtual

		if replacements = 0
			break
		end if

		repeat 1,\
			M:sizeof DRAFT.%,\
			N:lengthof now,\
			O:replacements
			display 9,"area size:",9,`M,' -> ',`N,10
			display 9,"replaced:",9,`O,10
		end repeat
	end repeat

end macro

calminstruction TagReplaced area*,COUNT* ; parameterized templating
	local head,mark,tag,T,V,times
	compute times,0
	compute head, -1
interval:
	compute mark, head + 1

tv:	take tags,T
	take values,V
	jyes tv

go:	compute head, head + 1
	check head < sizeof area
	jno done

	load tag, area:head, 1
	check tag = '{'
	jno go

vt:	take T,tags
	take V,values
	jno tv

	check head + lengthof T <= sizeof area
	jno vt

	load tag, area:head, lengthof T
	check tag = T
	jno vt

	call AreaInterval,area,mark,head

	emit lengthof V, V
	compute head, head + lengthof T - 1
	compute times,times+1
	jump interval

done:	call AreaInterval,area,mark,head
	publish COUNT,times
end calminstruction

; Emit the half-open interval of an area, [x0,x1).
calminstruction AreaInterval area*,x0*,x1*
	local bytes,value
	compute bytes,x1-x0
	check bytes>0
	jno skip
	load value,area:x0,bytes
	emit bytes,value
skip:
end calminstruction
