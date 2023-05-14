
; state machine to DOT graph file format

; REFERENCES:
;	https://oeis.org/A060843
;	https://bbchallenge.org
;	https://turingmachine.io
;	https://morphett.info/turing/turing.html
;	https://groups.google.com/g/busy-beaver-discuss
;	https://turbotm.de/~heiner/BB/
;	https://webusers.imj-prg.fr/~pascal.michel/
;	https://googology.fandom.com/wiki/Googology_Wiki
;
; Rado (1962)
; 1RB1LB_1LA1RH
;
; Lin and Rado (1965)
; 1RB1RH_1LB0RC_1LC1LA
; 1RB1RH_0RC1RB_1LC1LA
;
; Brady (1983)
; 1RB1LB_1LA0LC_1RH1LD_1RD0RA
;
; Marxen and Buntrock (1990)
; 1RB1LC_1RC1RB_1RD0LE_1LA1LD_1RH0LA
;
; BB(6,2)	t15	2022 May 30, Pavel Kropitz
; 1RB0LD_1RC0RF_1LC1LA_0LE1RH_1LF0RB_0RC0RE
;
; "Wythagoras" (2014)
; 1RB---_1RC0LG_1LD1RB_1LF1LE_1RH1LF_1RG0LD_1LB0RF
;
; Lafitte and Papazian (2007)
; 1RB2LB1RH_2LA2RB1LB
;
; Terry and Shawn Ligocki (2007)
; 1RB2LA1LC_0LA2RB1LB_1RH1RA1RC
;
; Terry and Shawn Ligocki (2008)
; 1RB1RH2RC_2LC2RD0LC_1RA2RB0LB_1LB0LD2RC
;
; Terry and Shawn Ligocki (2005)
; 1RB2LA1RA1RA_1LB1LA3RB1RH
;
; Terry and Shawn Ligocki (2007)
; 1RB1RA2LB3LA_2LA0LB1LC1LB_3RB3RC1RH1LC
;
; Terry and Shawn Ligocki (2007)
; 1RB2LA1RA2LB2LA_0LA2RB3RB4RA1RH
;
; Terry and Shawn Ligocki (2008)
; 1RB2LA1RH5LB5LA4LB_1LA4RB3RB5LB1LB4RA
;
; 15-state 2-symbol Turing machine M(15,2) that halts if and only if Erdős’ conjecture is false.
; 0RB1RC_1RD0RA_0RA1LI_0RE0RF_0RD0LG_1RA1RA_1RE1RM_0LI1LJ_0LK1LH_0LH1LN_0LL1LM_0LK1LK_0LK1RF_1LO0RM_0RZ0RG


match =PARAMS,PARAMS
	display 10,'expected usage examples:',10,\
		9,	'fasmg sm_dot.g -i "PARAMS equ 1RB0LD_1RC0RF_1LC1LA_0LE1RH_1LF0RB_0RC0RE"',10,\
		9,	'dot -Tpng sm_dot.dot -o "BB(6,2).png"',10
	err 'PARAMS missing'
else match Q=,S=,I,PARAMS
	file_gather <'states = ',`Q,' symbols = ',`S,' index = ',`I>,\
		<IndexForm Q,S,I>
else match any,PARAMS
	file_gather <`any>, <CompactLinearForm `any>
end match

macro file_gather note*, body*
	format binary as 'dot'
	db '###',10
	db '### generated file',10
	db '### ',note,10
	db '###',10
	db 'digraph statemachine {',10
	db '    rankdir=LR;',10
	db '    node [shape = circle fixedsize=true fillcolor=lightgray style=filled];',10
	body
	db '    Halt [shape = doublecircle];',10
	db '}',10
end macro

macro IndexForm states*,symbols*,index*
	local reduce,state,value,target,write,direction,attributes
	reduce = index

	struc StateName I*
		local result,chars,i
		i = I mod (states+1)
		if i = states
			. = 'Halt'
		else
			if I eqtype 0
			else
				I = I / states
			end if
			result = 0
			chars = 0
			while 1
				result = (result shl 8)+'A'+(i mod 26)
				chars = chars + 1
				i = i/26
				if i = 0
					break
				end if
			end while
			. = string (result bswap chars)
		end if
	end struc

	struc SymbolName I*
		repeat 1, n:I mod symbols
			. = `n
		end repeat
		if I eqtype 0
		else
			I = I / symbols
		end if
	end struc

	repeat states
		state StateName %-1
		; NOTE: this ordering creates a unique decode of index:
		repeat symbols
			value SymbolName %-1

			target StateName reduce
			write SymbolName reduce
			if reduce and 1
				direction = 'L'
				attributes reequ ''
			else
				direction = 'R'
				attributes reequ ' color = "red"'
			end if
			reduce = reduce shr 1
			if symbols = 2 ; decorate edges based on binary tape writing
				if write = '0'
					attributes reequ attributes,' arrowhead = onormal'
				end if
			end if

			db '    ',state,' -> ',target,\
				' [ label = "',value,'; ',write,', ',direction,'"',\
				attributes,' ];',10
		end repeat ; symbols
	end repeat ; states
	purge StateName,SymbolName
end macro

; WARNING: assume valid input: compact linearized transition matrix
; see: https://www.sligocki.com/2022/10/09/standard-tm-format.html

macro CompactLinearForm matrix*
	local reduce,symbols,symbol,states
	states = 1
	symbol = 0
	reduce = 0+matrix
	; precompute so halt state is known
	while reduce > 0
		if reduce and 0xFF = '_'
			reduce = reduce shr 8
			; next row of transition table
			if ~ definite symbols
				symbols := symbol
			else if symbols <> symbol
				err 'invalid compact linearized form'
			end if
			states = states + 1
			symbol = 0
		else
			transitions =: reduce and 0xFF_FF_FF
			reduce = reduce shr 24
			symbol = symbol + 1
		end if
	end while
	state = 'A'
	symbol = 0
	irpv transition, transitions
		if transition = '---' ; undefined transition
		else
			target = transition shr 16
			value = symbol + '0'
			write = 0xFF and transition
			direction = 0xFF and (transition shr 8)
			if target > states + 'A' - 1
				target = 'Halt'
			end if
			if direction = 'R'
				attributes reequ ' color = "red"'
			else
				attributes reequ ''
			end if
			if write = '0'
				attributes reequ attributes,' arrowhead = onormal'
			end if
			db '    ',state,' -> ',target,\
				' [ label = "',value,'; ',write,', ',direction,'"',\
				attributes,' ];',10
		end if
		symbol = symbol + 1
		if symbol = symbols
			state = state + 1
			symbol = 0
		end if
	end irpv
end macro
