
; basic COM support

macro UUID line&
	match A - B - C - D - E, line
		dd 0x#A
		dw 0x#B,0x#C
		dq 0x#D#E bswap 8
	else match { A =, B =, C =, D { E } },line
		dd A
		dw B,C
		db D E
	else ; assume brief
		ddq line
	end match
end macro

postpone
virtual at 0
irpv G,__GUID__temp ; generate GUIDs in common data area
	match name value,G
		if used name
			label name:16 at GUIDS+$
			UUID value
		end if
	end match
end irpv
load __GUID__:$ from 0
repeat 1,k:$
	display 10,9,`k,' bytes for GUID'
end repeat
end virtual
end postpone

collect __CONST
	align 64
	GUIDS db __GUID__
end collect



struc(id) interface? iid,funcs&
	match ,iid
	else ; let user decide what to do with it
		eval '__GUID__temp equ IID_',`id,' iid'
	end match

	match fun,funcs ; expand extensions
		iterate F,fun
			; interface vtbl offsets for manual use:
			;	call [rax + IUnknown__QueryInterface]
			label id#__#F:qword at %*8-8
		end iterate
		define EXTENDS__#id fun ; extension reference
	end match

	; typify pointer as COM interface
	struc (object) id
		macro object A&
			local ignore,func
			match ->B= C,A
				iterate P,[object],C
					repeat 1,I:%%-%+1
					indx I
					win64abi_parm I,P
					end repeat
				end iterate
				mov rax,[rcx]
				call [rax+id#__#B]
			else match ->B,A
				mov rcx,[object]
				mov rax,[rcx]
				call [rax+id#__#B]
			else
				err "COM: expecting an interface->function",13,10
			end match
			ignore:
		end macro
		object rq 1
	end struc
end struc


; combaseapi.inc.g

COINITBASE_MULTITHREADED	:= 0

REGCLS_SINGLEUSE	= 0
REGCLS_MULTIPLEUSE	= 1
REGCLS_MULTI_SEPARATE	= 2
REGCLS_SUSPENDED	= 4
REGCLS_SURROGATE	= 8
REGCLS_AGILE		= 0x10

SMEXF_SERVER     = 0x01
SMEXF_HANDLER    = 0x02

COM_RIGHTS_EXECUTE		:= 1
COM_RIGHTS_EXECUTE_LOCAL	:= 2
COM_RIGHTS_EXECUTE_REMOTE	:= 4
COM_RIGHTS_ACTIVATE_LOCAL	:= 8
COM_RIGHTS_ACTIVATE_REMOTE	:= 16
COM_RIGHTS_RESERVED1		:= 32
COM_RIGHTS_RESERVED2		:= 64

COWAIT_DEFAULT = 0
COWAIT_WAITALL = 1
COWAIT_ALERTABLE = 2
COWAIT_INPUTAVAILABLE = 4
COWAIT_DISPATCH_CALLS = 8
COWAIT_DISPATCH_WINDOW_MESSAGES = 0x10

CWMO_DEFAULT = 0
CWMO_DISPATCH_CALLS = 1
CWMO_DISPATCH_WINDOW_MESSAGES = 2


; objbase.inc.g

COINIT_MULTITHREADED		:= 0
COINIT_APARTMENTTHREADED	:= 2
COINIT_DISABLE_OLE1DDE		:= 4
COINIT_SPEED_OVER_MEMORY	:= 8

MARSHALINTERFACE_MIN:=500

ASYNC_MODE_DEFAULT      :=0x00000000
ASYNC_MODE_COMPATIBILITY:=0x00000001

STGTY_REPEAT            :=0x00000100
STG_TOEND               :=0xFFFFFFFF

STG_LAYOUT_SEQUENTIAL   :=0x00000000
STG_LAYOUT_INTERLEAVED  :=0x00000001

SD_LAUNCHPERMISSIONS	:= 0	; Machine wide launch permissions
SD_ACCESSPERMISSIONS	:= 1	; Machine wide acesss permissions
SD_LAUNCHRESTRICTIONS	:= 2	; Machine wide launch limits
SD_ACCESSRESTRICTIONS	:= 3	; Machine wide access limits

; common HRESULT values:
; https://docs.microsoft.com/en-us/windows/win32/seccrypto/common-hresult-values
S_OK		= 0x00000000	; Operation successful
E_NOTIMPL	= 0x80004001	; Not implemented
E_NOINTERFACE	= 0x80004002	; No such interface supported
E_POINTER	= 0x80004003	; Pointer that is not valid
E_ABORT		= 0x80004004	; Operation aborted
E_FAIL		= 0x80004005	; Unspecified failure
E_UNEXPECTED	= 0x8000FFFF	; Unexpected failure
E_ACCESSDENIED	= 0x80070005	; General access denied error
E_HANDLE	= 0x80070006	; Handle that is not valid
E_OUTOFMEMORY	= 0x8007000E	; Failed to allocate necessary memory
E_INVALIDARG	= 0x80070057	; One or more arguments are not valid


IUnknown	interface	00000000-0000-0000-C000-000000000046,\
	QueryInterface,AddRef,Release

IDispatch	interface	00020400-0000-0000-C000-000000000046,\
	EXTENDS__IUnknown,\
	GetTypeInfoCount,GetTypeInfo,GetIDsOfNames,Invoke
