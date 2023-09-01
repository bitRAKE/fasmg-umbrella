
; Make data statements from file (don't use this).

if definite FILE
virtual at 0
        DAT::
        file FILE
        BYTES := $
end virtual

db '; ',FILE,13,10
repeat 1,D:BYTES
        db 'label dat:',`D,13,10
end repeat
db 'db \',13,10
data_dump BYTES,,db

calminstruction hex_nibble digit*, command: display
        compute digit, 0FFh and '0123456789ABCDEF' shr (digit*8)
        arrange command, command digit
        assemble command
end calminstruction

define _db
calminstruction data_dump bytes*, i:0, cmd:display
        local awk, digit
jj:     arrange         awk, =load =_db:1 =from =DAT:i
        assemble        awk
        arrange         awk, cmd '0x'
        assemble        awk
        compute         digit, (_db shr 4) and 0Fh
        call            hex_nibble, digit, cmd
        compute         digit, _db and 0Fh
        call            hex_nibble, digit, cmd
        compute         i, i + 1
        check           i = bytes
        jyes            done
        arrange         awk, cmd ','
        assemble        awk
        check           i and 0Fh
        jyes            jj
        arrange         awk, cmd '\',13,10
        assemble        awk
        jump            jj
done:   arrange         awk, cmd 13,10
        assemble        awk
end calminstruction

else
        display 'usage: fasmg -i "define FILE ''<filename>''" ',__FILE__,' <outfile>'
end if