PE.__IMPORTS equ "api-ms-win-downlevel-advapi32-l1-1-0",\
AccessCheck,\
AccessCheckAndAuditAlarmW,\
AccessCheckByType,\
AccessCheckByTypeAndAuditAlarmW,\
AccessCheckByTypeResultList,\
AccessCheckByTypeResultListAndAuditAlarmByHandleW,\
AccessCheckByTypeResultListAndAuditAlarmW,\
AddAccessAllowedAce,\
AddAccessAllowedAceEx,\
AddAccessAllowedObjectAce,\
AddAccessDeniedAce,\
AddAccessDeniedAceEx,\
AddAccessDeniedObjectAce,\
AddAce,\
AddAuditAccessAce,\
AddAuditAccessAceEx,\
AddAuditAccessObjectAce,\
AddMandatoryAce,\
AdjustTokenGroups,\
AdjustTokenPrivileges,\
AllocateAndInitializeSid,\
AllocateLocallyUniqueId,\
AreAllAccessesGranted,\
AreAnyAccessesGranted,\
CheckTokenMembership,\
ConvertToAutoInheritPrivateObjectSecurity,\
CopySid,\
CreatePrivateObjectSecurity,\
CreatePrivateObjectSecurityEx,\
CreatePrivateObjectSecurityWithMultipleInheritance,\
CreateProcessAsUserW,\
CreateRestrictedToken,\
CreateWellKnownSid,\
DeleteAce,\
DestroyPrivateObjectSecurity,\
DuplicateToken,\
DuplicateTokenEx,\
EqualDomainSid,\
EqualPrefixSid,\
EqualSid,\
EventActivityIdControl,\
EventEnabled,\
EventProviderEnabled,\
EventRegister,\
EventUnregister,\
EventWrite,\
EventWriteEx,\
EventWriteString,\
EventWriteTransfer,\
FindFirstFreeAce,\
FreeSid,\
GetAce,\
GetAclInformation,\
GetFileSecurityW,\
GetKernelObjectSecurity,\
GetLengthSid,\
GetPrivateObjectSecurity,\
GetSecurityDescriptorControl,\
GetSecurityDescriptorDacl,\
GetSecurityDescriptorGroup,\
GetSecurityDescriptorLength,\
GetSecurityDescriptorOwner,\
GetSecurityDescriptorRMControl,\
GetSecurityDescriptorSacl,\
GetSidIdentifierAuthority,\
GetSidLengthRequired,\
GetSidSubAuthority,\
GetSidSubAuthorityCount,\
GetTokenInformation,\
GetTraceEnableFlags,\
GetTraceEnableLevel,\
GetTraceLoggerHandle,\
GetWindowsAccountDomainSid,\
ImpersonateAnonymousToken,\
ImpersonateLoggedOnUser,\
ImpersonateNamedPipeClient,\
ImpersonateSelf,\
InitializeAcl,\
InitializeSecurityDescriptor,\
InitializeSid,\
IsTokenRestricted,\
IsValidAcl,\
IsValidSecurityDescriptor,\
IsValidSid,\
IsWellKnownSid,\
MakeAbsoluteSD,\
MakeSelfRelativeSD,\
MapGenericMask,\
ObjectCloseAuditAlarmW,\
ObjectDeleteAuditAlarmW,\
ObjectOpenAuditAlarmW,\
ObjectPrivilegeAuditAlarmW,\
OpenProcessToken,\
OpenThreadToken,\
PrivilegeCheck,\
PrivilegedServiceAuditAlarmW,\
QuerySecurityAccessMask,\
RegCloseKey,\
RegCopyTreeW,\
RegCreateKeyExA,\
RegCreateKeyExW,\
RegDeleteKeyExA,\
RegDeleteKeyExW,\
RegDeleteTreeA,\
RegDeleteTreeW,\
RegDeleteValueA,\
RegDeleteValueW,\
RegDisablePredefinedCacheEx,\
RegEnumKeyExA,\
RegEnumKeyExW,\
RegEnumValueA,\
RegEnumValueW,\
RegFlushKey,\
RegGetKeySecurity,\
RegGetValueA,\
RegGetValueW,\
RegLoadAppKeyA,\
RegLoadAppKeyW,\
RegLoadKeyA,\
RegLoadKeyW,\
RegLoadMUIStringA,\
RegLoadMUIStringW,\
RegNotifyChangeKeyValue,\
RegOpenCurrentUser,\
RegOpenKeyExA,\
RegOpenKeyExW,\
RegOpenUserClassesRoot,\
RegQueryInfoKeyA,\
RegQueryInfoKeyW,\
RegQueryValueExA,\
RegQueryValueExW,\
RegRestoreKeyA,\
RegRestoreKeyW,\
RegSaveKeyExA,\
RegSaveKeyExW,\
RegSetKeySecurity,\
RegSetValueExA,\
RegSetValueExW,\
RegUnLoadKeyA,\
RegUnLoadKeyW,\
RegisterTraceGuidsW,\
RevertToSelf,\
SetAclInformation,\
SetFileSecurityW,\
SetKernelObjectSecurity,\
SetPrivateObjectSecurity,\
SetPrivateObjectSecurityEx,\
SetSecurityAccessMask,\
SetSecurityDescriptorControl,\
SetSecurityDescriptorDacl,\
SetSecurityDescriptorGroup,\
SetSecurityDescriptorOwner,\
SetSecurityDescriptorRMControl,\
SetSecurityDescriptorSacl,\
SetThreadToken,\
SetTokenInformation,\
TraceEvent,\
TraceMessage,\
TraceMessageVa,\
UnregisterTraceGuids

