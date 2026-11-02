chcp 932
python MmailKAI.py
powershell Compress-Archive -Path .\header*.txt -DestinationPath .\MEIWAKU_Mail_Header.zip -Force
sdelete.exe -p 3 header*.txt

set /p YorN="eomailでdekyoにMEIWAKUのメールヘッダー情報を送りますか？(y/n)"
IF "%YorN%"=="y" python eo_smtp.py
IF "%YorN%"=="y" echo :ERRORLEVEL %ERRORLEVEL%