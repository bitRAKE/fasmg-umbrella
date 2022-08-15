format PE64 CONSOLE 6.2 at 0x1234_56780000
; _downlevel is used for wsprintfW
define UMBRELLA_LIBRARY "OneCoreUAP_downlevel"
include 'umbrella.g'


include 'glob.inc'
glob_testing: entry $
	push rsi rdi

	iterate <PATTERN,		CASE,		EXPECTED, LENGTH>,\
		'^',			'',			0,	0,\
		'^a',			'ba',			-1,	-1,\
		'^.*c',			'abcd',			0,	3,\
		'$',			'',			0,	0,\
		'a$',			'ab',			-1,	-1,\
		'b.*$',			'abcd',			1,	3,\
		'a*$',			'aaaa',			0,	4,\
		'y.*$',			'a any b',		4,	3,\
		'.b',			'aab',			1,	2,\
		\; non-greedy matching returns least possible length:
		'a*',			'aaaa',			0,	0,\
		'.*',			'any',			0,	0,\
		'y.*',			'a any b',		4,	1,\
		'a+',			'aaaa',			0,	1,\
		'.+',			'any',			0,	1,\
		'y.+',			'a any b',		4,	2,\
		\; right-anchored matching seems greedy
		'b*c*d',		'abbcccd',		1,	6,\
		'b*c*$',		'abbccc',		1,	5,\

		collect CONST.1
			glob_testing.pattern.% db PATTERN,0
			glob_testing.case.% db CASE,0
		end collect

		lea rsi,[.pattern.%]
		lea rdi,[.case.%]
		push rdi
		call RegEx__Glob
		pop rax
		if EXPECTED < 0 ; should not match, fail if it does
			jz .fail
		else ; should match, verify location & length of match
			jnz .fail
			sub edx,edi
			cmp edx,LENGTH
			jnz .fail
			sub edi,eax
			cmp edi,EXPECTED
			jnz .fail
		end if
	end iterate

	pop rdi rsi
	retn

.fail:
	int3 ; should be in debugger, RAX is failed test case
