; get L2 cache size:
;	push 0x80000006
;	call Safe_CPUID
;	jc .error
;	shr ecx,16	; KB
;	jz .error	; also indicate unsupported command (all zeroes)
;	shl ecx,10	; bytes

if used Safe_CPUID
Safe_CPUID:
	label .command:4 at RSP+8

	mov eax,[.command]
	and eax,0x8000_0000
	cpuid
	cmp eax,[.command]
	jc .error
	mov eax,[.command]
	cpuid
.error:
	retn 8
end if ; Safe_CPUID



; all these use the Z-flag for return rather than BOOL type
;	call supports_AVX2
;	jnz not_supported

if	used supports_AVX		\
|	used supports_VAESNI		\
|	used supports_VPCLMULQDQ	\
|	used supports_F16C		\
|	used supports_FMA		\
|	used supports_AVX2		\


; Intel SDM Vol.1 14-16, Example 14-1.
supports_AVX:
	push 0x18000000 ; check OSXSAVE, AVX feature flags
  @@:
	; check multiple feature flags set
	mov eax, 1
	cpuid
	and ecx, [rsp]
	cmp ecx, [rsp]
	jne .not_supported

	; check OS has enabled both XMM and YMM state support
	xor ecx,ecx			; specify 0 for XCR0 register
	xgetbv				; result in EDX:EAX
	and eax, 111b
	cmp eax, 111b
  .not_supported:
	pop rcx
	retn

; Intel SDM Vol.1 14-17, Example 14-2.
supports_VAESNI:
	push 0x1A000000 ; check OSXSAVE, AVX, AESNI feature flags
	jmp @B

; Intel SDM Vol.1 14-17, Example 14-3.
supports_VPCLMULQDQ:
	push 0x18000002 ; check OSXSAVE, AVX, PCLMULQDQ feature flags
	jmp @B

; Intel SDM Vol.1 14-20, Example 14-4.
supports_F16C:
	push 0x38000000 ; check OSXSAVE, AVX, F16C feature flags
	jmp @B

; Intel SDM Vol.1 14-25, Example 14-5.
supports_FMA:
	push 0x18001000 ; check OSXSAVE, AVX, FMA feature flags
	jmp @B

; Intel SDM Vol.1 14-31, Example 14-7.
supports_AVX2:
	call supports_AVX
	jnz .not_supported

	; processor supports AVX instructions and XGETBV is enabled by OS
	mov eax, 7
	mov ecx, 0
	cpuid
	and ebx, 0x20
	cmp ebx, 0x20 ; check AVX2 feature flags
  .not_supported:
	retn

end if ; supports_*
