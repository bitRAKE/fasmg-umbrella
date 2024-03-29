PE.__IMPORTS equ "CRYPT32",\
CertAddCertificateContextToStore,\
CertAddCertificateLinkToStore,\
CertAddCRLContextToStore,\
CertAddCRLLinkToStore,\
CertAddCTLContextToStore,\
CertAddCTLLinkToStore,\
CertAddEncodedCertificateToStore,\
CertAddEncodedCRLToStore,\
CertAddEncodedCTLToStore,\
CertAddSerializedElementToStore,\
CertAddStoreToCollection,\
CertAlgIdToOID,\
CertCloseStore,\
CertCompareCertificate,\
CertCompareCertificateName,\
CertCompareIntegerBlob,\
CertControlStore,\
CertCreateCertificateChainEngine,\
CertCreateCertificateContext,\
CertCreateContext,\
CertCreateCRLContext,\
CertCreateCTLContext,\
CertCreateSelfSignCertificate,\
CertDeleteCertificateFromStore,\
CertDeleteCRLFromStore,\
CertDeleteCTLFromStore,\
CertDuplicateCertificateChain,\
CertDuplicateCertificateContext,\
CertDuplicateCRLContext,\
CertDuplicateCTLContext,\
CertDuplicateStore,\
CertEnumCertificateContextProperties,\
CertEnumCertificatesInStore,\
CertEnumCRLContextProperties,\
CertEnumCRLsInStore,\
CertEnumCTLContextProperties,\
CertEnumCTLsInStore,\
CertEnumPhysicalStore,\
CertEnumSystemStore,\
CertEnumSystemStoreLocation,\
CertFindAttribute,\
CertFindCertificateInCRL,\
CertFindCertificateInStore,\
CertFindChainInStore,\
CertFindCRLInStore,\
CertFindCTLInStore,\
CertFindExtension,\
CertFindRDNAttr,\
CertFindSubjectInCTL,\
CertFreeCertificateChain,\
CertFreeCertificateChainEngine,\
CertFreeCertificateChainList,\
CertFreeCertificateContext,\
CertFreeCRLContext,\
CertFreeCTLContext,\
CertGetCertificateChain,\
CertGetCertificateContextProperty,\
CertGetCRLContextProperty,\
CertGetCRLFromStore,\
CertGetCTLContextProperty,\
CertGetEnhancedKeyUsage,\
CertGetIntendedKeyUsage,\
CertGetIssuerCertificateFromStore,\
CertGetNameStringA,\
CertGetNameStringW,\
CertGetPublicKeyLength,\
CertGetStoreProperty,\
CertGetSubjectCertificateFromStore,\
CertGetValidUsages,\
CertIsValidCRLForCertificate,\
CertNameToStrA,\
CertNameToStrW,\
CertOIDToAlgId,\
CertOpenStore,\
CertOpenSystemStoreA,\
CertOpenSystemStoreW,\
CertRDNValueToStrA,\
CertRDNValueToStrW,\
CertRegisterSystemStore,\
CertRemoveStoreFromCollection,\
CertResyncCertificateChainEngine,\
CertSaveStore,\
CertSelectCertificateChains,\
CertSerializeCertificateStoreElement,\
CertSerializeCRLStoreElement,\
CertSerializeCTLStoreElement,\
CertSetCertificateContextProperty,\
CertSetCRLContextProperty,\
CertSetCTLContextProperty,\
CertSetStoreProperty,\
CertStrToNameA,\
CertStrToNameW,\
CertUnregisterSystemStore,\
CertVerifyCertificateChainPolicy,\
CertVerifySubjectCertificateContext,\
CertVerifyTimeValidity,\
CryptAcquireCertificatePrivateKey,\
CryptBinaryToStringW,\
CryptDecodeObject,\
CryptDecodeObjectEx,\
CryptDecryptMessage,\
CryptEncodeObject,\
CryptEncodeObjectEx,\
CryptEncryptMessage,\
CryptEnumOIDFunction,\
CryptEnumOIDInfo,\
CryptFindCertificateKeyProvInfo,\
CryptFindLocalizedName,\
CryptFindOIDInfo,\
CryptFormatObject,\
CryptFreeOIDFunctionAddress,\
CryptGetDefaultOIDDllList,\
CryptGetDefaultOIDFunctionAddress,\
CryptGetMessageCertificates,\
CryptGetOIDFunctionAddress,\
CryptGetOIDFunctionValue,\
CryptHashCertificate2,\
CryptHashPublicKeyInfo,\
CryptImportPublicKeyInfoEx2,\
CryptInitOIDFunctionSet,\
CryptInstallOIDFunctionAddress,\
CryptMsgCalculateEncodedLength,\
CryptMsgClose,\
CryptMsgControl,\
CryptMsgCountersign,\
CryptMsgCountersignEncoded,\
CryptMsgDuplicate,\
CryptMsgGetAndVerifySigner,\
CryptMsgGetParam,\
CryptMsgOpenToDecode,\
CryptMsgOpenToEncode,\
CryptMsgUpdate,\
CryptMsgVerifyCountersignatureEncoded,\
CryptMsgVerifyCountersignatureEncodedEx,\
CryptProtectData,\
CryptProtectMemory,\
CryptQueryObject,\
CryptRetrieveTimeStamp,\
CryptSignMessage,\
CryptStringToBinaryA,\
CryptUnprotectData,\
CryptUnprotectMemory,\
CryptVerifyDetachedMessageSignature,\
CryptVerifyTimeStampSignature,\
PFXExportCertStore,\
PFXExportCertStoreEx,\
PFXImportCertStore,\
PFXIsPFXBlob,\
PFXVerifyPassword

PE.__IMPORTS equ "CoreMessaging",\
CreateDispatcherQueueController

PE.__IMPORTS equ "D3DCOMPILER_47",\
D3DCompile,\
D3DCompile2,\
D3DCompileFromFile,\
D3DCompressShaders,\
D3DCreateBlob,\
D3DCreateFunctionLinkingGraph,\
D3DCreateLinker,\
D3DDecompressShaders,\
D3DDisassemble,\
D3DDisassemble11Trace,\
D3DDisassembleRegion,\
D3DGetBlobPart,\
D3DGetDebugInfo,\
D3DGetInputAndOutputSignatureBlob,\
D3DGetInputSignatureBlob,\
D3DGetOutputSignatureBlob,\
D3DGetTraceInstructionOffsets,\
D3DLoadModule,\
D3DPreprocess,\
D3DReadFileToBlob,\
D3DReflect,\
D3DReflectLibrary,\
D3DSetBlobPart,\
D3DStripShader,\
D3DWriteBlobToFile

PE.__IMPORTS equ "DNSAPI",\
DnsFree,\
DnsQuery_W,\
DnsRecordListFree

PE.__IMPORTS equ "DWrite",\
DWriteCreateFactory

PE.__IMPORTS equ "DiagnosticDataQuery",\
DdqCancelDiagnosticRecordOperation,\
DdqCloseSession,\
DdqCreateSession,\
DdqFreeDiagnosticRecordLocaleTags,\
DdqFreeDiagnosticRecordPage,\
DdqFreeDiagnosticRecordProducerCategories,\
DdqFreeDiagnosticRecordProducers,\
DdqFreeDiagnosticReport,\
DdqGetDiagnosticDataAccessLevelAllowed,\
DdqGetDiagnosticRecordAtIndex,\
DdqGetDiagnosticRecordBinaryDistribution,\
DdqGetDiagnosticRecordCategoryAtIndex,\
DdqGetDiagnosticRecordCategoryCount,\
DdqGetDiagnosticRecordCount,\
DdqGetDiagnosticRecordLocaleTagAtIndex,\
DdqGetDiagnosticRecordLocaleTagCount,\
DdqGetDiagnosticRecordLocaleTags,\
DdqGetDiagnosticRecordPage,\
DdqGetDiagnosticRecordPayload,\
DdqGetDiagnosticRecordProducerAtIndex,\
DdqGetDiagnosticRecordProducerCategories,\
DdqGetDiagnosticRecordProducerCount,\
DdqGetDiagnosticRecordProducers,\
DdqGetDiagnosticRecordStats,\
DdqGetDiagnosticRecordSummary,\
DdqGetDiagnosticRecordTagDistribution,\
DdqGetDiagnosticReport,\
DdqGetDiagnosticReportAtIndex,\
DdqGetDiagnosticReportCount,\
DdqGetDiagnosticReportStoreReportCount,\
DdqGetSessionAccessLevel,\
DdqGetTranscriptConfiguration,\
DdqIsDiagnosticRecordSampledIn,\
DdqSetTranscriptConfiguration

PE.__IMPORTS equ "ESENT",\
JetAddColumnW,\
JetAttachDatabase2W,\
JetBackupInstanceW,\
JetBeginSessionW,\
JetBeginTransaction3,\
JetCloseDatabase,\
JetCloseTable,\
JetCommitTransaction,\
JetCommitTransaction2,\
JetCreateDatabase2W,\
JetCreateIndex4W,\
JetCreateInstance2W,\
JetCreateTableColumnIndex4W,\
JetDefragment2W,\
JetDelete,\
JetDeleteColumn2W,\
JetDeleteIndexW,\
JetDeleteTableW,\
JetDetachDatabase2W,\
JetEndSession,\
JetEnumerateColumns,\
JetEscrowUpdate,\
JetGetBookmark,\
JetGetColumnInfoW,\
JetGetCurrentIndexW,\
JetGetDatabaseFileInfoW,\
JetGetDatabaseInfoW,\
JetGetErrorInfoW,\
JetGetIndexInfoW,\
JetGetObjectInfoW,\
JetGetRecordPosition,\
JetGetSecondaryIndexBookmark,\
JetGetSessionParameter,\
JetGetSystemParameterW,\
JetGetTableColumnInfoW,\
JetGetTableIndexInfoW,\
JetGetTableInfoW,\
JetGetThreadStats,\
JetGotoBookmark,\
JetGotoPosition,\
JetGotoSecondaryIndexBookmark,\
JetIndexRecordCount,\
JetInit3W,\
JetIntersectIndexes,\
JetMakeKey,\
JetMove,\
JetOpenDatabaseW,\
JetOpenTableW,\
JetOpenTemporaryTable2,\
JetOpenTempTable3,\
JetPrepareUpdate,\
JetPrereadIndexRanges,\
JetPrereadKeys,\
JetRegisterCallback,\
JetRenameColumnW,\
JetRenameTableW,\
JetResetSessionContext,\
JetResetTableSequential,\
JetResizeDatabase,\
JetRestoreInstanceW,\
JetRetrieveColumn,\
JetRetrieveColumns,\
JetRetrieveKey,\
JetRollback,\
JetSeek,\
JetSetColumn,\
JetSetColumns,\
JetSetCurrentIndex4W,\
JetSetCursorFilter,\
JetSetIndexRange,\
JetSetSessionContext,\
JetSetSessionParameter,\
JetSetSystemParameterW,\
JetSetTableSequential,\
JetStopBackupInstance,\
JetStopServiceInstance2,\
JetTerm2,\
JetUnregisterCallback,\
JetUpdate2

PE.__IMPORTS equ "HID",\
HidP_GetScaledUsageValue,\
HidP_GetSpecificValueCaps,\
HidP_GetUsages,\
HidP_GetUsageValue,\
HidP_GetUsageValueArray,\
HidP_MaxUsageListLength

PE.__IMPORTS equ "IPHLPAPI",\
CancelMibChangeNotify2,\
FreeMibTable,\
GetAdaptersAddresses,\
GetAdaptersInfo,\
GetBestInterfaceEx,\
GetBestRoute,\
GetBestRoute2,\
GetExtendedTcpTable,\
GetExtendedUdpTable,\
GetIcmpStatistics,\
GetIcmpStatisticsEx,\
GetIfEntry2,\
GetIfTable2,\
GetIpAddrTable,\
GetIpStatisticsEx,\
GetNetworkParams,\
GetPerAdapterInfo,\
GetTcpStatisticsEx,\
GetTcpTable,\
GetUdpStatisticsEx,\
GetUdpTable,\
GetUnicastIpAddressTable,\
Icmp6CreateFile,\
Icmp6SendEcho2,\
IcmpCloseHandle,\
IcmpCreateFile,\
IcmpSendEcho2,\
if_nametoindex,\
NotifyStableUnicastIpAddressTable,\
NotifyUnicastIpAddressChange,\
SendARP

PE.__IMPORTS equ "MF",\
MFCreateAggregateSource,\
MFCreateASFContentInfo,\
MFCreateASFIndexer,\
MFCreateASFIndexerByteStream,\
MFCreateASFSplitter,\
MFCreateAudioRendererActivate,\
MFCreateEncryptedMediaExtensionsStoreActivate,\
MFCreatePMPMediaSession,\
MFCreatePresentationClock,\
MFCreateProtectedEnvironmentAccess,\
MFCreateTopology,\
MFCreateTopologyNode,\
MFGetLocalId,\
MFGetService,\
MFGetSystemId,\
MFLoadSignedLibrary

PE.__IMPORTS equ "MFPlat",\
MFAllocateSerialWorkQueue,\
MFCancelWorkItem,\
MFCombineSamples,\
MFCopyImage,\
MFCreate2DMediaBuffer,\
MFCreateAlignedMemoryBuffer,\
MFCreateAsyncResult,\
MFCreateAttributes,\
MFCreateCollection,\
MFCreateContentDecryptorContext,\
MFCreateContentProtectionDevice,\
MFCreateD3D12SynchronizationObject,\
MFCreateDXGIDeviceManager,\
MFCreateDXGISurfaceBuffer,\
MFCreateEventQueue,\
MFCreateMediaBufferFromMediaType,\
MFCreateMediaBufferWrapper,\
MFCreateMediaEvent,\
MFCreateMediaExtensionActivate,\
MFCreateMediaType,\
MFCreateMediaTypeFromProperties,\
MFCreateMemoryBuffer,\
MFCreateMFByteStreamOnStreamEx,\
MFCreatePresentationDescriptor,\
MFCreatePropertiesFromMediaType,\
MFCreateSample,\
MFCreateSourceResolver,\
MFCreateStreamDescriptor,\
MFCreateStreamOnMFByteStreamEx,\
MFCreateSystemTimeSource,\
MFCreateTrackedSample,\
MFCreateVideoSampleAllocatorEx,\
MFCreateWaveFormatExFromMFMediaType,\
MFDeserializeAttributesFromStream,\
MFGetAttributesAsBlob,\
MFGetAttributesAsBlobSize,\
MFGetSystemTime,\
MFInitAttributesFromBlob,\
MFInitMediaTypeFromWaveFormatEx,\
MFInvokeCallback,\
MFIsContentProtectionDeviceSupported,\
MFllMulDiv,\
MFLockDXGIDeviceManager,\
MFLockPlatform,\
MFLockSharedWorkQueue,\
MFLockWorkQueue,\
MFPutWaitingWorkItem,\
MFPutWorkItem2,\
MFPutWorkItemEx2,\
MFScheduleWorkItemEx,\
MFSerializeAttributesToStream,\
MFShutdown,\
MFSplitSample,\
MFStartup,\
MFTEnumEx,\
MFUnlockDXGIDeviceManager,\
MFUnlockPlatform,\
MFUnlockWorkQueue,\
MFUnwrapMediaType,\
MFWrapMediaType

PE.__IMPORTS equ "MFReadWrite",\
MFCreateSinkWriterFromMediaSink,\
MFCreateSinkWriterFromURL,\
MFCreateSourceReaderFromByteStream,\
MFCreateSourceReaderFromMediaSource,\
MFCreateSourceReaderFromURL

PE.__IMPORTS equ "MFSENSORGROUP",\
MFCreateCameraControlMonitor,\
MFCreateCameraOcclusionStateMonitor,\
MFCreateSensorGroup,\
MFCreateSensorStream,\
MFCreateVirtualCamera,\
MFIsVirtualCameraTypeSupported

PE.__IMPORTS equ "MPR",\
WNetAddConnection2A,\
WNetCancelConnection2A,\
WNetUseConnectionA

