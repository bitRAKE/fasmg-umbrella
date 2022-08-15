
; https://board.flatassembler.net/topic.php?p=221774#221774

define collections

macro collect? name*
	calminstruction name
		local	tmp
	    reverse:
		take	tmp, collections.name
		jyes	reverse
	    execute:
		take	collections.name, tmp
		jno	done
		assemble collections.name
		jump	execute
	    done:
	end calminstruction
	calminstruction ? line&
		match	/=collect?, line
		jyes	close
		take	collections.name, line
		exit
	    close:
		arrange line, =purge ?
		assemble line
	end calminstruction
end macro

macro end?.collect?!
	/collect
end macro
