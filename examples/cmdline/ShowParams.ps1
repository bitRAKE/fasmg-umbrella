param (
    [Parameter(Position=0)]$Param1,
    [Parameter(Position=1)]$Param2,
    [Parameter(Position=2)]$Param3,
    [Parameter(Position=3)]$Param4
)

Write-Host "Listing all parameters:"
foreach ($param in $PSBoundParameters.Keys) {
    Write-Host "`t$param = $($PSBoundParameters.Item($param))"
}
