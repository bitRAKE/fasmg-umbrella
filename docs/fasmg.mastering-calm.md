## Chapter ?: Mastering CALM Instructions: Compiled Assembly Power

**(Assumes reader is familiar with core fasm g syntax, macroinstructions, and basic assembly concepts)**

**Introduction to CALM: Beyond Textual Substitution**

You've already experienced the power of fasm g's macro system, allowing for code reuse and abstraction through textual substitution.  However, for tasks demanding more intricate control, faster execution, and robust error handling, fasm g offers **CALM (Compiled Assembly-Like Macro) instructions**.

CALM instructions operate on a different paradigm. Instead of simple text replacement, they are defined as *compiled sequences of specialized commands*. This compilation step allows for:

*   **Performance Gains:** CALM instructions execute more efficiently than regular macros, especially for complex operations, as they bypass the full preprocessing and assembly cycle for each step within the CALM definition.
*   **Finer Control:** CALM provides a set of dedicated commands offering granular control over text manipulation, expression evaluation, and output generation, all within a structured, programming-like environment.
*   **Enhanced Error Handling:** CALM instructions often provide better error diagnostics and control flow, making complex preprocessing logic more robust.
*   **Fixed Symbol References:** Symbol references within a CALM instruction are resolved at definition time, offering a different kind of scoping and behavior compared to regular macros.

This chapter will dive deep into the syntax, commands, and usage of CALM instructions, empowering you to leverage their advanced capabilities within your fasm g projects.

**Defining CALM Instructions: `calminstruction` and `end calminstruction`**

The foundation of CALM lies in the `calminstruction` directive.  Its syntax mirrors that of the `macro` directive, including familiar features:

```assembly
calminstruction instruction_name [parameter1, parameter2, ...]
    ; CALM commands go here
end calminstruction
```

*   **`calminstruction instruction_name`**:  Initiates the definition of a new instruction named `instruction_name`. This name becomes an instruction-class symbol. You can use the `?`, `*`, `:`, and `&` parameter modifiers just like in regular macros.
*   **`[parameter1, parameter2, ...]`**:  Optional parameter list.  **Crucially, CALM parameters are *local symbolic variables***. When the CALM instruction is invoked, these variables are *assigned* the text of the arguments. They are not preprocessed parameters in the traditional macro sense.
*   **`; CALM commands go here`**:  This is the *body* of your CALM instruction, composed of specialized CALM commands (explained in detail below).
*   **`end calminstruction`**:  Marks the end of the CALM instruction definition.

**Labeled CALM Instructions:**

Similar to labeled macroinstructions, you can define labeled CALM instructions:

```assembly
calminstruction (label_parameter) labeled_instruction_name [parameter1, ...]
    ; CALM commands
end calminstruction
```

Here, `label_parameter` within parentheses will receive the text of the label when `labeled_instruction_name` is used as a labeled instruction.

**Key CALM Commands: Building Blocks of Compiled Logic**

Within the body of a CALM instruction, you use a specialized set of commands. These commands operate on symbolic variables (including the parameters) and allow for text manipulation, computation, conditional logic, and output control.

Here's a breakdown of the most essential CALM commands:

*   **`assemble variable`**:
    *   **Purpose:**  Takes the symbolic value of `variable` and passes it directly to the fasm g assembler for processing as source code.
    *   **Usage:**  Fundamental for injecting dynamically constructed fasm g code into the assembly process.

    ```assembly
    calminstruction echo? text&
        assemble text  ; Directly assemble the 'text' argument
    end calminstruction

    echo db 'Hello from CALM!'
    ```

