@SET this=%~dp0
@SET this=%this:~0,-1%

@REM Configure environment to build examples:
@SET path=%this%\fasmg\core;%path%
@SET include=%this%\addon\packages\x64\include;%this%\fasmg\packages\x86\include
@ECHO [91mshould be able to build any of the examples with:[m fasmg {file}.asm
