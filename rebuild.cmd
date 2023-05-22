@ECHO OFF	&:: echo will be restored when script ends
SETLOCAL	&:: keep variables local to this file

::	abstract output to capture and be quiet, if desired
set DEBUG_LOG="%~dp0.wip\debug.log"
::	quiet mode - only see errors
REM set DEBUG_LOG=NUL
::	standard output viewed in terminal
REM set DEBUG_LOG=?

PUSHD "%~dp0"
ECHO. >>%DEBUG_LOG%
ECHO. >>%DEBUG_LOG%
ECHO	-----	building examples ----- >>%DEBUG_LOG%
fasmg examples\_threads.asm >>%DEBUG_LOG%
fasmg examples\test.ITextHost2.asm >>%DEBUG_LOG%
fasmg examples\vt100.asm >>%DEBUG_LOG%
fasmg examples\xoshiro_threads.asm >>%DEBUG_LOG%

fasmg examples\glob_test\glob_test.asm >>%DEBUG_LOG%
fasmg examples\ducts\mtf.asm >>%DEBUG_LOG%
fasmg examples\cmdline\ShowParams.asm >>%DEBUG_LOG%
fasmg examples\TaskDialog\TaskDlgSamples.asm >>%DEBUG_LOG%
fasmg examples\wnd_tests\mag.asm >>%DEBUG_LOG%

PUSHD "examples\in-tale" 2>>NUL
If %errorlevel% EQU 0 (
	ECHO	-----	menu.cmd ----- >>%DEBUG_LOG%
	CALL menu.cmd >>%DEBUG_LOG%
	POPD
)

PUSHD "tools" 2>>NUL
If %errorlevel% EQU 0 (
	ECHO	-----	build.cmd ----- >>%DEBUG_LOG%
	CALL build.cmd >>%DEBUG_LOG%
	POPD
)

:: TODO:
::	+ raylib examples
::	+ SDL examples
::	+ \addon\editor\kate\
::		+ x86_fasmg\.process.cmd
::		+ .install.cmd
::		+ .CMD files are not highlighted

POPD
