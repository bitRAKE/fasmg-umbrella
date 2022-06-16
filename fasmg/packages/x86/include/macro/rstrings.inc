
; TODO: null string hack, LEA use, describe placeholders
; TODO: if the zero ID string is null and no other strings then ignore

define RSTRING 1

virtual at 0
	RSTRING.buffer::
end virtual

; need to allow empty string resources for various reasons:
;	0) windows hates zero value resource IDs
;	1) hack for null terminated strings
;	2) placeholder indices, etc ...
struc RSTRING values&
	local found,sid,O,r,ri,x,xi
	match ,values
		; just find array count (sid), and output new null string
		virtual RSTRING.buffer
			sid = 0
			O = 0
			while O < $
				load ri:2 from O
				O = O + ri + ri + 2
				sid = sid + 1
			end while
			dw 0
			. = sid
		end virtual
	else
		virtual at 0
			du values
			xi := $ ; non-zero
			load x:$ from 0
		end virtual
		found = 0
		virtual RSTRING.buffer
			sid = 0
			O = 0
			while O < $
				load ri:2 from O
				ri = ri shl 1
				if ri = xi
					load r:ri from O+2
					if r = x
						found = 1
						. = sid
						break
					end if
				end if
				O = O + ri + 2
				sid = sid + 1
			end while
			if ~ found
				. = sid
				dw xi shr 1
				emit xi:x
			end if
		end virtual
	end match
end struc

macro resource_RSTRINGS folder*,language:LANG_NEUTRAL
	local table,bytes,O0,O1,tid,sid,ri,rx
	virtual RSTRING.buffer
		bytes := $-$$
	end virtual
	if bytes
		RSTRING.where := $ ; error on multiple use
; first scatter table data into lists of 16 strings
		O0 = 0
		O1 = 0
		sid = 0
		while O1 < bytes
			load ri:2 from RSTRING.buffer:O1
			O1 = O1 + ri + ri + 2
; TODO: create labels to make address use possible (ie LEA)
			sid = sid + 1

			if sid and 0xF = 0 \
			| O1 = bytes
				load rx:O1-O0 from RSTRING.buffer:O0
				repeat 1,tid:(sid+15)shr 4
				table.tid dd RVA table.tid.base,O1-O0,0,0
				table.tid.base db rx
				end repeat
				O0 = O1
			end if
		end while

		; generate directory with entry for each table
		temp equ folder
		repeat (sid + 15) shr 4
			temp reequ temp,%,language,table.%
		end repeat
		match any,temp
		resource any
		end match
	else ; gracefully ignore, maybe wip
		display "warning: resource_RSTRINGS w/o RSTRINGS defined.",10
	end if
end macro

postpone
virtual RSTRING.buffer
if $ > 2 & ~ defined RSTRING.where
display 10, 'Warning: No location for defined resource string data has been specified.',10,'Use "resource_RSTRINGS {label}" macro in the intended location.'
end if
end virtual
end postpone
