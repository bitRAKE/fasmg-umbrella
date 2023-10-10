
; getfiletype: Report the standard output handle type on standard error
; see: https://github.com/skeeto/scratch/blob/master/windows/getfiletype.c

format PE64 NX ASLR CONSOLE 6.2
include 'umbrella.g'
main:
	iterate symbol,\
		FILE_TYPE_UNKNOWN,\
		FILE_TYPE_DISK,\
		FILE_TYPE_CHAR,\
		FILE_TYPE_PIPE,\
		FILE_TYPE_REMOTE

		if % = 1 ; generate table, symbols are in hash value order
		repeat %%
			dq .%, .%.bytes
		end repeat
		end if

		.% db `symbol,13,10
		.%.bytes := $ - .%
	end iterate
entry $
	pop rax ; no return
	GetStdHandle STD_OUTPUT_HANDLE
	GetFileType rax

	; minimal perfect hash that maps FILE_TYPE_* onto 0..4
	imul ebx, eax, 0x20010000
	shr ebx, 29-4 ; 16 byte table items

	GetStdHandle STD_ERROR_HANDLE
	label .P5:8 at rsp + 32 ; bytes written
	WriteFile rax, [main + rbx], [main + rbx + 8], & .P5, 0
	test eax, eax	; BOOL
	setz al		; ~ boolean
	movzx ecx, al	; EXIT_SUCCESS | EXIT_FAILURE
	ExitProcess rcx
