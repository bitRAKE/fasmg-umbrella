; strip whitespace from JSON file and re-format with tab

if definite FILE
virtual
DAT::
file FILE
DAT_END := $ - $$
end virtual

define _db
calminstruction json_prettier i:0,instring:0,depth:0
	local awk,char
more:
	arrange awk, =load =_db:1 =from =DAT:i
	assemble awk
	compute i, i + 1
	compute char, 0+_db

	check instring
	jyes string_contents

	check _db = '"'
	jyes string_inout
	check _db = ','
	jyes output_indent

	check _db = '{'
	jyes increase_depth
	check _db = '}'
	jyes decrease_depth

	check _db = '['
	jyes increase_depth
	check _db = ']'
	jyes decrease_depth

	; consume existing whitespace
	check _db = ' '
	jyes skip_ws
	check _db = 10
	jyes skip_ws
	check _db = 13
	jyes skip_ws
	check _db = 9
	jyes skip_ws

output_char:
	arrange awk, =db char
	assemble awk
skip_ws:
	check i < DAT_END
	jyes more
	exit

decrease_depth:
	compute depth, depth - 1
indent_output:
	arrange awk, =db 10,depth =dup 9,char
	assemble awk
	jump skip_ws

increase_depth:
	compute depth, depth + 1
output_indent:
	arrange awk, =db char,10,depth =dup 9
	assemble awk
	jump skip_ws

string_contents:
	check instring = 3
	jyes string_esc
	check _db = '"'
	jyes string_inout
	check _db = '\'
	jno output_char
string_esc:
	compute instring, instring xor 2
	jump output_char
string_inout:
	compute instring, instring xor 1
	jump output_char
end calminstruction
json_prettier

else
display 'usage: fasmg -i "define FILE ''<filename>''" ',__FILE__,' <outfile>'
end if
