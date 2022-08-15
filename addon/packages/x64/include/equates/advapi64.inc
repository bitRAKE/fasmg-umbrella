; Token Object Definitions

TOKEN_ASSIGN_PRIMARY	:= 0x0001
TOKEN_DUPLICATE		:= 0x0002
TOKEN_IMPERSONATE	:= 0x0004
TOKEN_QUERY		:= 0x0008
TOKEN_QUERY_SOURCE	:= 0x0010
TOKEN_ADJUST_PRIVILEGES	:= 0x0020
TOKEN_ADJUST_GROUPS	:= 0x0040
TOKEN_ADJUST_DEFAULT	:= 0x0080
TOKEN_ADJUST_SESSIONID	:= 0x0100

TOKEN_ALL_ACCESS_P	:= STANDARD_RIGHTS_REQUIRED \
			or TOKEN_ASSIGN_PRIMARY \
			or TOKEN_DUPLICATE \
			or TOKEN_IMPERSONATE \
			or TOKEN_QUERY \
			or TOKEN_QUERY_SOURCE \
			or TOKEN_ADJUST_PRIVILEGES \
			or TOKEN_ADJUST_GROUPS \
			or TOKEN_ADJUST_DEFAULT

TOKEN_ALL_ACCESS	:= TOKEN_ALL_ACCESS_P or TOKEN_ADJUST_SESSIONID

TOKEN_READ		:= STANDARD_RIGHTS_READ or TOKEN_QUERY

TOKEN_WRITE		:= STANDARD_RIGHTS_WRITE \
			or TOKEN_ADJUST_PRIVILEGES \
			or TOKEN_ADJUST_GROUPS \
			or TOKEN_ADJUST_DEFAULT

TOKEN_EXECUTE		:= STANDARD_RIGHTS_EXECUTE

TOKEN_TRUST_CONSTRAINT_MASK := STANDARD_RIGHTS_READ \
			or TOKEN_QUERY \
			or TOKEN_QUERY_SOURCE

TOKEN_ACCESS_PSEUDO_HANDLE := TOKEN_QUERY or TOKEN_QUERY_SOURCE

; enum TOKEN_TYPE
TokenPrimary		:= 1
TokenImpersonation	:= 2

; enum TOKEN_ELEVATION_TYPE
TokenElevationTypeDefault	:= 1
TokenElevationTypeFull		:= 2
TokenElevationTypeLimited	:= 3

; enum TOKEN_INFORMATION_CLASS
iterate NAME,\
	User,Groups,Privileges,Owner,PrimaryGroup,DefaultDacl,Source,Type,\
	ImpersonationLevel,Statistics,RestrictedSids,SessionId,GroupsAndPrivileges,\
	SessionReference,SandBoxInert,AuditPolicy,Origin,ElevationType,LinkedToken,\
	Elevation,HasRestrictions,AccessInformation,VirtualizationAllowed,\
	VirtualizationEnabled,IntegrityLevel,UIAccess,MandatoryPolicy,LogonSid,\
	IsAppContainer,Capabilities,AppContainerSid,AppContainerNumber,UserClaimAttributes,\
	DeviceClaimAttributes,RestrictedUserClaimAttributes,RestrictedDeviceClaimAttributes,\
	DeviceGroups,RestrictedDeviceGroups,SecurityAttributes,IsRestricted,\
	ProcessTrustLevel,PrivateNameSpace,SingletonAttributes,BnoIsolation,\
	ChildProcessFlags,IsLessPrivilegedAppContainer,IsSandboxed

	Token#NAME := %
end iterate

struct TOKEN_ELEVATION
	TokenIsElevated dd ?
ends


if 0 ; TODO:
// Token information class structures
struct TOKEN_USER
    SID_AND_ATTRIBUTES User;
ends

