@ECHO OFF	&:: echo will be restored when script ends
SETLOCAL	&:: keep variables local to this file
set DEBUG_LOG=NUL

PUSHD "%~dp0"
fasmg examples\_threads.asm >%DEBUG_LOG%
fasmg examples\test.ITextHost2.asm >%DEBUG_LOG%
fasmg examples\vt100.asm >%DEBUG_LOG%
fasmg examples\xoshiro_threads.asm >%DEBUG_LOG%

fasmg examples\glob_test\glob_test.asm >%DEBUG_LOG%
fasmg examples\ducts\mtf.asm >%DEBUG_LOG%
fasmg examples\cmdline\ShowParams.asm >%DEBUG_LOG%
fasmg examples\TaskDialog\TaskDlgSamples.asm >%DEBUG_LOG%
fasmg examples\wnd_tests\mag.asm >%DEBUG_LOG%

PUSHD "examples\in-tale" 2>%DEBUG_LOG%
If %errorlevel% EQU 0 (
	CALL menu.cmd
	POPD
)

PUSHD "tools" 2>%DEBUG_LOG%
If %errorlevel% EQU 0 (
	CALL build.cmd
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
