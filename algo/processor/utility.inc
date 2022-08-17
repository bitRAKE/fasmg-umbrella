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