PE.__IMPORTS equ "MSAJApi",\
alljoyn_aboutdata_create,\
alljoyn_aboutdata_create_empty,\
alljoyn_aboutdata_create_full,\
alljoyn_aboutdata_createfrommsgarg,\
alljoyn_aboutdata_createfromxml,\
alljoyn_aboutdata_destroy,\
alljoyn_aboutdata_getaboutdata,\
alljoyn_aboutdata_getajsoftwareversion,\
alljoyn_aboutdata_getannouncedaboutdata,\
alljoyn_aboutdata_getappid,\
alljoyn_aboutdata_getappname,\
alljoyn_aboutdata_getdateofmanufacture,\
alljoyn_aboutdata_getdefaultlanguage,\
alljoyn_aboutdata_getdescription,\
alljoyn_aboutdata_getdeviceid,\
alljoyn_aboutdata_getdevicename,\
alljoyn_aboutdata_getfield,\
alljoyn_aboutdata_getfields,\
alljoyn_aboutdata_getfieldsignature,\
alljoyn_aboutdata_gethardwareversion,\
alljoyn_aboutdata_getmanufacturer,\
alljoyn_aboutdata_getmodelnumber,\
alljoyn_aboutdata_getsoftwareversion,\
alljoyn_aboutdata_getsupportedlanguages,\
alljoyn_aboutdata_getsupporturl,\
alljoyn_aboutdata_isfieldannounced,\
alljoyn_aboutdata_isfieldlocalized,\
alljoyn_aboutdata_isfieldrequired,\
alljoyn_aboutdata_isvalid,\
alljoyn_aboutdata_setappid,\
alljoyn_aboutdata_setappid_fromstring,\
alljoyn_aboutdata_setappname,\
alljoyn_aboutdata_setdateofmanufacture,\
alljoyn_aboutdata_setdefaultlanguage,\
alljoyn_aboutdata_setdescription,\
alljoyn_aboutdata_setdeviceid,\
alljoyn_aboutdata_setdevicename,\
alljoyn_aboutdata_setfield,\
alljoyn_aboutdata_sethardwareversion,\
alljoyn_aboutdata_setmanufacturer,\
alljoyn_aboutdata_setmodelnumber,\
alljoyn_aboutdata_setsoftwareversion,\
alljoyn_aboutdata_setsupportedlanguage,\
alljoyn_aboutdata_setsupporturl,\
alljoyn_aboutdatalistener_create,\
alljoyn_aboutdatalistener_destroy,\
alljoyn_abouticon_clear,\
alljoyn_abouticon_create,\
alljoyn_abouticon_destroy,\
alljoyn_abouticon_getcontent,\
alljoyn_abouticon_geturl,\
alljoyn_abouticon_setcontent,\
alljoyn_abouticon_setcontent_frommsgarg,\
alljoyn_abouticon_seturl,\
alljoyn_abouticonobj_create,\
alljoyn_abouticonobj_destroy,\
alljoyn_abouticonproxy_create,\
alljoyn_abouticonproxy_destroy,\
alljoyn_abouticonproxy_geticon,\
alljoyn_abouticonproxy_getversion,\
alljoyn_aboutlistener_create,\
alljoyn_aboutlistener_destroy,\
alljoyn_aboutobj_announce,\
alljoyn_aboutobj_announce_using_datalistener,\
alljoyn_aboutobj_create,\
alljoyn_aboutobj_destroy,\
alljoyn_aboutobj_unannounce,\
alljoyn_aboutobjectdescription_clear,\
alljoyn_aboutobjectdescription_create,\
alljoyn_aboutobjectdescription_create_full,\
alljoyn_aboutobjectdescription_createfrommsgarg,\
alljoyn_aboutobjectdescription_destroy,\
alljoyn_aboutobjectdescription_getinterfacepaths,\
alljoyn_aboutobjectdescription_getinterfaces,\
alljoyn_aboutobjectdescription_getmsgarg,\
alljoyn_aboutobjectdescription_getpaths,\
alljoyn_aboutobjectdescription_hasinterface,\
alljoyn_aboutobjectdescription_hasinterfaceatpath,\
alljoyn_aboutobjectdescription_haspath,\
alljoyn_aboutproxy_create,\
alljoyn_aboutproxy_destroy,\
alljoyn_aboutproxy_getaboutdata,\
alljoyn_aboutproxy_getobjectdescription,\
alljoyn_aboutproxy_getversion,\
alljoyn_applicationstatelistener_create,\
alljoyn_applicationstatelistener_destroy,\
alljoyn_authlistener_create,\
alljoyn_authlistener_destroy,\
alljoyn_authlistener_requestcredentialsresponse,\
alljoyn_authlistener_setsharedsecret,\
alljoyn_authlistener_verifycredentialsresponse,\
alljoyn_authlistenerasync_create,\
alljoyn_authlistenerasync_destroy,\
alljoyn_autopinger_adddestination,\
alljoyn_autopinger_addpinggroup,\
alljoyn_autopinger_create,\
alljoyn_autopinger_destroy,\
alljoyn_autopinger_pause,\
alljoyn_autopinger_removedestination,\
alljoyn_autopinger_removepinggroup,\
alljoyn_autopinger_resume,\
alljoyn_autopinger_setpinginterval,\
alljoyn_busattachment_addlogonentry,\
alljoyn_busattachment_addmatch,\
alljoyn_busattachment_advertisename,\
alljoyn_busattachment_bindsessionport,\
alljoyn_busattachment_canceladvertisename,\
alljoyn_busattachment_cancelfindadvertisedname,\
alljoyn_busattachment_cancelfindadvertisednamebytransport,\
alljoyn_busattachment_cancelwhoimplements_interface,\
alljoyn_busattachment_cancelwhoimplements_interfaces,\
alljoyn_busattachment_clearkeys,\
alljoyn_busattachment_clearkeystore,\
alljoyn_busattachment_connect,\
alljoyn_busattachment_create,\
alljoyn_busattachment_create_concurrency,\
alljoyn_busattachment_createinterface,\
alljoyn_busattachment_createinterface_secure,\
alljoyn_busattachment_createinterfacesfromxml,\
alljoyn_busattachment_deletedefaultkeystore,\
alljoyn_busattachment_deleteinterface,\
alljoyn_busattachment_destroy,\
alljoyn_busattachment_disconnect,\
alljoyn_busattachment_enableconcurrentcallbacks,\
alljoyn_busattachment_enablepeersecurity,\
alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener,\
alljoyn_busattachment_findadvertisedname,\
alljoyn_busattachment_findadvertisednamebytransport,\
alljoyn_busattachment_getalljoyndebugobj,\
alljoyn_busattachment_getalljoynproxyobj,\
alljoyn_busattachment_getconcurrency,\
alljoyn_busattachment_getconnectspec,\
alljoyn_busattachment_getdbusproxyobj,\
alljoyn_busattachment_getglobalguidstring,\
alljoyn_busattachment_getinterface,\
alljoyn_busattachment_getinterfaces,\
alljoyn_busattachment_getkeyexpiration,\
alljoyn_busattachment_getpeerguid,\
alljoyn_busattachment_getpermissionconfigurator,\
alljoyn_busattachment_gettimestamp,\
alljoyn_busattachment_getuniquename,\
alljoyn_busattachment_isconnected,\
alljoyn_busattachment_ispeersecurityenabled,\
alljoyn_busattachment_isstarted,\
alljoyn_busattachment_isstopping,\
alljoyn_busattachment_join,\
alljoyn_busattachment_joinsession,\
alljoyn_busattachment_joinsessionasync,\
alljoyn_busattachment_leavesession,\
alljoyn_busattachment_namehasowner,\
alljoyn_busattachment_ping,\
alljoyn_busattachment_registeraboutlistener,\
alljoyn_busattachment_registerapplicationstatelistener,\
alljoyn_busattachment_registerbuslistener,\
alljoyn_busattachment_registerbusobject,\
alljoyn_busattachment_registerbusobject_secure,\
alljoyn_busattachment_registerkeystorelistener,\
alljoyn_busattachment_registersignalhandler,\
alljoyn_busattachment_registersignalhandlerwithrule,\
alljoyn_busattachment_releasename,\
alljoyn_busattachment_reloadkeystore,\
alljoyn_busattachment_removematch,\
alljoyn_busattachment_removesessionmember,\
alljoyn_busattachment_requestname,\
alljoyn_busattachment_secureconnection,\
alljoyn_busattachment_secureconnectionasync,\
alljoyn_busattachment_setdaemondebug,\
alljoyn_busattachment_setkeyexpiration,\
alljoyn_busattachment_setlinktimeout,\
alljoyn_busattachment_setlinktimeoutasync,\
alljoyn_busattachment_setsessionlistener,\
alljoyn_busattachment_start,\
alljoyn_busattachment_stop,\
alljoyn_busattachment_unbindsessionport,\
alljoyn_busattachment_unregisteraboutlistener,\
alljoyn_busattachment_unregisterallaboutlisteners,\
alljoyn_busattachment_unregisterallhandlers,\
alljoyn_busattachment_unregisterapplicationstatelistener,\
alljoyn_busattachment_unregisterbuslistener,\
alljoyn_busattachment_unregisterbusobject,\
alljoyn_busattachment_unregistersignalhandler,\
alljoyn_busattachment_unregistersignalhandlerwithrule,\
alljoyn_busattachment_whoimplements_interface,\
alljoyn_busattachment_whoimplements_interfaces,\
alljoyn_buslistener_create,\
alljoyn_buslistener_destroy,\
alljoyn_busobject_addinterface,\
alljoyn_busobject_addinterface_announced,\
alljoyn_busobject_addmethodhandler,\
alljoyn_busobject_addmethodhandlers,\
alljoyn_busobject_cancelsessionlessmessage,\
alljoyn_busobject_cancelsessionlessmessage_serial,\
alljoyn_busobject_create,\
alljoyn_busobject_destroy,\
alljoyn_busobject_emitpropertieschanged,\
alljoyn_busobject_emitpropertychanged,\
alljoyn_busobject_getannouncedinterfacenames,\
alljoyn_busobject_getbusattachment,\
alljoyn_busobject_getname,\
alljoyn_busobject_getpath,\
alljoyn_busobject_issecure,\
alljoyn_busobject_methodreply_args,\
alljoyn_busobject_methodreply_err,\
alljoyn_busobject_methodreply_status,\
alljoyn_busobject_setannounceflag,\
alljoyn_busobject_signal,\
alljoyn_credentials_clear,\
alljoyn_credentials_create,\
alljoyn_credentials_destroy,\
alljoyn_credentials_getcertchain,\
alljoyn_credentials_getexpiration,\
alljoyn_credentials_getlogonentry,\
alljoyn_credentials_getpassword,\
alljoyn_credentials_getprivateKey,\
alljoyn_credentials_getusername,\
alljoyn_credentials_isset,\
alljoyn_credentials_setcertchain,\
alljoyn_credentials_setexpiration,\
alljoyn_credentials_setlogonentry,\
alljoyn_credentials_setpassword,\
alljoyn_credentials_setprivatekey,\
alljoyn_credentials_setusername,\
alljoyn_getbuildinfo,\
alljoyn_getnumericversion,\
alljoyn_getversion,\
alljoyn_init,\
alljoyn_interfacedescription_activate,\
alljoyn_interfacedescription_addannotation,\
alljoyn_interfacedescription_addargannotation,\
alljoyn_interfacedescription_addmember,\
alljoyn_interfacedescription_addmemberannotation,\
alljoyn_interfacedescription_addmethod,\
alljoyn_interfacedescription_addproperty,\
alljoyn_interfacedescription_addpropertyannotation,\
alljoyn_interfacedescription_addsignal,\
alljoyn_interfacedescription_eql,\
alljoyn_interfacedescription_getannotation,\
alljoyn_interfacedescription_getannotationatindex,\
alljoyn_interfacedescription_getannotationscount,\
alljoyn_interfacedescription_getargdescriptionforlanguage,\
alljoyn_interfacedescription_getdescriptionforlanguage,\
alljoyn_interfacedescription_getdescriptionlanguages,\
alljoyn_interfacedescription_getdescriptionlanguages2,\
alljoyn_interfacedescription_getdescriptiontranslationcallback,\
alljoyn_interfacedescription_getmember,\
alljoyn_interfacedescription_getmemberannotation,\
alljoyn_interfacedescription_getmemberargannotation,\
alljoyn_interfacedescription_getmemberdescriptionforlanguage,\
alljoyn_interfacedescription_getmembers,\
alljoyn_interfacedescription_getmethod,\
alljoyn_interfacedescription_getname,\
alljoyn_interfacedescription_getproperties,\
alljoyn_interfacedescription_getproperty,\
alljoyn_interfacedescription_getpropertyannotation,\
alljoyn_interfacedescription_getpropertydescriptionforlanguage,\
alljoyn_interfacedescription_getsecuritypolicy,\
alljoyn_interfacedescription_getsignal,\
alljoyn_interfacedescription_hasdescription,\
alljoyn_interfacedescription_hasmember,\
alljoyn_interfacedescription_hasproperties,\
alljoyn_interfacedescription_hasproperty,\
alljoyn_interfacedescription_introspect,\
alljoyn_interfacedescription_issecure,\
alljoyn_interfacedescription_member_eql,\
alljoyn_interfacedescription_member_getannotation,\
alljoyn_interfacedescription_member_getannotationatindex,\
alljoyn_interfacedescription_member_getannotationscount,\
alljoyn_interfacedescription_member_getargannotation,\
alljoyn_interfacedescription_member_getargannotationatindex,\
alljoyn_interfacedescription_member_getargannotationscount,\
alljoyn_interfacedescription_property_eql,\
alljoyn_interfacedescription_property_getannotation,\
alljoyn_interfacedescription_property_getannotationatindex,\
alljoyn_interfacedescription_property_getannotationscount,\
alljoyn_interfacedescription_setargdescription,\
alljoyn_interfacedescription_setargdescriptionforlanguage,\
alljoyn_interfacedescription_setdescription,\
alljoyn_interfacedescription_setdescriptionforlanguage,\
alljoyn_interfacedescription_setdescriptionlanguage,\
alljoyn_interfacedescription_setdescriptiontranslationcallback,\
alljoyn_interfacedescription_setmemberdescription,\
alljoyn_interfacedescription_setmemberdescriptionforlanguage,\
alljoyn_interfacedescription_setpropertydescription,\
alljoyn_interfacedescription_setpropertydescriptionforlanguage,\
alljoyn_keystorelistener_create,\
alljoyn_keystorelistener_destroy,\
alljoyn_keystorelistener_getkeys,\
alljoyn_keystorelistener_putkeys,\
alljoyn_keystorelistener_with_synchronization_create,\
alljoyn_message_create,\
alljoyn_message_description,\
alljoyn_message_destroy,\
alljoyn_message_eql,\
alljoyn_message_getarg,\
alljoyn_message_getargs,\
alljoyn_message_getauthmechanism,\
alljoyn_message_getcallserial,\
alljoyn_message_getcompressiontoken,\
alljoyn_message_getdestination,\
alljoyn_message_geterrorname,\
alljoyn_message_getflags,\
alljoyn_message_getinterface,\
alljoyn_message_getmembername,\
alljoyn_message_getobjectpath,\
alljoyn_message_getreceiveendpointname,\
alljoyn_message_getreplyserial,\
alljoyn_message_getsender,\
alljoyn_message_getsessionid,\
alljoyn_message_getsignature,\
alljoyn_message_gettimestamp,\
alljoyn_message_gettype,\
alljoyn_message_isbroadcastsignal,\
alljoyn_message_isencrypted,\
alljoyn_message_isexpired,\
alljoyn_message_isglobalbroadcast,\
alljoyn_message_issessionless,\
alljoyn_message_isunreliable,\
alljoyn_message_parseargs,\
alljoyn_message_setendianess,\
alljoyn_message_tostring,\
alljoyn_msgarg_array_create,\
alljoyn_msgarg_array_element,\
alljoyn_msgarg_array_get,\
alljoyn_msgarg_array_set,\
alljoyn_msgarg_array_set_offset,\
alljoyn_msgarg_array_signature,\
alljoyn_msgarg_array_tostring,\
alljoyn_msgarg_clear,\
alljoyn_msgarg_clone,\
alljoyn_msgarg_copy,\
alljoyn_msgarg_create,\
alljoyn_msgarg_create_and_set,\
alljoyn_msgarg_destroy,\
alljoyn_msgarg_equal,\
alljoyn_msgarg_get,\
alljoyn_msgarg_get_array_element,\
alljoyn_msgarg_get_array_elementsignature,\
alljoyn_msgarg_get_array_numberofelements,\
alljoyn_msgarg_get_bool,\
alljoyn_msgarg_get_bool_array,\
alljoyn_msgarg_get_double,\
alljoyn_msgarg_get_double_array,\
alljoyn_msgarg_get_int16,\
alljoyn_msgarg_get_int16_array,\
alljoyn_msgarg_get_int32,\
alljoyn_msgarg_get_int32_array,\
alljoyn_msgarg_get_int64,\
alljoyn_msgarg_get_int64_array,\
alljoyn_msgarg_get_objectpath,\
alljoyn_msgarg_get_signature,\
alljoyn_msgarg_get_string,\
alljoyn_msgarg_get_uint16,\
alljoyn_msgarg_get_uint16_array,\
alljoyn_msgarg_get_uint32,\
alljoyn_msgarg_get_uint32_array,\
alljoyn_msgarg_get_uint64,\
alljoyn_msgarg_get_uint64_array,\
alljoyn_msgarg_get_uint8,\
alljoyn_msgarg_get_uint8_array,\
alljoyn_msgarg_get_variant,\
alljoyn_msgarg_get_variant_array,\
alljoyn_msgarg_getdictelement,\
alljoyn_msgarg_getkey,\
alljoyn_msgarg_getmember,\
alljoyn_msgarg_getnummembers,\
alljoyn_msgarg_gettype,\
alljoyn_msgarg_getvalue,\
alljoyn_msgarg_hassignature,\
alljoyn_msgarg_set,\
alljoyn_msgarg_set_and_stabilize,\
alljoyn_msgarg_set_bool,\
alljoyn_msgarg_set_bool_array,\
alljoyn_msgarg_set_double,\
alljoyn_msgarg_set_double_array,\
alljoyn_msgarg_set_int16,\
alljoyn_msgarg_set_int16_array,\
alljoyn_msgarg_set_int32,\
alljoyn_msgarg_set_int32_array,\
alljoyn_msgarg_set_int64,\
alljoyn_msgarg_set_int64_array,\
alljoyn_msgarg_set_objectpath,\
alljoyn_msgarg_set_objectpath_array,\
alljoyn_msgarg_set_signature,\
alljoyn_msgarg_set_signature_array,\
alljoyn_msgarg_set_string,\
alljoyn_msgarg_set_string_array,\
alljoyn_msgarg_set_uint16,\
alljoyn_msgarg_set_uint16_array,\
alljoyn_msgarg_set_uint32,\
alljoyn_msgarg_set_uint32_array,\
alljoyn_msgarg_set_uint64,\
alljoyn_msgarg_set_uint64_array,\
alljoyn_msgarg_set_uint8,\
alljoyn_msgarg_set_uint8_array,\
alljoyn_msgarg_setdictentry,\
alljoyn_msgarg_setstruct,\
alljoyn_msgarg_signature,\
alljoyn_msgarg_stabilize,\
alljoyn_msgarg_tostring,\
alljoyn_observer_create,\
alljoyn_observer_destroy,\
alljoyn_observer_get,\
alljoyn_observer_getfirst,\
alljoyn_observer_getnext,\
alljoyn_observer_registerlistener,\
alljoyn_observer_unregisteralllisteners,\
alljoyn_observer_unregisterlistener,\
alljoyn_observerlistener_create,\
alljoyn_observerlistener_destroy,\
alljoyn_passwordmanager_setcredentials,\
alljoyn_permissionconfigurationlistener_create,\
alljoyn_permissionconfigurationlistener_destroy,\
alljoyn_permissionconfigurator_certificatechain_destroy,\
alljoyn_permissionconfigurator_certificateid_cleanup,\
alljoyn_permissionconfigurator_certificateidarray_cleanup,\
alljoyn_permissionconfigurator_claim,\
alljoyn_permissionconfigurator_endmanagement,\
alljoyn_permissionconfigurator_getapplicationstate,\
alljoyn_permissionconfigurator_getclaimcapabilities,\
alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo,\
alljoyn_permissionconfigurator_getdefaultclaimcapabilities,\
alljoyn_permissionconfigurator_getdefaultpolicy,\
alljoyn_permissionconfigurator_getidentity,\
alljoyn_permissionconfigurator_getidentitycertificateid,\
alljoyn_permissionconfigurator_getmanifests,\
alljoyn_permissionconfigurator_getmanifesttemplate,\
alljoyn_permissionconfigurator_getmembershipsummaries,\
alljoyn_permissionconfigurator_getpolicy,\
alljoyn_permissionconfigurator_getpublickey,\
alljoyn_permissionconfigurator_installmanifests,\
alljoyn_permissionconfigurator_installmembership,\
alljoyn_permissionconfigurator_manifestarray_cleanup,\
alljoyn_permissionconfigurator_manifesttemplate_destroy,\
alljoyn_permissionconfigurator_policy_destroy,\
alljoyn_permissionconfigurator_publickey_destroy,\
alljoyn_permissionconfigurator_removemembership,\
alljoyn_permissionconfigurator_reset,\
alljoyn_permissionconfigurator_resetpolicy,\
alljoyn_permissionconfigurator_setapplicationstate,\
alljoyn_permissionconfigurator_setclaimcapabilities,\
alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo,\
alljoyn_permissionconfigurator_setmanifestfromxml,\
alljoyn_permissionconfigurator_setmanifesttemplatefromxml,\
alljoyn_permissionconfigurator_startmanagement,\
alljoyn_permissionconfigurator_updateidentity,\
alljoyn_permissionconfigurator_updatepolicy,\
alljoyn_pinglistener_create,\
alljoyn_pinglistener_destroy,\
alljoyn_proxybusobject_addchild,\
alljoyn_proxybusobject_addinterface,\
alljoyn_proxybusobject_addinterface_by_name,\
alljoyn_proxybusobject_copy,\
alljoyn_proxybusobject_create,\
alljoyn_proxybusobject_create_secure,\
alljoyn_proxybusobject_destroy,\
alljoyn_proxybusobject_enablepropertycaching,\
alljoyn_proxybusobject_getallproperties,\
alljoyn_proxybusobject_getallpropertiesasync,\
alljoyn_proxybusobject_getchild,\
alljoyn_proxybusobject_getchildren,\
alljoyn_proxybusobject_getinterface,\
alljoyn_proxybusobject_getinterfaces,\
alljoyn_proxybusobject_getpath,\
alljoyn_proxybusobject_getproperty,\
alljoyn_proxybusobject_getpropertyasync,\
alljoyn_proxybusobject_getservicename,\
alljoyn_proxybusobject_getsessionid,\
alljoyn_proxybusobject_getuniquename,\
alljoyn_proxybusobject_implementsinterface,\
alljoyn_proxybusobject_introspectremoteobject,\
alljoyn_proxybusobject_introspectremoteobjectasync,\
alljoyn_proxybusobject_issecure,\
alljoyn_proxybusobject_isvalid,\
alljoyn_proxybusobject_methodcall,\
alljoyn_proxybusobject_methodcall_member,\
alljoyn_proxybusobject_methodcall_member_noreply,\
alljoyn_proxybusobject_methodcall_noreply,\
alljoyn_proxybusobject_methodcallasync,\
alljoyn_proxybusobject_methodcallasync_member,\
alljoyn_proxybusobject_parsexml,\
alljoyn_proxybusobject_ref_create,\
alljoyn_proxybusobject_ref_decref,\
alljoyn_proxybusobject_ref_get,\
alljoyn_proxybusobject_ref_incref,\
alljoyn_proxybusobject_registerpropertieschangedlistener,\
alljoyn_proxybusobject_removechild,\
alljoyn_proxybusobject_secureconnection,\
alljoyn_proxybusobject_secureconnectionasync,\
alljoyn_proxybusobject_setproperty,\
alljoyn_proxybusobject_setpropertyasync,\
alljoyn_proxybusobject_unregisterpropertieschangedlistener,\
alljoyn_routerinit,\
alljoyn_routerinitwithconfig,\
alljoyn_routershutdown,\
alljoyn_securityapplicationproxy_claim,\
alljoyn_securityapplicationproxy_computemanifestdigest,\
alljoyn_securityapplicationproxy_create,\
alljoyn_securityapplicationproxy_destroy,\
alljoyn_securityapplicationproxy_digest_destroy,\
alljoyn_securityapplicationproxy_eccpublickey_destroy,\
alljoyn_securityapplicationproxy_endmanagement,\
alljoyn_securityapplicationproxy_getapplicationstate,\
alljoyn_securityapplicationproxy_getclaimcapabilities,\
alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo,\
alljoyn_securityapplicationproxy_getdefaultpolicy,\
alljoyn_securityapplicationproxy_geteccpublickey,\
alljoyn_securityapplicationproxy_getmanifesttemplate,\
alljoyn_securityapplicationproxy_getpermissionmanagementsessionport,\
alljoyn_securityapplicationproxy_getpolicy,\
alljoyn_securityapplicationproxy_installmembership,\
alljoyn_securityapplicationproxy_manifest_destroy,\
alljoyn_securityapplicationproxy_manifesttemplate_destroy,\
alljoyn_securityapplicationproxy_policy_destroy,\
alljoyn_securityapplicationproxy_reset,\
alljoyn_securityapplicationproxy_resetpolicy,\
alljoyn_securityapplicationproxy_setmanifestsignature,\
alljoyn_securityapplicationproxy_signmanifest,\
alljoyn_securityapplicationproxy_startmanagement,\
alljoyn_securityapplicationproxy_updateidentity,\
alljoyn_securityapplicationproxy_updatepolicy,\
alljoyn_sessionlistener_create,\
alljoyn_sessionlistener_destroy,\
alljoyn_sessionopts_cmp,\
alljoyn_sessionopts_create,\
alljoyn_sessionopts_destroy,\
alljoyn_sessionopts_get_multipoint,\
alljoyn_sessionopts_get_proximity,\
alljoyn_sessionopts_get_traffic,\
alljoyn_sessionopts_get_transports,\
alljoyn_sessionopts_iscompatible,\
alljoyn_sessionopts_set_multipoint,\
alljoyn_sessionopts_set_proximity,\
alljoyn_sessionopts_set_traffic,\
alljoyn_sessionopts_set_transports,\
alljoyn_sessionportlistener_create,\
alljoyn_sessionportlistener_destroy,\
alljoyn_shutdown,\
alljoyn_unity_deferred_callbacks_process,\
alljoyn_unity_set_deferred_callback_mainthread_only,\
AllJoynCloseBusHandle,\
AllJoynConnectToBus,\
AllJoynEnumEvents,\
AllJoynEventSelect,\
AllJoynReceiveFromBus,\
AllJoynSendToBus,\
QCC_StatusText

PE.__IMPORTS equ "MSWSOCK",\
AcceptEx,\
GetAcceptExSockaddrs,\
TransmitFile

PE.__IMPORTS equ "OLEAUT32",\
VARIANT_UserFree64,\
BSTR_UserFree64,\
LPSAFEARRAY_UserFree64,\
BSTR_UserMarshal64,\
LPSAFEARRAY_UserMarshal64,\
BSTR_UserSize64,\
LPSAFEARRAY_UserSize64,\
BSTR_UserUnmarshal64,\
LPSAFEARRAY_UserUnmarshal64,\
VARIANT_UserUnmarshal64,\
VARIANT_UserSize64,\
VARIANT_UserMarshal64

PE.__IMPORTS equ "POWRPROF",\
PowerEnumerate,\
PowerReadFriendlyName

PE.__IMPORTS equ "PROPSYS",\
InitPropVariantFromCLSID,\
InitPropVariantFromFileTime,\
InitVariantFromBuffer,\
PropVariantChangeType,\
PropVariantCompareEx,\
PropVariantToBoolean,\
PropVariantToBSTR,\
PropVariantToGUID,\
PropVariantToStringAlloc,\
PropVariantToStringWithDefault,\
PropVariantToVariant,\
PSCreateAdapterFromPropertyStore,\
PSCreateMemoryPropertyStore,\
PSCreatePropertyStoreFromObject,\
VariantToGUID,\
VariantToPropVariant

