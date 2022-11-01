: For each *.INC file in \lang\ build the menu example.
IF NOT EXIST bin\ MKDIR bin
FOR %%G IN (lang\*.inc) DO (
	fasmg -I "INCLUDE '%%G'" menu.asm bin\%%~nG.exe
)