
fasmg support in the KSyntaxHighlighting Framework


Installation (Windows):
	- XML syntax files need to be copied to:
		%USERPROFILE%\AppData\Local\org.kde.syntax-highlighting\syntax



Developing the Syntax Definition:

Through studying the existing syntax support of the KSyntaxHighlighting Framework, and the fasmg source code; the definition was gradually built up. First, I started with number representations - my initial work was not correct. Even testing against existing source codes would sometimes fail.

The process of testing changes in the syntax:
    - Ctrl-S : Save XML definition file
    - F7 : open command line
    - execute "reload-highlighting" command
    - validate changes

After reaching the limits of this initial process, then came building test files and extracting x86 instructions from (fasmg)[0]'s definitions. This process is (largely automated)[1] and can updated concurrently with changes to fasmg.



Thoughts on Future Work:

Although, fasmg cannot be completely parsed by the KSyntaxHighlighting engine, it should be possible to do finer grain highlighting by breaking each line into different contexts.



References:
    KSyntaxHighlighting
    https://api.kde.org/frameworks/syntax-highlighting/html/index.html

    Working with Syntax Highlighting
    https://docs.kde.org/trunk5/en/kate/katepart/highlight.html

    Over 300 syntax definition files
    https://invent.kde.org/frameworks/syntax-highlighting/-/tree/master/data/syntax

    fasmg Highlighting for NotepadPlusPlus
	https://github.com/bitRAKE/fasmg-NotepadPlusPlus


[0] https://github.com/tgrysztar/fasmg/tree/master/packages/x86/include/cpu
[1] https://board.flatassembler.net/topic.php?p=214280#214280
