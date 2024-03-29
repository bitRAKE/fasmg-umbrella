
## State Graph Representations in x86

We start with a simple state graph that passes exact divisors of three. We examine the bits of a number of any length, starting from the most significant bit down to the least significant bit. Once all bits have been examined, the final state determines whether the number is a multiple of three.
```mermaid
graph LR
	classDef start color:green,stroke-dasharray: 2
	classDef stop color:red,stroke-dasharray: 2

	start(((start))):::start --> q0
	%% these state transitions respond to decreasing bit values and input end
	subgraph "Divide by Three "
		q0 -. 0 .-> q0((q0))
		q0 -- 1 --> q1((q1))
		q1 -. 0 .-> q2((q2))
		q1 -- 1 --> q0
		q2 -. 0 .-> q2
		q2 -- 1 --> q1
	end
	%% only state q0 indicates divisible by three
	q0 --> |"input end"| q3[accept]:::stop
	q1 --> |"input end"| q4[reject]:::stop
	q2 --> |"input end"| q4

	linkStyle 0 stroke:green;

	linkStyle 2 stroke:black;
	linkStyle 4 stroke:black;
	linkStyle 6 stroke:black;

	linkStyle 7 stroke:darkred;
	linkStyle 8 stroke:darkred;
	linkStyle 9 stroke:darkred;
```
Next, we translate this into basic x86 code, which essentially replicates each q* node in the graph. The function: Does the ECX bit [number] represent a multiple of three?
```asm
; RSI : array of qword indices, set bits in number.
	jrcxz	invalid
q0:
	dec	ecx
	js	accept
	bt	[number], ecx
	jnc	q0
q1:
	dec	ecx
	js	reject1
	bt	[number], ecx
	jc	q0
q2:
	dec	ecx
	js	reject0
	bt	[number], ecx
	jc	q1
	jmp	q2
accept:
	clc
reject1:
	cmc
reject0:
```
... carry flag set when number is exact multiple of three.


Observing the repetitive assembly, we can represent the state machine more generally as a transition table.
```asm
	xor eax, eax ; clear sign flag to signal error
	jrcxz no_bits
	dec ecx
	xor edx, edx ; start state zero
more:
	bt [number], ecx
	setc al
	movzx edx, [transitions + rdx + rax]
	dec ecx
	jns more
	mov al, [transitions + rdx + 2]
no_bits:
; SF=0, error
; SF=1, AL is result of state machine
```
A byte table is adequate to represent the limited number of states in this graph:
```asm
transitions db \;	0	1	end-of-input	this-state
			q0,	q1,	accept,\	; q0
			q2,	q0,	reject,\	; q1
			q2,	q1,	reject		; q2
```
States are identified by their position within the table:
```asm
q0 := 3 * 0
q1 := 3 * 1
q2 := 3 * 2
```
We need to specify return values for each state when no more input is available.
```asm
accept := 1
reject := 0
```
An error state is indicated by the inversion of the sign flag, which signifies that no bits are present - hence, not a number. Known valid input would only remove the JRCXZ instruction.


## Further Discovery:

<details><summary>What is the maximum number of states that can be represented in a byte-based transition table?</summary><b>

> No uppper limit exist as states can be represented by multiple tables.

</b></details>
<details><summary>Give a code example of your above ideas.</summary><b>

```asm
; TODO : some code here
```

</b></details>
<details><summary>How could we manage early termination for other types of graphs? Or handle multiple termination states?</summary><b>

> Both of these can be accomplished with additional data within each state, and/or another termination branch within the inner loop.

</b></details>
<details><summary>If we can only use the bit indices of the set bits, write an algorithm to determine if the number is divisible by three.</summary><b>

```asm
	jrcxz invalid
	xor eax, eax
	; only test bit zero of number's bit indices
@@:	bt dword [rsi + rcx*8 - 8], 0
	; all `2^n MOD 3` values result in {1,2} based on parity of index
	adc eax, 1
	loop @B
	mov ecx, 3
	xor edx, edx
	div ecx
	; return zero flag if exact multiple of three
	test edx, edx
```

</b></details>
