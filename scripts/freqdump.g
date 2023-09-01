; output byte frequency of input file
;	fasmg freqdump.g -i "FileName equ 'freqdump.g'"
;
; performance:	bytes		seconds
;		1,126,964	1.2
;		20,968,922	45.4
;		510,018,886	534.9


match =FileName,FileName
	display 10,'usage: fasmg freqdump.g -i "FileName equ ''your_file''"',10
	err 'missing FileName expected'
else
	virtual at 0
		source::
		file FileName
	end virtual

	AreaFrequency source

	; we can verify total equals length
	total = 0
	postpone
		assert total = sizeof source
	end postpone

	; display array of values
	repeat 256, i:0
		repeat 1, N:source.i
			display `N,','
			total = total + N
dd N ; and store to output
		end repeat
	end repeat
end match

calminstruction AreaFrequency area*
	local offset, var, val, i
	compute offset, 0

	; set all byte frequency counts to zero
	compute i, 256
clear:
	compute i, i - 1
	arrange var, area.i
	publish var, offset
	check i
	jyes clear

	; increment frequency counts for each byte
	jump zero
more:
	load val, area:offset, 1
	compute val, 0+val ; convert string to number
	arrange var, area.val
	compute val, var + 1
	publish var, val
	compute offset, offset + 1
zero:
	check offset < sizeof area
	jyes more
end calminstruction

;	text AreaContent Some_Area
;	display text
calminstruction (target) AreaContent area*
	local string
	load string, area: 0, sizeof area
	publish target, string
end calminstruction
