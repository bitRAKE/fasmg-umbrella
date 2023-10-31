format PE64 NX ASLR CONSOLE 6.0 at 0x1234_5678_0000
include 'umbrella.g'
include 'cpu\zen.inc'

include 'equates\winerror.g'
include 'algo\string\StdErr.inc'

main: entry $
	pop rax ; no return

	; enable privledge for current process ...
	call SetPrivilegeA, 0, <_A "SeIncreaseQuotaPrivilege">, 1
	test eax, eax ; BOOL
	jz .fail
	SetSystemFileCacheSize -1, -1, 0
	test eax, eax ; BOOL
	jz .error
	ExitProcess 0
	int3
.error:
	GetLastError
	call StdErr_WriteErrorUTF8
.fail:
	ExitProcess 1
	int3

;-------------------------------------------------------------------------------
; More general version of ...
; https://learn.microsoft.com/en-us/windows/win32/secauthz/enabling-and-disabling-privileges-in-c--

struct LUID
	LowPart		dd ?
	HighPart	dd ?
ends
struct LUID_AND_ATTRIBUTES
	Luid		LUID
	Attributes	dd ?
ends
struct TOKEN_PRIVILEGES
	PrivilegeCount	dd ?
	Privileges	LUID_AND_ATTRIBUTES
ends
SE_PRIVILEGE_ENABLED := 2


align 16, codepad #
SetPrivilegeA:
	virtual at rbp - .frame
					rq 4
		.P5			dq ?
		.P6			dq ?

		.tp			TOKEN_PRIVILEGES
					align.assume rbp, 16
					align 16
		.frame := $ - $$
					rq 2
		.hToken			dq ?	; HANDLE, zero to open process token
		.lpszPrivilege		dq ?	; privilege string

		.bCloseToken		db ?
		.bResult		db ?
	end virtual
	enter .frame, 0
	mov [.hToken], rcx
	mov [.lpszPrivilege], rdx
	imul eax, r8d, SE_PRIVILEGE_ENABLED ; bEnablePrivilege?
	mov [.tp.Privileges.Attributes], eax
	mov [.tp.PrivilegeCount], 1

	mov [.bResult], 0 ; FALSE
	test rcx, rcx
	setz [.bCloseToken]
	jnz .have_handle

	GetCurrentProcess
	xchg rcx, rax
	OpenProcessToken rcx, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, & .hToken
	test eax, eax
	jz .return
.have_handle:
	LookupPrivilegeValueA 0, [.lpszPrivilege], & .tp.Privileges.Luid
	test eax, eax
	jz .return_close

	AdjustTokenPrivileges [.hToken], 0, & .tp, sizeof TOKEN_PRIVILEGES, 0, 0
	test eax, eax
	jz .return_close
	; Note: don't succeed if results are partial
	GetLastError
	cmp eax, ERROR_NOT_ALL_ASSIGNED
	setnz [.bResult]
.return_close:
	cmp [.bResult], 0
	jnz .no_error
	GetLastError
	call StdErr_WriteErrorUTF8
.no_error:
	cmp [.bCloseToken], 0
	jz .return
	CloseHandle [.hToken]
.return:
	movzx eax, [.bResult]
	leave
	retn
