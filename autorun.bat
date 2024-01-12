@echo off
doskey /macrofile=macros.txt
set PATH=%PATH%;%CD%
set PATH=%PATH%;%CD%\EXE
set PATH=%PATH%;%CD%\SDelete

set OPENAI_API_KEY=#####YOUR OpenChat API KEY THE IN THIS from https://openai.com/api/#####
set GOOGLE_APPLICATION_CREDENTIALS=#####YOUR Authentication info from https://cloud.google.com/docs/authentication/production?hl=ja#####