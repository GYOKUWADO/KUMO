@echo off
TITLE GET_NEWS_PYTHON_CODE
IF "%1" == "" GOTO :HELP
IF "%1" == "/g" GOTO :A
GOTO :EOF

:HELP
echo JPnews.bat [/g]
echo [/g] �� NewsPaper.txt �ɗ��񂳂ꂽ URL ���� sitemap.xml ���擾��
echo      www.sankei.com �� sitemap.xml ��� xml_time.txt �̎���������ɍX�V���ꂽ�֐��̃j���[�X�� html�t�@�C�� ���擾�� kansai_news.html �ɏo�͂��܂��B
GOTO :EOF

:A
JPnews_in_sitemap.py
sankei_news.py > kansai_news.html
set xmltime=%date:~0,4%-%date:~5,2%-%date:~8,2%T%time%
echo %xmltime% > xml_time.txt
GOTO :EOF
