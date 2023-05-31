@echo off
setlocal

:Loop
if "%~1"=="" goto :EndLoop
echo %1
shift
goto :Loop

:EndLoop
endlocal
