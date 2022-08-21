
; Windows Runtime immutable string handle object

macro HSTRING_HRESULT_Check
	; define this to use a common error checking routine
end macro

struc(NAMED) HSTRING
NAMED dq ?
namespace NAMED

macro Init line&
	match ,line ; NULL string?
		and [NAMED],0
	else match buffer:length,line
		WindowsCreateString buffer, length, ADDR NAMED
		HSTRING_HRESULT_Check
	else
		lea rcx,<_W line>
		WindowsCreateString rcx, .bytes shr 1, ADDR NAMED
		HSTRING_HRESULT_Check
	end match
end macro

macro Empty
	WindowsIsStringEmpty [NAMED] ; BOOL
end macro

macro EmbeddedNull result
	WindowsStringHasEmbeddedNull [NAMED],ADDR result
	HSTRING_HRESULT_Check
end macro

macro Length ; in Unicode characters, embedded nulls, but not terminating null
	WindowsGetStringLen [NAMED] ; UINT32
end macro

macro Buffer length
	match ,length
		WindowsGetStringRawBuffer [NAMED],0 ; PCWSTR (readonly)
	else
		WindowsGetStringRawBuffer [NAMED],ADDR length ; PCWSTR (readonly)
	end match
end macro

macro Preallocate length*,buffer*
	; note: using NAMED for a HSTRING_BUFFER, not a HSTRING!
	WindowsPreallocateStringBuffer length,ADDR buffer,ADDR NAMED
	HSTRING_HRESULT_Check
end macro
macro Promote
	; note: using NAMED for a HSTRING_BUFFER and HSTRING!
	WindowsPromoteStringBuffer [NAMED],ADDR NAMED
	HSTRING_HRESULT_Check
end macro

macro Delete line&
	WindowsDeleteString [NAMED]
	and [NAMED],0
	HSTRING_HRESULT_Check
end macro


macro Copy new*
	WindowsDuplicateString [NAMED],ADDR new
	HSTRING_HRESULT_Check
end macro

macro Concat item*,new*
	WindowsConcatString [NAMED],[item],ADDR new
	HSTRING_HRESULT_Check
end macro

macro Compare item*,result*
	WindowsCompareStringOrdinal [NAMED],[item],ADDR result
	HSTRING_HRESULT_Check
end macro

macro Replace search*,replace*,new*
	WindowsReplaceString [NAMED],[search],[replace],ADDR new
	HSTRING_HRESULT_Check
end macro

macro Substring index*,new*
	WindowsSubstring [NAMED],index,ADDR new
	HSTRING_HRESULT_Check
end macro

macro Substring index*,length*,new*
	WindowsSubstringWithSpecifiedLength [NAMED],index,length,ADDR new
	HSTRING_HRESULT_Check
end macro

macro TrimEnd trim*,new*
	WindowsTrimStringEnd [NAMED],[trim],ADDR new
	HSTRING_HRESULT_Check
end macro

macro TrimStart trim*,new*
	WindowsTrimStringStart [NAMED],[trim],ADDR new
	HSTRING_HRESULT_Check
end macro

end namespace ; NAMED
end struc ; HSTRING
