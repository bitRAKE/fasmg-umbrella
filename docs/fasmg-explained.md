
### How to Handle Undefined Symbols in Flat Assembler G

The `DEFINED` operator is used in conjunction with an expression that follows it. It generates a logical value, true or false, depending on whether all components of the expression have an available definition at the time of evaluation. This does not require the expression to be computable; it only verifies the existence of definitions for all its elements. It's useful when you need to check if a particular element, such as a symbol from the expression class, has been assigned a definition. However, due to the possibility of forward-referencing, a symbol might be found 'defined' even if its definition appears later in the source code.

The following is a common mistake and incorrect usage of `DEFINED`[^2]:
```assembly
if defined EXPORT
	display 'Error: could not generate code within the allowed number of passes.'
else
	EXPORT = 1
end if
```
If you want to ensure that all symbols in an expression have been defined before the expression itself, the `DEFINITE` operator is the tool for the job. It verifies not only the existence of a definition for each symbol in the expression but also that these definitions precede the expression.

The `DEFINITE` operator was introduced to check if a symbol has been defined earlier in the source, that is, if it has already been properly defined in the current pass during the multi-pass assembly. However, keep in mind that `DEFINITE` only guarantees that a symbol has been defined somewhere earlier in the source. It does not mean that the value of the symbol is final and resolved. The actual value of a symbol may be in flux, as things that happen even later in the source may affect the outcome.[^1]

Additionally, `DEFINED` has a unique feature: it can be applied to an empty expression. In this case, the condition is automatically satisfied because there are no symbols to verify. On the other hand, the `DEFINITE` operator does not allow this; it requires an expression to check.

### Calm offers other options:

However, there are methods to check whether a symbol has a value assigned. One of them is using the `TAKE` command with the CALM instructions of FASMG. The `TAKE` command allows to check whether a symbol has a value assigned, even a symbolic one.

```assembly
define var ; this is to make CALM code see "var" as global symbol

calminstruction def_take
	take var, var
	jyes use_var
	display 'var is not defined'
	display 10
	exit
use_var:
	display 'var IS defined'
	display 10
end calminstruction

restore var ; remove temporary definition

define var PE GUI
def_take ; now test it:
```

Another method uses the `TRANSFORM` command, which can be used when the identifier of the symbol to check for was provided at runtime to the instruction, for example as an argument to a macro:
```assembly
calminstruction def_trans symbol
	transform symbol
	jyes use_var
	display 'var is not defined'
	display 10
	exit
use_var:
	display 'var IS defined'
	display 10
end calminstruction

define var PE GUI
def_trans var ; now test it:
```




### References:
[^1]: [DEFINITE operator in fasm 1.73.11 and fasm g.iiviv](https://board.flatassembler.net/topic.php?t=21058l)

[^2]: [Troubles with defined/definite](https://board.flatassembler.net/topic.php?t=21770)



