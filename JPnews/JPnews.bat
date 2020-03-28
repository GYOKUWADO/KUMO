@echo off
TITLE GET_NEWS_PYTHON_CODE
IF "%1" == "" GOTO :HELP
IF "%1" == "/g" GOTO :A
GOTO :EOF

:HELP
echo JPnews.bat [/g]
echo [/g] は NewsPaper.txt に羅列された URL から sitemap.xml を取得し
echo      www.sankei.com の sitemap.xml より xml_time.txt の時刻よりも後に更新された関西のニュースの htmlファイル を取得し kansai_news.html に出力します。
GOTO :EOF

:A
JPnews_in_sitemap.py
sankei_news.py > kansai_news.html
set xmltime=%date:~0,4%-%date:~5,2%-%date:~8,2%T%time%
echo %xmltime% > xml_time.txt
GOTO :EOF