*   **`match pattern, variable [, bracket_pairs]`**:
    *   **Purpose:**  Performs pattern matching against the symbolic value of `variable`, similar to the `match` directive, but within CALM.
    *   **Usage:**  Extract parts of the text in `variable` based on `pattern` and assign them to wildcard variables named in the pattern.
    *   **`pattern`**:  Follows the same pattern syntax as the `match` directive.
    *   **`variable`**:  Symbolic variable whose text is matched.
    *   **`bracket_pairs` (optional)**:  Specifies bracket pairs (e.g., `()`, `[]`, `{}`) for balanced bracket matching, as in the `match` directive.

    ```assembly
    calminstruction extract_dd? instruction&
        local size, value
        match size dd value, instruction
        jyes found_dd
        err 'Not a DD instruction!'
        exit
    found_dd:
        display 'Size:', size, ', Value:', value
    end calminstruction

    extract_dd dd 1234h  ; Output: Size: dd, Value: 1234h
    extract_dd dw 5678h  ; Output: Error message
    ```

*   **`arrange destination_variable, pattern`**:
    *   **Purpose:**  Constructs a new symbolic value in `destination_variable` based on the `pattern`. It's the inverse of `match`.
    *   **Usage:**  Builds text strings dynamically by inserting literal tokens and the symbolic values of other variables into the `pattern`.
    *   **`destination_variable`**:  Symbolic variable to store the constructed text.
    *   **`pattern`**:  Defines the structure of the text to build. Literal tokens are copied directly, and variable names (not preceded by `=`) are replaced by their symbolic values.

    ```assembly
    calminstruction dd_instruction? value
        local instruction
        arrange instruction, =dd value  ; Build "dd value" string
        assemble instruction           ; Assemble the constructed string
    end calminstruction

    dd_instruction 0ABCDEFh  ; Assembles "dd 0ABCDEFh"
    ```

*   **`compute destination_variable, expression`**:
    *   **Purpose:** Evaluates a numerical `expression` and assigns the *numeric result* to `destination_variable`.
    *   **Usage:**  Performs arithmetic and bitwise calculations within CALM. The `expression` is pre-compiled at CALM instruction definition time for efficiency. Symbolic variables within the expression are treated as numeric sub-expressions.

    ```assembly
    calminstruction multiply_by_two? value
        local result
        compute result, value * 2  ; Calculate value * 2
        display 'Result:', result
    end calminstruction

    multiply_by_two 10  ; Output: Result: 20
    ```

*   **`check logical_expression`**:
    *   **Purpose:**  Evaluates a `logical_expression` (similar to `if` conditions) and sets an internal result flag (tested by `jyes`/`jno`).
    *   **Usage:**  Implements conditional logic within CALM. Symbolic variables in the `logical_expression` are treated as numeric values.

    ```assembly
    calminstruction check_range? value
        check value >= 0 & value <= 255
        jyes in_range
        display 'Value out of range!'
        exit
    in_range:
        display 'Value is in range.'
    end calminstruction

    check_range 100   ; Output: Value is in range.
    check_range 300   ; Output: Value out of range!
    ```

*   **`publish symbol_variable [, value_variable] [:,] [:]`**:
    *   **Purpose:**  Defines a symbol in the main fasm g assembly based on the text in `symbol_variable`.
    *   **Usage:**  Dynamically create symbols with names and values determined within CALM.
    *   **`symbol_variable`**: Symbolic variable containing the *name* of the symbol to define.
    *   **`value_variable` (optional)**: Symbolic or numeric variable containing the *value* to assign to the symbol. If omitted, the symbol is defined without a value (like a label, but expression class).
    *   **Trailing `:`**: Makes the defined symbol a *constant* (`:=` behavior).
    *   **Leading `:`**: *Stacks* the value on the symbol (like `=:` behavior).

    ```assembly
    calminstruction define_symbol? name, value
        publish name, value :  ; Define a constant symbol
    end calminstruction

    define_symbol myVar, 1234h
    display 'Value of myVar:', myVar  ; Output: Value of myVar: 1234h
    ```