PE.__IMPORTS equ "PSAPI",\
GetModuleBaseNameA,\
GetModuleBaseNameW,\
GetModuleFileNameExA,\
GetModuleFileNameExW,\
GetModuleInformation,\
GetProcessMemoryInfo,\
QueryWorkingSet,\
QueryWorkingSetEx

PE.__IMPORTS equ "PerceptionDevice",\
PerceptionDeviceCreateFactory,\
PerceptionDeviceSetCreateFactoryOverride

PE.__IMPORTS equ "RPCRT4",\
CreateProxyFromTypeInfo,\
CreateStubFromTypeInfo,\
CStdStubBuffer_AddRef,\
CStdStubBuffer_Connect,\
CStdStubBuffer_CountRefs,\
CStdStubBuffer_DebugServerQueryInterface,\
CStdStubBuffer_DebugServerRelease,\
CStdStubBuffer_Disconnect,\
CStdStubBuffer_Invoke,\
CStdStubBuffer_IsIIDSupported,\
CStdStubBuffer_QueryInterface,\
DceErrorInqTextA,\
DceErrorInqTextW,\
I_RpcExceptionFilter,\
IUnknown_AddRef_Proxy,\
IUnknown_QueryInterface_Proxy,\
IUnknown_Release_Proxy,\
Ndr64AsyncClientCall,\
Ndr64AsyncServerCall64,\
Ndr64AsyncServerCallAll,\
NdrAllocate,\
NdrAsyncClientCall,\
NdrAsyncServerCall,\
NdrByteCountPointerBufferSize,\
NdrByteCountPointerFree,\
NdrByteCountPointerMarshall,\
NdrByteCountPointerUnmarshall,\
NDRCContextBinding,\
NDRCContextMarshall,\
NDRCContextUnmarshall,\
NdrClearOutParameters,\
NdrClientCall2,\
NdrClientCall3,\
NdrClientContextMarshall,\
NdrClientContextUnmarshall,\
NdrClientInitialize,\
NdrClientInitializeNew,\
NdrComplexArrayBufferSize,\
NdrComplexArrayFree,\
NdrComplexArrayMarshall,\
NdrComplexArrayMemorySize,\
NdrComplexArrayUnmarshall,\
NdrComplexStructBufferSize,\
NdrComplexStructFree,\
NdrComplexStructMarshall,\
NdrComplexStructMemorySize,\
NdrComplexStructUnmarshall,\
NdrConformantArrayBufferSize,\
NdrConformantArrayFree,\
NdrConformantArrayMarshall,\
NdrConformantArrayMemorySize,\
NdrConformantArrayUnmarshall,\
NdrConformantStringBufferSize,\
NdrConformantStringMarshall,\
NdrConformantStringMemorySize,\
NdrConformantStringUnmarshall,\
NdrConformantStructBufferSize,\
NdrConformantStructFree,\
NdrConformantStructMarshall,\
NdrConformantStructMemorySize,\
NdrConformantStructUnmarshall,\
NdrConformantVaryingArrayBufferSize,\
NdrConformantVaryingArrayFree,\
NdrConformantVaryingArrayMarshall,\
NdrConformantVaryingArrayMemorySize,\
NdrConformantVaryingArrayUnmarshall,\
NdrConformantVaryingStructBufferSize,\
NdrConformantVaryingStructFree,\
NdrConformantVaryingStructMarshall,\
NdrConformantVaryingStructMemorySize,\
NdrConformantVaryingStructUnmarshall,\
NdrContextHandleInitialize,\
NdrContextHandleSize,\
NdrConvert,\
NdrConvert2,\
NdrCorrelationFree,\
NdrCorrelationInitialize,\
NdrCorrelationPass,\
NdrCreateServerInterfaceFromStub,\
NdrCStdStubBuffer_Release,\
NdrCStdStubBuffer2_Release,\
NdrDllCanUnloadNow,\
NdrDllGetClassObject,\
NdrDllRegisterProxy,\
NdrDllUnregisterProxy,\
NdrEncapsulatedUnionBufferSize,\
NdrEncapsulatedUnionFree,\
NdrEncapsulatedUnionMarshall,\
NdrEncapsulatedUnionMemorySize,\
NdrEncapsulatedUnionUnmarshall,\
NdrFixedArrayBufferSize,\
NdrFixedArrayFree,\
NdrFixedArrayMarshall,\
NdrFixedArrayMemorySize,\
NdrFixedArrayUnmarshall,\
NdrFreeBuffer,\
NdrFullPointerXlatFree,\
NdrFullPointerXlatInit,\
NdrGetBuffer,\
NdrGetDcomProtocolVersion,\
NdrGetUserMarshalInfo,\
NdrInterfacePointerBufferSize,\
NdrInterfacePointerFree,\
NdrInterfacePointerMarshall,\
NdrInterfacePointerMemorySize,\
NdrInterfacePointerUnmarshall,\
NdrMapCommAndFaultStatus,\
NdrNonConformantStringBufferSize,\
NdrNonConformantStringMarshall,\
NdrNonConformantStringMemorySize,\
NdrNonConformantStringUnmarshall,\
NdrNonEncapsulatedUnionBufferSize,\
NdrNonEncapsulatedUnionFree,\
NdrNonEncapsulatedUnionMarshall,\
NdrNonEncapsulatedUnionMemorySize,\
NdrNonEncapsulatedUnionUnmarshall,\
NdrNsGetBuffer,\
NdrNsSendReceive,\
NdrOleAllocate,\
NdrOleFree,\
NdrPartialIgnoreClientBufferSize,\
NdrPartialIgnoreClientMarshall,\
NdrPartialIgnoreServerInitialize,\
NdrPartialIgnoreServerUnmarshall,\
NdrPointerBufferSize,\
NdrPointerFree,\
NdrPointerMarshall,\
NdrPointerMemorySize,\
NdrPointerUnmarshall,\
NdrProxyErrorHandler,\
NdrRangeUnmarshall,\
NdrRpcSmClientAllocate,\
NdrRpcSmClientFree,\
NdrRpcSmSetClientToOsf,\
NdrRpcSsDefaultAllocate,\
NdrRpcSsDefaultFree,\
NdrRpcSsDisableAllocate,\
NdrRpcSsEnableAllocate,\
NDRSContextMarshall,\
NDRSContextMarshall2,\
NDRSContextMarshallEx,\
NDRSContextUnmarshall,\
NDRSContextUnmarshall2,\
NDRSContextUnmarshallEx,\
NdrSendReceive,\
NdrServerCall2,\
NdrServerCallAll,\
NdrServerCallNdr64,\
NdrServerContextMarshall,\
NdrServerContextNewMarshall,\
NdrServerContextNewUnmarshall,\
NdrServerContextUnmarshall,\
NdrServerInitialize,\
NdrServerInitializeMarshall,\
NdrServerInitializeNew,\
NdrServerInitializePartial,\
NdrServerInitializeUnmarshall,\
NdrSimpleStructBufferSize,\
NdrSimpleStructFree,\
NdrSimpleStructMarshall,\
NdrSimpleStructMemorySize,\
NdrSimpleStructUnmarshall,\
NdrSimpleTypeMarshall,\
NdrSimpleTypeUnmarshall,\
NdrStubCall2,\
NdrStubCall3,\
NdrStubForwardingFunction,\
NdrUserMarshalBufferSize,\
NdrUserMarshalFree,\
NdrUserMarshalMarshall,\
NdrUserMarshalMemorySize,\
NdrUserMarshalSimpleTypeConvert,\
NdrUserMarshalUnmarshall,\
NdrVaryingArrayBufferSize,\
NdrVaryingArrayFree,\
NdrVaryingArrayMarshall,\
NdrVaryingArrayMemorySize,\
NdrVaryingArrayUnmarshall,\
NdrXmitOrRepAsBufferSize,\
NdrXmitOrRepAsFree,\
NdrXmitOrRepAsMarshall,\
NdrXmitOrRepAsMemorySize,\
NdrXmitOrRepAsUnmarshall,\
RpcAsyncAbortCall,\
RpcAsyncCancelCall,\
RpcAsyncCompleteCall,\
RpcAsyncGetCallStatus,\
RpcAsyncInitializeHandle,\
RpcBindingBind,\
RpcBindingCopy,\
RpcBindingCreateA,\
RpcBindingCreateW,\
RpcBindingFree,\
RpcBindingFromStringBindingA,\
RpcBindingFromStringBindingW,\
RpcBindingInqAuthInfoA,\
RpcBindingInqAuthInfoExA,\
RpcBindingInqAuthInfoExW,\
RpcBindingInqAuthInfoW,\
RpcBindingInqObject,\
RpcBindingInqOption,\
RpcBindingReset,\
RpcBindingSetAuthInfoA,\
RpcBindingSetAuthInfoExA,\
RpcBindingSetAuthInfoExW,\
RpcBindingSetAuthInfoW,\
RpcBindingSetObject,\
RpcBindingSetOption,\
RpcBindingToStringBindingA,\
RpcBindingToStringBindingW,\
RpcBindingUnbind,\
RpcEpResolveBinding,\
RpcErrorAddRecord,\
RpcErrorClearInformation,\
RpcErrorEndEnumeration,\
RpcErrorGetNextRecord,\
RpcErrorGetNumberOfRecords,\
RpcErrorLoadErrorInfo,\
RpcErrorResetEnumeration,\
RpcErrorSaveErrorInfo,\
RpcErrorStartEnumeration,\
RpcExceptionFilter,\
RpcMgmtInqServerPrincNameA,\
RpcMgmtInqServerPrincNameW,\
RpcMgmtInqStats,\
RpcMgmtIsServerListening,\
RpcMgmtSetCancelTimeout,\
RpcMgmtSetComTimeout,\
RpcNetworkIsProtseqValidA,\
RpcNetworkIsProtseqValidW,\
RpcRaiseException,\
RpcSmAllocate,\
RpcSmClientFree,\
RpcSmDestroyClientContext,\
RpcSmDisableAllocate,\
RpcSmEnableAllocate,\
RpcSmFree,\
RpcSmGetThreadHandle,\
RpcSmSetClientAllocFree,\
RpcSmSetThreadHandle,\
RpcSmSwapClientAllocFree,\
RpcSsAllocate,\
RpcSsDestroyClientContext,\
RpcSsDisableAllocate,\
RpcSsEnableAllocate,\
RpcSsFree,\
RpcSsGetThreadHandle,\
RpcSsSetClientAllocFree,\
RpcSsSetThreadHandle,\
RpcSsSwapClientAllocFree,\
RpcStringBindingComposeA,\
RpcStringBindingComposeW,\
RpcStringBindingParseA,\
RpcStringBindingParseW,\
RpcStringFreeA,\
RpcStringFreeW,\
RpcTestCancel,\
RpcUserFree,\
UuidCompare,\
UuidCreate,\
UuidCreateNil,\
UuidCreateSequential,\
UuidEqual,\
UuidFromStringA,\
UuidFromStringW,\
UuidHash,\
UuidIsNil,\
UuidToStringA,\
UuidToStringW

PE.__IMPORTS equ "RoMetadata",\
MetaDataGetDispenser

PE.__IMPORTS equ "SspiCli",\
AcceptSecurityContext,\
AcquireCredentialsHandleW,\
ApplyControlToken,\
CompleteAuthToken,\
DecryptMessage,\
DeleteSecurityContext,\
EncryptMessage,\
EnumerateSecurityPackagesW,\
FreeContextBuffer,\
FreeCredentialsHandle,\
GetUserNameExW,\
InitializeSecurityContextA,\
InitializeSecurityContextW,\
InitSecurityInterfaceA,\
InitSecurityInterfaceW,\
LsaConnectUntrusted,\
LsaDeregisterLogonProcess,\
LsaFreeReturnBuffer,\
LsaGetLogonSessionData,\
LsaLogonUser,\
LsaLookupAuthenticationPackage,\
LsaRegisterLogonProcess,\
QueryContextAttributesW,\
QueryCredentialsAttributesW,\
QuerySecurityContextToken,\
SetContextAttributesW,\
SspiEncodeStringsAsAuthIdentity,\
SspiEncryptAuthIdentityEx,\
SspiFreeAuthIdentity

PE.__IMPORTS equ "UIAutomationCore",\
UiaHasServerSideProvider,\
UiaIAccessibleFromProvider,\
UiaProviderForNonClient,\
UiaProviderFromIAccessible,\
UiaRaiseActiveTextPositionChangedEvent,\
UiaRaiseAsyncContentLoadedEvent,\
UiaRaiseNotificationEvent

PE.__IMPORTS equ "USERENV",\
DeriveAppContainerSidFromAppContainerName

PE.__IMPORTS equ "WINHTTP",\
WinHttpAddRequestHeaders,\
WinHttpAddRequestHeadersEx,\
WinHttpCheckPlatform,\
WinHttpCloseHandle,\
WinHttpConnect,\
WinHttpCrackUrl,\
WinHttpCreateProxyResolver,\
WinHttpCreateUrl,\
WinHttpDetectAutoProxyConfigUrl,\
WinHttpFreeProxyResult,\
WinHttpFreeProxyResultEx,\
WinHttpFreeProxySettings,\
WinHttpGetDefaultProxyConfiguration,\
WinHttpGetIEProxyConfigForCurrentUser,\
WinHttpGetProxyForUrl,\
WinHttpGetProxyForUrlEx,\
WinHttpGetProxyForUrlEx2,\
WinHttpGetProxyResult,\
WinHttpGetProxyResultEx,\
WinHttpGetProxySettingsVersion,\
WinHttpOpen,\
WinHttpOpenRequest,\
WinHttpQueryAuthSchemes,\
WinHttpQueryDataAvailable,\
WinHttpQueryHeaders,\
WinHttpQueryOption,\
WinHttpReadData,\
WinHttpReadProxySettings,\
WinHttpReceiveResponse,\
WinHttpResetAutoProxy,\
WinHttpSendRequest,\
WinHttpSetCredentials,\
WinHttpSetDefaultProxyConfiguration,\
WinHttpSetOption,\
WinHttpSetProxySettingsPerUser,\
WinHttpSetStatusCallback,\
WinHttpSetTimeouts,\
WinHttpTimeFromSystemTime,\
WinHttpTimeToSystemTime,\
WinHttpWebSocketClose,\
WinHttpWebSocketCompleteUpgrade,\
WinHttpWebSocketQueryCloseStatus,\
WinHttpWebSocketReceive,\
WinHttpWebSocketSend,\
WinHttpWebSocketShutdown,\
WinHttpWriteData,\
WinHttpWriteProxySettings

PE.__IMPORTS equ "WINTRUST",\
WinVerifyTrust

PE.__IMPORTS equ "WS2_32",\
freeaddrinfo,\
FreeAddrInfoEx,\
FreeAddrInfoExW,\
FreeAddrInfoW,\
getaddrinfo,\
GetAddrInfoExCancel,\
GetAddrInfoExOverlappedResult,\
GetAddrInfoExW,\
GetAddrInfoW,\
WSAEnumNameSpaceProvidersW,\
WSAEnumNetworkEvents,\
WSAEnumProtocolsA,\
WSAEnumProtocolsW,\
WSAEventSelect,\
WSAGetOverlappedResult,\
WSAGetServiceClassInfoW,\
WSAGetServiceClassNameByClassIdW,\
WSAHtonl,\
WSAHtons,\
WSAIoctl,\
WSAJoinLeaf,\
WSALookupServiceBeginA,\
WSALookupServiceBeginW,\
WSALookupServiceEnd,\
WSALookupServiceNextA,\
WSALookupServiceNextW,\
GetHostNameW,\
getnameinfo,\
GetNameInfoW,\
WSAPoll,\
WSAProviderConfigChange,\
WSARecv,\
WSARecvFrom,\
WSAResetEvent,\
WSASend,\
WSASendMsg,\
WSASendTo,\
WSASetEvent,\
WSASetServiceA,\
inet_ntop,\
inet_pton,\
InetNtopW,\
InetPtonW,\
WSAStringToAddressA,\
WSAStringToAddressW,\
WSAWaitForMultipleEvents,\
WSASocketW,\
WSASocketA,\
SetAddrInfoExW,\
WSASetServiceW,\
WSANtohs,\
WSANtohl,\
WSAAccept,\
WSAAddressToStringA,\
WSAAddressToStringW,\
WSANSPIoctl,\
WSACloseEvent,\
WSAConnect,\
WSAConnectByList,\
WSAConnectByNameA,\
WSAConnectByNameW,\
WSACreateEvent,\
WSADuplicateSocketA,\
WSADuplicateSocketW,\
WSAEnumNameSpaceProvidersA,\
WSAEnumNameSpaceProvidersExA,\
WSAEnumNameSpaceProvidersExW

PE.__IMPORTS equ "Windows.AI.MachineLearning",\
MLCreateOperatorRegistry

PE.__IMPORTS equ "Windows.Data.Pdf",\
PdfCreateRenderer

PE.__IMPORTS equ "Windows.Networking",\
SetSocketMediaStreamingMode

PE.__IMPORTS equ "WindowsCodecs",\
WICConvertBitmapSource,\
WICCreateBitmapFromSection,\
WICCreateBitmapFromSectionEx,\
WICGetMetadataContentSize,\
WICMapGuidToShortName,\
WICMapSchemaToName,\
WICMapShortNameToGuid,\
WICMatchMetadataContent,\
WICSerializeMetadataContent

PE.__IMPORTS equ "XINPUTUAP",\
XInputEnable,\
XInputGetAudioDeviceIds,\
XInputGetBatteryInformation,\
XInputGetCapabilities,\
XInputGetKeystroke,\
XInputGetState,\
XInputSetState

PE.__IMPORTS equ "XmlLite",\
CreateXmlReader,\
CreateXmlReaderInputWithEncodingCodePage,\
CreateXmlReaderInputWithEncodingName,\
CreateXmlWriter,\
CreateXmlWriterOutputWithEncodingCodePage,\
CreateXmlWriterOutputWithEncodingName

PE.__IMPORTS equ "api-ms-win-appmodel-runtime-l1-1-0",\
ClosePackageInfo,\
GetApplicationUserModelId,\
GetCurrentApplicationUserModelId,\
GetCurrentPackageFamilyName,\
GetCurrentPackageFullName,\
GetCurrentPackageId,\
GetCurrentPackageInfo,\
GetCurrentPackagePath,\
GetPackageFamilyName,\
GetPackageFullName,\
GetPackageId,\
GetPackageInfo,\
GetPackagePath,\
GetPackagesByPackageFamily,\
OpenPackageInfoByFullName,\
PackageFamilyNameFromFullName,\
PackageFamilyNameFromId,\
PackageFullNameFromId,\
PackageIdFromFullName,\
PackageNameAndPublisherIdFromFamilyName

PE.__IMPORTS equ "api-ms-win-appmodel-runtime-l1-1-1",\
FindPackagesByPackageFamily,\
FormatApplicationUserModelId,\
GetApplicationUserModelIdFromToken,\
GetPackageApplicationIds,\
GetPackageFamilyNameFromToken,\
GetPackageFullNameFromToken,\
GetPackagePathByFullName,\
GetStagedPackagePathByFullName,\
OpenPackageInfoByFullNameForUser,\
ParseApplicationUserModelId,\
VerifyApplicationUserModelId,\
VerifyPackageFamilyName,\
VerifyPackageFullName,\
VerifyPackageId,\
VerifyPackageRelativeApplicationId

PE.__IMPORTS equ "api-ms-win-appmodel-runtime-l1-1-2",\
AppPolicyGetClrCompat,\
AppPolicyGetCreateFileAccess,\
AppPolicyGetLifecycleManagement,\
AppPolicyGetMediaFoundationCodecLoading,\
AppPolicyGetProcessTerminationMethod,\
AppPolicyGetShowDeveloperDiagnostic,\
AppPolicyGetThreadInitializationType,\
AppPolicyGetWindowingModel

PE.__IMPORTS equ "api-ms-win-appmodel-runtime-l1-1-3",\
GetCurrentPackageInfo2,\
GetCurrentPackagePath2,\
GetPackageInfo2,\
GetPackagePathByFullName2,\
GetStagedPackagePathByFullName2

PE.__IMPORTS equ "api-ms-win-core-atoms-l1-1-0",\
AddAtomA,\
AddAtomW,\
DeleteAtom,\
FindAtomA,\
FindAtomW,\
GetAtomNameA,\
GetAtomNameW

PE.__IMPORTS equ "api-ms-win-core-com-l1-1-0",\
CLSIDFromProgID,\
CLSIDFromString,\
CoAddRefServerProcess,\
CoCreateFreeThreadedMarshaler,\
CoCreateGuid,\
CoCreateInstance,\
CoCreateInstanceEx,\
CoCreateInstanceFromApp,\
CoDecrementMTAUsage,\
CoDisconnectObject,\
CoFreeUnusedLibraries,\
CoFreeUnusedLibrariesEx,\
CoGetApartmentType,\
CoGetClassObject,\
CoGetContextToken,\
CoGetCurrentLogicalThreadId,\
CoGetInterfaceAndReleaseStream,\
CoGetMalloc,\
CoGetMarshalSizeMax,\
CoGetObjectContext,\
CoGetStandardMarshal,\
CoIncrementMTAUsage,\
CoInitializeEx,\
CoInitializeSecurity,\
CoLockObjectExternal,\
CoMarshalInterface,\
CoMarshalInterThreadInterfaceInStream,\
CoRegisterClassObject,\
CoRegisterPSClsid,\
CoReleaseMarshalData,\
CoReleaseServerProcess,\
CoResumeClassObjects,\
CoRevokeClassObject,\
CoSetProxyBlanket,\
CoSuspendClassObjects,\
CoSwitchCallContext,\
CoTaskMemAlloc,\
CoTaskMemFree,\
CoTaskMemRealloc,\
CoUninitialize,\
CoUnmarshalInterface,\
CoWaitForMultipleHandles,\
CoWaitForMultipleObjects,\
CreateStreamOnHGlobal,\
FreePropVariantArray,\
GetHGlobalFromStream,\
IIDFromString,\
ProgIDFromCLSID,\
PropVariantClear,\
PropVariantCopy,\
StringFromCLSID,\
StringFromGUID2,\
StringFromIID

