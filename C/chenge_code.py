import re

filename = 'C.bat'

x = input('変更する合言葉の漢字一文字のJISコードを入力して下さい。 : ')
with open(filename, 'r') as f:
    fileText = f.read()
    after = re.sub('IF "%JIS%"==".*" GOTO START4', 'IF "%CODE%"=="' + x + '" GOTO START4',fileText)
    print(after)

with open(filename, mode="w") as f:
    f.write(after)