@echo off

TITLE GoogleSearh in cmd
IF "%1"=="" GOTO :HELP
IF "%1"=="/i" GOTO START1
IF "%1"=="/f" GOTO START2
IF "%1"=="/s" GOTO START3
IF "%1"=="/o" GOTO START4
IF NOT "%1"=="" GOTO START0
EXIT /B

:HELP
echo �������[�h����͂��Ă��������B
echo �� google �_
echo �摜����������ɂ� /i �I�v�V���������Ă��������B
echo �� google /i �_
echo �t�B���^��\������ɂ� /f �I�v�V���������Ă��������B
echo �� google /f
echo �T�C�g�}�b�v�𑗐M����ɂ� /s �I�v�V���������Ă��������B
echo �� google /s
echo ON THE KUMO PROJECT�Ƀu���E�U�ŃA�N�Z�X����ɂ� /o �I�v�V���������Ă��������B
echo �� google /o
GOTO :EOF

:START0
rem �����������[�h�ɑΉ�
rem ���p�X�y�[�X�ƑS�p�X�y�[�X��+�֒u������
rem �������[�h1 �������[�h2 �� �������[�h1+�������[�h2
set line=%*
set line=%line: =+%
set search_keys=%line: =+%

rem Google�����I
start https://www.google.co.jp/search?q=%search_keys%
GOTO :EOF

:START1
set line=%*
set line=%line:~3%
set search_keys=%line: =+%

rem Google�摜����
start https://www.google.co.jp/search?q=%search_keys%^&tbm=isch
GOTO :EOF

:START2
start http://kumo.site/document/txt/GoogleSerchCode.txt
GOTO :EOF

:START3
IF "%sitemap%"=="" echo �Ǘ��Ҍ�����cmd�����s���āASETX /M sitemap [url] �ŕϐ� sitemap ���`���Ă��������B
IF "%sitemap%"=="" exit /B
start https://www.google.com/ping?sitemap=%sitemap%
GOTO :EOF

:START4
start http://kumo.site
GOTO :EOF

:START5
set line=%*
set line=%line:~3%
set search_keys=%line: =+%

rem Google�����I
start https://www.google.co.jp/search?q=%search_keys%+site:www.webmodelers.com
GOTO :EOF

rem �Q�lURL
rem �E�B���h�E�ŏ�����ԂŃo�b�`�����s����
rem https://blog.cles.jp/item/8980