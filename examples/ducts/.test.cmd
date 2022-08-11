if "%1" EQU "" (set THIS=duct.mft.exe) else (set THIS=%1)
duct.mft.exe e < %THIS% > duct.001
duct.mft.exe e < duct.001 > duct.002
duct.mft.exe e < duct.002 > duct.003
duct.mft.exe d < duct.003 > duct.020
duct.mft.exe d < duct.020 > duct.010
duct.mft.exe d < duct.010 > duct.000
fc /B %THIS% duct.000
fc /B duct.001 duct.010
fc /B duct.002 duct.020
