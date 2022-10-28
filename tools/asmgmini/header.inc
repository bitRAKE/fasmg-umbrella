postpone
	assert __LINE__ = 2
end postpone

include 'cpu\x64.inc'
iterate EXT, avx2,bmi2,fma
	eval 'include "cpu\ext\',`EXT,'.inc"'
end iterate
use64

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