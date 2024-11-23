; https://board.flatassembler.net/topic.php?p=241662#241662

if __SOURCE__ = __FILE__ ; self-test
	virtual
	TTT::
	file __FILE__
	end virtual

	iterate <TAG,		VALUE>,\
		"{{VEGE}}",	"<<PEPPER>>",\
		"{{ANIMAL}}",	"<<BEAR>>",\
		"{{COMMAND}}",	"<<TESTING>>"

		define tags	TAG
		define values	VALUE
	end iterate

	TagReplaced TTT
end if

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


calminstruction TagReplaced area* ; parameterized templating
	local head,mark,tag,T,V
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
	jump interval

done:	call AreaInterval,area,mark,head
end calminstruction
