if ~ definite _RICHOLE_
_RICHOLE_ := 1

; OLE Extensions to the Rich Text Editor

struct REOBJECT
	cbStruct dd ?
	cp dd ?
	clsid GUID
	poleobj dq ?
	pstg dq ?
	polesite dq ?
	sizel SIZEL
	dvaspect dd ?
	dwFlags dd ?
	dwUser dd ?,?
ends

REO_GETOBJ_NO_INTERFACES	:= 0
REO_GETOBJ_POLEOBJ		:= 1
REO_GETOBJ_PSTG			:= 2
REO_GETOBJ_POLESITE		:= 4
REO_GETOBJ_ALL_INTERFACES	:= 7

REO_CP_SELECTION := -1

REO_IOB_SELECTION := -1
REO_IOB_USE_CP := -2

REO_NULL		:= 0x00000000
REO_RESIZABLE		:= 0x00000001
REO_BELOWBASELINE	:= 0x00000002
REO_INVERTEDSELECT	:= 0x00000004
REO_DYNAMICSIZE		:= 0x00000008
REO_BLANK		:= 0x00000010
REO_DONTNEEDPALETTE	:= 0x00000020
REO_OWNERDRAWSELECT	:= 0x00000040
REO_CANROTATE		:= 0x00000080
REO_ALIGNTORIGHT	:= 0x00000100
REO_WRAPTEXTAROUND	:= 0x00000200
REO_USEASBACKGROUND	:= 0x00000400
REO_READWRITEMASK	:= 0x000007FF

REO_GETMETAFILE		:= 0x00400000
REO_LINKAVAILABLE	:= 0x00800000
REO_HILITED		:= 0x01000000
REO_INPLACEACTIVE	:= 0x02000000
REO_OPEN		:= 0x04000000
REO_SELECTED		:= 0x08000000
REO_STATIC		:= 0x40000000
REO_LINK		:= 0x80000000

RECO_PASTE	:= 0
RECO_DROP	:= 1
RECO_COPY	:= 2
RECO_CUT	:= 3
RECO_DRAG	:= 4

IRichEditOle interface 00020D00-0000-0000-C000-000000000046,\
	EXTENDS__IUnknown,\
	GetClientSite,GetObjectCount,GetLinkCount,GetObject,InsertObject,ConvertObject,ActivateAs,SetHostNames,SetLinkAvailable,SetDvaspect,HandsOffStorage,SaveCompleted,InPlaceDeactivate,ContextSensitiveHelp,GetClipboardData,ImportDataObject

IRichEditOleCallback interface 00020D03-0000-0000-C000-000000000046,\
	EXTENDS__IUnknown,\
	GetNewStorage,GetInPlaceContext,ShowContainerUI,QueryInsertObject,DeleteObject,QueryAcceptData,ContextSensitiveHelp,GetClipboardData,GetDragDropEffect,GetContextMenu

end if ;~ definite _RICHOLE_