PE.__IMPORTS equ "api-ms-win-core-com-l1-1-1",\
RoGetAgileReference

PE.__IMPORTS equ "api-ms-win-core-com-l2-1-1",\
CreateILockBytesOnHGlobal,\
FmtIdToPropStgName,\
GetConvertStg,\
GetHGlobalFromILockBytes,\
PropStgNameToFmtId,\
ReadClassStg,\
ReadClassStm,\
StgCreateDocfile,\
StgCreateDocfileOnILockBytes,\
StgCreatePropSetStg,\
StgCreatePropStg,\
StgCreateStorageEx,\
StgIsStorageFile,\
StgIsStorageILockBytes,\
StgOpenPropStg,\
StgOpenStorage,\
StgOpenStorageEx,\
StgOpenStorageOnILockBytes,\
StgSetTimes,\
WriteClassStg,\
WriteClassStm

PE.__IMPORTS equ "api-ms-win-core-com-midlproxystub-l1-1-0",\
CStdAsyncStubBuffer_AddRef,\
CStdAsyncStubBuffer_Connect,\
CStdAsyncStubBuffer_Disconnect,\
CStdAsyncStubBuffer_Invoke,\
CStdAsyncStubBuffer_QueryInterface,\
CStdAsyncStubBuffer_Release,\
CStdAsyncStubBuffer2_Connect,\
CStdAsyncStubBuffer2_Disconnect,\
CStdAsyncStubBuffer2_Release,\
CStdStubBuffer2_Connect,\
CStdStubBuffer2_CountRefs,\
CStdStubBuffer2_Disconnect,\
CStdStubBuffer2_QueryInterface,\
NdrProxyForwardingFunction10,\
NdrProxyForwardingFunction11,\
NdrProxyForwardingFunction12,\
NdrProxyForwardingFunction13,\
NdrProxyForwardingFunction14,\
NdrProxyForwardingFunction15,\
NdrProxyForwardingFunction16,\
NdrProxyForwardingFunction17,\
NdrProxyForwardingFunction18,\
NdrProxyForwardingFunction19,\
NdrProxyForwardingFunction20,\
NdrProxyForwardingFunction21,\
NdrProxyForwardingFunction22,\
NdrProxyForwardingFunction23,\
NdrProxyForwardingFunction24,\
NdrProxyForwardingFunction25,\
NdrProxyForwardingFunction26,\
NdrProxyForwardingFunction27,\
NdrProxyForwardingFunction28,\
NdrProxyForwardingFunction29,\
NdrProxyForwardingFunction3,\
NdrProxyForwardingFunction30,\
NdrProxyForwardingFunction31,\
NdrProxyForwardingFunction32,\
NdrProxyForwardingFunction4,\
NdrProxyForwardingFunction5,\
NdrProxyForwardingFunction6,\
NdrProxyForwardingFunction7,\
NdrProxyForwardingFunction8,\
NdrProxyForwardingFunction9,\
ObjectStublessClient10,\
ObjectStublessClient11,\
ObjectStublessClient12,\
ObjectStublessClient13,\
ObjectStublessClient14,\
ObjectStublessClient15,\
ObjectStublessClient16,\
ObjectStublessClient17,\
ObjectStublessClient18,\
ObjectStublessClient19,\
ObjectStublessClient20,\
ObjectStublessClient21,\
ObjectStublessClient22,\
ObjectStublessClient23,\
ObjectStublessClient24,\
ObjectStublessClient25,\
ObjectStublessClient26,\
ObjectStublessClient27,\
ObjectStublessClient28,\
ObjectStublessClient29,\
ObjectStublessClient3,\
ObjectStublessClient30,\
ObjectStublessClient31,\
ObjectStublessClient32,\
ObjectStublessClient4,\
ObjectStublessClient5,\
ObjectStublessClient6,\
ObjectStublessClient7,\
ObjectStublessClient8,\
ObjectStublessClient9

PE.__IMPORTS equ "api-ms-win-core-comm-l1-1-0",\
ClearCommBreak,\
ClearCommError,\
EscapeCommFunction,\
GetCommConfig,\
GetCommMask,\
GetCommModemStatus,\
GetCommProperties,\
GetCommState,\
GetCommTimeouts,\
PurgeComm,\
SetCommBreak,\
SetCommConfig,\
SetCommMask,\
SetCommState,\
SetCommTimeouts,\
SetupComm,\
TransmitCommChar,\
WaitCommEvent

PE.__IMPORTS equ "api-ms-win-core-comm-l1-1-1",\
OpenCommPort

PE.__IMPORTS equ "api-ms-win-core-comm-l1-1-2",\
GetCommPorts

PE.__IMPORTS equ "api-ms-win-core-console-l1-1-0",\
AllocConsole,\
GetConsoleCP,\
GetConsoleMode,\
GetConsoleOutputCP,\
GetNumberOfConsoleInputEvents,\
ReadConsoleA,\
ReadConsoleInputA,\
ReadConsoleInputW,\
ReadConsoleW,\
SetConsoleCtrlHandler,\
SetConsoleMode,\
WriteConsoleA,\
WriteConsoleW

PE.__IMPORTS equ "api-ms-win-core-console-l1-2-0",\
AttachConsole,\
FreeConsole,\
PeekConsoleInputA,\
PeekConsoleInputW

PE.__IMPORTS equ "api-ms-win-core-console-l2-1-0",\
CreateConsoleScreenBuffer,\
FillConsoleOutputAttribute,\
FillConsoleOutputCharacterA,\
FillConsoleOutputCharacterW,\
FlushConsoleInputBuffer,\
GenerateConsoleCtrlEvent,\
GetConsoleCursorInfo,\
GetConsoleScreenBufferInfo,\
GetConsoleScreenBufferInfoEx,\
GetLargestConsoleWindowSize,\
ReadConsoleOutputA,\
ReadConsoleOutputAttribute,\
ReadConsoleOutputCharacterA,\
ReadConsoleOutputCharacterW,\
ReadConsoleOutputW,\
ScrollConsoleScreenBufferA,\
ScrollConsoleScreenBufferW,\
SetConsoleActiveScreenBuffer,\
SetConsoleCP,\
SetConsoleCursorInfo,\
SetConsoleCursorPosition,\
SetConsoleOutputCP,\
SetConsoleScreenBufferInfoEx,\
SetConsoleScreenBufferSize,\
SetConsoleTextAttribute,\
SetConsoleWindowInfo,\
WriteConsoleInputA,\
WriteConsoleInputW,\
WriteConsoleOutputA,\
WriteConsoleOutputAttribute,\
WriteConsoleOutputCharacterA,\
WriteConsoleOutputCharacterW,\
WriteConsoleOutputW

PE.__IMPORTS equ "api-ms-win-core-console-l2-2-0",\
GetConsoleOriginalTitleA,\
GetConsoleOriginalTitleW,\
GetConsoleTitleA,\
GetConsoleTitleW,\
SetConsoleTitleA,\
SetConsoleTitleW

PE.__IMPORTS equ "api-ms-win-core-console-l3-2-0",\
AddConsoleAliasA,\
AddConsoleAliasW,\
ExpungeConsoleCommandHistoryA,\
ExpungeConsoleCommandHistoryW,\
GetConsoleAliasA,\
GetConsoleAliasesA,\
GetConsoleAliasesLengthA,\
GetConsoleAliasesLengthW,\
GetConsoleAliasesW,\
GetConsoleAliasExesA,\
GetConsoleAliasExesLengthA,\
GetConsoleAliasExesLengthW,\
GetConsoleAliasExesW,\
GetConsoleAliasW,\
GetConsoleCommandHistoryA,\
GetConsoleCommandHistoryLengthA,\
GetConsoleCommandHistoryLengthW,\
GetConsoleCommandHistoryW,\
GetConsoleDisplayMode,\
GetConsoleFontSize,\
GetConsoleHistoryInfo,\
GetConsoleProcessList,\
GetConsoleSelectionInfo,\
GetConsoleWindow,\
GetCurrentConsoleFont,\
GetCurrentConsoleFontEx,\
GetNumberOfConsoleMouseButtons,\
SetConsoleDisplayMode,\
SetConsoleHistoryInfo,\
SetConsoleNumberOfCommandsA,\
SetConsoleNumberOfCommandsW,\
SetCurrentConsoleFontEx

PE.__IMPORTS equ "api-ms-win-core-datetime-l1-1-0",\
GetDateFormatA,\
GetDateFormatW,\
GetTimeFormatA,\
GetTimeFormatW

PE.__IMPORTS equ "api-ms-win-core-datetime-l1-1-1",\
GetDateFormatEx,\
GetTimeFormatEx

PE.__IMPORTS equ "api-ms-win-core-datetime-l1-1-2",\
GetDurationFormatEx

PE.__IMPORTS equ "api-ms-win-core-debug-l1-1-0",\
DebugBreak,\
IsDebuggerPresent,\
OutputDebugStringA,\
OutputDebugStringW

PE.__IMPORTS equ "api-ms-win-core-debug-l1-1-1",\
CheckRemoteDebuggerPresent,\
ContinueDebugEvent,\
DebugActiveProcess,\
DebugActiveProcessStop,\
WaitForDebugEvent

PE.__IMPORTS equ "api-ms-win-core-delayload-l1-1-0",\
DelayLoadFailureHook

PE.__IMPORTS equ "api-ms-win-core-delayload-l1-1-1",\
ResolveDelayLoadedAPI,\
ResolveDelayLoadsFromDll

PE.__IMPORTS equ "api-ms-win-core-enclave-l1-1-0",\
CreateEnclave,\
InitializeEnclave,\
IsEnclaveTypeSupported,\
LoadEnclaveData

PE.__IMPORTS equ "api-ms-win-core-errorhandling-l1-1-0",\
GetErrorMode,\
GetLastError,\
RaiseException,\
SetErrorMode,\
SetLastError,\
SetUnhandledExceptionFilter,\
UnhandledExceptionFilter

PE.__IMPORTS equ "api-ms-win-core-errorhandling-l1-1-1",\
AddVectoredExceptionHandler,\
RemoveVectoredExceptionHandler

PE.__IMPORTS equ "api-ms-win-core-errorhandling-l1-1-2",\
RaiseFailFastException

PE.__IMPORTS equ "api-ms-win-core-errorhandling-l1-1-3",\
FatalAppExitA,\
FatalAppExitW,\
GetThreadErrorMode,\
SetThreadErrorMode

PE.__IMPORTS equ "api-ms-win-core-featurestaging-l1-1-0",\
GetFeatureEnabledState,\
RecordFeatureError,\
RecordFeatureUsage,\
SubscribeFeatureStateChangeNotification,\
UnsubscribeFeatureStateChangeNotification

PE.__IMPORTS equ "api-ms-win-core-featurestaging-l1-1-1",\
GetFeatureVariant

PE.__IMPORTS equ "api-ms-win-core-fibers-l1-1-0",\
FlsAlloc,\
FlsFree,\
FlsGetValue,\
FlsSetValue

PE.__IMPORTS equ "api-ms-win-core-fibers-l1-1-1",\
IsThreadAFiber

PE.__IMPORTS equ "api-ms-win-core-fibers-l2-1-0",\
ConvertFiberToThread,\
DeleteFiber,\
SwitchToFiber

PE.__IMPORTS equ "api-ms-win-core-fibers-l2-1-1",\
ConvertThreadToFiberEx,\
CreateFiberEx

PE.__IMPORTS equ "api-ms-win-core-file-ansi-l1-1-0",\
DeleteVolumeMountPointA,\
FindFirstVolumeA,\
FindNextVolumeA,\
GetLogicalDriveStringsA,\
GetVolumePathNameA

PE.__IMPORTS equ "api-ms-win-core-file-ansi-l2-1-0",\
CopyFileExA,\
CreateDirectoryExA,\
MoveFileWithProgressA,\
ReplaceFileA

PE.__IMPORTS equ "api-ms-win-core-file-fromapp-l1-1-0",\
CopyFileFromAppW,\
CreateDirectoryFromAppW,\
CreateFile2FromAppW,\
CreateFileFromAppW,\
DeleteFileFromAppW,\
FindFirstFileExFromAppW,\
GetFileAttributesExFromAppW,\
MoveFileFromAppW,\
RemoveDirectoryFromAppW,\
ReplaceFileFromAppW,\
SetFileAttributesFromAppW

PE.__IMPORTS equ "api-ms-win-core-file-l1-1-0",\
CompareFileTime,\
CreateDirectoryA,\
CreateDirectoryW,\
CreateFileA,\
CreateFileW,\
DeleteFileA,\
DeleteFileW,\
DeleteVolumeMountPointW,\
FileTimeToLocalFileTime,\
FindClose,\
FindCloseChangeNotification,\
FindFirstChangeNotificationA,\
FindFirstChangeNotificationW,\
FindFirstFileA,\
FindFirstFileExA,\
FindFirstFileExW,\
FindFirstFileW,\
FindFirstVolumeW,\
FindNextChangeNotification,\
FindNextFileA,\
FindNextFileW,\
FindNextVolumeW,\
FindVolumeClose,\
FlushFileBuffers,\
GetDiskFreeSpaceA,\
GetDiskFreeSpaceExA,\
GetDiskFreeSpaceExW,\
GetDiskFreeSpaceW,\
GetDriveTypeA,\
GetDriveTypeW,\
GetFileAttributesA,\
GetFileAttributesExA,\
GetFileAttributesExW,\
GetFileAttributesW,\
GetFileInformationByHandle,\
GetFileSize,\
GetFileSizeEx,\
GetFileTime,\
GetFileType,\
GetFinalPathNameByHandleA,\
GetFinalPathNameByHandleW,\
GetFullPathNameA,\
GetFullPathNameW,\
GetLogicalDrives,\
GetLogicalDriveStringsW,\
GetLongPathNameA,\
GetLongPathNameW,\
GetShortPathNameW,\
GetTempFileNameW,\
GetVolumeInformationByHandleW,\
GetVolumeInformationW,\
GetVolumePathNameW,\
LocalFileTimeToFileTime,\
LockFile,\
LockFileEx,\
ReadFile,\
ReadFileEx,\
ReadFileScatter,\
RemoveDirectoryA,\
RemoveDirectoryW,\
SetEndOfFile,\
SetFileAttributesA,\
SetFileAttributesW,\
SetFileInformationByHandle,\
SetFilePointer,\
SetFilePointerEx,\
SetFileTime,\
SetFileValidData,\
UnlockFile,\
UnlockFileEx,\
WriteFile,\
WriteFileEx,\
WriteFileGather

PE.__IMPORTS equ "api-ms-win-core-file-l1-2-0",\
CreateFile2,\
GetTempPathW,\
GetVolumeNameForVolumeMountPointW,\
GetVolumePathNamesForVolumeNameW

PE.__IMPORTS equ "api-ms-win-core-file-l1-2-2",\
AreFileApisANSI,\
GetTempFileNameA,\
GetTempPathA,\
GetVolumeInformationA

PE.__IMPORTS equ "api-ms-win-core-file-l2-1-0",\
CopyFile2,\
CopyFileExW,\
CreateDirectoryExW,\
CreateHardLinkW,\
CreateSymbolicLinkW,\
GetFileInformationByHandleEx,\
MoveFileExW,\
MoveFileWithProgressW,\
ReadDirectoryChangesW,\
ReOpenFile,\
ReplaceFileW

PE.__IMPORTS equ "api-ms-win-core-file-l2-1-2",\
CopyFileW

PE.__IMPORTS equ "api-ms-win-core-firmware-l1-1-0",\
GetFirmwareEnvironmentVariableA,\
GetFirmwareEnvironmentVariableExA,\
GetFirmwareEnvironmentVariableExW,\
GetFirmwareEnvironmentVariableW,\
SetFirmwareEnvironmentVariableA,\
SetFirmwareEnvironmentVariableExA,\
SetFirmwareEnvironmentVariableExW,\
SetFirmwareEnvironmentVariableW

PE.__IMPORTS equ "api-ms-win-core-handle-l1-1-0",\
CloseHandle,\
CompareObjectHandles,\
DuplicateHandle,\
GetHandleInformation,\
SetHandleInformation

PE.__IMPORTS equ "api-ms-win-core-heap-l1-1-0",\
GetProcessHeap,\
GetProcessHeaps,\
HeapAlloc,\
HeapCompact,\
HeapCreate,\
HeapDestroy,\
HeapFree,\
HeapLock,\
HeapQueryInformation,\
HeapReAlloc,\
HeapSetInformation,\
HeapSize,\
HeapUnlock,\
HeapValidate,\
HeapWalk

PE.__IMPORTS equ "api-ms-win-core-heap-l2-1-0",\
GlobalAlloc,\
GlobalFree,\
LocalAlloc,\
LocalFree,\
LocalReAlloc

PE.__IMPORTS equ "api-ms-win-core-heap-obsolete-l1-1-0",\
GlobalLock,\
GlobalReAlloc,\
GlobalSize,\
GlobalUnlock

PE.__IMPORTS equ "api-ms-win-core-interlocked-l1-1-0",\
InitializeSListHead,\
InterlockedFlushSList,\
InterlockedPopEntrySList,\
InterlockedPushEntrySList,\
QueryDepthSList

PE.__IMPORTS equ "api-ms-win-core-interlocked-l1-2-0",\
InterlockedPushListSListEx

PE.__IMPORTS equ "api-ms-win-core-io-l1-1-0",\
CancelIoEx,\
CreateIoCompletionPort,\
DeviceIoControl,\
GetOverlappedResult,\
GetQueuedCompletionStatus,\
GetQueuedCompletionStatusEx,\
PostQueuedCompletionStatus

PE.__IMPORTS equ "api-ms-win-core-io-l1-1-1",\
CancelIo,\
GetOverlappedResultEx

PE.__IMPORTS equ "api-ms-win-core-job-l2-1-0",\
AssignProcessToJobObject,\
CreateJobObjectW,\
SetInformationJobObject

PE.__IMPORTS equ "api-ms-win-core-kernel32-legacy-ansi-l1-1-0",\
SetDllDirectoryA,\
SetVolumeLabelA

PE.__IMPORTS equ "api-ms-win-core-kernel32-legacy-l1-1-0",\
CopyFileA,\
CreateFileMappingA,\
CreateNamedPipeA,\
DosDateTimeToFileTime,\
FileTimeToDosDateTime,\
FindResourceA,\
GetComputerNameA,\
GetComputerNameW,\
GetShortPathNameA,\
GetStartupInfoA,\
GetSystemPowerStatus,\
GlobalMemoryStatus,\
MoveFileA,\
MoveFileExA,\
MoveFileW,\
RegisterWaitForSingleObject,\
SetFileCompletionNotificationModes,\
SetVolumeLabelW,\
UnregisterWait

PE.__IMPORTS equ "api-ms-win-core-kernel32-legacy-l1-1-1",\
SetDllDirectoryW,\
VerifyVersionInfoW

PE.__IMPORTS equ "api-ms-win-core-kernel32-legacy-l1-1-2",\
OpenFileMappingA,\
Process32First,\
Process32Next,\
VerifyVersionInfoA

PE.__IMPORTS equ "api-ms-win-core-kernel32-legacy-l1-1-5",\
SetThreadExecutionState

PE.__IMPORTS equ "api-ms-win-core-largeinteger-l1-1-0",\
MulDiv

PE.__IMPORTS equ "api-ms-win-core-libraryloader-l1-2-0",\
AddDllDirectory,\
DisableThreadLibraryCalls,\
FindResourceExW,\
FindStringOrdinal,\
FreeLibrary,\
FreeLibraryAndExitThread,\
FreeResource,\
GetModuleFileNameA,\
GetModuleFileNameW,\
GetModuleHandleA,\
GetModuleHandleExA,\
GetModuleHandleExW,\
GetModuleHandleW,\
GetProcAddress,\
LoadLibraryExA,\
LoadLibraryExW,\
LoadResource,\
LoadStringA,\
LoadStringW,\
LockResource,\
RemoveDllDirectory,\
SetDefaultDllDirectories,\
SizeofResource

PE.__IMPORTS equ "api-ms-win-core-libraryloader-l1-2-1",\
FindResourceW,\
LoadLibraryA,\
LoadLibraryW

PE.__IMPORTS equ "api-ms-win-core-libraryloader-l1-2-2",\
EnumResourceNamesW

PE.__IMPORTS equ "api-ms-win-core-libraryloader-l1-2-3",\
EnumResourceNamesA

PE.__IMPORTS equ "api-ms-win-core-libraryloader-l2-1-0",\
LoadPackagedLibrary,\
QueryOptionalDelayLoadedAPI

PE.__IMPORTS equ "api-ms-win-core-localization-ansi-l1-1-0",\
EnumUILanguagesA,\
FoldStringA,\
GetCalendarInfoA,\
GetStringTypeExA,\
SetCalendarInfoA,\
SetLocaleInfoA

PE.__IMPORTS equ "api-ms-win-core-localization-l1-2-0",\
ConvertDefaultLocale,\
EnumSystemGeoID,\
EnumSystemLocalesA,\
EnumSystemLocalesW,\
FindNLSString,\
FindNLSStringEx,\
FormatMessageA,\
FormatMessageW,\
GetACP,\
GetCalendarInfoEx,\
GetCalendarInfoW,\
GetCPInfo,\
GetCPInfoExW,\
GetFileMUIInfo,\
GetFileMUIPath,\
GetGeoInfoW,\
GetLocaleInfoA,\
GetLocaleInfoEx,\
GetLocaleInfoW,\
GetNLSVersion,\
GetNLSVersionEx,\
GetOEMCP,\
GetProcessPreferredUILanguages,\
GetSystemDefaultLangID,\
GetSystemDefaultLCID,\
GetSystemPreferredUILanguages,\
GetThreadLocale,\
GetThreadPreferredUILanguages,\
GetThreadUILanguage,\
GetUILanguageInfo,\
GetUserDefaultLangID,\
GetUserDefaultLCID,\
GetUserDefaultLocaleName,\
GetUserGeoID,\
GetUserPreferredUILanguages,\
IdnToAscii,\
IdnToUnicode,\
IsDBCSLeadByte,\
IsDBCSLeadByteEx,\
IsNLSDefinedString,\
IsValidCodePage,\
IsValidLanguageGroup,\
IsValidLocale,\
IsValidLocaleName,\
IsValidNLSVersion,\
LCMapStringA,\
LCMapStringEx,\
LCMapStringW,\
LocaleNameToLCID,\
ResolveLocaleName,\
SetCalendarInfoW,\
SetLocaleInfoW,\
SetProcessPreferredUILanguages,\
SetThreadLocale,\
SetThreadPreferredUILanguages,\
SetThreadUILanguage,\
VerLanguageNameA,\
VerLanguageNameW

