@echo off
CALL FUNCTION34

for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~0,4%==%%i set JPL_A=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~5,4%==%%i set JPL_B=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~10,4%==%%i set JPL_C=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~15,4%==%%i set JPL_D=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~20,4%==%%i set JPL_E=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~25,4%==%%i set JPL_F=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~30,4%==%%i set JPL_G=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~35,4%==%%i set JPL_H=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~40,4%==%%i set JPL_I=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~45,4%==%%i set JPL_J=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~50,4%==%%i set JPL_K=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~55,4%==%%i set JPL_L=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~60,4%==%%i set JPL_M=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~65,4%==%%i set JPL_N=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~70,4%==%%i set JPL_O=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~75,4%==%%i set JPL_P=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~80,4%==%%i set JPL_Q=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~85,4%==%%i set JPL_R=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~90,4%==%%i set JPL_S=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ1:~95,4%==%%i set JPL_T=%%j
echo %JPL_A%%JPL_B%%JPL_C%%JPL_D%%JPL_E%%JPL_F%%JPL_G%%JPL_H%%JPL_I%%JPL_J%%JPL_K%%JPL_L%%JPL_M%%JPL_N%%JPL_O%%JPL_P%%JPL_Q%%JPL_R%%JPL_S%%JPL_T%