postpone
	assert __LINE__ = 2
end postpone

; language extensions:
iterate UTIL, @@,align,xcalm
	eval 'include "..\..\utility\',`UTIL,'.inc"'
end iterate

calminstruction ?! line&
	local collection, current
	compute current, $%
	take collection, current
	check __LINE__ = 2
	jyes finish
	assemble line
	exit
    finish:
	arrange line, =purge ?
	assemble line
    offsets:
	take current, collection
	jno done
	arrange line, =dd current
	assemble line
	jump offsets
    done:
end calminstruction