PE.__IMPORTS equ "api-ms-win-core-localization-l1-2-1",\
EnumSystemLocalesEx

PE.__IMPORTS equ "api-ms-win-core-localization-l1-2-2",\
GetSystemDefaultLocaleName,\
LCIDToLocaleName

PE.__IMPORTS equ "api-ms-win-core-localization-l1-2-3",\
GetUserDefaultGeoName

PE.__IMPORTS equ "api-ms-win-core-localization-l2-1-0",\
EnumCalendarInfoExEx,\
EnumCalendarInfoW,\
EnumDateFormatsExEx,\
EnumSystemCodePagesW,\
EnumTimeFormatsEx,\
GetCurrencyFormatEx,\
GetCurrencyFormatW,\
GetNumberFormatEx

PE.__IMPORTS equ "api-ms-win-core-localization-obsolete-l1-2-0",\
CompareStringA,\
EnumUILanguagesW,\
GetStringTypeA,\
GetSystemDefaultUILanguage,\
GetUserDefaultUILanguage

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-0",\
CreateFileMappingW,\
FlushViewOfFile,\
MapViewOfFile,\
MapViewOfFileEx,\
OpenFileMappingW,\
ReadProcessMemory,\
UnmapViewOfFile,\
VirtualAlloc,\
VirtualAllocEx,\
VirtualFree,\
VirtualFreeEx,\
VirtualProtect,\
VirtualProtectEx,\
VirtualQuery,\
VirtualQueryEx,\
WriteProcessMemory

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-1",\
CreateFileMappingFromApp,\
GetLargePageMinimum,\
GetProcessWorkingSetSizeEx,\
GetWriteWatch,\
MapViewOfFileFromApp,\
ResetWriteWatch,\
SetProcessWorkingSetSizeEx,\
UnmapViewOfFileEx,\
VirtualLock,\
VirtualUnlock

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-2",\
DiscardVirtualMemory,\
OfferVirtualMemory,\
ReclaimVirtualMemory

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-3",\
OpenFileMappingFromApp,\
SetProcessValidCallTargets,\
VirtualAllocFromApp,\
VirtualProtectFromApp

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-5",\
UnmapViewOfFile2,\
VirtualUnlockEx

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-6",\
MapViewOfFile3FromApp,\
VirtualAlloc2FromApp

PE.__IMPORTS equ "api-ms-win-core-memory-l1-1-7",\
SetProcessValidCallTargetsForMappedView

PE.__IMPORTS equ "api-ms-win-core-namedpipe-ansi-l1-1-0",\
GetNamedPipeClientComputerNameA,\
GetNamedPipeHandleStateA,\
WaitNamedPipeA

PE.__IMPORTS equ "api-ms-win-core-namedpipe-ansi-l1-1-1",\
CallNamedPipeA

PE.__IMPORTS equ "api-ms-win-core-namedpipe-l1-1-0",\
ConnectNamedPipe,\
CreateNamedPipeW,\
CreatePipe,\
DisconnectNamedPipe,\
GetNamedPipeClientComputerNameW,\
ImpersonateNamedPipeClient,\
PeekNamedPipe,\
SetNamedPipeHandleState,\
TransactNamedPipe,\
WaitNamedPipeW

PE.__IMPORTS equ "api-ms-win-core-namedpipe-l1-2-1",\
GetNamedPipeHandleStateW,\
GetNamedPipeInfo

PE.__IMPORTS equ "api-ms-win-core-namedpipe-l1-2-2",\
CallNamedPipeW

PE.__IMPORTS equ "api-ms-win-core-namespace-ansi-l1-1-0",\
CreateBoundaryDescriptorA,\
CreatePrivateNamespaceA,\
OpenPrivateNamespaceA

PE.__IMPORTS equ "api-ms-win-core-namespace-l1-1-0",\
AddSIDToBoundaryDescriptor,\
ClosePrivateNamespace,\
CreateBoundaryDescriptorW,\
CreatePrivateNamespaceW,\
DeleteBoundaryDescriptor,\
OpenPrivateNamespaceW

PE.__IMPORTS equ "api-ms-win-core-normalization-l1-1-0",\
GetStringScripts,\
IdnToNameprepUnicode,\
IsNormalizedString,\
NormalizeString,\
VerifyScripts

PE.__IMPORTS equ "api-ms-win-core-path-l1-1-0",\
PathAllocCanonicalize,\
PathAllocCombine,\
PathCchAddBackslash,\
PathCchAddBackslashEx,\
PathCchAddExtension,\
PathCchAppend,\
PathCchAppendEx,\
PathCchCanonicalize,\
PathCchCanonicalizeEx,\
PathCchCombine,\
PathCchCombineEx,\
PathCchFindExtension,\
PathCchIsRoot,\
PathCchRemoveBackslash,\
PathCchRemoveBackslashEx,\
PathCchRemoveExtension,\
PathCchRemoveFileSpec,\
PathCchRenameExtension,\
PathCchSkipRoot,\
PathCchStripPrefix,\
PathCchStripToRoot,\
PathIsUNCEx

PE.__IMPORTS equ "api-ms-win-core-privateprofile-l1-1-0",\
GetPrivateProfileIntA,\
GetPrivateProfileStringA,\
GetPrivateProfileStringW,\
WritePrivateProfileStringA,\
WritePrivateProfileStringW

PE.__IMPORTS equ "api-ms-win-core-privateprofile-l1-1-1",\
GetPrivateProfileSectionA

PE.__IMPORTS equ "api-ms-win-core-processenvironment-ansi-l1-1-0",\
SetEnvironmentStringsA

PE.__IMPORTS equ "api-ms-win-core-processenvironment-l1-1-0",\
ExpandEnvironmentStringsA,\
ExpandEnvironmentStringsW,\
FreeEnvironmentStringsA,\
FreeEnvironmentStringsW,\
GetCommandLineA,\
GetCommandLineW,\
GetCurrentDirectoryA,\
GetCurrentDirectoryW,\
GetEnvironmentStrings,\
GetEnvironmentStringsW,\
GetEnvironmentVariableA,\
GetEnvironmentVariableW,\
GetStdHandle,\
SearchPathW,\
SetCurrentDirectoryA,\
SetCurrentDirectoryW,\
SetEnvironmentStringsW,\
SetEnvironmentVariableA,\
SetEnvironmentVariableW,\
SetStdHandle,\
SetStdHandleEx

PE.__IMPORTS equ "api-ms-win-core-processenvironment-l1-2-0",\
SearchPathA

PE.__IMPORTS equ "api-ms-win-core-processsnapshot-l1-1-0",\
PssCaptureSnapshot,\
PssDuplicateSnapshot,\
PssFreeSnapshot,\
PssQuerySnapshot,\
PssWalkMarkerCreate,\
PssWalkMarkerFree,\
PssWalkMarkerGetPosition,\
PssWalkMarkerSeekToBeginning,\
PssWalkMarkerSetPosition,\
PssWalkSnapshot

PE.__IMPORTS equ "api-ms-win-core-processthreads-l1-1-0",\
CreateProcessA,\
CreateProcessAsUserW,\
CreateProcessW,\
CreateRemoteThread,\
CreateRemoteThreadEx,\
CreateThread,\
DeleteProcThreadAttributeList,\
ExitProcess,\
ExitThread,\
FlushProcessWriteBuffers,\
GetCurrentProcess,\
GetCurrentProcessId,\
GetCurrentThread,\
GetCurrentThreadId,\
GetExitCodeProcess,\
GetExitCodeThread,\
GetPriorityClass,\
GetProcessId,\
GetProcessIdOfThread,\
GetProcessTimes,\
GetProcessVersion,\
GetStartupInfoW,\
GetThreadId,\
GetThreadPriority,\
GetThreadPriorityBoost,\
InitializeProcThreadAttributeList,\
OpenProcessToken,\
OpenThread,\
OpenThreadToken,\
ProcessIdToSessionId,\
QueryProcessAffinityUpdateMode,\
QueueUserAPC,\
ResumeThread,\
SetPriorityClass,\
SetProcessAffinityUpdateMode,\
SetProcessShutdownParameters,\
SetThreadPriority,\
SetThreadPriorityBoost,\
SetThreadStackGuarantee,\
SetThreadToken,\
SuspendThread,\
SwitchToThread,\
TerminateProcess,\
TerminateThread,\
TlsAlloc,\
TlsFree,\
TlsGetValue,\
TlsSetValue,\
UpdateProcThreadAttribute

PE.__IMPORTS equ "api-ms-win-core-processthreads-l1-1-1",\
FlushInstructionCache,\
GetCurrentProcessorNumber,\
GetCurrentProcessorNumberEx,\
GetCurrentThreadStackLimits,\
GetProcessHandleCount,\
GetProcessMitigationPolicy,\
GetThreadContext,\
GetThreadIdealProcessorEx,\
GetThreadTimes,\
IsProcessorFeaturePresent,\
OpenProcess,\
SetProcessMitigationPolicy,\
SetThreadContext,\
SetThreadIdealProcessorEx

PE.__IMPORTS equ "api-ms-win-core-processthreads-l1-1-2",\
GetProcessPriorityBoost,\
GetSystemTimes,\
SetProcessPriorityBoost,\
SetThreadInformation

PE.__IMPORTS equ "api-ms-win-core-processthreads-l1-1-3",\
CreateProcessAsUserA,\
GetProcessDefaultCpuSets,\
GetProcessInformation,\
GetSystemCpuSetInformation,\
GetThreadDescription,\
GetThreadSelectedCpuSets,\
SetProcessDefaultCpuSets,\
SetProcessInformation,\
SetThreadDescription,\
SetThreadIdealProcessor,\
SetThreadSelectedCpuSets

PE.__IMPORTS equ "api-ms-win-core-processthreads-l1-1-5",\
QueueUserAPC2

PE.__IMPORTS equ "api-ms-win-core-processthreads-l1-1-6",\
GetProcessDefaultCpuSetMasks,\
GetThreadSelectedCpuSetMasks,\
SetProcessDefaultCpuSetMasks,\
SetThreadSelectedCpuSetMasks

PE.__IMPORTS equ "api-ms-win-core-processtopology-l1-1-0",\
GetThreadGroupAffinity,\
SetThreadGroupAffinity

PE.__IMPORTS equ "api-ms-win-core-processtopology-obsolete-l1-1-0",\
GetProcessAffinityMask,\
GetProcessIoCounters,\
SetProcessAffinityMask,\
SetThreadAffinityMask

PE.__IMPORTS equ "api-ms-win-core-profile-l1-1-0",\
QueryPerformanceCounter,\
QueryPerformanceFrequency

PE.__IMPORTS equ "api-ms-win-core-psapi-ansi-l1-1-0",\
K32GetModuleBaseNameA,\
K32GetModuleFileNameExA,\
QueryFullProcessImageNameA

PE.__IMPORTS equ "api-ms-win-core-psapi-l1-1-0",\
K32EnumProcesses,\
K32GetModuleBaseNameW,\
K32GetModuleFileNameExW,\
K32GetModuleInformation,\
K32GetProcessMemoryInfo,\
K32QueryWorkingSet,\
K32QueryWorkingSetEx,\
QueryFullProcessImageNameW

PE.__IMPORTS equ "api-ms-win-core-psm-appnotify-l1-1-0",\
RegisterAppStateChangeNotification,\
UnregisterAppStateChangeNotification

PE.__IMPORTS equ "api-ms-win-core-realtime-l1-1-0",\
QueryThreadCycleTime,\
QueryUnbiasedInterruptTime

PE.__IMPORTS equ "api-ms-win-core-realtime-l1-1-1",\
QueryInterruptTime,\
QueryInterruptTimePrecise,\
QueryUnbiasedInterruptTimePrecise

PE.__IMPORTS equ "api-ms-win-core-realtime-l1-1-2",\
ConvertAuxiliaryCounterToPerformanceCounter,\
ConvertPerformanceCounterToAuxiliaryCounter,\
QueryAuxiliaryCounterFrequency

PE.__IMPORTS equ "api-ms-win-core-registry-l1-1-0",\
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
RegUnLoadKeyW

PE.__IMPORTS equ "api-ms-win-core-registry-l1-1-1",\
RegDeleteKeyValueA,\
RegDeleteKeyValueW,\
RegSetKeyValueA,\
RegSetKeyValueW

PE.__IMPORTS equ "api-ms-win-core-registry-l1-1-2",\
RegQueryMultipleValuesA,\
RegQueryMultipleValuesW

PE.__IMPORTS equ "api-ms-win-core-registry-l2-1-0",\
RegConnectRegistryA,\
RegConnectRegistryW,\
RegCopyTreeA,\
RegCreateKeyA,\
RegCreateKeyTransactedA,\
RegCreateKeyTransactedW,\
RegCreateKeyW,\
RegDeleteKeyA,\
RegDeleteKeyTransactedA,\
RegDeleteKeyTransactedW,\
RegDeleteKeyW,\
RegDisablePredefinedCache,\
RegEnumKeyA,\
RegEnumKeyW,\
RegOpenKeyA,\
RegOpenKeyTransactedA,\
RegOpenKeyTransactedW,\
RegOpenKeyW,\
RegOverridePredefKey,\
RegQueryValueA,\
RegQueryValueW,\
RegReplaceKeyA,\
RegReplaceKeyW,\
RegSaveKeyA,\
RegSaveKeyW,\
RegSetValueA,\
RegSetValueW

PE.__IMPORTS equ "api-ms-win-core-rtlsupport-l1-1-0",\
RtlAddFunctionTable,\
RtlCaptureContext,\
RtlCaptureStackBackTrace,\
RtlCompareMemory,\
RtlDeleteFunctionTable,\
RtlInstallFunctionTableCallback,\
RtlLookupFunctionEntry,\
RtlPcToFileHeader,\
RtlRaiseException,\
RtlRestoreContext,\
RtlUnwind,\
RtlUnwindEx,\
RtlVirtualUnwind

PE.__IMPORTS equ "api-ms-win-core-shutdown-l1-1-0",\
InitiateSystemShutdownExW

PE.__IMPORTS equ "api-ms-win-core-slapi-l1-1-0",\
SLQueryLicenseValueFromApp,\
SLQueryLicenseValueFromApp2

PE.__IMPORTS equ "api-ms-win-core-string-l1-1-0",\
CompareStringEx,\
CompareStringOrdinal,\
CompareStringW,\
FoldStringW,\
GetStringTypeExW,\
GetStringTypeW,\
MultiByteToWideChar,\
WideCharToMultiByte

PE.__IMPORTS equ "api-ms-win-core-string-l2-1-0",\
CharLowerBuffW,\
CharLowerW,\
CharNextW,\
CharUpperW

PE.__IMPORTS equ "api-ms-win-core-string-obsolete-l1-1-0",\
lstrcatW,\
lstrcmpA,\
lstrcmpiA,\
lstrcmpiW,\
lstrcmpW,\
lstrcpynW,\
lstrcpyW,\
lstrlenA,\
lstrlenW

PE.__IMPORTS equ "api-ms-win-core-string-obsolete-l1-1-1",\
lstrcatA,\
lstrcpyA

PE.__IMPORTS equ "api-ms-win-core-stringansi-l1-1-0",\
CharLowerA,\
CharNextA,\
CharNextExA

PE.__IMPORTS equ "api-ms-win-core-synch-ansi-l1-1-0",\
CreateSemaphoreA,\
CreateSemaphoreExA,\
CreateWaitableTimerA,\
CreateWaitableTimerExA,\
OpenMutexA,\
OpenWaitableTimerA

PE.__IMPORTS equ "api-ms-win-core-synch-l1-1-0",\
AcquireSRWLockExclusive,\
AcquireSRWLockShared,\
CancelWaitableTimer,\
CreateEventA,\
CreateEventExA,\
CreateEventExW,\
CreateEventW,\
CreateMutexA,\
CreateMutexExA,\
CreateMutexExW,\
CreateMutexW,\
CreateSemaphoreExW,\
CreateWaitableTimerExW,\
DeleteCriticalSection,\
EnterCriticalSection,\
InitializeCriticalSection,\
InitializeCriticalSectionAndSpinCount,\
InitializeCriticalSectionEx,\
InitializeSRWLock,\
LeaveCriticalSection,\
OpenEventA,\
OpenEventW,\
OpenMutexW,\
OpenSemaphoreW,\
OpenWaitableTimerW,\
ReleaseMutex,\
ReleaseSemaphore,\
ReleaseSRWLockExclusive,\
ReleaseSRWLockShared,\
ResetEvent,\
SetCriticalSectionSpinCount,\
SetEvent,\
SetWaitableTimer,\
SetWaitableTimerEx,\
SleepEx,\
TryAcquireSRWLockExclusive,\
TryAcquireSRWLockShared,\
TryEnterCriticalSection,\
WaitForMultipleObjectsEx,\
WaitForSingleObject,\
WaitForSingleObjectEx

PE.__IMPORTS equ "api-ms-win-core-synch-l1-2-0",\
DeleteSynchronizationBarrier,\
EnterSynchronizationBarrier,\
InitializeConditionVariable,\
InitializeSynchronizationBarrier,\
InitOnceBeginInitialize,\
InitOnceComplete,\
InitOnceExecuteOnce,\
InitOnceInitialize,\
SignalObjectAndWait,\
Sleep,\
SleepConditionVariableCS,\
SleepConditionVariableSRW,\
WaitOnAddress,\
WakeAllConditionVariable,\
WakeByAddressAll,\
WakeByAddressSingle,\
WakeConditionVariable

PE.__IMPORTS equ "api-ms-win-core-synch-l1-2-1",\
CreateSemaphoreW,\
CreateWaitableTimerW,\
WaitForMultipleObjects

PE.__IMPORTS equ "api-ms-win-core-sysinfo-l1-1-0",\
GetComputerNameExA,\
GetComputerNameExW,\
GetLocalTime,\
GetLogicalProcessorInformation,\
GetLogicalProcessorInformationEx,\
GetSystemDirectoryA,\
GetSystemDirectoryW,\
GetSystemInfo,\
GetSystemTime,\
GetSystemTimeAdjustment,\
GetSystemTimeAsFileTime,\
GetSystemWindowsDirectoryA,\
GetSystemWindowsDirectoryW,\
GetTickCount,\
GetTickCount64,\
GetVersion,\
GetVersionExA,\
GetVersionExW,\
GetWindowsDirectoryA,\
GetWindowsDirectoryW,\
GlobalMemoryStatusEx,\
SetLocalTime

PE.__IMPORTS equ "api-ms-win-core-sysinfo-l1-2-0",\
EnumSystemFirmwareTables,\
GetNativeSystemInfo,\
GetProductInfo,\
GetSystemFirmwareTable,\
GetSystemTimePreciseAsFileTime,\
SetSystemTime,\
VerSetConditionMask

PE.__IMPORTS equ "api-ms-win-core-sysinfo-l1-2-1",\
GetPhysicallyInstalledSystemMemory

PE.__IMPORTS equ "api-ms-win-core-sysinfo-l1-2-3",\
GetIntegratedDisplaySize

PE.__IMPORTS equ "api-ms-win-core-sysinfo-l1-2-5",\
GetSystemLeapSecondInformation

PE.__IMPORTS equ "api-ms-win-core-sysinfo-l1-2-6",\
IsUserCetAvailableInEnvironment

PE.__IMPORTS equ "api-ms-win-core-systemtopology-l1-1-0",\
GetNumaHighestNodeNumber

PE.__IMPORTS equ "api-ms-win-core-threadpool-l1-2-0",\
CallbackMayRunLong,\
CancelThreadpoolIo,\
CloseThreadpool,\
CloseThreadpoolCleanupGroup,\
CloseThreadpoolCleanupGroupMembers,\
CloseThreadpoolIo,\
CloseThreadpoolTimer,\
CloseThreadpoolWait,\
CloseThreadpoolWork,\
CreateThreadpool,\
CreateThreadpoolCleanupGroup,\
CreateThreadpoolIo,\
CreateThreadpoolTimer,\
CreateThreadpoolWait,\
CreateThreadpoolWork,\
DisassociateCurrentThreadFromCallback,\
FreeLibraryWhenCallbackReturns,\
IsThreadpoolTimerSet,\
LeaveCriticalSectionWhenCallbackReturns,\
QueryThreadpoolStackInformation,\
ReleaseMutexWhenCallbackReturns,\
ReleaseSemaphoreWhenCallbackReturns,\
SetEventWhenCallbackReturns,\
SetThreadpoolStackInformation,\
SetThreadpoolThreadMaximum,\
SetThreadpoolThreadMinimum,\
SetThreadpoolTimer,\
SetThreadpoolTimerEx,\
SetThreadpoolWait,\
SetThreadpoolWaitEx,\
StartThreadpoolIo,\
SubmitThreadpoolWork,\
TrySubmitThreadpoolCallback,\
WaitForThreadpoolIoCallbacks,\
WaitForThreadpoolTimerCallbacks,\
WaitForThreadpoolWaitCallbacks,\
WaitForThreadpoolWorkCallbacks

PE.__IMPORTS equ "api-ms-win-core-threadpool-legacy-l1-1-0",\
ChangeTimerQueueTimer,\
CreateTimerQueue,\
CreateTimerQueueTimer,\
DeleteTimerQueueEx,\
DeleteTimerQueueTimer,\
QueueUserWorkItem,\
UnregisterWaitEx

