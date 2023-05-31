$Kernel32Definition = @'
[DllImport("kernel32")]
public static extern IntPtr GetCommandLineW();
[DllImport("kernel32")]
public static extern IntPtr LocalFree(IntPtr hMem);
'@

$Kernel32 = Add-Type -MemberDefinition $Kernel32Definition -Name 'Kernel32' -Namespace 'Win32' -PassThru

$Shell32Definition = @'
[DllImport("shell32.dll", SetLastError = true)]
public static extern IntPtr CommandLineToArgvW(
    [MarshalAs(UnmanagedType.LPWStr)] string lpCmdLine,
    out int pNumArgs);
'@

$Shell32 = Add-Type -MemberDefinition $Shell32Definition -Name 'Shell32' -Namespace 'Win32' -PassThru

$RawCommandLine = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($Kernel32::GetCommandLineW())
Write-Host "The raw command line is (excluding the angle brackets)\:`n<$RawCommandLine>`n"

$ParsedArgCount = 0
$ParsedArgsPtr = $Shell32::CommandLineToArgvW($RawCommandLine, [ref] $ParsedArgCount)

try
{
    $ParsedArgs = @( );

    0..$ParsedArgCount | ForEach-Object {
        $ParsedArgs += [System.Runtime.InteropServices.Marshal]::PtrToStringUni(
            [System.Runtime.InteropServices.Marshal]::ReadIntPtr($ParsedArgsPtr, $_ * [IntPtr]::Size)
        )
    }
}
finally
{
    $Kernel32::LocalFree($ParsedArgsPtr) | Out-Null
}

Write-Host "The command line as parsed by CommandLineToArgvW (not MSVCRT) is:"
# -lt to skip the last item, which is a NULL ptr
for ($i = 0; $i -lt $ParsedArgCount; $i += 1) {
    Write-Host "argv[$i] <$($ParsedArgs[$i])>"
}