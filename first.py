#起動して http://localhost:8000/ にブラウザででアクセス
#フォームで送信した内容がmessageフォルダに入ります。
#!C:\Users\kenzi\AppData\Local\Programs\Python\Python37\python.exe

import urllib.parse
import cgi
from datetime import datetime
from wsgiref.simple_server import make_server

# 入力HTML文字列
input_html = '''
<!doctype html>
<html>
<head>
<title>MASSAGE TO KUMO</title>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<meta http-equiv="Content-style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="author" content="橋本 健二" />
<meta name="description" content="問い合わせの簡易WEBサーバーです。8000番ポートで待ち受けます。" />
<meta name="robots" content="noindex">
<style>
html {
	background: #222;
}

body {
	width: 460px;
	margin: 0 auto;
	padding: 0 0 40px 0;
	background: #eee;
font-family: Helvetica, Arial;
}

h1 {
	background-color: #FC7600;
	color: #fff;
	font-size: 1.6em;
	padding: 30px 20px 15px 20px;
	margin-bottom: 20px;
}

#header {
	padding: 0 20px;
}

.body li {
	margin-bottom: 10px ;
}

.body p,
#header p {
	color: #555;
	line-height: 160%;
	margin-bottom: 10px;
}

.body p,
#header small {
	font-size: 10pt;
	color: #777;
	display: block;
	line-height: 140%;
}

.body strong,
#header strong {
	color: #000;
	font-weight: bold;
}

.body a,
#header a {
	color: #444;
}

.body a:hover,
#header a:hover {
	color: #000;
}

form legend {
	color: #333;
	padding: 0 0 20px 0;
	text-transform: uppercase;
}

form {
	padding: 0 20px 20px 20px;
}

form, form fieldset input, form fieldset textarea, form label {
	font-family: Helvetica, Arial;
	font-size: 12pt;
}
form p { position: relative; margin: 10px 0;}
form p label { position: absolute; top: 0; left: 0; cursor:	text;}
form p br {display: none;}


form fieldset p input,
form fieldset p textarea {
	display: block;
	padding: 4px;
	width: 400px;
	margin: 0;
}

form fieldset p label {
	width: 380px;
	display: block;
	margin: 5px 5px 5px 6px;
	padding: 0;
}

form fieldset p textarea {
	padding: 2px;
	width: 404px;
}

form fieldset p textarea,
form fieldset p input {
	border: solid 1px #ccc;
}
form fieldset p label {
	color: #777;
}

.body {
	padding: 0 20px;
}

h2 {
	color: #aaa;
	font-size: 4em;
	padding: 30px 0 10px 0 ;
	letter-spacing: -3px;
	font-weight: normal;
}

pre {
	font-size: 10pt;
	font-family: "Courier New";
	background: #000;
	padding: 10px 5px;
	color: #fff;
}

tt {
		font-family: "Courier New";
		font-weight: bold;
		color: #000;
}

.body ul {
	padding: 0 0 10px 20px;
	margin: 0 0 0 20px;
	list-style: disc;
	font-size: 0.8em;
}
</style>
</head>
  <body>
<div class="body"><h2>Contact Us</h2></div>
   <form action="/" method="POST">
    <fieldset>
      <legend>Comment Form</legend>
      <label>Name</label><p><br /><input type="text" name="name" id="name" placeholder=""></p>
      <label>Email</label><br /><p><input type="email" name="email" id="email"  placeholder="" required></p>
      <label>Website</label><br /><p><input type="text" name="website" id="website"  placeholder=""></p>
      <label>Comment</label><br /><p><textarea name="comment" id="comment" rows="10" cols="40" placeholder="" required></textarea></p>
    </fieldset>
    <p><input type="submit" value="Send"></p>
   </form>
  </body>
</html>
'''
 
# 結果HTML文字列
result_html = '''
<!DOCTYPE html>
<html>
  <head>
    <title>RESULT SEND MESSAGE</title>
    <meta charset="UTF-8">
  </head>
  <body>
    {}
    <hr>
    {}
    <hr>
    {}
  </body>
</html>
'''
 
def parse_query(query):
    name = 'none'
    email = 'none'
    website = 'none'
    comment = 'none'
 
    for param, value in query:
        if param == b'name':
            name = value.decode('UTF-8')
        elif param == b'email':
            email = value.decode('UTF-8')
        elif param == b'website':
            website =  value.decode('UTF-8')
        elif param == b'comment':
            comment =  value.decode('UTF-8')
 
    errors = []
    #if name == '未入力':
    #    errors.append('メールアドレスの入力がありません。')
    if email == '未入力':
        errors.append('お名前の入力がありません。')
    #if website == '未入力':
    #    errors.append('サイトの入力がありません。')
    if comment == '未入力':
        errors.append('内容の入力がありません。')
 
    return name, email, website, comment, errors
 
def test_app(environ, start_response):
 
    start_response('200 OK', [('Content-Type','text/html')])
    method = environ.get('REQUEST_METHOD')

    #path_w = 'test_w.txt'
 
    # フォームから値を取得
    if method == 'POST':
        wsgi_input = environ['wsgi.input']
        content_length = int(environ.get('CONTENT_LENGTH', 0))
        query = urllib.parse.parse_qsl(wsgi_input.read(content_length))
        name, email, website, comment, errors = parse_query(query)
 
        result = 'name：{} '.format(name)
        result += 'email: {} '.format(email)
        result += 'website: {} '.format(website)
        result += 'comment: {} '.format(comment)
             
 
        # 結果を表示
        #text = 'Python学習中'
        dt_now = datetime.now()
        file = open('message/' + dt_now.strftime('%Y-%m-%d_%H-%M-%S-') + 'message.txt', 'w')
        file.write(result)
        file.close()

        return [result_html.format(
            'リクエストは {} です。'.format(method),
            result,
            '<br />'.join(errors)
        ).encode('UTF-8')]
 
    return [input_html.encode('UTF-8')]
 
# WSGIテストサーバーの作成
with make_server('', 8000, test_app) as httpd:
 
    # テストサーバーによる待ち受け
    print('Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...')
    httpd.serve_forever()