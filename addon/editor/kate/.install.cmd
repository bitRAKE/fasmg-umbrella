@(
	set DEST="%USERPROFILE%\AppData\Local\org.kde.syntax-highlighting\syntax"

	REM insure directory path exists, ignore error
	mkdir %DEST% 2>NUL
	if exist %DEST%* (
		REM copy *.xml files to expected location, overwrite
		xcopy /Q /I /Y "%~dp0*.xml" %DEST%\*
	) else (
		echo unable to create directory %DEST%
	)
)
