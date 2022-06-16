REM try:
REM	"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\x64\OneCore*"
REM	"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64\OneCore*"

@REM pass in the search path to process or single file
for %%G in (%*) do (
	dumpbin /ALL "%%G" >"%%~nG.exports.txt"
	lua54 libdump_to_fasmg.lua "%%~nG.exports.txt" >"%%~nG.fincg"
	del "%%~nG.exports.txt"
)
