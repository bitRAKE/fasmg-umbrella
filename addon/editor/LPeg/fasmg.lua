--[[ 2021 fasmg Assembly LPeg lexer by bitRAKE (use/change freely)
For help with the parser see: http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
]]

local lexer = require('lexer')
local token, word_match = lexer.token, lexer.word_match
local B, P, R, S, V = lpeg.B, lpeg.P, lpeg.R, lpeg.S, lpeg.V

local lex = lexer.new('fasmg', {case_insensitive_fold_points = true})

-- Whitespace:
lex:add_rule('whitespace', token(lexer.WHITESPACE, lexer.space^1))

-- Comments:
lex:add_rule('comment', token(lexer.COMMENT, ';' * lexer.nonnewline^0))

lex:add_rule('keyword', token(lexer.KEYWORD, word_match([[
  end namespace while repeat iterate rept irp irpv postpone macro struc virtual
  else if match rmatch rawmatch
  calminstruction local arrange assemble transform stringify publish take compute check jyes jno jump exit
  indx break esc outscope purge restruc mvmacro mvstruc
  removecomments retaincomments combinelines isolatelines
  org section restartout format
  display err include eval assert
]],true)))

local fasmg_datatypes = word_match([[
  file emit dbx
  db dw dd dp dq dt ddq dqq ddqq
  rb rw rd rp rq rt rdq rqq rdqq
  byte word dword pword fword qword tword tbyte dqword xword qqword yword dqqword zword
]],true)
lex:add_rule('type', token(lexer.TYPE, fasmg_datatypes))

lex:add_rule('key_op', token(lexer.CLASS, word_match([[
  not mod xor and or shl shr bswap bsf bsr
  defined used definite eqtype eq relativeto string float trunc sizeof lengthof
  elementsof element scale metadata elementof scaleof metadataof element
  equ reequ define redefine restore
]],true)))

local constants = word_match([[ $ $$ $@ $% $%% % %% %t __time__ __source__ __file__ __line__ ]],true)
lex:add_rule('constant', token(lexer.CONSTANT, constants))

local dq_str = '"' * (lexer.any - '"')^0 * P('"')^-1
local sq_str = "'" * (lexer.any - "'")^0 * P("'")^-1
lex:add_rule('string', token(lexer.STRING, dq_str + sq_str))

-- Registers.
lex:add_rule('register', token('register', word_match[[
  cs ds es fs gs ss
  cr0 cr1 cr2 cr3 cr4 cr5 cr6 cr7
  dr0 dr1 dr2 dr3 dr4 dr5 dr6 dr7
  tr0 tr1 tr2 tr3 tr4 tr5 tr6 tr7
  ah bh ch dh eip rip
  al bl cl dl sil dil bpl spl r8l r9l r10l r11l r12l r13l r14l r15l
  ax bx cx dx si di bp sp r8w r9w r10w r11w r12w r13w r14w r15w
  eax ebx ecx edx esi edi ebp esp r8d r9d r10d r11d r12d r13d r14d r15d
  rax rcx rdx rbx rsp rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
  r8b r9b r10b r11b r12b r13b r14b r15b
  st0 st1 st2 st3 st4 st5 st6 st7
  mm0 mm1 mm2 mm3 mm4 mm5 mm6 mm7
  xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
  ymm0 ymm1 ymm2 ymm3 ymm4 ymm5 ymm6 ymm7 ymm8 ymm9 ymm10 ymm11 ymm12 ymm13 ymm14 ymm15
  k0 k1 k2 k3 k4 k5 k6 k7
  zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 zmm9 zmm10 zmm11 zmm12 zmm13 zmm14 zmm15
  ymm16 ymm17 ymm18 ymm19 ymm20 ymm21 ymm22 ymm23 ymm24 ymm25 ymm26 ymm27 ymm28 ymm29 ymm30 ymm31
  zmm16 zmm17 zmm18 zmm19 zmm20 zmm21 zmm22 zmm23 zmm24 zmm25 zmm26 zmm27 zmm28 zmm29 zmm30 zmm31
]]))
lex:add_style('register', lexer.STYLE_CONSTANT)

-- Instructions.
lex:add_rule('instruction', token(lexer.VARIABLE, word_match[[
  -- 8086
  add or adc sbb and sub xor cmp not neg mul imul div idiv mov test xchg inc dec
  push pop push pop ret retn retf lea les lds rol ror rcl rcr shl sal shr sar
  call jmp jo jno jc jb jnae jnc jnb jae jz je jnz jne jna jbe ja jnbe js jns jp
  jpe jnp jpo jl jnge jnl jge jng jle jg jnle loopnz loopne loopz loope loop
  jcxz daa das aaa aas nop cbw cwd int3 into iret salc hlt cmc clc stc cli sti
  cld std pushf popf sahf lahf movsb cmpsb stosb lodsb scasb xlatb movsw cmpsw
  stosw lodsw scasw lock repnz repne rep repz repe int aam aad movs cmps stos
  lods scas xlat in out
]]))
--lex:add_style('instruction', lexer.STYLE_EMBEDDED)

-- number starts must begin with question mark
-- no single quote at start
-- no question marks in the middle
local word_num = P("?") * R("09")
local word_force = P("?")^-1 * (lexer.alpha + S('@%_'))
local word = (word_num + word_force) * (lexer.alnum + S("@%'_"))^0 * P("?")^-1
-- NOTE: if you are not seeing the difference, many style settings treat labels and identifiers the same
lex:add_rule('label', token(lexer.FUNCTION, word * S(' \t')^0 * P(':')))
lex:add_rule('identifier', token(lexer.IDENTIFIER, word))

lex:add_rule('operator', token(lexer.OPERATOR, S('+-/*=<>()[]{}:?!,.|&~#`\\;')))

-- Number:
local fasmg_hexdigit = R('09', 'AF', 'af') + S("'_")
local fasmg_decdigit = R('09') + S("'_")
local fasmg_octdigit = R('07') + S("'_")
local fasmg_hex = ('$' * fasmg_hexdigit^1) + ('0' * S('xX') * fasmg_hexdigit^1) +  (R('09') * fasmg_hexdigit^0 * S('hH'))
local fasmg_dec = R('09')^1 * fasmg_decdigit^0 * S('dD')^-1
local fasmg_oct = R('07')^1 * fasmg_octdigit^0 * S('oOqQ')
local fasmg_bin = S('01')^1 * S("01'_")^0 * S('bB')
lex:add_rule('number', token(lexer.NUMBER, fasmg_hex + fasmg_oct + fasmg_bin + lexer.float + fasmg_dec))

-- Fold points:
local function fasmg_fold(text, pos, line, s, symbol)
  if line:match('^%s*[eE][nN][dD]%s') then
    return -1 -- ending fold point
  elseif line:match('^%s*'..symbol) then
    return 1 -- beginning fold point
  end
  return 0
end

lex:add_fold_point(lexer.KEYWORD, 'postpone', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'namespace', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'calminstruction', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'virtual', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'macro', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'match', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'if', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'repeat', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'iterate', fasmg_fold)
lex:add_fold_point(lexer.KEYWORD, 'struc', fasmg_fold)
lex:add_fold_point(lexer.COMMENT, ';', lexer.fold_line_comments(';'))

return lex