@echo off
setlocal EnableDelayedExpansion

set LIST_FILE=filelist.txt

:: Check if LIST_FILE exists
if not exist "%LIST_FILE%" (
    echo Error: The file list '%LIST_FILE%' does not exist.
    exit /b 1
)

:: Check if LIST_FILE is empty
for /f "tokens=* delims=" %%a in ('type "%LIST_FILE%" ^| find /v /c ""') do set size=%%a
if "%size%"=="0" (
    echo Error: This script expects a single file on each line.
    echo Error: The file list '%LIST_FILE%' is empty.
    exit /b 1
)

:: Initialize an empty variable for the files list
set FILES_LIST=

:: Read each line from the text file and append to the list
for /F "tokens=*" %%f in (%LIST_FILE%) do (
    set FILES_LIST=!FILES_LIST! "%%f"
)

:: Show the result:
echo %FILES_LIST%
