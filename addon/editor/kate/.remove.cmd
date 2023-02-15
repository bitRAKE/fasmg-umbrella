@(
	for /r "%~dp0" %%G in (*.xml) do
		del "%USERPROFILE%\AppData\Local\org.kde.syntax-highlighting\syntax\%%~nxG"
)