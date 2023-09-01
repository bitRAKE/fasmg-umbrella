match =FileName,FileName
	display 10,'usage: fasmg json.pack.g -i "FileName equ ''metaModel.json''"',10
	err 'missing FileName expected'
else
	virtual at 0
		source::
		file FileName
	end virtual
end match

calminstruction JSON_Pack area*
	local offset, outset, val
	compute outset, -1
	compute offset, -1
value:
	compute offset, offset + 1
	check offset = sizeof area
	jyes done
	load val, area:offset, 1
	check val = ' '
	jyes value
	check val = 9
	jyes value
	check val = 10
	jyes value
	check val = 13
	jyes value
	; store verbatim
	compute outset, outset + 1
	store area:outset, 1, val
	check val = '"'
	jno value
quoted: ; assume valid JSON - all quotes
	compute offset, offset + 1
	load val, area:offset, 1
	; store verbatim
	compute outset, outset + 1
	store area:outset, 1, val
	check val = '"'
	jno quoted
	; was it an escaped quote?
	load val, area:offset-1, 1
	check val = '\'
	jyes quoted
	jump value
done:
	; define new length to area, SIZEOF no good!
	compute outset, outset + 1
	arrange val, area.=packed =:== outset
	assemble val
end calminstruction

format binary as 'json'
JSON_Pack source
load package:source.packed from source:0
db package
