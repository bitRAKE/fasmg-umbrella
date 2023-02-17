@(
	:: use fasmg to process  both \fasmg and \addon cpu includes
	set BASE="..\..\..\..\fasmg\packages\x86\include\cpu\"
	FOR /R %BASE% %%G IN (*.inc) DO @(
		fasmg -n -i "INCLUDE '%~dp0stub.inc'" %%G ".\%%~nG"
	)
	FOR /R %BASE% %%G IN (*.inc) DO @(
		fasmg -n -i "define BASE '%%~nG'" "%~dp0lister.g" %%~nG.xml
	)
	FOR /R %BASE% %%G IN (*.inc) DO @(
		del "%%~nG"
	)
)
