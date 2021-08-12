@echo off
CALL FUNCTION34

for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~0,4%==%%i set JPL_A=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~5,4%==%%i set JPL_B=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~10,4%==%%i set JPL_C=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~15,4%==%%i set JPL_D=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~20,4%==%%i set JPL_E=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~25,4%==%%i set JPL_F=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~30,4%==%%i set JPL_G=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~35,4%==%%i set JPL_H=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~40,4%==%%i set JPL_I=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~45,4%==%%i set JPL_J=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~50,4%==%%i set JPL_K=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~55,4%==%%i set JPL_L=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~60,4%==%%i set JPL_M=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~65,4%==%%i set JPL_N=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~70,4%==%%i set JPL_O=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~75,4%==%%i set JPL_P=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~80,4%==%%i set JPL_Q=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~85,4%==%%i set JPL_R=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~90,4%==%%i set JPL_S=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~95,4%==%%i set JPL_T=%%j
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %LPJ6:~100,4%==%%i set JPL_U=%%
echo %JPL_A%%JPL_B%%JPL_C%%JPL_D%%JPL_E%%JPL_F%%JPL_G%%JPL_H%%JPL_I%%JPL_J%%JPL_K%%JPL_L%%JPL_M%%JPL_N%%JPL_O%%JPL_P%%JPL_Q%%JPL_R%%JPL_S%%JPL_T%%JPL_U%