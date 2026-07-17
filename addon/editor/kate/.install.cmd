@echo off
setlocal
set "DEST=%LOCALAPPDATA%\org.kde.syntax-highlighting\syntax"

if not exist "%DEST%\" (
	mkdir "%DEST%" 2>NUL
	if errorlevel 1 (
		echo Unable to create directory "%DEST%".
		exit /b 1
	)
)

xcopy /Q /I /Y "%~dp0*.xml" "%DEST%\"
exit /b %ERRORLEVEL%
