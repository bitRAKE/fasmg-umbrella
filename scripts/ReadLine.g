
; customize this simple template for your task

bytes := $-$$ ; operate on existing area data
if bytes
	; note: this only works if defined before use
	calminstruction ReadLine value*, marker*
		local val, mark, begin
		compute mark, marker
	more:	check mark < bytes
		jno fail
		load val, mark, 1

		check val = 13
		jyes skip
		check val = 10
		jyes skip
		check val = 32
		jyes skip
		check val = 9
		jno content

	skip:	compute mark, mark + 1
		jump more

	content:
		compute begin, mark

	read:	compute mark, mark + 1
		check mark < bytes
		jno done
		load val, mark, 1

		check val = 13
		jyes done
		check val = 10
		jno read
	done:
		load val, begin, mark - begin
		publish :value, val
	fail:
		compute mark, mark + 1
		publish marker, mark
	end calminstruction

	cursor = 0
	while cursor < bytes
		ReadLine line, cursor

; your selection criteria for lines to keep:

		if (line and "#define") <> "#define"
			restore line
		end if

; remember line is string-like without character restrictions, and might work
; in such a construction:
;		eval "match any =define? any,",line
;			restore line
;		end match
	end while

	restartout
	irpv L, line
		db L,10
	end irpv
else
	display 10,'usage: fasmg ',__FILE__,' -i "file ''{your_file}''"',10
	display 10,'Error: missing file statement.'
end if
