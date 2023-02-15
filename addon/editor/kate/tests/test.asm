

; import "fasmg.udl.xml"file to add "fasmg"to Notepad++'s Language menu
; (open this file in Notepad++ and insure "fasmg" language is selected)


; References:
;	https://udl20.weebly.com/index.html
;	https://ivan-radic.github.io/udl-documentation/comments/


;	(these explainations follow Nopepad++ UI)


;: User Defined Language v.2.1.0.12:
;
; Default & Folding:
;	- Folding seems generally broken in NPP
;	- Default style only uses foreground color
;
; Keyword Lists:
;	- left column is domain langauge
;	- right column is fasmg keywords


; Replacing x86 with another language:
;
; Four keyword groups exist for x86 highlighting. Simply replace them with
; keywords for your custom language. I recommend the following groups:
;	- control/flow
;	- arithmatic
;	- data movement
;	- compile-time framework



;: Comment Highlighting:
; comments are slightly abused for additional features
;: this is an accented commment line
; accent can be applied after regular comment ;: NOTE
; or within a comment ;: look here : or don't
;: accent lines ; support regular comments, but highlighting is broken
; without termination - EOL is captured by regular comment style.

; see off coloring of the line above? (unless it's been fixed)
;:: can be used to highlight commented code

;: Tags:; in comments
;	FIXME: this is all wrong
;:	TODO: get to work!
;	-=:BUG:=-, you did this - change it
;	|ERROR| what the heck is going on here!
	this mastodon: shouldn't highlight :/
; So, tags need to be choosen which don't break other highlighting.
; ...and combining all the features:
	;:	TODO: slower/smaller code if needed:
	;::	@@:	addx eax,ecx	; bet you didn't think of that
	;::		loop @B


;: Numbers:
; - doesn't like Suffix2/Range that are also in Extra1
;	- b B d D
; - doesn't restrict decimal numbers for smaller radix
;	(i.e 8/9 is colorized in octal numbers)
; - only a single Range match is accepted within a single number
; - quote character not allowed as Range char
;
;	Correctly colorized:
	$123cAaadf		; hex
	0xA34_345		; hex
	0X5555			; hex
	0123456789ABDEFh	; hex
	012345697o		; octal
	0123456789		; decimal
	0.5			; float

;	Not supported, ERRORS:
	0000_11110090o		;:FIXME::
	01b			; binary :/
	09d			; decimal
	0_0_0o			; multiple breaks
	0.1f			; float
	0.1e-7			; float

; Basically, options chosen to allow greater highlighting,
; but this limitation is very disappointing.


;: Strings:
; they work well with a single delimiter setting:
	'okay, this works'
	"another string"
; even the escape functionality requires nothing special:
	"This is a string""test."
	'and another string''asdfas'
; It'd be nice to flag unclosed strings:
	"this string is broken, but we can't see that :/
; the few things I've tried hasn't worked





;: Operator 1:; do NOT merge with words
+ - / * ! , . | & ~ # \ < > [ ] = : ( )

;: Operator 2:;	merge with words, but not Operator 1
? $ $$ $@ $% $%% %t __time__ __source__ __file__ __line__
not mod xor and or shl shr bswap bsf bsr string float trunc sizeof lengthof
elementsof element scale metadata elementof scaleof metadataof element equ
reequ define redefine restore relativeto defined used definite eqtype eq at
from as dup



; x86 instructions highlighted by fasmg keyword groups:
;	- call jno
;	- not xor and or shl shr bswap bsf bsr







; Fundamental Highlighting Problems:
;   + some fasmg keywords are modal: match (calm is different)
;   + some fasmg operators are the same as x86 instructions
;
; - no highlighing for binary :/




; folding appears to be broken? affects number detection?
; just turning on comment folding produces bad UI
;
;
;
;
;|
; foldstart ;: IMPORTANT NAME :
;| foldmiddle |; asdfasdfasdfa
asdfasd	;| fold blocking with comment tags
;| foldend asdfasdf
;|
;
foldstart



;: Other Notepad++ Features:
;
; + configure global font and use language file to control the colors
;
; Settings
;	Preferences ...
;		Delimiter < >
;
