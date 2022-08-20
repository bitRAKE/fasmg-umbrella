
; TODO:
;	[note: what is found in the library is listed first]
;	151=CreateMRUListA				; ordinal
;	(IID_ITextServices)				; non-function exports
;	DllGetClassObject as DWMAPI_DllGetClassObject	; proxy
;	DwmGetWindowAttribute				; default
;
;	+ auto remap of particular names that are likely to conflict (seems kind of extreme)
;		DllCanUnloadNow, DllGetClassObject
if 0
	match ( LABELED ),_LABEL ; other, non-function export
		define OPTIONS LABELED
	else
		define OPTIONS _LABEL
		; flag as function
	end match

	match ORDINAL == PROXY, OPTIONS
		external equ ORDINAL
		internal equ PROXY
	else match NAMED =AS? PROXY, OPTIONS
		external equ NAMED
		internal equ PROXY
	else ; common case
		external equ OPTIONS
		internal equ OPTIONS
	end match
end if

;	+ merge imports with the same filename (rare, A/W proxies, seems convient though)
;		+ preprocess vector into another vector
;			+ filename proxy resolved
;			+ used function reduction
;			+ reference type resolved

section '.idata' import data readable ;writeable
namespace PE

irpv IMP, __IMPORTS
	match NAME=,REST, IMP
		repeat 1,N:NAME
		if ~ redundant.N
			dd RVA lookup.N
			dd 0,0
			dd RVA string.N
			dd RVA address.N
		end if
		referred.N = 1
		end repeat
	else
		err 'bad __IMPORTS'
	end match
end irpv
dd 0,0,0,0,0

; these strings can be anywhere?
irpv IMP, __IMPORTS
	match NAME=,REST, IMP
		repeat 1,N:NAME
		if ~ redundant.N
			string.N db NAME,0
			align 2
		end if
		end repeat
	end match
end irpv

align 8
irpv IMP, __IMPORTS
	match NAME=,REST, IMP
		repeat 1,N:NAME

		if defined referred.N
			lookup.N:
			iterate _LABEL, REST
; grok type: ordinal,proxy,other,default
				if used _x_#_LABEL
					dq RVA _LABEL.N
				end if
			end iterate
			if $ > lookup.N
				redundant.N = 0
				dq 0
			else
				redundant.N = 1
			end if

			address.N:
			end namespace ; PE

; needs to be defined outside of PE namespace (i.e. 'global')
			iterate _LABEL, REST
; grok type: ordinal,proxy,other,default
macro _LABEL line&
win64abi _x_#_LABEL,line
end macro
				if used _x_#_LABEL
					_x_#_LABEL dq RVA _LABEL.N
				end if
			end iterate

			namespace PE
			if ~ redundant.N
				dq 0
			end if
; these strings can be anywhere?
			iterate _LABEL, REST
; grok type: ordinal,proxy,other,default
				if used _x_#_LABEL
					_LABEL.N dw 0
					db `_LABEL,0
					align 2
				end if
			end iterate
		end if ; defined referred.N

		end repeat
	end match
end irpv

end namespace ; PE
