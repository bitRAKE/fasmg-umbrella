fasmg Support in the KSyntaxHighlighting Framework[^1]
---
Installation (Windows):

- [ ] XML syntax files need to be copied to:
	* `%USERPROFILE%\AppData\Local\org.kde.syntax-highlighting\syntax`

- [ ] Prioritize fasmg over conflicting extensions:[^5]
	* menu `Settings` -> item `Configure Kate...`
		* section `Open/Save`, tab `Modes & Filetypes`
			* `Filetype:` Assembler/fasmg
			* `Priority:` 15
---
Developing the Syntax Definition:
---
Through studying[^4] the existing syntax support of the KSyntaxHighlighting Framework[^2][^3], and the fasmg source code; the definition was gradually built up. First, I started with number representations - my initial work was not correct. Even testing against existing source codes would sometimes fail.

* The process of testing changes in the syntax:
	* `Ctrl-S` : Save XML definition file
	* `F7` : open command line
	* execute `reload-highlighting` command
	* validate changes

After reaching the limits of this initial process, then came building test files and extracting x86 instructions from [fasmg's definitions][0]. This process is [largely automated][1] and can updated concurrently with changes to fasmg.

---
Thoughts on Future Work:
---
Although, fasmg cannot be completely parsed by the KSyntaxHighlighting engine, it should be possible to do finer grain highlighting by breaking each line into different contexts.

---

### References:
[^1]: [KSyntaxHighlighting](https://api.kde.org/frameworks/syntax-highlighting/html/index.html)
[^2]: [Working with Syntax Highlighting](https://docs.kde.org/trunk5/en/kate/katepart/highlight.html)
[^3]: [Over 300 syntax definition files](https://invent.kde.org/frameworks/syntax-highlighting/-/tree/master/data/syntax)
[^4]: [fasmg Highlighting for NotepadPlusPlus](/addon/editor/npp/)
[^5]: [How to change default syntax-highlighting for files in Kate (with images).](https://unix.stackexchange.com/questions/137989/how-to-change-default-syntax-highlighting-for-header-file-in-kate)


[0]: https://github.com/tgrysztar/fasmg/tree/master/packages/x86/include/cpu
[1]: https://board.flatassembler.net/topic.php?p=214280#214280