*   **`transform variable [, namespace]`**:
    *   **Purpose:**  Performs symbolic value transformation within `variable`, similar to how `equ` processes its assigned value. Replaces symbolic variable identifiers in `variable`'s text with their respective symbolic values.
    *   **Usage:**  Expands symbolic variables within a text string.
    *   **`variable`**:  Symbolic variable to transform.
    *   **`namespace` (optional)**:  Specifies a namespace to resolve symbols within the text, overriding the original context.

    ```assembly
    symbol_link equ myVar
    myVar equ 5
    calminstruction show_transformed? var
        transform var
        display 'Transformed value:', var
    end calminstruction

    show_transformed symbol_link  ; Output: Transformed value: 5
    ```

*   **`stringify variable`**:
    *   **Purpose:**  Converts the symbolic value of `variable` into a *string* type value and stores it back in `variable`.
    *   **Usage:**  Useful for ensuring a value is treated as text, especially after numerical computations where you want to represent the result as a string.

    ```assembly
    calminstruction number_to_string? num
        compute num, num + 10
        stringify num
        display 'Number as string:', num
    end calminstruction

    number_to_string 5  ; Output: Number as string: 15
    ```

*   **`take destination_variable, source_variable`**:
    *   **Purpose:**  Operates on symbol value stacks. Removes the *topmost* value from `source_variable`'s stack and assigns it to `destination_variable`.
    *   **Usage:**  Manages stacks of symbolic values, enabling undo/restore operations or iterating through value histories.
    *   **`destination_variable`**:  Symbolic variable to receive the taken value. Can be empty to discard the value.
    *   **`source_variable`**: Symbolic variable to take the value from.

    ```assembly
    myVar equ 1
    myVar equ 2
    myVar equ 3

    calminstruction restore_var? var
        take var, var  ; Take the latest value off the stack (value '3' will be removed)
        take restored_value, var ; Take the next value off the stack (value '2' will be assigned to restored_value)
        display 'Restored Value:', restored_value
    end calminstruction

    restore_var myVar ; Output: Restored Value: 2
    display 'Current myVar (still on stack):', myVar ; Output: Current myVar (still on stack): 1
    ```

*   **`call instruction_name [, argument1, argument2, ...]`**:
    *   **Purpose:**  Executes another *CALM instruction* directly.
    *   **Usage:**  Allows for modularity and code reuse within CALM instructions.  Enables building complex CALM logic by composing smaller, specialized CALM instructions.
    *   **`instruction_name`**:  Name of the CALM instruction to call.
    *   **`argument1, argument2, ...` (optional)**:  Variables or constants whose values are passed as arguments to the called CALM instruction.  These arguments are *directly assigned* to the called instruction's parameters.

    ```assembly
    calminstruction display_prefix? prefix, text
        display prefix, text
    end calminstruction

    calminstruction greet? name
        local greeting
        arrange greeting, =Hello,
        call display_prefix, greeting, name  ; Call display_prefix with prefix and name
    end calminstruction

    greet 'World!' ; Output: Hello, World!
    ```

**Control Flow Commands in CALM:**

CALM provides commands to control the execution flow within a CALM instruction:

*   **`jump label`**: Unconditional jump to `label` within the *same* CALM instruction.
*   **`jyes label`**: Conditional jump to `label` if the *result flag* is set (typically set by `match` or `check` on success).
*   **`jno label`**: Conditional jump to `label` if the *result flag* is *not* set.
*   **`exit`**:  Immediately terminates the execution of the current CALM instruction.

**Labels in CALM:**

Labels within CALM instructions are defined using a simple name followed by a colon `:`:

```assembly
my_label:
    ; CALM commands
```

These labels are *local to the CALM instruction* and are only used as jump targets for `jump`, `jyes`, and `jno`. They are distinct from regular fasm g labels.

**Assembly Commands within CALM: Direct Output Control**

CALM also includes a subset of standard fasm g assembly directives for direct output manipulation, operating on *raw offsets* rather than area addresses:

