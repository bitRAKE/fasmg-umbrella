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
CALL :run fasmg examples\_threads.asm || GOTO :fail
CALL :run fasmg examples\test.ITextHost2.asm || GOTO :fail
CALL :run fasmg examples\vt100.asm || GOTO :fail
CALL :run fasmg examples\xoshiro_threads.asm || GOTO :fail

CALL :run fasmg examples\glob_test\glob_test.asm || GOTO :fail
CALL :run fasmg examples\ducts\mtf.asm || GOTO :fail
CALL :run fasmg examples\cmdline\ShowParams.asm || GOTO :fail
CALL :run fasmg examples\TaskDialog\TaskDlgSamples.asm || GOTO :fail
CALL :run fasmg examples\wnd_tests\mag.asm || GOTO :fail

PUSHD "examples\in-tale" 2>>NUL
If %errorlevel% EQU 0 (
	ECHO	-----	menu.cmd ----- >>%DEBUG_LOG%
	CALL :run CALL menu.cmd || (POPD & GOTO :fail)
	POPD
)

PUSHD "tools" 2>>NUL
If %errorlevel% EQU 0 (
	ECHO	-----	build.cmd ----- >>%DEBUG_LOG%
	CALL :run CALL build.cmd || (POPD & GOTO :fail)
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
EXIT /B 0

:run
%* >>%DEBUG_LOG%
IF ERRORLEVEL 1 (
	ECHO build failed: %* >>%DEBUG_LOG%
	EXIT /B 1
)
EXIT /B 0

:fail
POPD
EXIT /B 1