typedef struct _SE_TOKEN_USER {
    union {
        TOKEN_USER TokenUser;
        SID_AND_ATTRIBUTES User;
    } DUMMYUNIONNAME;

    union {
        SID Sid;
        BYTE  Buffer[SECURITY_MAX_SID_SIZE];
    } DUMMYUNIONNAME2;

} SE_TOKEN_USER , PSE_TOKEN_USER;

TOKEN_USER_MAX_SIZE := sizeof TOKEN_USER + SECURITY_MAX_SID_SIZE

typedef struct _TOKEN_GROUPS {
    DWORD GroupCount;
    SID_AND_ATTRIBUTES Groups[ANYSIZE_ARRAY];
} TOKEN_GROUPS, *PTOKEN_GROUPS;

typedef struct _TOKEN_PRIVILEGES {
    DWORD PrivilegeCount;
    LUID_AND_ATTRIBUTES Privileges[ANYSIZE_ARRAY];
} TOKEN_PRIVILEGES, *PTOKEN_PRIVILEGES;


typedef struct _TOKEN_OWNER {
    PSID Owner;
} TOKEN_OWNER, *PTOKEN_OWNER;

#define TOKEN_OWNER_MAX_SIZE (sizeof(TOKEN_OWNER) + SECURITY_MAX_SID_SIZE)

typedef struct _TOKEN_PRIMARY_GROUP {
    PSID PrimaryGroup;
} TOKEN_PRIMARY_GROUP, *PTOKEN_PRIMARY_GROUP;


typedef struct _TOKEN_DEFAULT_DACL {
    PACL DefaultDacl;
} TOKEN_DEFAULT_DACL, *PTOKEN_DEFAULT_DACL;

typedef struct _TOKEN_USER_CLAIMS {
    PCLAIMS_BLOB UserClaims;
} TOKEN_USER_CLAIMS, *PTOKEN_USER_CLAIMS;

typedef struct _TOKEN_DEVICE_CLAIMS {
    PCLAIMS_BLOB DeviceClaims;
} TOKEN_DEVICE_CLAIMS, *PTOKEN_DEVICE_CLAIMS;

typedef struct _TOKEN_GROUPS_AND_PRIVILEGES {
    DWORD SidCount;
    DWORD SidLength;
    PSID_AND_ATTRIBUTES Sids;
    DWORD RestrictedSidCount;
    DWORD RestrictedSidLength;
    PSID_AND_ATTRIBUTES RestrictedSids;
    DWORD PrivilegeCount;
    DWORD PrivilegeLength;
    PLUID_AND_ATTRIBUTES Privileges;
    LUID AuthenticationId;
} TOKEN_GROUPS_AND_PRIVILEGES, *PTOKEN_GROUPS_AND_PRIVILEGES;

typedef struct _TOKEN_LINKED_TOKEN {
    HANDLE LinkedToken;
} TOKEN_LINKED_TOKEN, *PTOKEN_LINKED_TOKEN;

typedef struct _TOKEN_ELEVATION {
    DWORD TokenIsElevated;
} TOKEN_ELEVATION, *PTOKEN_ELEVATION;

typedef struct _TOKEN_MANDATORY_LABEL {
    SID_AND_ATTRIBUTES Label;
} TOKEN_MANDATORY_LABEL, *PTOKEN_MANDATORY_LABEL;

#define TOKEN_MANDATORY_POLICY_OFF             0x0
#define TOKEN_MANDATORY_POLICY_NO_WRITE_UP     0x1
#define TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN 0x2

#define TOKEN_MANDATORY_POLICY_VALID_MASK      (TOKEN_MANDATORY_POLICY_NO_WRITE_UP | \
                                                TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN)

#ifndef MIDL_PASS
#define TOKEN_INTEGRITY_LEVEL_MAX_SIZE ((((DWORD)(sizeof(TOKEN_MANDATORY_LABEL)) + sizeof(PVOID) - 1) & ~(sizeof(PVOID)-1)) + SECURITY_MAX_SID_SIZE)
#endif