PE.__IMPORTS equ "api-ms-win-core-timezone-l1-1-0",\
EnumDynamicTimeZoneInformation,\
FileTimeToSystemTime,\
GetDynamicTimeZoneInformation,\
GetDynamicTimeZoneInformationEffectiveYears,\
GetTimeZoneInformation,\
GetTimeZoneInformationForYear,\
SetDynamicTimeZoneInformation,\
SetTimeZoneInformation,\
SystemTimeToFileTime,\
SystemTimeToTzSpecificLocalTime,\
SystemTimeToTzSpecificLocalTimeEx,\
TzSpecificLocalTimeToSystemTime,\
TzSpecificLocalTimeToSystemTimeEx

PE.__IMPORTS equ "api-ms-win-core-timezone-l1-1-1",\
LocalFileTimeToLocalSystemTime,\
LocalSystemTimeToLocalFileTime

PE.__IMPORTS equ "api-ms-win-core-toolhelp-l1-1-0",\
CreateToolhelp32Snapshot,\
Process32FirstW,\
Process32NextW,\
Thread32First,\
Thread32Next

PE.__IMPORTS equ "api-ms-win-core-url-l1-1-0",\
GetAcceptLanguagesA,\
GetAcceptLanguagesW

PE.__IMPORTS equ "api-ms-win-core-util-l1-1-0",\
Beep,\
DecodePointer,\
DecodeSystemPointer,\
EncodePointer,\
EncodeSystemPointer

PE.__IMPORTS equ "api-ms-win-core-version-l1-1-0",\
GetFileVersionInfoExW,\
GetFileVersionInfoSizeExW,\
VerQueryValueW

PE.__IMPORTS equ "api-ms-win-core-version-l1-1-1",\
GetFileVersionInfoW

PE.__IMPORTS equ "api-ms-win-core-versionansi-l1-1-0",\
GetFileVersionInfoExA,\
GetFileVersionInfoSizeExA,\
VerQueryValueA

PE.__IMPORTS equ "api-ms-win-core-versionansi-l1-1-1",\
GetFileVersionInfoA

PE.__IMPORTS equ "api-ms-win-core-windowsceip-l1-1-0",\
CeipIsOptedIn

PE.__IMPORTS equ "api-ms-win-core-windowserrorreporting-l1-1-0",\
WerRegisterFile,\
WerRegisterMemoryBlock,\
WerUnregisterFile,\
WerUnregisterMemoryBlock

PE.__IMPORTS equ "api-ms-win-core-windowserrorreporting-l1-1-1",\
WerRegisterAdditionalProcess,\
WerRegisterCustomMetadata,\
WerRegisterExcludedMemoryBlock,\
WerUnregisterAdditionalProcess,\
WerUnregisterCustomMetadata,\
WerUnregisterExcludedMemoryBlock

PE.__IMPORTS equ "api-ms-win-core-windowserrorreporting-l1-1-2",\
WerRegisterAppLocalDump,\
WerUnregisterAppLocalDump

PE.__IMPORTS equ "api-ms-win-core-winrt-error-l1-1-0",\
GetRestrictedErrorInfo,\
RoCaptureErrorContext,\
RoFailFastWithErrorContext,\
RoGetErrorReportingFlags,\
RoOriginateError,\
RoOriginateErrorW,\
RoSetErrorReportingFlags,\
RoTransformError,\
RoTransformErrorW,\
SetRestrictedErrorInfo

PE.__IMPORTS equ "api-ms-win-core-winrt-error-l1-1-1",\
IsErrorPropagationEnabled,\
RoClearError,\
RoGetMatchingRestrictedErrorInfo,\
RoOriginateLanguageException,\
RoReportFailedDelegate,\
RoReportUnhandledError

PE.__IMPORTS equ "api-ms-win-core-winrt-l1-1-0",\
RoActivateInstance,\
RoGetActivationFactory,\
RoGetApartmentIdentifier,\
RoInitialize,\
RoRegisterActivationFactories,\
RoRegisterForApartmentShutdown,\
RoRevokeActivationFactories,\
RoUninitialize,\
RoUnregisterForApartmentShutdown

PE.__IMPORTS equ "api-ms-win-core-winrt-registration-l1-1-0",\
RoGetActivatableClassRegistration,\
RoGetServerActivatableClasses

PE.__IMPORTS equ "api-ms-win-core-winrt-robuffer-l1-1-0",\
RoGetBufferMarshaler

PE.__IMPORTS equ "api-ms-win-core-winrt-roparameterizediid-l1-1-0",\
RoFreeParameterizedTypeExtra,\
RoGetParameterizedTypeInstanceIID,\
RoParameterizedTypeExtraGetTypeSignature

PE.__IMPORTS equ "api-ms-win-core-winrt-string-l1-1-0",\
HSTRING_UserFree,\
HSTRING_UserFree64,\
HSTRING_UserMarshal,\
HSTRING_UserMarshal64,\
HSTRING_UserSize,\
HSTRING_UserSize64,\
HSTRING_UserUnmarshal,\
HSTRING_UserUnmarshal64,\
WindowsCompareStringOrdinal,\
WindowsConcatString,\
WindowsCreateString,\
WindowsCreateStringReference,\
WindowsDeleteString,\
WindowsDeleteStringBuffer,\
WindowsDuplicateString,\
WindowsGetStringLen,\
WindowsGetStringRawBuffer,\
WindowsIsStringEmpty,\
WindowsPreallocateStringBuffer,\
WindowsPromoteStringBuffer,\
WindowsReplaceString,\
WindowsStringHasEmbeddedNull,\
WindowsSubstring,\
WindowsSubstringWithSpecifiedLength,\
WindowsTrimStringEnd,\
WindowsTrimStringStart

PE.__IMPORTS equ "api-ms-win-core-wow64-l1-1-0",\
IsWow64Process

PE.__IMPORTS equ "api-ms-win-core-wow64-l1-1-1",\
IsWow64Process2

PE.__IMPORTS equ "api-ms-win-core-xstate-l2-1-0",\
GetEnabledXStateFeatures,\
GetXStateFeaturesMask,\
InitializeContext,\
LocateXStateFeature

PE.__IMPORTS equ "api-ms-win-core-xstate-l2-1-2",\
EnableProcessOptionalXStateFeatures,\
GetThreadEnabledXStateFeatures

PE.__IMPORTS equ "api-ms-win-devices-config-l1-1-1",\
CM_Get_Device_ID_List_SizeW,\
CM_Get_Device_ID_ListW,\
CM_Get_Device_IDW,\
CM_Get_Device_Interface_List_SizeW,\
CM_Get_Device_Interface_ListW,\
CM_Get_Device_Interface_PropertyW,\
CM_Get_DevNode_PropertyW,\
CM_Get_DevNode_Status,\
CM_Get_Parent,\
CM_Locate_DevNodeW,\
CM_MapCrToWin32Err,\
CM_Register_Notification,\
CM_Unregister_Notification

PE.__IMPORTS equ "api-ms-win-devices-config-l1-1-2",\
CM_Get_Device_Interface_List_SizeA,\
CM_Get_Device_Interface_ListA

PE.__IMPORTS equ "api-ms-win-devices-query-l1-1-0",\
DevCloseObjectQuery,\
DevCreateObjectQuery

PE.__IMPORTS equ "api-ms-win-eventing-classicprovider-l1-1-0",\
GetTraceEnableFlags,\
GetTraceEnableLevel,\
GetTraceLoggerHandle,\
RegisterTraceGuidsW,\
TraceMessage,\
UnregisterTraceGuids

PE.__IMPORTS equ "api-ms-win-eventing-consumer-l1-1-0",\
CloseTrace,\
OpenTraceW,\
ProcessTrace

PE.__IMPORTS equ "api-ms-win-eventing-controller-l1-1-0",\
ControlTraceW,\
EnableTraceEx2,\
EnumerateTraceGuidsEx,\
StartTraceW,\
StopTraceW

PE.__IMPORTS equ "api-ms-win-eventing-legacy-l1-1-0",\
ControlTraceA,\
EnableTrace,\
EnableTraceEx,\
FlushTraceW,\
OpenTraceA,\
QueryTraceW,\
StartTraceA

PE.__IMPORTS equ "api-ms-win-eventing-obsolete-l1-1-0",\
RegisterTraceGuidsA

PE.__IMPORTS equ "api-ms-win-eventing-provider-l1-1-0",\
EventActivityIdControl,\
EventEnabled,\
EventProviderEnabled,\
EventRegister,\
EventSetInformation,\
EventUnregister,\
EventWrite,\
EventWriteEx,\
EventWriteString,\
EventWriteTransfer

PE.__IMPORTS equ "api-ms-win-eventlog-legacy-l1-1-0",\
DeregisterEventSource,\
RegisterEventSourceW,\
ReportEventW

PE.__IMPORTS equ "api-ms-win-gaming-deviceinformation-l1-1-0",\
GetGamingDeviceModelInformation

PE.__IMPORTS equ "api-ms-win-gaming-expandedresources-l1-1-0",\
GetExpandedResourceExclusiveCpuCount,\
HasExpandedResources,\
ReleaseExclusiveCpuSets

PE.__IMPORTS equ "api-ms-win-gaming-tcui-l1-1-0",\
ProcessPendingGameUI,\
ShowChangeFriendRelationshipUI,\
ShowGameInviteUI,\
ShowPlayerPickerUI,\
ShowProfileCardUI,\
ShowTitleAchievementsUI,\
TryCancelPendingGameUI

PE.__IMPORTS equ "api-ms-win-gaming-tcui-l1-1-1",\
CheckGamingPrivilegeSilently,\
CheckGamingPrivilegeWithUI

PE.__IMPORTS equ "api-ms-win-gaming-tcui-l1-1-2",\
CheckGamingPrivilegeSilentlyForUser,\
CheckGamingPrivilegeWithUIForUser,\
ShowChangeFriendRelationshipUIForUser,\
ShowGameInviteUIForUser,\
ShowPlayerPickerUIForUser,\
ShowProfileCardUIForUser,\
ShowTitleAchievementsUIForUser

PE.__IMPORTS equ "api-ms-win-gaming-tcui-l1-1-3",\
ShowGameInviteUIWithContext,\
ShowGameInviteUIWithContextForUser

PE.__IMPORTS equ "api-ms-win-gaming-tcui-l1-1-4",\
ShowCustomizeUserProfileUI,\
ShowCustomizeUserProfileUIForUser,\
ShowFindFriendsUI,\
ShowFindFriendsUIForUser,\
ShowGameInfoUI,\
ShowGameInfoUIForUser,\
ShowUserSettingsUI,\
ShowUserSettingsUIForUser

PE.__IMPORTS equ "api-ms-win-mm-time-l1-1-0",\
timeBeginPeriod,\
timeEndPeriod,\
timeGetDevCaps,\
timeGetTime

PE.__IMPORTS equ "api-ms-win-ntuser-sysparams-l1-1-0",\
EnumDisplayDevicesW,\
EnumDisplayMonitors,\
EnumDisplaySettingsExW,\
GetMonitorInfoW,\
GetSystemMetrics,\
SystemParametersInfoW

PE.__IMPORTS equ "api-ms-win-power-base-l1-1-0",\
CallNtPowerInformation

PE.__IMPORTS equ "api-ms-win-power-setting-l1-1-0",\
PowerGetActiveScheme,\
PowerReadACValue,\
PowerSettingRegisterNotification,\
PowerSettingUnregisterNotification

PE.__IMPORTS equ "api-ms-win-ro-typeresolution-l1-1-0",\
RoGetMetaDataFile,\
RoParseTypeName,\
RoResolveNamespace

PE.__IMPORTS equ "api-ms-win-ro-typeresolution-l1-1-1",\
RoCreateNonAgilePropertySet,\
RoCreatePropertySetSerializer,\
RoIsApiContractMajorVersionPresent,\
RoIsApiContractPresent

PE.__IMPORTS equ "api-ms-win-security-appcontainer-l1-1-0",\
GetAppContainerNamedObjectPath

PE.__IMPORTS equ "api-ms-win-security-base-ansi-l1-1-0",\
SetFileSecurityA

PE.__IMPORTS equ "api-ms-win-security-base-l1-1-0",\
AddAccessAllowedAce,\
AddAccessAllowedAceEx,\
AddAce,\
AddMandatoryAce,\
AdjustTokenGroups,\
AdjustTokenPrivileges,\
AllocateAndInitializeSid,\
AllocateLocallyUniqueId,\
CheckTokenMembership,\
CopySid,\
CreateWellKnownSid,\
DeleteAce,\
DuplicateToken,\
DuplicateTokenEx,\
EqualDomainSid,\
EqualSid,\
FreeSid,\
GetAce,\
GetAclInformation,\
GetFileSecurityW,\
GetKernelObjectSecurity,\
GetLengthSid,\
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
GetWindowsAccountDomainSid,\
ImpersonateLoggedOnUser,\
InitializeAcl,\
InitializeSecurityDescriptor,\
InitializeSid,\
IsValidAcl,\
IsValidSecurityDescriptor,\
IsValidSid,\
IsWellKnownSid,\
MakeAbsoluteSD,\
MakeSelfRelativeSD,\
RevertToSelf,\
SetFileSecurityW,\
SetKernelObjectSecurity,\
SetSecurityDescriptorControl,\
SetSecurityDescriptorDacl,\
SetSecurityDescriptorGroup,\
SetSecurityDescriptorOwner,\
SetSecurityDescriptorRMControl,\
SetSecurityDescriptorSacl,\
SetTokenInformation

PE.__IMPORTS equ "api-ms-win-security-base-l1-2-0",\
CheckTokenMembershipEx

PE.__IMPORTS equ "api-ms-win-security-base-l1-2-1",\
CveEventWrite

PE.__IMPORTS equ "api-ms-win-security-base-l1-2-2",\
DeriveCapabilitySidsFromName

PE.__IMPORTS equ "api-ms-win-security-cpwl-l1-1-0",\
CreateProcessWithLogonW

PE.__IMPORTS equ "api-ms-win-security-cryptoapi-l1-1-0",\
CryptAcquireContextA,\
CryptAcquireContextW,\
CryptCreateHash,\
CryptDecrypt,\
CryptDeriveKey,\
CryptDestroyHash,\
CryptDestroyKey,\
CryptDuplicateKey,\
CryptEncrypt,\
CryptEnumProvidersA,\
CryptEnumProvidersW,\
CryptExportKey,\
CryptGenKey,\
CryptGenRandom,\
CryptGetDefaultProviderA,\
CryptGetDefaultProviderW,\
CryptGetHashParam,\
CryptGetKeyParam,\
CryptGetProvParam,\
CryptGetUserKey,\
CryptHashData,\
CryptImportKey,\
CryptReleaseContext,\
CryptSetHashParam,\
CryptSetKeyParam,\
CryptSetProviderW,\
CryptSetProvParam,\
CryptSignHashA,\
CryptSignHashW,\
CryptVerifySignatureA,\
CryptVerifySignatureW

PE.__IMPORTS equ "api-ms-win-security-isolatedcontainer-l1-1-0",\
IsProcessInIsolatedContainer

PE.__IMPORTS equ "api-ms-win-security-lsalookup-ansi-l2-1-0",\
LookupAccountNameA,\
LookupAccountSidA,\
LookupPrivilegeDisplayNameA,\
LookupPrivilegeNameA,\
LookupPrivilegeValueA

PE.__IMPORTS equ "api-ms-win-security-lsalookup-l2-1-0",\
LookupAccountNameW,\
LookupAccountSidW,\
LookupPrivilegeDisplayNameW,\
LookupPrivilegeNameW,\
LookupPrivilegeValueW

PE.__IMPORTS equ "api-ms-win-security-lsapolicy-l1-1-0",\
LsaClose,\
LsaFreeMemory,\
LsaLookupNames2,\
LsaLookupSids,\
LsaOpenPolicy

PE.__IMPORTS equ "api-ms-win-security-provider-ansi-l1-1-0",\
GetExplicitEntriesFromAclA,\
GetNamedSecurityInfoA,\
SetEntriesInAclA,\
SetNamedSecurityInfoA

PE.__IMPORTS equ "api-ms-win-security-provider-l1-1-0",\
GetExplicitEntriesFromAclW,\
GetNamedSecurityInfoW,\
GetSecurityInfo,\
SetEntriesInAclW,\
SetNamedSecurityInfoW,\
SetSecurityInfo

PE.__IMPORTS equ "api-ms-win-security-sddl-ansi-l1-1-0",\
ConvertSidToStringSidA,\
ConvertStringSidToSidA

PE.__IMPORTS equ "api-ms-win-security-sddl-l1-1-0",\
ConvertSecurityDescriptorToStringSecurityDescriptorW,\
ConvertSidToStringSidW,\
ConvertStringSecurityDescriptorToSecurityDescriptorW,\
ConvertStringSidToSidW

PE.__IMPORTS equ "api-ms-win-security-systemfunctions-l1-1-0",\
SystemFunction036

PE.__IMPORTS equ "api-ms-win-service-core-l1-1-0",\
RegisterServiceCtrlHandlerExW

PE.__IMPORTS equ "api-ms-win-service-management-l1-1-0",\
OpenSCManagerW

PE.__IMPORTS equ "api-ms-win-service-winsvc-l1-1-0",\
OpenSCManagerA,\
RegisterServiceCtrlHandlerA,\
RegisterServiceCtrlHandlerExA,\
RegisterServiceCtrlHandlerW

PE.__IMPORTS equ "api-ms-win-shcore-obsolete-l1-1-0",\
CommandLineToArgvW

PE.__IMPORTS equ "api-ms-win-shcore-stream-winrt-l1-1-0",\
CreateRandomAccessStreamOnFile,\
CreateRandomAccessStreamOverStream,\
CreateStreamOverRandomAccessStream

PE.__IMPORTS equ "bcrypt",\
BCryptCloseAlgorithmProvider,\
BCryptCreateHash,\
BCryptCreateMultiHash,\
BCryptDecrypt,\
BCryptDeriveKey,\
BCryptDeriveKeyCapi,\
BCryptDeriveKeyPBKDF2,\
BCryptDestroyHash,\
BCryptDestroyKey,\
BCryptDestroySecret,\
BCryptDuplicateHash,\
BCryptDuplicateKey,\
BCryptEncrypt,\
BCryptEnumAlgorithms,\
BCryptEnumProviders,\
BCryptExportKey,\
BCryptFinalizeKeyPair,\
BCryptFinishHash,\
BCryptFreeBuffer,\
BCryptGenerateKeyPair,\
BCryptGenerateSymmetricKey,\
BCryptGenRandom,\
BCryptGetFipsAlgorithmMode,\
BCryptGetProperty,\
BCryptHash,\
BCryptHashData,\
BCryptImportKey,\
BCryptImportKeyPair,\
BCryptKeyDerivation,\
BCryptOpenAlgorithmProvider,\
BCryptProcessMultiOperations,\
BCryptSecretAgreement,\
BCryptSetProperty,\
BCryptSignHash,\
BCryptVerifySignature

PE.__IMPORTS equ "chakra",\
JsAddRef,\
JsBooleanToBool,\
JsBoolToBoolean,\
JsCallFunction,\
JsCollectGarbage,\
JsConstructObject,\
JsConvertValueToBoolean,\
JsConvertValueToNumber,\
JsConvertValueToObject,\
JsConvertValueToString,\
JsCreateArray,\
JsCreateArrayBuffer,\
JsCreateContext,\
JsCreateDataView,\
JsCreateError,\
JsCreateExternalArrayBuffer,\
JsCreateExternalObject,\
JsCreateFunction,\
JsCreateNamedFunction,\
JsCreateObject,\
JsCreateRangeError,\
JsCreateReferenceError,\
JsCreateRuntime,\
JsCreateSymbol,\
JsCreateSyntaxError,\
JsCreateTypedArray,\
JsCreateTypeError,\
JsCreateURIError,\
JsDefineProperty,\
JsDeleteIndexedProperty,\
JsDeleteProperty,\
JsDisableRuntimeExecution,\
JsDisposeRuntime,\
JsDoubleToNumber,\
JsEnableRuntimeExecution,\
JsEquals,\
JsGetAndClearException,\
JsGetArrayBufferStorage,\
JsGetContextData,\
JsGetContextOfObject,\
JsGetCurrentContext,\
JsGetDataViewStorage,\
JsGetExtensionAllowed,\
JsGetExternalData,\
JsGetFalseValue,\
JsGetGlobalObject,\
JsGetIndexedPropertiesExternalData,\
JsGetIndexedProperty,\
JsGetNullValue,\
JsGetOwnPropertyDescriptor,\
JsGetOwnPropertyNames,\
JsGetOwnPropertySymbols,\
JsGetProperty,\
JsGetPropertyIdFromName,\
JsGetPropertyIdFromSymbol,\
JsGetPropertyIdType,\
JsGetPropertyNameFromId,\
JsGetPrototype,\
JsGetRuntime,\
JsGetRuntimeMemoryLimit,\
JsGetRuntimeMemoryUsage,\
JsGetStringLength,\
JsGetSymbolFromPropertyId,\
JsGetTrueValue,\
JsGetTypedArrayInfo,\
JsGetTypedArrayStorage,\
JsGetUndefinedValue,\
JsGetValueType,\
JsHasException,\
JsHasExternalData,\
JsHasIndexedPropertiesExternalData,\
JsHasIndexedProperty,\
JsHasProperty,\
JsIdle,\
JsInspectableToObject,\
JsInstanceOf,\
JsIntToNumber,\
JsIsRuntimeExecutionDisabled,\
JsNumberToDouble,\
JsNumberToInt,\
JsObjectToInspectable,\
JsParseScript,\
JsParseSerializedScript,\
JsParseSerializedScriptWithCallback,\
JsPointerToString,\
JsPreventExtension,\
JsRelease,\
JsRunScript,\
JsRunSerializedScript,\
JsRunSerializedScriptWithCallback,\
JsSerializeScript,\
JsSetContextData,\
JsSetCurrentContext,\
JsSetException,\
JsSetExternalData,\
JsSetIndexedPropertiesToExternalData,\
JsSetIndexedProperty,\
JsSetObjectBeforeCollectCallback,\
JsSetPromiseContinuationCallback,\
JsSetProperty,\
JsSetPrototype,\
JsSetRuntimeBeforeCollectCallback,\
JsSetRuntimeMemoryAllocationCallback,\
JsSetRuntimeMemoryLimit,\
JsStartDebugging,\
JsStrictEquals,\
JsStringToPointer,\
JsValueToVariant,\
JsVariantToValue

