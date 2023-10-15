
; global dynamic freelist implementation (WIP)
;	- two instruction get/put for algorithms
;	- multi-threading: each thread creates its own freelist
;	- paranoid exception handling (only linear growth)
;
; requirements:
;	g_sysinf SYSTEM_INFO ; populated global structure
;
; TODO: reuse handler code for initialization

virtual DATA.64
FreeList__block_bytes	dq 64		; 64, freelist item size
FreeList__total_bytes	dq 1 shl 30	; constant allocation limit
FreeList__base_address	dq ?		; determined by initial allocation
FreeList__guard_address	dq ?		; active commit region end
FreeList__end_address	dq ?		; base + total
FreeList__hVector	dq ?		;
			dq ?		;
			dq ?		;
end virtual

define FreeList FreeList
namespace FreeList

REGISTER equ r15 ; default global get/set register (or state explicitly)

; these two function are why freelist
macro get reg0*, reg1:FreeList.REGISTER
	mov reg0, reg1
	mov reg1, [reg1]
end macro
macro put reg0*, reg1:FreeList.REGISTER
	mov [reg0], reg1
	mov reg1, reg0
end macro

; NOTE: `base` is advanced to address after `bytes`
macro chain base*, reg0*, reg1*, bytes:[g_sysinf.dwAllocationGranularity]
	local more
	mov reg32.reg1, bytes ; dword
	add reg1, base
more:	mov reg0, base
	add base, [FreeList__block_bytes]
	mov [reg0], base
	cmp reg1, base
	jnz more
end macro


; TODO: test if just handling EXCEPTION_ACCESS_VIOLATION is the same?
; NOTE: Cannot be used during a system service.
;
; We attempt to insure correct usage with an exception handler tuned to only
; respond to very specific addresses during an access violation on a guard page.
align 16, codepad #
Handler:
	mov rax, [rcx + EXCEPTION_POINTERS.ExceptionRecord]
	cmp [rax + EXCEPTION_RECORD64.ExceptionCode], EXCEPTION_GUARD_PAGE
	jz .violation
.search:
	; forward the exception if it's not what we're looking for
	assert EXCEPTION_CONTINUE_SEARCH = 0
	xor eax, eax
	retn

.violation:
	; guard of zero is not valid, happens in the following instances:
	;	+ pre-initialization
	;	+ all pages have been commited
	mov rcx, [FreeList__guard_address]
	jrcxz .search

	; violation virtual address must match expected
	cmp [rax + EXCEPTION_RECORD64.ExceptionInformation + 8], rcx
	jnz .search

; system removes the `PAGE_GUARD` status, commit next granule, set next guard page
	; invalidate guard address, no guard page set
	and [FreeList__guard_address], 0

	virtual at rbp - .frame
			rq 4
		.frame := $ - $$
	end virtual
	enter .frame, 0
	VirtualAlloc rcx, dword [g_sysinf.dwAllocationGranularity],\
		MEM_COMMIT, PAGE_READWRITE
	xchg rcx, rax
	jrcxz .commit_fail

	; create free blocks
	chain rcx, rdx, rax, [g_sysinf.dwAllocationGranularity]

	; no guard page possible for large allocation unit
	cmp rcx, [FreeList__end_address]
	jz .execute
	VirtualAlloc rcx, dword [g_sysinf.dwPageSize],\
		MEM_COMMIT, PAGE_READWRITE or PAGE_GUARD
	xchg rcx, rax
	jrcxz .commit_fail
	mov [FreeList__guard_address], rcx
.execute:
	; moved guard page, okay to continue
	assert (EXCEPTION_CONTINUE_EXECUTION and 0xFFFF_FFFF) = 0xFFFF_FFFF
	or eax, EXCEPTION_CONTINUE_EXECUTION
	leave
	retn

.commit_fail: ; should never happen (unknown state, error elsewhere)?
	leave
	jmp .search


; The default is to configure through global variables, and let the OS
; select a base address.
macro initialize total_bytes:[FreeList__total_bytes],\
		start_bytes:dword [g_sysinf.dwAllocationGranularity],\
		start_address:0
	local fail0,fail
	; setup exception handler as first in hierarchy
	AddVectoredExceptionHandler 1, & FreeList.Handler
	mov [FreeList__hVector], rax
	xchg rcx, rax
	jrcxz fail0

; set region start/size here
	mov rdx, total_bytes
	mov [FreeList__end_address], rdx
	VirtualAlloc start_address, rdx, MEM_RESERVE, PAGE_NOACCESS
	xchg rcx, rax
fail0:
	jrcxz fail
	VirtualAlloc rcx, start_bytes, MEM_COMMIT, PAGE_READWRITE
	xchg rcx, rax
	jrcxz fail
	; update start/end addresses
	mov [FreeList__base_address], rcx
	add [FreeList__end_address], rcx

	; create free blocks
	FreeList.chain rcx, rdx, rax, [g_sysinf.dwAllocationGranularity]

	VirtualAlloc rcx, dword [g_sysinf.dwPageSize],\
		MEM_COMMIT, PAGE_READWRITE or PAGE_GUARD
	xchg rcx, rax
	mov [FreeList__guard_address], rcx
	mov FreeList.REGISTER, [FreeList__base_address]
fail:
end macro ; RCX zero on error

end namespace ; FreeList