PE.__IMPORTS equ "api-ms-win-downlevel-advapi32-l2-1-0",\
ChangeServiceConfig2A,\
ChangeServiceConfig2W,\
ChangeServiceConfigA,\
ChangeServiceConfigW,\
CloseServiceHandle,\
CloseTrace,\
ControlService,\
ControlServiceExA,\
ControlServiceExW,\
ControlTraceA,\
ControlTraceW,\
ConvertSecurityDescriptorToStringSecurityDescriptorW,\
ConvertSidToStringSidW,\
ConvertStringSecurityDescriptorToSecurityDescriptorW,\
ConvertStringSidToSidW,\
CreateServiceA,\
CreateServiceW,\
CredDeleteA,\
CredDeleteW,\
CredEnumerateA,\
CredEnumerateW,\
CredFindBestCredentialA,\
CredFindBestCredentialW,\
CredFree,\
CredGetSessionTypes,\
CredGetTargetInfoA,\
CredGetTargetInfoW,\
CredIsMarshaledCredentialW,\
CredIsProtectedA,\
CredIsProtectedW,\
CredMarshalCredentialA,\
CredMarshalCredentialW,\
CredProtectA,\
CredProtectW,\
CredReadA,\
CredReadDomainCredentialsA,\
CredReadDomainCredentialsW,\
CredReadW,\
CredUnmarshalCredentialA,\
CredUnmarshalCredentialW,\
CredUnprotectA,\
CredUnprotectW,\
CredWriteA,\
CredWriteDomainCredentialsA,\
CredWriteDomainCredentialsW,\
CredWriteW,\
DeleteService,\
EnableTraceEx2,\
EnumDependentServicesW,\
EnumServicesStatusExW,\
EnumerateTraceGuidsEx,\
EventAccessControl,\
EventAccessQuery,\
EventAccessRemove,\
NotifyServiceStatusChangeA,\
NotifyServiceStatusChangeW,\
OpenSCManagerA,\
OpenSCManagerW,\
OpenServiceA,\
OpenServiceW,\
OpenTraceW,\
ProcessTrace,\
QueryAllTracesA,\
QueryAllTracesW,\
QueryServiceConfig2A,\
QueryServiceConfig2W,\
QueryServiceConfigA,\
QueryServiceConfigW,\
QueryServiceObjectSecurity,\
QueryServiceStatus,\
QueryServiceStatusEx,\
RegisterServiceCtrlHandlerA,\
RegisterServiceCtrlHandlerExA,\
RegisterServiceCtrlHandlerExW,\
RegisterServiceCtrlHandlerW,\
RegisterTraceGuidsA,\
RemoveTraceCallback,\
SetServiceObjectSecurity,\
SetServiceStatus,\
SetTraceCallback,\
StartServiceA,\
StartServiceCtrlDispatcherA,\
StartServiceCtrlDispatcherW,\
StartServiceW,\
StartTraceA,\
StartTraceW,\
StopTraceW,\
TraceSetInformation

