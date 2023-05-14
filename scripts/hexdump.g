; hex dump of file (based on work by macomics)
; https://board.flatassembler.net/topic.php?p=220038#220038

match =FileName,FileName
	display 10,'usage: fasmg hexdump.g -i "FileName equ ''your_file''"',10
	err 'missing FileName expected'
else
	virtual at 0
		hexdigit::
		db '0123456789ABCDEF'
	end virtual
	virtual at 0
		source::
		file FileName
		bytes = $
	end virtual
	db '00000000: '
	repeat bytes
		load a byte from source:(%-1)
		load b byte from hexdigit:a shr 4
		load a byte from hexdigit:a and 15
		db b,a,' '
		if (% and -16 > 0) & (% - 1) and 15 = 15
			repeat 16, a:% - 16
				load b byte from source:a
				if b < 32 | b = 127
					db ' ' ; replace control chars
				else
					db b
				end if
			end repeat
			db 13, 10
			a = %
			repeat 8
				b = a shr ( 32 - % * 4 )
				load b byte from hexdigit:b and 15
				db b
			end repeat
			db ': '
		end if
	end repeat
end match
