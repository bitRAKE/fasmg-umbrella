; static heap buffer

struc(NAMED) Buffer
local size
namespace NAMED

head	dq ?	; start address
tail	dq ?	; to simplify bounds checking of addresses
busy	dq ?	; active stream bytes

macro Create _size*
	size equ _size
	GetProcessHeap
	xchg rcx,rax
	mov r8,size
	mov [NAMED.tail],r8
	HeapAlloc rcx,HEAP_GENERATE_EXCEPTIONS or HEAP_ZERO_MEMORY,r8
	mov [NAMED.head],rax
	add [NAMED.tail],rax
	and [NAMED.busy],0
end macro


macro StreamIn
	ReadFile [.hIn],[NAMED.head],size,ADDR NAMED.busy,0
	mov rax,[NAMED.head]
	add rax,[NAMED.busy]
	mov [NAMED.tail],rax
end macro


macro StreamOut
	WriteFile [.hOut],[NAMED.head],[NAMED.busy],0,0
	and [NAMED.busy],0
end macro


macro Destroy
	GetProcessHeap
	xchg rcx,rax
	HeapFree rcx,0,[NAMED.head]
end macro

end namespace ; NAMED
end struc ; Buffer
