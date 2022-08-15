
; TODO:
;	- non-function exports
;	- extend OneCore includes

macro libraries? definitions&
	section '.idata' import data readable writeable
	namespace PE
	Imports:
	iterate name, definitions
		repeat 1,N:name ; convert string to number
		if ~ redundant.N
			dd RVA lookup.N
			dd 0,0
			dd RVA string.N
			dd RVA address.N
		end if
		referred.N = 1
		end repeat
	end iterate
	dd 0,0,0,0,0
	iterate name, definitions
		repeat 1,N:name ; convert string to number
		if ~ redundant.N
			string.N db name,0
			align 2
		end if
		end repeat
	end iterate
	end namespace
end macro
macro import? name,definitions&
	align 8
	namespace PE
	repeat 1,N:name
	if defined referred.N
		lookup.N:
		iterate _label, definitions
			if used _x_#_label
				dq RVA _label.N
			end if
		end iterate
		if $ > lookup.N
			redundant.N = 0
			dq 0
		else
			redundant.N = 1
		end if
		address.N:
		end namespace

		iterate _label, definitions
macro _label line&
	win64abi _x_#_label,line
end macro
			if used _x_#_label
				_x_#_label dq RVA _label.N
			end if
		end iterate

		namespace PE
		if ~ redundant.N
			dq 0
		end if
		iterate _label, definitions
			if used _x_#_label
				_label.N dw 0
				db `_label,0
				align 2
			end if
		end iterate
	end if
	end repeat
	end namespace
end macro