PE.__IMPORTS equ "d3d11",\
CreateDirect3D11DeviceFromDXGIDevice,\
CreateDirect3D11SurfaceFromDXGISurface,\
D3D11CreateDevice,\
D3D11On12CreateDevice

PE.__IMPORTS equ "d3d12",\
D3D12CreateRootSignatureDeserializer,\
D3D12CreateVersionedRootSignatureDeserializer,\
D3D12EnableExperimentalFeatures,\
D3D12SerializeRootSignature,\
D3D12SerializeVersionedRootSignature

PE.__IMPORTS equ "deviceaccess",\
CreateDeviceAccessInstance

PE.__IMPORTS equ "dhcpcsvc",\
DhcpCApiCleanup,\
DhcpCApiInitialize,\
DhcpRequestParams

PE.__IMPORTS equ "dhcpcsvc6",\
Dhcpv6CApiCleanup,\
Dhcpv6CApiInitialize,\
Dhcpv6RequestParams

PE.__IMPORTS equ "dxgi",\
CreateDXGIFactory1,\
CreateDXGIFactory2

PE.__IMPORTS equ "ext-ms-win-core-iuri-l1-1-0",\
CreateUri,\
CreateUriWithFragment

PE.__IMPORTS equ "ext-ms-win-dxcore-l1-1-0",\
DXCoreCreateAdapterFactory

PE.__IMPORTS equ "ext-ms-win-networking-wlanapi-l1-1-0",\
WlanCloseHandle,\
WlanDeleteProfile,\
WlanEnumInterfaces,\
WlanFreeMemory,\
WlanGetAvailableNetworkList,\
WlanGetProfile,\
WlanGetProfileList,\
WlanOpenHandle,\
WlanQueryInterface,\
WlanReasonCodeToString,\
WlanSetProfile

PE.__IMPORTS equ "ext-ms-win-resourcemanager-activitycoordinator-l1-1-0",\
CreateActivityCoordinatorPolicy,\
DestroyActivityCoordinatorPolicy,\
GetActivityCoordinatorPolicyResourceCondition,\
SetActivityCoordinatorPolicyResourceCondition,\
SubscribeActivityCoordinatorPolicy,\
UnsubscribeActivityCoordinatorPolicy

PE.__IMPORTS equ "ext-ms-win-uiacore-l1-1-0",\
UiaHostProviderFromHwnd,\
UiaReturnRawElementProvider

PE.__IMPORTS equ "ext-ms-win-uiacore-l1-1-1",\
UiaClientsAreListening,\
UiaDisconnectProvider,\
UiaGetReservedMixedAttributeValue,\
UiaGetReservedNotSupportedValue,\
UiaRaiseAutomationEvent,\
UiaRaiseAutomationPropertyChangedEvent,\
UiaRaiseStructureChangedEvent

PE.__IMPORTS equ "ext-ms-win-uiacore-l1-1-2",\
UiaDisconnectAllProviders,\
UiaRaiseTextEditTextChangedEvent

PE.__IMPORTS equ "ext-ms-win-uiacore-l1-1-3",\
UiaRaiseChangesEvent

PE.__IMPORTS equ "icu",\
u_austrcpy,\
u_austrncpy,\
u_catclose,\
u_catgets,\
u_catopen,\
u_charAge,\
u_charDigitValue,\
u_charDirection,\
u_charFromName,\
u_charMirror,\
u_charName,\
u_charsToUChars,\
u_charType,\
u_cleanup,\
u_countChar32,\
u_digit,\
u_enumCharNames,\
u_enumCharTypes,\
u_errorName,\
u_foldCase,\
u_forDigit,\
u_formatMessage,\
u_formatMessageWithError,\
u_getBidiPairedBracket,\
u_getBinaryPropertySet,\
u_getCombiningClass,\
u_getDataVersion,\
u_getFC_NFKC_Closure,\
u_getIntPropertyMap,\
u_getIntPropertyMaxValue,\
u_getIntPropertyMinValue,\
u_getIntPropertyValue,\
u_getNumericValue,\
u_getPropertyEnum,\
u_getPropertyName,\
u_getPropertyValueEnum,\
u_getPropertyValueName,\
u_getUnicodeVersion,\
u_getVersion,\
u_hasBinaryProperty,\
u_init,\
u_isalnum,\
u_isalpha,\
u_isbase,\
u_isblank,\
u_iscntrl,\
u_isdefined,\
u_isdigit,\
u_isgraph,\
u_isIDIgnorable,\
u_isIDPart,\
u_isIDStart,\
u_isISOControl,\
u_isJavaIDPart,\
u_isJavaIDStart,\
u_isJavaSpaceChar,\
u_islower,\
u_isMirrored,\
u_isprint,\
u_ispunct,\
u_isspace,\
u_istitle,\
u_isUAlphabetic,\
u_isULowercase,\
u_isupper,\
u_isUUppercase,\
u_isUWhiteSpace,\
u_isWhitespace,\
u_isxdigit,\
u_memcasecmp,\
u_memchr,\
u_memchr32,\
u_memcmp,\
u_memcmpCodePointOrder,\
u_memcpy,\
u_memmove,\
u_memrchr,\
u_memrchr32,\
u_memset,\
u_parseMessage,\
u_parseMessageWithError,\
u_setMemoryFunctions,\
u_shapeArabic,\
u_strcasecmp,\
u_strCaseCompare,\
u_strcat,\
u_strchr,\
u_strchr32,\
u_strcmp,\
u_strcmpCodePointOrder,\
u_strCompare,\
u_strCompareIter,\
u_strcpy,\
u_strcspn,\
u_strFindFirst,\
u_strFindLast,\
u_strFoldCase,\
u_strFromJavaModifiedUTF8WithSub,\
u_strFromUTF32,\
u_strFromUTF32WithSub,\
u_strFromUTF8,\
u_strFromUTF8Lenient,\
u_strFromUTF8WithSub,\
u_strFromWCS,\
u_strHasMoreChar32Than,\
u_strlen,\
u_strncasecmp,\
u_strncat,\
u_strncmp,\
u_strncmpCodePointOrder,\
u_strncpy,\
u_strpbrk,\
u_strrchr,\
u_strrchr32,\
u_strrstr,\
u_strspn,\
u_strstr,\
u_strToJavaModifiedUTF8,\
u_strtok_r,\
u_strToLower,\
u_strToTitle,\
u_strToUpper,\
u_strToUTF32,\
u_strToUTF32WithSub,\
u_strToUTF8,\
u_strToUTF8WithSub,\
u_strToWCS,\
u_tolower,\
u_totitle,\
u_toupper,\
u_uastrcpy,\
u_uastrncpy,\
u_UCharsToChars,\
u_unescape,\
u_unescapeAt,\
u_versionFromString,\
u_versionFromUString,\
u_versionToString,\
u_vformatMessage,\
u_vformatMessageWithError,\
u_vparseMessage,\
u_vparseMessageWithError,\
ubidi_close,\
ubidi_countParagraphs,\
ubidi_countRuns,\
ubidi_getBaseDirection,\
ubidi_getClassCallback,\
ubidi_getCustomizedClass,\
ubidi_getDirection,\
ubidi_getLength,\
ubidi_getLevelAt,\
ubidi_getLevels,\
ubidi_getLogicalIndex,\
ubidi_getLogicalMap,\
ubidi_getLogicalRun,\
ubidi_getParagraph,\
ubidi_getParagraphByIndex,\
ubidi_getParaLevel,\
ubidi_getProcessedLength,\
ubidi_getReorderingMode,\
ubidi_getReorderingOptions,\
ubidi_getResultLength,\
ubidi_getText,\
ubidi_getVisualIndex,\
ubidi_getVisualMap,\
ubidi_getVisualRun,\
ubidi_invertMap,\
ubidi_isInverse,\
ubidi_isOrderParagraphsLTR,\
ubidi_open,\
ubidi_openSized,\
ubidi_orderParagraphsLTR,\
ubidi_reorderLogical,\
ubidi_reorderVisual,\
ubidi_setClassCallback,\
ubidi_setContext,\
ubidi_setInverse,\
ubidi_setLine,\
ubidi_setPara,\
ubidi_setReorderingMode,\
ubidi_setReorderingOptions,\
ubidi_writeReordered,\
ubidi_writeReverse,\
ubiditransform_close,\
ubiditransform_open,\
ubiditransform_transform,\
ublock_getCode,\
ubrk_close,\
ubrk_countAvailable,\
ubrk_current,\
ubrk_first,\
ubrk_following,\
ubrk_getAvailable,\
ubrk_getBinaryRules,\
ubrk_getLocaleByType,\
ubrk_getRuleStatus,\
ubrk_getRuleStatusVec,\
ubrk_isBoundary,\
ubrk_last,\
ubrk_next,\
ubrk_open,\
ubrk_openBinaryRules,\
ubrk_openRules,\
ubrk_preceding,\
ubrk_previous,\
ubrk_refreshUText,\
ubrk_safeClone,\
ubrk_setText,\
ubrk_setUText,\
ucal_add,\
ucal_clear,\
ucal_clearField,\
ucal_clone,\
ucal_close,\
ucal_countAvailable,\
ucal_equivalentTo,\
ucal_get,\
ucal_getAttribute,\
ucal_getAvailable,\
ucal_getCanonicalTimeZoneID,\
ucal_getDayOfWeekType,\
ucal_getDefaultTimeZone,\
ucal_getDSTSavings,\
ucal_getFieldDifference,\
ucal_getGregorianChange,\
ucal_getHostTimeZone,\
ucal_getKeywordValuesForLocale,\
ucal_getLimit,\
ucal_getLocaleByType,\
ucal_getMillis,\
ucal_getNow,\
ucal_getTimeZoneDisplayName,\
ucal_getTimeZoneID,\
ucal_getTimeZoneIDForWindowsID,\
ucal_getTimeZoneTransitionDate,\
ucal_getType,\
ucal_getTZDataVersion,\
ucal_getWeekendTransition,\
ucal_getWindowsTimeZoneID,\
ucal_inDaylightTime,\
ucal_isSet,\
ucal_isWeekend,\
ucal_open,\
ucal_openCountryTimeZones,\
ucal_openTimeZoneIDEnumeration,\
ucal_openTimeZones,\
ucal_roll,\
ucal_set,\
ucal_setAttribute,\
ucal_setDate,\
ucal_setDateTime,\
ucal_setDefaultTimeZone,\
ucal_setGregorianChange,\
ucal_setMillis,\
ucal_setTimeZone,\
ucasemap_close,\
ucasemap_getBreakIterator,\
ucasemap_getLocale,\
ucasemap_getOptions,\
ucasemap_open,\
ucasemap_setBreakIterator,\
ucasemap_setLocale,\
ucasemap_setOptions,\
ucasemap_toTitle,\
ucasemap_utf8FoldCase,\
ucasemap_utf8ToLower,\
ucasemap_utf8ToTitle,\
ucasemap_utf8ToUpper,\
ucfpos_close,\
ucfpos_constrainCategory,\
ucfpos_constrainField,\
ucfpos_getCategory,\
ucfpos_getField,\
ucfpos_getIndexes,\
ucfpos_getInt64IterationContext,\
ucfpos_matchesField,\
ucfpos_open,\
ucfpos_reset,\
ucfpos_setInt64IterationContext,\
ucfpos_setState,\
ucnv_cbFromUWriteBytes,\
ucnv_cbFromUWriteSub,\
ucnv_cbFromUWriteUChars,\
ucnv_cbToUWriteSub,\
ucnv_cbToUWriteUChars,\
ucnv_close,\
ucnv_compareNames,\
ucnv_convert,\
ucnv_convertEx,\
ucnv_countAliases,\
ucnv_countAvailable,\
ucnv_countStandards,\
ucnv_detectUnicodeSignature,\
ucnv_fixFileSeparator,\
ucnv_flushCache,\
UCNV_FROM_U_CALLBACK_ESCAPE,\
UCNV_FROM_U_CALLBACK_SKIP,\
UCNV_FROM_U_CALLBACK_STOP,\
UCNV_FROM_U_CALLBACK_SUBSTITUTE,\
ucnv_fromAlgorithmic,\
ucnv_fromUChars,\
ucnv_fromUCountPending,\
ucnv_fromUnicode,\
ucnv_getAlias,\
ucnv_getAliases,\
ucnv_getAvailableName,\
ucnv_getCanonicalName,\
ucnv_getCCSID,\
ucnv_getDefaultName,\
ucnv_getDisplayName,\
ucnv_getFromUCallBack,\
ucnv_getInvalidChars,\
ucnv_getInvalidUChars,\
ucnv_getMaxCharSize,\
ucnv_getMinCharSize,\
ucnv_getName,\
ucnv_getNextUChar,\
ucnv_getPlatform,\
ucnv_getStandard,\
ucnv_getStandardName,\
ucnv_getStarters,\
ucnv_getSubstChars,\
ucnv_getToUCallBack,\
ucnv_getType,\
ucnv_getUnicodeSet,\
ucnv_isAmbiguous,\
ucnv_isFixedWidth,\
ucnv_open,\
ucnv_openAllNames,\
ucnv_openCCSID,\
ucnv_openPackage,\
ucnv_openStandardNames,\
ucnv_openU,\
ucnv_reset,\
ucnv_resetFromUnicode,\
ucnv_resetToUnicode,\
ucnv_safeClone,\
ucnv_setDefaultName,\
ucnv_setFallback,\
ucnv_setFromUCallBack,\
ucnv_setSubstChars,\
ucnv_setSubstString,\
ucnv_setToUCallBack,\
UCNV_TO_U_CALLBACK_ESCAPE,\
UCNV_TO_U_CALLBACK_SKIP,\
UCNV_TO_U_CALLBACK_STOP,\
UCNV_TO_U_CALLBACK_SUBSTITUTE,\
ucnv_toAlgorithmic,\
ucnv_toUChars,\
ucnv_toUCountPending,\
ucnv_toUnicode,\
ucnv_usesFallback,\
ucnvsel_close,\
ucnvsel_open,\
ucnvsel_openFromSerialized,\
ucnvsel_selectForString,\
ucnvsel_selectForUTF8,\
ucnvsel_serialize,\
ucol_cloneBinary,\
ucol_close,\
ucol_closeElements,\
ucol_countAvailable,\
ucol_equal,\
ucol_getAttribute,\
ucol_getAvailable,\
ucol_getBound,\
ucol_getContractionsAndExpansions,\
ucol_getDisplayName,\
ucol_getEquivalentReorderCodes,\
ucol_getFunctionalEquivalent,\
ucol_getKeywords,\
ucol_getKeywordValues,\
ucol_getKeywordValuesForLocale,\
ucol_getLocaleByType,\
ucol_getMaxExpansion,\
ucol_getMaxVariable,\
ucol_getOffset,\
ucol_getReorderCodes,\
ucol_getRules,\
ucol_getRulesEx,\
ucol_getSortKey,\
ucol_getStrength,\
ucol_getTailoredSet,\
ucol_getUCAVersion,\
ucol_getVariableTop,\
ucol_getVersion,\
ucol_greater,\
ucol_greaterOrEqual,\
ucol_keyHashCode,\
ucol_mergeSortkeys,\
ucol_next,\
ucol_nextSortKeyPart,\
ucol_open,\
ucol_openAvailableLocales,\
ucol_openBinary,\
ucol_openElements,\
ucol_openRules,\
ucol_previous,\
ucol_primaryOrder,\
ucol_reset,\
ucol_safeClone,\
ucol_secondaryOrder,\
ucol_setAttribute,\
ucol_setMaxVariable,\
ucol_setOffset,\
ucol_setReorderCodes,\
ucol_setStrength,\
ucol_setText,\
ucol_strcoll,\
ucol_strcollIter,\
ucol_strcollUTF8,\
ucol_tertiaryOrder,\
ucpmap_get,\
ucpmap_getRange,\
ucptrie_close,\
ucptrie_get,\
ucptrie_getRange,\
ucptrie_getType,\
ucptrie_getValueWidth,\
ucptrie_internalSmallIndex,\
ucptrie_internalSmallU8Index,\
ucptrie_internalU8PrevIndex,\
ucptrie_openFromBinary,\
ucptrie_toBinary,\
ucsdet_close,\
ucsdet_detect,\
ucsdet_detectAll,\
ucsdet_enableInputFilter,\
ucsdet_getAllDetectableCharsets,\
ucsdet_getConfidence,\
ucsdet_getLanguage,\
ucsdet_getName,\
ucsdet_getUChars,\
ucsdet_isInputFilterEnabled,\
ucsdet_open,\
ucsdet_setDeclaredEncoding,\
ucsdet_setText,\
ucurr_countCurrencies,\
ucurr_forLocale,\
ucurr_forLocaleAndDate,\
ucurr_getDefaultFractionDigits,\
ucurr_getDefaultFractionDigitsForUsage,\
ucurr_getKeywordValuesForLocale,\
ucurr_getName,\
ucurr_getNumericCode,\
ucurr_getPluralName,\
ucurr_getRoundingIncrement,\
ucurr_getRoundingIncrementForUsage,\
ucurr_isAvailable,\
ucurr_openISOCurrencies,\
ucurr_register,\
ucurr_unregister,\
udat_adoptNumberFormat,\
udat_adoptNumberFormatForFields,\
udat_applyPattern,\
udat_clone,\
udat_close,\
udat_countAvailable,\
udat_countSymbols,\
udat_format,\
udat_formatCalendar,\
udat_formatCalendarForFields,\
udat_formatForFields,\
udat_get2DigitYearStart,\
udat_getAvailable,\
udat_getBooleanAttribute,\
udat_getCalendar,\
udat_getContext,\
udat_getLocaleByType,\
udat_getNumberFormat,\
udat_getNumberFormatForField,\
udat_getSymbols,\
udat_isLenient,\
udat_open,\
udat_parse,\
udat_parseCalendar,\
udat_set2DigitYearStart,\
udat_setBooleanAttribute,\
udat_setCalendar,\
udat_setContext,\
udat_setLenient,\
udat_setNumberFormat,\
udat_setSymbols,\
udat_toCalendarDateField,\
udat_toPattern,\
udatpg_addPattern,\
udatpg_clone,\
udatpg_close,\
udatpg_getAppendItemFormat,\
udatpg_getAppendItemName,\
udatpg_getBaseSkeleton,\
udatpg_getBestPattern,\
udatpg_getBestPatternWithOptions,\
udatpg_getDateTimeFormat,\
udatpg_getDecimal,\
udatpg_getFieldDisplayName,\
udatpg_getPatternForSkeleton,\
udatpg_getSkeleton,\
udatpg_open,\
udatpg_openBaseSkeletons,\
udatpg_openEmpty,\
udatpg_openSkeletons,\
udatpg_replaceFieldTypes,\
udatpg_replaceFieldTypesWithOptions,\
udatpg_setAppendItemFormat,\
udatpg_setAppendItemName,\
udatpg_setDateTimeFormat,\
udatpg_setDecimal,\
udtitvfmt_close,\
udtitvfmt_closeResult,\
udtitvfmt_format,\
udtitvfmt_open,\
udtitvfmt_openResult,\
udtitvfmt_resultAsValue,\
uenum_close,\
uenum_count,\
uenum_next,\
uenum_openCharStringsEnumeration,\
uenum_openUCharStringsEnumeration,\
uenum_reset,\
uenum_unext,\
ufieldpositer_close,\
ufieldpositer_next,\
ufieldpositer_open,\
ufmt_close,\
ufmt_getArrayItemByIndex,\
ufmt_getArrayLength,\
ufmt_getDate,\
ufmt_getDecNumChars,\
ufmt_getDouble,\
ufmt_getInt64,\
ufmt_getLong,\
ufmt_getObject,\
ufmt_getType,\
ufmt_getUChars,\
ufmt_isNumeric,\
ufmt_open,\
ufmtval_getString,\
ufmtval_nextPosition,\
ugender_getInstance,\
ugender_getListGender,\
uidna_close,\
uidna_labelToASCII,\
uidna_labelToASCII_UTF8,\
uidna_labelToUnicode,\
uidna_labelToUnicodeUTF8,\
uidna_nameToASCII,\
uidna_nameToASCII_UTF8,\
uidna_nameToUnicode,\
uidna_nameToUnicodeUTF8,\
uidna_openUTS46,\
uiter_current32,\
uiter_getState,\
uiter_next32,\
uiter_previous32,\
uiter_setState,\
uiter_setString,\
uiter_setUTF16BE,\
uiter_setUTF8,\
uldn_close,\
uldn_getContext,\
uldn_getDialectHandling,\
uldn_getLocale,\
uldn_keyDisplayName,\
uldn_keyValueDisplayName,\
uldn_languageDisplayName,\
uldn_localeDisplayName,\
uldn_open,\
uldn_openForContext,\
uldn_regionDisplayName,\
uldn_scriptCodeDisplayName,\
uldn_scriptDisplayName,\
uldn_variantDisplayName,\
ulistfmt_close,\
ulistfmt_closeResult,\
ulistfmt_format,\
ulistfmt_formatStringsToResult,\
ulistfmt_open,\
ulistfmt_openForType,\
ulistfmt_openResult,\
ulistfmt_resultAsValue,\
uloc_acceptLanguage,\
uloc_acceptLanguageFromHTTP,\
uloc_addLikelySubtags,\
uloc_canonicalize,\
uloc_countAvailable,\
uloc_forLanguageTag,\
uloc_getAvailable,\
uloc_getBaseName,\
uloc_getCharacterOrientation,\
uloc_getCountry,\
uloc_getDefault,\
uloc_getDisplayCountry,\
uloc_getDisplayKeyword,\
uloc_getDisplayKeywordValue,\
uloc_getDisplayLanguage,\
uloc_getDisplayName,\
uloc_getDisplayScript,\
uloc_getDisplayVariant,\
uloc_getISO3Country,\
uloc_getISO3Language,\
uloc_getISOCountries,\
uloc_getISOLanguages,\
uloc_getKeywordValue,\
uloc_getLanguage,\
uloc_getLCID,\
uloc_getLineOrientation,\
uloc_getLocaleForLCID,\
uloc_getName,\
uloc_getParent,\
uloc_getScript,\
uloc_getVariant,\
uloc_isRightToLeft,\
uloc_minimizeSubtags,\
uloc_openAvailableByType,\
uloc_openKeywords,\
uloc_setDefault,\
uloc_setKeywordValue,\
uloc_toLanguageTag,\
uloc_toLegacyKey,\
uloc_toLegacyType,\
uloc_toUnicodeLocaleKey,\
uloc_toUnicodeLocaleType,\
ulocdata_close,\
ulocdata_getCLDRVersion,\
ulocdata_getDelimiter,\
ulocdata_getExemplarSet,\
ulocdata_getLocaleDisplayPattern,\
ulocdata_getLocaleSeparator,\
ulocdata_getMeasurementSystem,\
ulocdata_getNoSubstitute,\
ulocdata_getPaperSize,\
ulocdata_open,\
ulocdata_setNoSubstitute,\
umsg_applyPattern,\
umsg_autoQuoteApostrophe,\
umsg_clone,\
umsg_close,\
umsg_format,\
umsg_getLocale,\
umsg_open,\
umsg_parse,\
umsg_setLocale,\
umsg_toPattern,\
umsg_vformat,\
umsg_vparse,\
umutablecptrie_buildImmutable,\
umutablecptrie_clone,\
umutablecptrie_close,\
umutablecptrie_fromUCPMap,\
umutablecptrie_fromUCPTrie,\
umutablecptrie_get,\
umutablecptrie_getRange,\
umutablecptrie_open,\
umutablecptrie_set,\
umutablecptrie_setRange,\
unorm_compare,\
unorm2_append,\
unorm2_close,\
unorm2_composePair,\
unorm2_getCombiningClass,\
unorm2_getDecomposition,\
unorm2_getInstance,\
unorm2_getNFCInstance,\
unorm2_getNFDInstance,\
unorm2_getNFKCCasefoldInstance,\
unorm2_getNFKCInstance,\
unorm2_getNFKDInstance,\
unorm2_getRawDecomposition,\
unorm2_hasBoundaryAfter,\
unorm2_hasBoundaryBefore,\
unorm2_isInert,\
unorm2_isNormalized,\
unorm2_normalize,\
unorm2_normalizeSecondAndAppend,\
unorm2_openFiltered,\
unorm2_quickCheck,\
unorm2_spanQuickCheckYes,\
unum_applyPattern,\
unum_clone,\
unum_close,\
unum_countAvailable,\
unum_format,\
unum_formatDecimal,\
unum_formatDouble,\
unum_formatDoubleCurrency,\
unum_formatDoubleForFields,\
unum_formatInt64,\
unum_formatUFormattable,\
unum_getAttribute,\
unum_getAvailable,\
unum_getContext,\
unum_getDoubleAttribute,\
unum_getLocaleByType,\
unum_getSymbol,\
unum_getTextAttribute,\
unum_open,\
unum_parse,\
unum_parseDecimal,\
unum_parseDouble,\
unum_parseDoubleCurrency,\
unum_parseInt64,\
unum_parseToUFormattable,\
unum_setAttribute,\
unum_setContext,\
unum_setDoubleAttribute,\
unum_setSymbol,\
unum_setTextAttribute,\
unum_toPattern,\
unumf_close,\
unumf_closeResult,\
unumf_formatDecimal,\
unumf_formatDouble,\
unumf_formatInt,\
unumf_openForSkeletonAndLocale,\
unumf_openForSkeletonAndLocaleWithError,\
unumf_openResult,\
unumf_resultAsValue,\
unumf_resultGetAllFieldPositions,\
unumf_resultNextFieldPosition,\
unumf_resultToString,\
unumsys_close,\
unumsys_getDescription,\
unumsys_getName,\
unumsys_getRadix,\
unumsys_isAlgorithmic,\
unumsys_open,\
unumsys_openAvailableNames,\
unumsys_openByName,\
uplrules_close,\
uplrules_getKeywords,\
uplrules_open,\
uplrules_openForType,\
uplrules_select,\
uplrules_selectFormatted,\
uregex_appendReplacement,\
uregex_appendReplacementUText,\
uregex_appendTail,\
uregex_appendTailUText,\
uregex_clone,\
uregex_close,\
uregex_end,\
uregex_end64,\
uregex_find,\
uregex_find64,\
uregex_findNext,\
uregex_flags,\
uregex_getFindProgressCallback,\
uregex_getMatchCallback,\
uregex_getStackLimit,\
uregex_getText,\
uregex_getTimeLimit,\
uregex_getUText,\
uregex_group,\
uregex_groupCount,\
uregex_groupNumberFromCName,\
uregex_groupNumberFromName,\
uregex_groupUText,\
uregex_hasAnchoringBounds,\
uregex_hasTransparentBounds,\
uregex_hitEnd,\
uregex_lookingAt,\
uregex_lookingAt64,\
uregex_matches,\
uregex_matches64,\
uregex_open,\
uregex_openC,\
uregex_openUText,\
uregex_pattern,\
uregex_patternUText,\
uregex_refreshUText,\
uregex_regionEnd,\
uregex_regionEnd64,\
uregex_regionStart,\
uregex_regionStart64,\
uregex_replaceAll,\
uregex_replaceAllUText,\
uregex_replaceFirst,\
uregex_replaceFirstUText,\
uregex_requireEnd,\
uregex_reset,\
uregex_reset64,\
uregex_setFindProgressCallback,\
uregex_setMatchCallback,\
uregex_setRegion,\
uregex_setRegion64,\
uregex_setRegionAndStart,\
uregex_setStackLimit,\
uregex_setText,\
uregex_setTimeLimit,\
uregex_setUText,\
uregex_split,\
uregex_splitUText,\
uregex_start,\
uregex_start64,\
uregex_useAnchoringBounds,\
uregex_useTransparentBounds,\
uregion_areEqual,\
uregion_contains,\
uregion_getAvailable,\
uregion_getContainedRegions,\
uregion_getContainedRegionsOfType,\
uregion_getContainingRegion,\
uregion_getContainingRegionOfType,\
uregion_getNumericCode,\
uregion_getPreferredValues,\
uregion_getRegionCode,\
uregion_getRegionFromCode,\
uregion_getRegionFromNumericCode,\
uregion_getType,\
ureldatefmt_close,\
ureldatefmt_closeResult,\
ureldatefmt_combineDateAndTime,\
ureldatefmt_format,\
ureldatefmt_formatNumeric,\
ureldatefmt_formatNumericToResult,\
ureldatefmt_formatToResult,\
ureldatefmt_open,\
ureldatefmt_openResult,\
ureldatefmt_resultAsValue,\
ures_close,\
ures_getBinary,\
ures_getByIndex,\
ures_getByKey,\
ures_getInt,\
ures_getIntVector,\
ures_getKey,\
ures_getLocaleByType,\
ures_getNextResource,\
ures_getNextString,\
ures_getSize,\
ures_getString,\
ures_getStringByIndex,\
ures_getStringByKey,\
ures_getType,\
ures_getUInt,\
ures_getUTF8String,\
ures_getUTF8StringByIndex,\
ures_getUTF8StringByKey,\
ures_getVersion,\
ures_hasNext,\
ures_open,\
ures_openAvailableLocales,\
ures_openDirect,\
ures_openU,\
ures_resetIterator,\
uscript_breaksBetweenLetters,\
uscript_getCode,\
uscript_getName,\
uscript_getSampleString,\
uscript_getScript,\
uscript_getScriptExtensions,\
uscript_getShortName,\
uscript_getUsage,\
uscript_hasScript,\
uscript_isCased,\
uscript_isRightToLeft,\
usearch_close,\
usearch_first,\
usearch_following,\
usearch_getAttribute,\
usearch_getBreakIterator,\
usearch_getCollator,\
usearch_getMatchedLength,\
usearch_getMatchedStart,\
usearch_getMatchedText,\
usearch_getOffset,\
usearch_getPattern,\
usearch_getText,\
usearch_last,\
usearch_next,\
usearch_open,\
usearch_openFromCollator,\
usearch_preceding,\
usearch_previous,\
usearch_reset,\
usearch_setAttribute,\
usearch_setBreakIterator,\
usearch_setCollator,\
usearch_setOffset,\
usearch_setPattern,\
usearch_setText,\
uset_add,\
uset_addAll,\
uset_addAllCodePoints,\
uset_addRange,\
uset_addString,\
uset_applyIntPropertyValue,\
uset_applyPattern,\
uset_applyPropertyAlias,\
uset_charAt,\
uset_clear,\
uset_clone,\
uset_cloneAsThawed,\
uset_close,\
uset_closeOver,\
uset_compact,\
uset_complement,\
uset_complementAll,\
uset_contains,\
uset_containsAll,\
uset_containsAllCodePoints,\
uset_containsNone,\
uset_containsRange,\
uset_containsSome,\
uset_containsString,\
uset_equals,\
uset_freeze,\
uset_getItem,\
uset_getItemCount,\
uset_getSerializedRange,\
uset_getSerializedRangeCount,\
uset_getSerializedSet,\
uset_indexOf,\
uset_isEmpty,\
uset_isFrozen,\
uset_open,\
uset_openEmpty,\
uset_openPattern,\
uset_openPatternOptions,\
uset_remove,\
uset_removeAll,\
uset_removeAllStrings,\
uset_removeRange,\
uset_removeString,\
uset_resemblesPattern,\
uset_retain,\
uset_retainAll,\
uset_serialize,\
uset_serializedContains,\
uset_set,\
uset_setSerializedToOne,\
uset_size,\
uset_span,\
uset_spanBack,\
uset_spanBackUTF8,\
uset_spanUTF8,\
uset_toPattern,\
uspoof_areConfusable,\
uspoof_areConfusableUTF8,\
uspoof_check,\
uspoof_check2,\
uspoof_check2UTF8,\
uspoof_checkUTF8,\
uspoof_clone,\
uspoof_close,\
uspoof_closeCheckResult,\
uspoof_getAllowedChars,\
uspoof_getAllowedLocales,\
uspoof_getCheckResultChecks,\
uspoof_getCheckResultNumerics,\
uspoof_getCheckResultRestrictionLevel,\
uspoof_getChecks,\
uspoof_getInclusionSet,\
uspoof_getRecommendedSet,\
uspoof_getRestrictionLevel,\
uspoof_getSkeleton,\
uspoof_getSkeletonUTF8,\
uspoof_open,\
uspoof_openCheckResult,\
uspoof_openFromSerialized,\
uspoof_openFromSource,\
uspoof_serialize,\
uspoof_setAllowedChars,\
uspoof_setAllowedLocales,\
uspoof_setChecks,\
uspoof_setRestrictionLevel,\
usprep_close,\
usprep_open,\
usprep_openByType,\
usprep_prepare,\
utext_char32At,\
utext_clone,\
utext_close,\
utext_copy,\
utext_current32,\
utext_equals,\
utext_extract,\
utext_freeze,\
utext_getNativeIndex,\
utext_getPreviousNativeIndex,\
utext_hasMetaData,\
utext_isLengthExpensive,\
utext_isWritable,\
utext_moveIndex32,\
utext_nativeLength,\
utext_next32,\
utext_next32From,\
utext_openUChars,\
utext_openUTF8,\
utext_previous32,\
utext_previous32From,\
utext_replace,\
utext_setNativeIndex,\
utext_setup,\
utf8_appendCharSafeBody,\
utf8_back1SafeBody,\
utf8_nextCharSafeBody,\
utf8_prevCharSafeBody,\
utmscale_fromInt64,\
utmscale_getTimeScaleValue,\
utmscale_toInt64,\
utrace_format,\
utrace_functionName,\
utrace_getFunctions,\
utrace_getLevel,\
utrace_setFunctions,\
utrace_setLevel,\
utrace_vformat,\
utrans_clone,\
utrans_close,\
utrans_countAvailableIDs,\
utrans_getSourceSet,\
utrans_getUnicodeID,\
utrans_openIDs,\
utrans_openInverse,\
utrans_openU,\
utrans_register,\
utrans_setFilter,\
utrans_toRules,\
utrans_trans,\
utrans_transIncremental,\
utrans_transIncrementalUChars,\
utrans_transUChars,\
utrans_unregisterID

