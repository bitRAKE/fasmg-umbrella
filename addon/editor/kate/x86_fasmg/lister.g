
; generate XML list from fasmg instruction definitions
;	fasmg -n -i "define BASE '%%~nG'" lister.g %%~nG.xml

;format binary as 'xml'
virtual
	TEMP::
	file BASE
	TEMP.bytes := $ - $$
end virtual

head = 0
db '<list name="instr_',BASE,'">',10
while head < TEMP.bytes
	; scan for line end
	char = 0
	tail = head
	while char <= ' ' & tail < TEMP.bytes
		load char:1 from TEMP:tail
		tail = tail + 1
	end while
	head = tail - 1
	while char > 10 & tail < TEMP.bytes
		load char:1 from TEMP:tail
		tail = tail + 1
	end while

	skip filter_line head,tail
	if ~ skip
		; generate item line:
		db 9,'<item>'
		while head < tail
			load char:1 from TEMP:head
			if char = '?' | char = ' ' | char < 14
				break
			else if char <> '#'
				db char
			end if
			head = head + 1
		end while
		db '</item>',10
	end if
	head = tail
end while
db '</list>',10


struc(result) filter_line head*,tail*
	local line,mask
	result = 1 ; filter/skip line

	; line MUST include at least a <line feed> character
	; (i.e. extra character beyond match range)
	load line:tail-head from TEMP:head

	; any line beginning with the following is filtered out
	iterate filter,\
		\; sort by length to fast pass short/empty lines
		'(',\
		'AVX.',\
		'MMX.',\
		'MPX.',\
		'SSE.',\
		'x86.',\
		'jumps',\
		'word?',\
		'dword?',\
		'qword?',\
		'use16?',\
		'use32?',\
		'use64?',\
		'element',\
		'nojumps',\
		'AVX_512.',\
		'calminstruction?'

		; calculate byte mask based on length of filter string
		mask = (1 shl (((bsr filter)+7) and -7)) - 1
		if line > mask
			if 0 + filter = line and mask
				break
			end if
			if % = %%
				result = 0
			end if
		else
			result = 0
			break
		end if
	end iterate
end struc
