@ECHO OFF
TITLE SMTP SEND
IF "%1"=="" GOTO :HELP0
IF NOT "%1"=="" GOTO :ZERO
GOTO :EOF

:HELP0
ECHO SIGN.BAT [Seed]
GOTO :EOF

:ZERO
node md5sign ./Product_IMG.json %1 > Sign.txt