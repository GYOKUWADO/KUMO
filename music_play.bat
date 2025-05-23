@echo off
chcp 65001

set /p DL="ON THE KUMO PROJECT から HIP HOP MUSIC をダウンロードしますか？(y/n)"

IF %DL% == y python music_DL_B.py
IF %DL% == Y python music_DL_B.py

set HIPHOP_PATH=HIPHOP_MUSIC

FOR /F "tokens=1,2" %%a IN (%HIPHOP_PATH%\music_play_list.txt) DO set m%%a=%%b

echo ######################################################
FOR /F "tokens=1,2" %%a IN (%HIPHOP_PATH%\music_play_list.txt) DO echo %%a %%b
:A
set /p m_play="Play_No:"

FOR /F "tokens=1,2" %%a IN (%HIPHOP_PATH%\music_play_list.txt) DO IF %m_play%==%%a %HIPHOP_PATH%\%%b.mp3
FOR /F "tokens=1,2" %%a IN (%HIPHOP_PATH%\music_play_list.txt) DO IF %m_play%==%%a %HIPHOP_PATH%\%%b.txt

GOTO :A
