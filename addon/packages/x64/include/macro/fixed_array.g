; constant fixed size arrays for any data type
; array dimensions are:
;	.stride (sizeof .) X .items
struc FIXED_ARRAY line
	local max
	label .:.stride
	max = 0
	iterate item, line
		.% item ; zero implied padding
		if $ - .% > max
			max = $ - .%
		end if
		rb .stride - ($ - .%)
		if % = %%
			.items := %%
		end if
	end iterate
	.stride	:= max
end struc
