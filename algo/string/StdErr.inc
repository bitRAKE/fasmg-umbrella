; Use the system locale to display an error message.
; EAX : error message number from GetLastError()
align 16, codepad #
StdErr_WriteErrorUTF8:
	virtual at rbp - .frame
				rq 4
		.P5		dq ?
		.P6		dq ?
		.P7		dq ?
		.P8		dq ?
	align.assume rbp, 16
	align 16
	.frame := $ - $$
				rq 2
		.msg		dq ?
		.utf8		dq ?
		.msg_chars	dd ?
		.utf8_bytes	dd ?
		.written	dd ?
	assert ($ - .msg) <= 32 ; do not exceed shadow space
	end virtual
	enter .frame, 0
	xchg r8d, eax
	xor edx, edx
	xor r9, r9
	FormatMessageW FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,\
		rdx, r8, r9, & .msg, rdx, rdx
	test eax, eax
	jz .no_chars
	mov [.msg_chars], eax

	WideCharToMultiByte CP_UTF8, 0, [.msg], DWORD [.msg_chars], 0, 0, 0, 0
	mov [.utf8_bytes], eax
	xchg edx, eax
	LocalAlloc LMEM_FIXED, rdx
	mov [.utf8], rax
	WideCharToMultiByte CP_UTF8, 0, [.msg], DWORD [.msg_chars],\
		[.utf8], DWORD [.utf8_bytes], 0, 0

	GetStdHandle STD_ERROR_HANDLE
	xchg rcx, rax
	WriteFile rcx, [.utf8], DWORD [.utf8_bytes], & .written, 0
	LocalFree [.utf8]
	LocalFree [.msg]
.no_chars:
	leave
	retn
