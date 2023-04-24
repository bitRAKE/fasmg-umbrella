@ECHO OFF
REM	test suite data complements of:
REM	https://github.com/fefe982/DeMangleVC
for /f "usebackq tokens=* delims=" %%a in ("test.demangle.txt") do (
    demangle "%%a"
)

ECHO.
ECHO Doesn't work on GCC style symbol mangling:
demangle "_ZNK8KxVectorIP13KxLogObserverjE10idxIsValidEj"
