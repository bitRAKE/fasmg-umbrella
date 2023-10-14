Create a Run command:
`"%ComSpec%" /K "cd /D "$(CURRENT_DIRECTORY)" & $(CURRENT_WORD)"`
... and any selected text can be executed in the current file's directory.

Create a Macro to select first line of any file:
`<Ctrl>+<Home>,<Right>,<Right>,<Shift>+<End>`

At the top of my test files I put the command line used to build:
`; fasmg.exe -e 5 -v 1 test.asm`

Now with two hot keys I can test any file. It's very flexible in that several commands can be sent to the command line, and the window remains open to examine output/errors (just type `exit` to close and return to editing).


**Caveats:**

The environment variables need to be set prior as chained commands will not see the changes. For example, the commands:
`set include=C:\fasmg\packages\x86\include & fasmg.exe test.asm`
... will not work, as fasmg will not see the changes to `%include%`.


**Refinements:**

By changing the `/K` to `/C` and appending `$(FILE_NAME)` the build commands can be copied between files without change and the command window closes with a keypress. Greater specialization makes this less flexible with multiple commands:
`"%ComSpec%" /c "cd /D "$(CURRENT_DIRECTORY)" & $(CURRENT_WORD) $(FILE_NAME) & pause"`


It's a great way to test snippets of code with various tools.

# debugging

Debug the executable of the same name as the current file (32-bit or 64-bit), using the current selection as the commandline for the application.
```
"Y:\x64dbg\release\x96dbg.exe" "$(CURRENT_DIRECTORY)\$(NAME_PART).exe" "$(CURRENT_WORD)"
```




# Test Notepad++ Configuration:

cmd /c echo $(CURRENT_DIRECTORY) && pause
cmd /K cd &quot;$(CURRENT_DIRECTORY)&quot; ^&amp;^&amp; &quot;$(FULL_CURRENT_PATH)&quot;


| value type          | syntax to use        | notes:               |
|---------------------|----------------------|----------------------|
| {selection}         | $(CURRENT_WORD)      | not word restricted  |
| FileName            | $(NAME_PART)         |                      |
| FileName.Ext        | $(FILE_NAME)         |                      |
| X:\path             | $(CURRENT_DIRECTORY) | settings dependent   |
| X:\path\FileName.Ext| $(FULL_CURRENT_PATH) |                      |
| ?:\\{install path}  | $(NPP_DIRECTORY)     |                      |



