@REM	compile each *.asm file with fasmg and delete result
@REM	as we are only interested in the possible error output

@for %%G in ("%~dp0*.asm") do @(
	@fasmg %%G "%~dp0file.tmp"
	@del "%~dp0file.tmp"
)
