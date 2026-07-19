@ECHO OFF
SETLOCAL
REM Compile each *.asm file with fasmg and delete its temporary output.
REM Stop immediately if assembly fails so callers receive a failing status.

FOR %%G IN ("%~dp0*.asm") DO (
	fasmg "%%~fG" "%~dp0file.tmp"
	IF ERRORLEVEL 1 (
		IF EXIST "%~dp0file.tmp" DEL /Q "%~dp0file.tmp" >NUL 2>&1
		ECHO Validation failed: %%~nxG
		EXIT /B 1
	)
	DEL /Q "%~dp0file.tmp"
	IF ERRORLEVEL 1 (
		ECHO Unable to remove temporary output: %~dp0file.tmp
		EXIT /B 1
	)
)
EXIT /B 0