PE.__IMPORTS equ "api-ms-win-downlevel-normaliz-l1-1-0",\
IdnToAscii,\
IdnToUnicode

PE.__IMPORTS equ "api-ms-win-downlevel-ole32-l1-1-0",\
CLSIDFromProgID,\
CLSIDFromString,\
CoAddRefServerProcess,\
CoCancelCall,\
CoCopyProxy,\
CoCreateFreeThreadedMarshaler,\
CoCreateGuid,\
CoCreateInstance,\
CoCreateInstanceEx,\
CoDisableCallCancellation,\
CoDisconnectContext,\
CoDisconnectObject,\
CoEnableCallCancellation,\
CoFreeUnusedLibraries,\
CoFreeUnusedLibrariesEx,\
CoGetApartmentType,\
CoGetCallContext,\
CoGetCallerTID,\
CoGetCancelObject,\
CoGetClassObject,\
CoGetContextToken,\
CoGetCurrentLogicalThreadId,\
CoGetCurrentProcess,\
CoGetDefaultContext,\
CoGetInterfaceAndReleaseStream,\
CoGetMalloc,\
CoGetMarshalSizeMax,\
CoGetObjectContext,\
CoGetPSClsid,\
CoGetStandardMarshal,\
CoGetStdMarshalEx,\
CoGetTreatAsClass,\
CoImpersonateClient,\
CoInitializeEx,\
CoInitializeSecurity,\
CoInvalidateRemoteMachineBindings,\
CoIsHandlerConnected,\
CoLockObjectExternal,\
CoMarshalHresult,\
CoMarshalInterThreadInterfaceInStream,\
CoMarshalInterface,\
CoQueryAuthenticationServices,\
CoQueryClientBlanket,\
CoQueryProxyBlanket,\
CoRegisterClassObject,\
CoRegisterInitializeSpy,\
CoRegisterMessageFilter,\
CoRegisterPSClsid,\
CoRegisterSurrogate,\
CoReleaseMarshalData,\
CoReleaseServerProcess,\
CoResumeClassObjects,\
CoRevertToSelf,\
CoRevokeClassObject,\
CoRevokeInitializeSpy,\
CoSetCancelObject,\
CoSetProxyBlanket,\
CoSuspendClassObjects,\
CoSwitchCallContext,\
CoTaskMemAlloc,\
CoTaskMemFree,\
CoTaskMemRealloc,\
CoTestCancel,\
CoUninitialize,\
CoUnmarshalHresult,\
CoUnmarshalInterface,\
CoWaitForMultipleHandles,\
CreateErrorInfo,\
CreateStreamOnHGlobal,\
FreePropVariantArray,\
GetErrorInfo,\
GetHGlobalFromStream,\
IIDFromString,\
ProgIDFromCLSID,\
PropVariantClear,\
PropVariantCopy,\
SetErrorInfo,\
StringFromCLSID,\
StringFromGUID2,\
StringFromIID

PE.__IMPORTS equ "api-ms-win-downlevel-shell32-l1-1-0",\
CommandLineToArgvW,\
GetCurrentProcessExplicitAppUserModelID,\
SetCurrentProcessExplicitAppUserModelID