typedef struct _TOKEN_MANDATORY_POLICY {
    DWORD Policy;
} TOKEN_MANDATORY_POLICY, *PTOKEN_MANDATORY_POLICY;

typedef PVOID PSECURITY_ATTRIBUTES_OPAQUE;

typedef struct _TOKEN_ACCESS_INFORMATION {
    PSID_AND_ATTRIBUTES_HASH SidHash;
    PSID_AND_ATTRIBUTES_HASH RestrictedSidHash;
    PTOKEN_PRIVILEGES Privileges;
    LUID AuthenticationId;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    TOKEN_MANDATORY_POLICY MandatoryPolicy;
    DWORD Flags;
    DWORD AppContainerNumber;
    PSID PackageSid;
    PSID_AND_ATTRIBUTES_HASH CapabilitiesHash;
    PSID TrustLevelSid;
    PSECURITY_ATTRIBUTES_OPAQUE SecurityAttributes;
} TOKEN_ACCESS_INFORMATION, *PTOKEN_ACCESS_INFORMATION;

//
// Valid bits for each TOKEN_AUDIT_POLICY policy mask field.
//

#define POLICY_AUDIT_SUBCATEGORY_COUNT (59)

typedef struct _TOKEN_AUDIT_POLICY {
    BYTE  PerUserPolicy[((POLICY_AUDIT_SUBCATEGORY_COUNT) >> 1) + 1];
} TOKEN_AUDIT_POLICY, *PTOKEN_AUDIT_POLICY;

#define TOKEN_SOURCE_LENGTH 8

typedef struct _TOKEN_SOURCE {
    CHAR SourceName[TOKEN_SOURCE_LENGTH];
    LUID SourceIdentifier;
} TOKEN_SOURCE, *PTOKEN_SOURCE;


typedef struct _TOKEN_STATISTICS {
    LUID TokenId;
    LUID AuthenticationId;
    LARGE_INTEGER ExpirationTime;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    DWORD DynamicCharged;
    DWORD DynamicAvailable;
    DWORD GroupCount;
    DWORD PrivilegeCount;
    LUID ModifiedId;
} TOKEN_STATISTICS, *PTOKEN_STATISTICS;



typedef struct _TOKEN_CONTROL {
    LUID TokenId;
    LUID AuthenticationId;
    LUID ModifiedId;
    TOKEN_SOURCE TokenSource;
} TOKEN_CONTROL, *PTOKEN_CONTROL;

typedef struct _TOKEN_ORIGIN {
    LUID OriginatingLogonSession ;
} TOKEN_ORIGIN, * PTOKEN_ORIGIN ;


typedef enum _MANDATORY_LEVEL {
    MandatoryLevelUntrusted = 0,
    MandatoryLevelLow,
    MandatoryLevelMedium,
    MandatoryLevelHigh,
    MandatoryLevelSystem,
    MandatoryLevelSecureProcess,
    MandatoryLevelCount
} MANDATORY_LEVEL, *PMANDATORY_LEVEL;

typedef struct _TOKEN_APPCONTAINER_INFORMATION {
    PSID TokenAppContainer;
} TOKEN_APPCONTAINER_INFORMATION, *PTOKEN_APPCONTAINER_INFORMATION;

#define TOKEN_APPCONTAINER_SID_MAX_SIZE (sizeof(TOKEN_APPCONTAINER_INFORMATION) + SECURITY_MAX_SID_SIZE)

typedef struct _TOKEN_SID_INFORMATION {
    PSID Sid;
} TOKEN_SID_INFORMATION, *PTOKEN_SID_INFORMATION;

typedef struct _TOKEN_BNO_ISOLATION_INFORMATION {
    PWSTR       IsolationPrefix;
    BOOLEAN     IsolationEnabled;
} TOKEN_BNO_ISOLATION_INFORMATION, *PTOKEN_BNO_ISOLATION_INFORMATION;
end if
