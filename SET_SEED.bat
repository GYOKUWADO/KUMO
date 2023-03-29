@echo off

set "pscmd=powershell.exe -Command " ^
$inputPass = read-host 'SEED IN THE THIS' -AsSecureString ; ^
$BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); ^
[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""

for /f "tokens=*" %%a in ('%pscmd%') do set SEED=%%a

REM echo %SEED%
pause