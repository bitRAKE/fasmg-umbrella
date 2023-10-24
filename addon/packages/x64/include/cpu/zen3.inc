
; Zen3 adds the following instructions:

include 'ext\vaes.inc'

include 'ext\vpclmulqdq.inc'
; alias mnemonics:
iterate <instr,aux>, PCLMULLQLQDQ,0, PCLMULHQLQDQ,1, PCLMULLQHQDQ,10h, PCLMULHQHQDQ,11h
	macro instr? line&
		PCLMULQDQ line,aux
	end macro
	macro v#instr? line&
		VPCLMULQDQ line,aux
	end macro
end iterate

; CET_SS - Control-flow Enforcement Technology / Shadow Stack:
;	CLRSSBSY, INCSSP, RDSSP, RSTORSSP, SAVEPREVSSP, SETSSBSY, WRSS, WRUSS
include 'ext\cet_ss.inc'

; INVPCID - Invalidate TLB entry(s) in a specified PCID
include 'ext\invpcid.inc'

; INVLPGB - Broadcast TLB flushing:
;	INVLPGB, TLBSYNC
include 'ext\invlpgb.inc'

; PKU - Memory Protection Keys for Users:
;	RDPKRU, WRPKRU
include 'ext\pku.inc'

; SEV-SNP - 3rd generation Secure Encrypted Virtualization - Secure Nested Paging:
;	PSMASH, PVALIDATE, RMPADJUST, RMPUPDATE
include 'ext\sev_snp.inc'
