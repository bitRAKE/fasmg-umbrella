; static heap buffer - different usage scenarios
;	+ simple allocator w/ reset
;	+ stream in/out

struc(NAMED) Buffer
local SIZE
namespace NAMED

head	dq ?	; start address
tail	dq ?	; to simplify bounds checking of addresses
busy	dq ?	; active stream bytes

macro Create _size*
	SIZE equ _size
	GetProcessHeap
	xchg rcx, rax
	mov r8, SIZE
	mov [NAMED.tail], r8
	HeapAlloc rcx, HEAP_GENERATE_EXCEPTIONS or HEAP_ZERO_MEMORY, r8
	mov [NAMED.head], rax
	add [NAMED.tail], rax
	and [NAMED.busy], 0
end macro


struc(RREG) Alloc bytes*
	mov RREG, [NAMED.busy]
	add [NAMED.busy], bytes ; immedate value or 64-bit register, not RREG
	add RREG, [NAMED.head]
	cmp [NAMED.busy], SIZE ; HACK : remove this if all allocations known good
; CF=1, allocation was okay
; CF=0, fatal error, use a larger buffer
end macro
macro Reset
	and [NAMED.busy], 0
end macro


macro StreamIn _size:SIZE
	ReadFile [.hIn], [NAMED.head], _size, ADDR NAMED.busy, 0
	mov rax, [NAMED.head]
	add rax, [NAMED.busy]
	mov [NAMED.tail], rax
end macro
macro StreamOut
	WriteFile [.hOut], [NAMED.head], [NAMED.busy], 0, 0
	and [NAMED.busy], 0
end macro


macro Destroy
	GetProcessHeap
	xchg rcx, rax
	HeapFree rcx, 0, [NAMED.head]
end macro

end namespace ; NAMED
end struc ; Buffer