*   **`display value`**:  Outputs `value` (string or byte number) as a message to the standard output.
*   **`err message`**:  Generates an error message `message` (string).
*   **`emit size, value`**: Generates `size` bytes of data with `value` (numeric or string). `value` is optional for uninitialized data.
*   **`load target_variable, offset, size`**: Loads `size` bytes from output at `offset` into `target_variable`.
*   **`store offset, size, value`**: Stores `size` bytes of `value` at `offset` in the output.

These commands provide fine-grained control over the generated output directly from within CALM instructions, often used for tasks like checksum calculation or data manipulation at specific output positions.  Remember that offsets for `load` and `store` are *raw byte offsets* from the beginning of the output.

**Local Variables and Symbol Resolution in CALM:**

A key distinction of CALM is its handling of symbols:

*   **CALM Parameters are Local Symbolic Variables:**  Parameters declared in the `calminstruction` definition become *local symbolic variables* within the instruction's scope.  When the instruction is called, argument text is assigned to these variables.
*   **Fixed Symbol References at Definition Time:**  Symbol references within the CALM instruction's code are *resolved and fixed* at the *time the CALM instruction is defined*.  This means that if you use a global symbol within a CALM instruction, it will always refer to the symbol's value *at the time of CALM instruction definition*, not when the CALM instruction is *executed*.
*   **`local` Command for Explicit Local Symbols:**  To explicitly declare additional local symbolic variables within a CALM instruction (beyond the parameters), use the `local` command:

    ```assembly
    calminstruction example?
        local temp_var, counter
        ; ... use temp_var and counter ...
    end calminstruction
    ```

This fixed-reference behavior and local variable scope are fundamental to understanding how CALM instructions differ from regular macros and contribute to their performance and predictable behavior.

**Extending CALM with Macro-Defined Commands:**

You can further customize CALM by defining your own commands within the `calminstruction?` namespace using regular macroinstructions. This allows you to create higher-level abstractions and tailor CALM to specific tasks.  Remember to define these macro-based CALM commands as *case-insensitive* to be correctly recognized within CALM instructions.

```assembly
macro calminstruction?.asmarranged? variable*, pattern&
    arrange variable, pattern
    assemble variable
end macro

calminstruction writeln? text&
    asmarranged text, =display text,10 ; Using our macro-defined command
end calminstruction

writeln 'Custom CALM command!'
```

**Practical Examples: Unleashing CALM's Power**

**(This section would be expanded with more concrete, illustrative examples. Here are a few example ideas):**

*   **Dynamically Generating Instruction Sequences:**  A CALM instruction that takes a list of register names and generates a sequence of instructions to push them onto the stack, based on runtime-determined logic.
*   **Text Parsing and Validation:** A CALM instruction to parse a complex configuration string, validate its format using `match`, and extract key parameters into variables for further assembly logic.
*   **Checksum Calculation within Assembly:** A CALM instruction that iterates through a defined output area (using `load` and `store`) to calculate a checksum and embed it at a specific location in the output file.
*   **Conditional Macro Expansion Based on Complex Criteria:**  A CALM instruction that uses `check` and `jyes`/`jno` to implement more sophisticated conditional macro expansion logic than simple `if` directives allow.

**(Further sections could include):**

*   **Advanced CALM Techniques:**  (Area-relative offsets for `load/store`, more complex control flow patterns, etc.)
*   **Best Practices for CALM Instruction Design:** (Modularity, clarity, error handling within CALM).
*   **Comparison with Regular Macros: When to Choose CALM vs. Macros.**

**Conclusion: CALM - A Powerful Tool for Advanced Assembly**

CALM instructions represent a significant step up in complexity and power compared to regular macros.  By understanding their compiled nature, specialized commands, and unique symbol handling, you can leverage CALM to create highly efficient, robust, and dynamically controlled assembly code, pushing the boundaries of what's possible within fasm g. While they require a deeper understanding, mastering CALM unlocks a new dimension of advanced assembly programming.
