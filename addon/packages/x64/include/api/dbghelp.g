
; TODO: integrate other defintions from dbghelp.h

; modified imports:
;	dh -> dbghelp_dh
;	dbghelp -> _dbghelp	TODO fix import macro

PE.__IMPORTS equ 'dbghelp',\
\; 1101,\
\; 1102,\
\; 1103,\
\; 1104,\
\; 1105,\
\; 1106,\
\; 1107,\
\; 1108,\
\; 1109,\
\; 1110,\
SymAllocDiaString,\
SymFreeDiaString,\
SymGetDiaSession,\
SymGetDiaSource,\
\; 1115,\
\; 1116,\
\; 1117,\
\; 1118,\
\; 1119,\
SymGetLineFromAddrEx,\
SymGetLineFromNameEx,\
SymGetLineNextEx,\
SymGetLinePrevEx,\
SymGetOmapBlockBase,\
SymRegisterGetSourcePathPartCallback,\
SymRegisterSourceFileUrlListCallback,\
SymSetDiaSession,\
SymSetServiceManager,\
_EFN_DumpImage,\
DbgHelpCreateUserDump,\
DbgHelpCreateUserDumpW,\
EnumDirTree,\
EnumDirTreeW,\
EnumerateLoadedModules,\
EnumerateLoadedModules64,\
EnumerateLoadedModulesEx,\
EnumerateLoadedModulesExW,\
EnumerateLoadedModulesW64,\
ExtensionApiVersion,\
FindDebugInfoFile,\
FindDebugInfoFileEx,\
FindDebugInfoFileExW,\
FindExecutableImage,\
FindExecutableImageEx,\
FindExecutableImageExW,\
FindFileInPath,\
FindFileInSearchPath,\
GetSymLoadError,\
GetTimestampForLoadedLibrary,\
ImageDirectoryEntryToData,\
ImageDirectoryEntryToDataEx,\
ImageNtHeader,\
ImageRvaToSection,\
ImageRvaToVa,\
ImagehlpApiVersion,\
ImagehlpApiVersionEx,\
MakeSureDirectoryPathExists,\
MiniDumpReadDumpStream,\; dbgcore.MiniDumpReadDumpStream
MiniDumpWriteDump,\; dbgcore.MiniDumpWriteDump
RangeMapAddPeImageSections,\
RangeMapCreate,\
RangeMapFree,\
RangeMapRead,\
RangeMapRemove,\
RangeMapWrite,\
RemoveInvalidModuleList,\
ReportSymbolLoadSummary,\
SearchTreeForFile,\
SearchTreeForFileW,\
SetCheckUserInterruptShared,\
SetSymLoadError,\
StackWalk,\
StackWalk2,\
StackWalk64,\
StackWalkEx,\
SymAddSourceStream,\
SymAddSourceStreamA,\
SymAddSourceStreamW,\
SymAddSymbol,\
SymAddSymbolW,\
SymAddrIncludeInlineTrace,\
SymCleanup,\
SymCompareInlineTrace,\
SymDeleteSymbol,\
SymDeleteSymbolW,\
SymEnumLines,\
SymEnumLinesW,\
SymEnumProcesses,\
SymEnumSourceFileTokens,\
SymEnumSourceFiles,\
SymEnumSourceFilesW,\
SymEnumSourceLines,\
SymEnumSourceLinesW,\
SymEnumSym,\
SymEnumSymbols,\
SymEnumSymbolsEx,\
SymEnumSymbolsExW,\
SymEnumSymbolsForAddr,\
SymEnumSymbolsForAddrW,\
SymEnumSymbolsW,\
SymEnumTypes,\
SymEnumTypesByName,\
SymEnumTypesByNameW,\
SymEnumTypesW,\
SymEnumerateModules,\
SymEnumerateModules64,\
SymEnumerateModulesW64,\
SymEnumerateSymbols,\
SymEnumerateSymbols64,\
SymEnumerateSymbolsW,\
SymEnumerateSymbolsW64,\
SymFindDebugInfoFile,\
SymFindDebugInfoFileW,\
SymFindExecutableImage,\
SymFindExecutableImageW,\
SymFindFileInPath,\
SymFindFileInPathW,\
SymFromAddr,\
SymFromAddrW,\
SymFromIndex,\
SymFromIndexW,\
SymFromInlineContext,\
SymFromInlineContextW,\
SymFromName,\
SymFromNameW,\
SymFromToken,\
SymFromTokenW,\
SymFunctionTableAccess,\
SymFunctionTableAccess64,\
SymFunctionTableAccess64AccessRoutines,\
SymGetExtendedOption,\
SymGetFileLineOffsets64,\
SymGetHomeDirectory,\
SymGetHomeDirectoryW,\
SymGetLineFromAddr,\
SymGetLineFromAddr64,\
SymGetLineFromAddrW64,\
SymGetLineFromInlineContext,\
SymGetLineFromInlineContextW,\
SymGetLineFromName,\
SymGetLineFromName64,\
SymGetLineFromNameW64,\
SymGetLineNext,\
SymGetLineNext64,\
SymGetLineNextW64,\
SymGetLinePrev,\
SymGetLinePrev64,\
SymGetLinePrevW64,\
SymGetModuleBase,\
SymGetModuleBase64,\
SymGetModuleInfo,\
SymGetModuleInfo64,\
SymGetModuleInfoW,\
SymGetModuleInfoW64,\
SymGetOmaps,\
SymGetOptions,\
SymGetScope,\
SymGetScopeW,\
SymGetSearchPath,\
SymGetSearchPathW,\
SymGetSourceFile,\
SymGetSourceFileChecksum,\
SymGetSourceFileChecksumW,\
SymGetSourceFileFromToken,\
SymGetSourceFileFromTokenByTokenName,\
SymGetSourceFileFromTokenByTokenNameW,\
SymGetSourceFileFromTokenW,\
SymGetSourceFileToken,\
SymGetSourceFileTokenByTokenName,\
SymGetSourceFileTokenByTokenNameW,\
SymGetSourceFileTokenW,\
SymGetSourceFileW,\
SymGetSourceVarFromToken,\
SymGetSourceVarFromTokenW,\
SymGetSymFromAddr,\
SymGetSymFromAddr64,\
SymGetSymFromName,\
SymGetSymFromName64,\
SymGetSymNext,\
SymGetSymNext64,\
SymGetSymPrev,\
SymGetSymPrev64,\
SymGetSymbolFile,\
SymGetSymbolFileW,\
SymGetTypeFromName,\
SymGetTypeFromNameW,\
SymGetTypeInfo,\
SymGetTypeInfoEx,\
SymGetUnwindInfo,\
SymInitialize,\
SymInitializeW,\
SymLoadModule,\
SymLoadModule64,\
SymLoadModuleEx,\
SymLoadModuleExW,\
SymMatchFileName,\
SymMatchFileNameW,\
SymMatchString,\
SymMatchStringA,\
SymMatchStringW,\
SymNext,\
SymNextW,\
SymPrev,\
SymPrevW,\
SymQueryInlineTrace,\
SymRefreshModuleList,\
SymRegisterCallback,\
SymRegisterCallback64,\
SymRegisterCallbackW64,\
SymRegisterFunctionEntryCallback,\
SymRegisterFunctionEntryCallback64,\
SymSearch,\
SymSearchW,\
SymSetContext,\
SymSetExtendedOption,\
SymSetHomeDirectory,\
SymSetHomeDirectoryW,\
SymSetOptions,\
SymSetParentWindow,\
SymSetScopeFromAddr,\
SymSetScopeFromIndex,\
SymSetScopeFromInlineContext,\
SymSetSearchPath,\
SymSetSearchPathW,\
SymSrvDeltaName,\
SymSrvDeltaNameW,\
SymSrvGetFileIndexInfo,\
SymSrvGetFileIndexInfoW,\
SymSrvGetFileIndexString,\
SymSrvGetFileIndexStringW,\
SymSrvGetFileIndexes,\
SymSrvGetFileIndexesW,\
SymSrvGetSupplement,\
SymSrvGetSupplementW,\
SymSrvIsStore,\
SymSrvIsStoreW,\
SymSrvStoreFile,\
SymSrvStoreFileW,\
SymSrvStoreSupplement,\
SymSrvStoreSupplementW,\
SymUnDName,\
SymUnDName64,\
SymUnloadModule,\
SymUnloadModule64,\
UnDecorateSymbolName,\
UnDecorateSymbolNameW,\
WinDbgExtensionDllInit,\
block,\
chksym,\
_dbghelp,\
dbghelp_dh,\
fptr,\
homedir,\
inlinedbg,\
itoldyouso,\
lmi,\
lminfo,\
omap,\
optdbgdump,\
optdbgdumpaddr,\
srcfiles,\
stack_force_ebp,\
stackdbg,\
sym,\
symsrv,\
vc7fpo



