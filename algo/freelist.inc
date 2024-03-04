
; global dynamic freelist implementation (WIP)
;	- two instruction get/put for algorithms
;	- paranoid exception handling (only linear growth)
;	- multi-threading: unsupported, AddVectoredExceptionHandler is
;		process wide, but freelist has a single chain
;
; requirements:
;	g_sysinf SYSTEM_INFO ; populated global structure

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

; this is why freelists are used - these two macros
macro get reg0*, reg1:FreeList.REGISTER
	mov reg0, reg1
	mov reg1, [reg1]
end macro
macro put reg0*, reg1:FreeList.REGISTER
	mov [reg0], reg1
	mov reg1, reg0
end macro


; The default is to configure through global variables, and let the OS
; select a base address.
macro initialize total_bytes:[FreeList__total_bytes],\
		start_address:0
	local fail
	; setup exception handler as first in hierarchy
	AddVectoredExceptionHandler 1, & FreeList.Handler
	mov [FreeList__hVector], rax
	xchg rcx, rax
	jrcxz fail

	mov rdx, total_bytes
	mov [FreeList__end_address], rdx
	VirtualAlloc start_address, rdx, MEM_RESERVE, PAGE_NOACCESS
	xchg rcx, rax
	jrcxz fail

	; Note: Assume RSP ≡ 0(mod 16) and no shadow space use!
	; TODO: larger initial size if applicable
	mov [FreeList__base_address], rcx
	add [FreeList__end_address], rcx
	call FreeList.Handler.extend
	mov FreeList.REGISTER, [FreeList__base_address]
	xchg ecx, eax
fail:
	; only one time
	purge FreeList.initialize
	; check RCX zero for error
end macro


macro destroy
	RemoveVectoredExceptionHandler [FreeList__hVector]
	VirtualFree [FreeList__base_address], 0, MEM_RELEASE
	purge FreeList.destroy
end macro


; Chaining is only used by the Handler.
; Note: `base` is advanced to address after `bytes`
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
	; (or if an error happens below - misuse of freelist)
	assert EXCEPTION_CONTINUE_SEARCH = 0
	xor eax, eax
	retn

.violation:
	; guard of zero is not valid, happens in the following instances:
	;	+ pre-initialization
	;	+ all pages have been commited
	mov rcx, [FreeList__guard_address]
	; invalidate guard address, no guard page set, truncate future errors
	and [FreeList__guard_address], 0
	jrcxz .search

	; violation virtual address must match expected
	cmp [rax + EXCEPTION_RECORD64.ExceptionInformation + 8], rcx
	jnz .search

; system removes the `PAGE_GUARD` status, commit next granule, set next guard page
.extend:
	virtual at rbp - .frame
			rq 4
		.frame := $ - $$
	end virtual
	enter .frame, 0
	VirtualAlloc rcx, dword [g_sysinf.dwAllocationGranularity],\
		MEM_COMMIT, PAGE_READWRITE
	xchg rcx, rax
	jrcxz .commit_fail

	; create free blocks by link-chaining
	chain rcx, rdx, rax, [g_sysinf.dwAllocationGranularity]

	; no guard page possible for last allocation unit
	cmp rcx, [FreeList__end_address]
	jz .execute
	VirtualAlloc rcx, dword [g_sysinf.dwPageSize],\
		MEM_COMMIT, PAGE_READWRITE or PAGE_GUARD
	xchg rcx, rax
	jrcxz .guard_fail
	mov [FreeList__guard_address], rcx
.execute:
	assert (EXCEPTION_CONTINUE_EXECUTION and 0xFFFF_FFFF) = 0xFFFF_FFFF
	or eax, EXCEPTION_CONTINUE_EXECUTION
	leave
	retn

; should never happen (unknown state, error elsewhere)?
.commit_fail:
.guard_fail:
	leave
	jmp .search

end namespace ; FreeList
