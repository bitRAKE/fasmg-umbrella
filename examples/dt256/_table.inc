
; table based branching, full size addresses

namespace METHOD

align 16
get_data:
	movzx eax,[rsi]
	jmp [Table+rax*8]

repeat 256
	Branch.%:
		push %-129
		pop rax
		call work
		jmp get_data
end repeat

end namespace ; METHOD

collect.64 ; cacheline aligned data
	METHOD.Table:
end collect

repeat 256
collect.64 ; cacheline aligned data
	dq METHOD.Branch.%
end collect
end repeat
