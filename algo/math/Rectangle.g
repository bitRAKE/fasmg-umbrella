
; wrap operation on standard Windows RECT structure
; https://learn.microsoft.com/en-us/windows/win32/gdi/rectangles
; TODO: error checking, results are all BOOL

struc(NAMED) Rectangle
NAMED RECT
namespace NAMED

macro IsEmpty
	IsRectEmpty ADDR NAMED
end macro
macro SetEmpty
	SetRectEmpty ADDR NAMED
end macro

macro Set xLeft, yTop, xRight, yBottom
	SetRect ADDR NAMED, xLeft, yTop, xRight, yBottom
end macro

macro PtIn point*
	PtInRect ADDR NAMED, QWORD [point]
end macro

macro Offset dx*, dy*
	OffsetRect ADDR NAMED, dx, dy
end macro
macro Inflate dx*, dy*
	InflateRect ADDR NAMED, dx, dy
end macro

macro Equal rect*
	EqualRect ADDR NAMED, ADDR rect
end macro
macro Copy rect*
	CopyRect ADDR NAMED, ADDR rect
end macro

macro Intersect rect0*, rect1*
	IntersectRect ADDR NAMED, ADDR rect0, ADDR rect1
end macro
macro Subtract rect0*, rect1*
	SubtractRect ADDR NAMED, ADDR rect0, ADDR rect1
end macro
macro Union rect0*, rect1*
	UnionRect ADDR NAMED, ADDR rect0, ADDR rect1
end macro

end namespace ; NAMED
end struc
