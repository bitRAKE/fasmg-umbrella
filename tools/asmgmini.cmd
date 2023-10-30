@echo off
setlocal enabledelayedexpansion
rem	Anchor on parent directory:
set "this=%~dp0.."
rem	Order is important, FIFO search:
set "include=%this%;%this%\addon\packages\x64\include;%this%\fasmg\packages\x86\include"

rem ----- Rebuild asmgmini if source code is newer than executable: -----
rem	(Note: datetime format based on locale, echo output to debug.)
set _executable_=10/10/2010 1:01:01 PM
for /f "tokens=*" %%a in ('forfiles /p "asmgmini" /m "asmgmini.asm" /c "cmd /c echo @fdate @ftime" 2^>nul') do set _source_=%%a
for /f "tokens=*" %%b in ('forfiles /p "..\tools" /m "asmgmini.exe" /c "cmd /c echo @fdate @ftime" 2^>nul') do set _executable_=%%b

if "!_source_!" gtr "!_executable_!" (
	rem	Configure build environment:
	set "path=%this%\fasmg\core;%path%"

	fasmg asmgmini\asmgmini.asm asmgmini.exe
	fasmg ..\fasmg\core\source\windows\dll\fasmg.asm fasmg.dll
)
rem	Start editor and close command window:
start /B "" "asmgmini.exe"