PE.__IMPORTS equ "inkobjcore",\
AddStroke,\
AddWordsToWordList,\
AdviseInkChange,\
CreateContext,\
CreateRecognizer,\
DestroyContext,\
DestroyRecognizer,\
DestroyWordList,\
EndInkInput,\
GetAllRecognizers,\
GetBestResultString,\
GetLatticePtr,\
GetLeftSeparator,\
GetRecoAttributes,\
GetResultPropertyList,\
GetRightSeparator,\
GetUnicodeRanges,\
IsStringSupported,\
LoadCachedAttributes,\
MakeWordList,\
Process,\
SetEnabledUnicodeRanges,\
SetFactoid,\
SetFlags,\
SetGuide,\
SetTextContext,\
SetWordList

PE.__IMPORTS equ "mscms",\
InstallColorProfileW,\
InstallColorProfileA

PE.__IMPORTS equ "ncrypt",\
NCryptCloseProtectionDescriptor,\
NCryptCreateClaim,\
NCryptCreatePersistedKey,\
NCryptCreateProtectionDescriptor,\
NCryptDecrypt,\
NCryptDeleteKey,\
NCryptDeriveKey,\
NCryptEncrypt,\
NCryptEnumAlgorithms,\
NCryptEnumKeys,\
NCryptExportKey,\
NCryptFinalizeKey,\
NCryptFreeBuffer,\
NCryptFreeObject,\
NCryptGetProperty,\
NCryptGetProtectionDescriptorInfo,\
NCryptImportKey,\
NCryptIsAlgSupported,\
NCryptKeyDerivation,\
NCryptOpenKey,\
NCryptOpenStorageProvider,\
NCryptProtectSecret,\
NCryptSecretAgreement,\
NCryptSetProperty,\
NCryptSignHash,\
NCryptUnprotectSecret,\
NCryptVerifyClaim,\
NCryptVerifySignature

PE.__IMPORTS equ "netutils",\
NetApiBufferFree

PE.__IMPORTS equ "ntdll",\
RtlEthernetAddressToStringA,\
RtlEthernetAddressToStringW,\
RtlEthernetStringToAddressA,\
RtlEthernetStringToAddressW,\
RtlIpv4AddressToStringA,\
RtlIpv4AddressToStringExA,\
RtlIpv4AddressToStringExW,\
RtlIpv4AddressToStringW,\
RtlIpv4StringToAddressA,\
RtlIpv4StringToAddressExA,\
RtlIpv4StringToAddressExW,\
RtlIpv4StringToAddressW,\
RtlIpv6AddressToStringA,\
RtlIpv6AddressToStringExA,\
RtlIpv6AddressToStringExW,\
RtlIpv6AddressToStringW,\
RtlIpv6StringToAddressA,\
RtlIpv6StringToAddressExA,\
RtlIpv6StringToAddressExW,\
RtlIpv6StringToAddressW

PE.__IMPORTS equ "srvcli",\
NetShareEnum

PE.__IMPORTS equ "urlmon",\
UrlMkGetSessionOption,\
UrlMkSetSessionOption

PE.__IMPORTS equ "webauthn",\
WebAuthNAuthenticatorGetAssertion,\
WebAuthNAuthenticatorMakeCredential,\
WebAuthNCancelCurrentOperation,\
WebAuthNFreeAssertion,\
WebAuthNFreeCredentialAttestation,\
WebAuthNGetCancellationId,\
WebAuthNGetErrorName,\
WebAuthNGetW3CExceptionDOMError,\
WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable

PE.__IMPORTS equ "webservices",\
WsAbandonCall,\
WsAbandonMessage,\
WsAbortChannel,\
WsAbortServiceProxy,\
WsAddCustomHeader,\
WsAddErrorString,\
WsAddMappedHeader,\
WsAddressMessage,\
WsAlloc,\
WsAsyncExecute,\
WsCall,\
WsCheckMustUnderstandHeaders,\
WsCloseChannel,\
WsCloseServiceProxy,\
WsCombineUrl,\
WsCopyError,\
WsCopyNode,\
WsCreateChannel,\
WsCreateError,\
WsCreateFaultFromError,\
WsCreateHeap,\
WsCreateMessage,\
WsCreateMessageForChannel,\
WsCreateMetadata,\
WsCreateReader,\
WsCreateServiceProxy,\
WsCreateServiceProxyFromTemplate,\
WsCreateWriter,\
WsCreateXmlBuffer,\
WsCreateXmlSecurityToken,\
WsDateTimeToFileTime,\
WsDecodeUrl,\
WsEncodeUrl,\
WsEndReaderCanonicalization,\
WsEndWriterCanonicalization,\
WsFileTimeToDateTime,\
WsFillBody,\
WsFillReader,\
WsFindAttribute,\
WsFlushBody,\
WsFlushWriter,\
WsFreeChannel,\
WsFreeError,\
WsFreeHeap,\
WsFreeMessage,\
WsFreeMetadata,\
WsFreeReader,\
WsFreeSecurityToken,\
WsFreeServiceProxy,\
WsFreeWriter,\
WsGetChannelProperty,\
WsGetCustomHeader,\
WsGetDictionary,\
WsGetErrorProperty,\
WsGetErrorString,\
WsGetFaultErrorDetail,\
WsGetFaultErrorProperty,\
WsGetHeader,\
WsGetHeaderAttributes,\
WsGetHeapProperty,\
WsGetMappedHeader,\
WsGetMessageProperty,\
WsGetMetadataEndpoints,\
WsGetMetadataProperty,\
WsGetMissingMetadataDocumentAddress,\
WsGetNamespaceFromPrefix,\
WsGetPolicyAlternativeCount,\
WsGetPolicyProperty,\
WsGetPrefixFromNamespace,\
WsGetReaderNode,\
WsGetReaderPosition,\
WsGetReaderProperty,\
WsGetSecurityContextProperty,\
WsGetSecurityTokenProperty,\
WsGetServiceProxyProperty,\
WsGetWriterPosition,\
WsGetWriterProperty,\
WsGetXmlAttribute,\
WsInitializeMessage,\
WsMarkHeaderAsUnderstood,\
WsMatchPolicyAlternative,\
WsMoveReader,\
WsMoveWriter,\
WsOpenChannel,\
WsOpenServiceProxy,\
WsPullBytes,\
WsPushBytes,\
WsReadArray,\
WsReadAttribute,\
WsReadBody,\
WsReadBytes,\
WsReadChars,\
WsReadCharsUtf8,\
WsReadElement,\
WsReadEndAttribute,\
WsReadEndElement,\
WsReadEndpointAddressExtension,\
WsReadEnvelopeEnd,\
WsReadEnvelopeStart,\
WsReadMessageEnd,\
WsReadMessageStart,\
WsReadMetadata,\
WsReadNode,\
WsReadQualifiedName,\
WsReadStartAttribute,\
WsReadStartElement,\
WsReadToStartElement,\
WsReadType,\
WsReadValue,\
WsReadXmlBuffer,\
WsReadXmlBufferFromBytes,\
WsReceiveMessage,\
WsRemoveCustomHeader,\
WsRemoveHeader,\
WsRemoveMappedHeader,\
WsRemoveNode,\
WsRequestReply,\
WsRequestSecurityToken,\
WsResetChannel,\
WsResetError,\
WsResetHeap,\
WsResetMessage,\
WsResetMetadata,\
WsResetServiceProxy,\
WsRevokeSecurityContext,\
WsSendFaultMessageForError,\
WsSendMessage,\
WsSendReplyMessage,\
WsSetChannelProperty,\
WsSetErrorProperty,\
WsSetFaultErrorDetail,\
WsSetFaultErrorProperty,\
WsSetHeader,\
WsSetInput,\
WsSetInputToBuffer,\
WsSetMessageProperty,\
WsSetOutput,\
WsSetOutputToBuffer,\
WsSetReaderPosition,\
WsSetWriterPosition,\
WsShutdownSessionChannel,\
WsSkipNode,\
WsStartReaderCanonicalization,\
WsStartWriterCanonicalization,\
WsTrimXmlWhitespace,\
WsVerifyXmlNCName,\
WsWriteArray,\
WsWriteAttribute,\
WsWriteBody,\
WsWriteBytes,\
WsWriteChars,\
WsWriteCharsUtf8,\
WsWriteElement,\
WsWriteEndAttribute,\
WsWriteEndCData,\
WsWriteEndElement,\
WsWriteEndStartElement,\
WsWriteEnvelopeEnd,\
WsWriteEnvelopeStart,\
WsWriteMessageEnd,\
WsWriteMessageStart,\
WsWriteNode,\
WsWriteQualifiedName,\
WsWriteStartAttribute,\
WsWriteStartCData,\
WsWriteStartElement,\
WsWriteText,\
WsWriteType,\
WsWriteValue,\
WsWriteXmlBuffer,\
WsWriteXmlBufferToBytes,\
WsWriteXmlnsAttribute,\
WsXmlStringEquals

PE.__IMPORTS equ "wkscli",\
NetGetJoinInformation,\
NetUseAdd,\
NetUseDel,\
NetWkstaGetInfo,\
NetWkstaUserGetInfo

PE.__IMPORTS equ "wlanapi",\
WlanConnect,\
WlanDisconnect,\
WlanGetInterfaceCapability,\
WlanGetNetworkBssList,\
WlanHostedNetworkForceStart,\
WlanHostedNetworkForceStop,\
WlanHostedNetworkInitSettings,\
WlanHostedNetworkQueryProperty,\
WlanHostedNetworkQuerySecondaryKey,\
WlanHostedNetworkQueryStatus,\
WlanHostedNetworkRefreshSecuritySettings,\
WlanHostedNetworkSetProperty,\
WlanHostedNetworkSetSecondaryKey,\
WlanHostedNetworkStartUsing,\
WlanHostedNetworkStopUsing,\
WlanRegisterNotification,\
WlanRegisterVirtualStationNotification,\
WlanScan,\
WlanSetInterface