PE.__IMPORTS equ "api-ms-win-downlevel-shlwapi-l1-1-0",\
GetAcceptLanguagesW,\
HashData,\
IsCharSpaceA,\
IsCharSpaceW,\
IsInternetESCEnabled,\
ParseURLW,\
PathAddBackslashA,\
PathAddBackslashW,\
PathAddExtensionA,\
PathAddExtensionW,\
PathAppendA,\
PathAppendW,\
PathCanonicalizeA,\
PathCanonicalizeW,\
PathCombineA,\
PathCombineW,\
PathCommonPrefixA,\
PathCommonPrefixW,\
PathCreateFromUrlAlloc,\
PathCreateFromUrlW,\
PathFileExistsA,\
PathFileExistsW,\
PathFindExtensionA,\
PathFindExtensionW,\
PathFindFileNameA,\
PathFindFileNameW,\
PathFindNextComponentA,\
PathFindNextComponentW,\
PathGetArgsA,\
PathGetArgsW,\
PathGetCharTypeA,\
PathGetCharTypeW,\
PathGetDriveNumberA,\
PathGetDriveNumberW,\
PathIsFileSpecA,\
PathIsFileSpecW,\
PathIsLFNFileSpecA,\
PathIsLFNFileSpecW,\
PathIsPrefixA,\
PathIsPrefixW,\
PathIsRelativeA,\
PathIsRelativeW,\
PathIsRootA,\
PathIsRootW,\
PathIsSameRootA,\
PathIsSameRootW,\
PathIsUNCA,\
PathIsUNCServerA,\
PathIsUNCServerShareA,\
PathIsUNCServerShareW,\
PathIsUNCServerW,\
PathIsUNCW,\
PathIsURLW,\
PathMatchSpecA,\
PathMatchSpecExA,\
PathMatchSpecExW,\
PathMatchSpecW,\
PathParseIconLocationA,\
PathParseIconLocationW,\
PathQuoteSpacesA,\
PathQuoteSpacesW,\
PathRelativePathToA,\
PathRelativePathToW,\
PathRemoveBackslashA,\
PathRemoveBackslashW,\
PathRemoveBlanksA,\
PathRemoveBlanksW,\
PathRemoveExtensionA,\
PathRemoveExtensionW,\
PathRemoveFileSpecA,\
PathRemoveFileSpecW,\
PathRenameExtensionA,\
PathRenameExtensionW,\
PathSearchAndQualifyA,\
PathSearchAndQualifyW,\
PathSkipRootA,\
PathSkipRootW,\
PathStripPathA,\
PathStripPathW,\
PathStripToRootA,\
PathStripToRootW,\
PathUnExpandEnvStringsA,\
PathUnExpandEnvStringsW,\
PathUnquoteSpacesA,\
PathUnquoteSpacesW,\
QISearch,\
SHLoadIndirectString,\
SHRegCloseUSKey,\
SHRegDeleteUSValueA,\
SHRegDeleteUSValueW,\
SHRegEnumUSKeyA,\
SHRegEnumUSKeyW,\
SHRegGetBoolUSValueA,\
SHRegGetBoolUSValueW,\
SHRegGetUSValueA,\
SHRegGetUSValueW,\
SHRegOpenUSKeyA,\
SHRegOpenUSKeyW,\
SHRegQueryUSValueA,\
SHRegQueryUSValueW,\
SHRegSetUSValueA,\
SHRegSetUSValueW,\
StrCSpnA,\
StrCSpnIA,\
StrCSpnIW,\
StrCSpnW,\
StrCatBuffA,\
StrCatBuffW,\
StrCatChainW,\
StrChrA,\
StrChrIA,\
StrChrIW,\
StrChrNIW,\
StrChrNW,\
StrChrW,\
StrCmpCA,\
StrCmpCW,\
StrCmpICA,\
StrCmpICW,\
StrCmpIW,\
StrCmpLogicalW,\
StrCmpNA,\
StrCmpNCA,\
StrCmpNCW,\
StrCmpNIA,\
StrCmpNICA,\
StrCmpNICW,\
StrCmpNIW,\
StrCmpNW,\
StrCmpW,\
StrCpyNW,\
StrDupA,\
StrDupW,\
StrIsIntlEqualA,\
StrIsIntlEqualW,\
StrPBrkA,\
StrPBrkW,\
StrRChrA,\
StrRChrIA,\
StrRChrIW,\
StrRChrW,\
StrRStrIA,\
StrRStrIW,\
StrSpnA,\
StrSpnW,\
StrStrA,\
StrStrIA,\
StrStrIW,\
StrStrNIW,\
StrStrNW,\
StrStrW,\
StrToInt64ExA,\
StrToInt64ExW,\
StrToIntA,\
StrToIntExA,\
StrToIntExW,\
StrToIntW,\
StrTrimA,\
StrTrimW,\
UrlApplySchemeW,\
UrlCanonicalizeW,\
UrlCombineA,\
UrlCombineW,\
UrlCreateFromPathW,\
UrlEscapeW,\
UrlFixupW,\
UrlGetLocationW,\
UrlGetPartW,\
UrlIsW,\
UrlUnescapeA,\
UrlUnescapeW

