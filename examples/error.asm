format PE64 NX ASLR CONSOLE 6.2 at 0x1234_5678_0000 ; 64-bit addresses throughout
include 'umbrella.g'

include 'algo\string\StdErr.inc'
main: entry $
	pop rax

	DeleteFileA <_A 'bitRAKE'> ; non-exeistent file
	GetLastError
	call StdErr_WriteErrorUTF8

	ExitProcess 0
	int3
