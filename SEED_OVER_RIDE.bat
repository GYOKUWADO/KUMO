echo off
set hide=********
echo 置換開始
setlocal enabledelayedexpansion
for /f "delims=" %%A in (BLOCK_CHAIN_LIST_TMP.txt) do (
    set line0=%%A
    set line1=!line0:%SEED%=%hide%!
    echo !line1!>>BLOCK_CHAIN_LIST.txt
)
endlocal
echo 置換完了
pause