PE.__IMPORTS equ "api-ms-win-downlevel-shlwapi-l2-1-0",\
IStream_Copy,\
IStream_Read,\
IStream_ReadStr,\
IStream_Reset,\
IStream_Size,\
IStream_Write,\
IStream_WriteStr,\
IUnknown_AtomicRelease,\
IUnknown_GetSite,\
IUnknown_QueryService,\
IUnknown_Set,\
IUnknown_SetSite,\
IsOS,\
SHAnsiToAnsi,\
SHAnsiToUnicode,\
SHCopyKeyA,\
SHCopyKeyW,\
SHCreateMemStream,\
SHCreateStreamOnFileA,\
SHCreateStreamOnFileEx,\
SHCreateStreamOnFileW,\
SHCreateThread,\
SHCreateThreadRef,\
SHCreateThreadWithHandle,\
SHDeleteEmptyKeyA,\
SHDeleteEmptyKeyW,\
SHDeleteKeyA,\
SHDeleteKeyW,\
SHDeleteValueA,\
SHDeleteValueW,\
SHEnumKeyExA,\
SHEnumKeyExW,\
SHEnumValueA,\
SHEnumValueW,\
SHGetThreadRef,\
SHGetValueA,\
SHGetValueW,\
SHOpenRegStream2A,\
SHOpenRegStream2W,\
SHOpenRegStreamA,\
SHOpenRegStreamW,\
SHQueryInfoKeyA,\
SHQueryInfoKeyW,\
SHQueryValueExA,\
SHQueryValueExW,\
SHRegDuplicateHKey,\
SHRegGetIntW,\
SHRegGetPathA,\
SHRegGetPathW,\
SHRegGetValueA,\
SHRegGetValueW,\
SHRegSetPathA,\
SHRegSetPathW,\
SHReleaseThreadRef,\
SHSetThreadRef,\
SHSetValueA,\
SHSetValueW,\
SHStrDupA,\
SHStrDupW,\
SHUnicodeToAnsi,\
SHUnicodeToUnicode

PE.__IMPORTS equ "api-ms-win-downlevel-user32-l1-1-0",\
CharLowerA,\
CharLowerBuffA,\
CharLowerBuffW,\
CharLowerW,\
CharNextA,\
CharNextExA,\
CharNextW,\
CharPrevA,\
CharPrevExA,\
CharPrevW,\
CharUpperA,\
CharUpperBuffA,\
CharUpperBuffW,\
CharUpperW,\
IsCharAlphaA,\
IsCharAlphaNumericA,\
IsCharAlphaNumericW,\
IsCharAlphaW,\
IsCharLowerA,\
IsCharLowerW,\
IsCharUpperA,\
IsCharUpperW,\
LoadStringA,\
LoadStringW

PE.__IMPORTS equ "api-ms-win-downlevel-version-l1-1-0",\
GetFileVersionInfoExW,\
GetFileVersionInfoSizeExW,\
VerFindFileA,\
VerFindFileW,\
VerQueryValueA,\
VerQueryValueW