ERROR_IMAGE_NOT_STRIPPED	:= 0x8800 ; the image is not stripped. No dbg file available
ERROR_NO_DBG_POINTER		:= 0x8801 ; image is stripped but there is no pointer to a dbg file
ERROR_NO_PDB_POINTER		:= 0x8802 ; image does not point to a pdb file

UNDNAME_COMPLETE		:= 0x0000 ; Enable full undecoration
UNDNAME_NO_LEADING_UNDERSCORES	:= 0x0001 ; Remove leading underscores from MS extended keywords
UNDNAME_NO_MS_KEYWORDS		:= 0x0002 ; Disable expansion of MS extended keywords
UNDNAME_NO_FUNCTION_RETURNS	:= 0x0004 ; Disable expansion of return type for primary declaration
UNDNAME_NO_ALLOCATION_MODEL	:= 0x0008 ; Disable expansion of the declaration model
UNDNAME_NO_ALLOCATION_LANGUAGE	:= 0x0010 ; Disable expansion of the declaration language specifier
UNDNAME_NO_MS_THISTYPE		:= 0x0020 ; NYI Disable expansion of MS keywords on the 'this' type for primary declaration
UNDNAME_NO_CV_THISTYPE		:= 0x0040 ; NYI Disable expansion of CV modifiers on the 'this' type for primary declaration
UNDNAME_NO_THISTYPE		:= 0x0060 ; Disable all modifiers on the 'this' type
UNDNAME_NO_ACCESS_SPECIFIERS	:= 0x0080 ; Disable expansion of access specifiers for members
UNDNAME_NO_THROW_SIGNATURES	:= 0x0100 ; Disable expansion of 'throw-signatures' for functions and pointers to functions
UNDNAME_NO_MEMBER_TYPE		:= 0x0200 ; Disable expansion of 'static' or 'virtual'ness of members
UNDNAME_NO_RETURN_UDT_MODEL	:= 0x0400 ; Disable expansion of MS model for UDT returns
UNDNAME_32_BIT_DECODE		:= 0x0800 ; Undecorate 32-bit decorated names
UNDNAME_NAME_ONLY		:= 0x1000 ; Crack only the name for primary declaration; return just [scope::]name. Does expand template params
UNDNAME_NO_ARGUMENTS		:= 0x2000 ; Don't undecorate arguments to function
UNDNAME_NO_SPECIAL_SYMS		:= 0x4000 ; Don't undecorate special names (v-table, vcall, vector xxx, metatype, etc)

; these values are used for synthesized file types that can be passed in as image headers instead of the standard ones from ntimage.h
DBHHEADER_DEBUGDIRS	:= 0x1
DBHHEADER_CVMISC	:= 0x2
DBHHEADER_PDBGUID	:= 0x3


; ADDRESS_MODE
AddrMode1616:=0
AddrMode1632:=1
AddrModeReal:=2
AddrModeFlat:=3

;struct ADDRESS64
;	Offset	dq ?
;	Segment	dw ?,?
;	Mode	dd ? ; ADDRESS_MODE
;ends
