@echo off

IF "%1"=="" echo BlockChain.bat [ƒtƒHƒ‹ƒ_–¼]
IF NOT "%1"=="" GOTO :STRAT
GOTO :EOF

:STRAT
chcp 65001

attrib -H BLOCK_CHAIN.txt

REM set /p SEED="SEED IN THE THIS:"
CALL SET_SEED.bat
set SEED_VAL=MD5SimpleBlockchainSignature: %SEED%
echo %SEED_VAL% > BLOCK_CHAIN_HASH.txt
echo STRAT_OF_BLOCK_CHAIN_LIST > BLOCK_CHAIN_LIST_TMP.txt
echo [filename] [seed] >> BLOCK_CHAIN_LIST_TMP.txt
for /F %%i in ('dir /B /o:n %1') do FOR /F "tokens=1,2" %%A IN (BLOCK_CHAIN_HASH.txt) do IF %%A==MD5SimpleBlockchainSignature: node Md5Sign.js %1\%%i %%B > BLOCK_CHAIN_HASH.txt && IF %%A==MD5SimpleBlockchainSignature: echo %%i %%B >> BLOCK_CHAIN_LIST_TMP.txt
echo ############################################################### >> BLOCK_CHAIN_LIST_TMP.txt

CALL SEED_OVER_RIDE.bat

copy BLOCK_CHAIN_LIST.txt + BLOCK_CHAIN_HASH.txt BLOCK_CHAIN.txt

attrib +H BLOCK_CHAIN.txt

del BLOCK_CHAIN_LIST_TMP.txt
del BLOCK_CHAIN_LIST.txt
del BLOCK_CHAIN_HASH.txt

set /p YorN="DO THE GPG SIGN?(y/n):"

IF %YorN%==y gpg --clear-sign BLOCK_CHAIN.txt
IF %YorN%==Y gpg --clear-sign BLOCK_CHAIN.txt

IF %YorN%==y certutil -encode BLOCK_CHAIN.txt.asc BLOCK_CHAIN.txt.asc.jpg
IF %YorN%==Y certutil -encode BLOCK_CHAIN.txt.asc BLOCK_CHAIN.txt.asc.jpg

chcp 932

set SEED=
set SEED_VAL=