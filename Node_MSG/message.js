//以下のnpm installを実行してください。
//npm install jschardet
//npm install dateformat
var http = require('http');

var maxData = 5 * 1024;
//var maxData = 1;

var jschardet = require('jschardet');
var notUtf8String = "送信データは5Kbyte以下にしてください。";

var detectResult = jschardet.detect(notUtf8String);

const fs = require("fs");
var dateformat = require('dateformat');

var server = http.createServer(function(req, res) {
  if (req.method == 'POST') {
    var body = '';
    // data受信イベントの発生時に断片データ(chunk)を取得
    // body 変数に連結
    req.on('data', function(chunk) {
        body += chunk;

    });
    
    // 受信完了(end)イベント発生時
    req.on('end', function() {
     try {

        if(body.length > maxData) {
          res.writeHead(413,{'Content-Type': 'text/plain; charset=utf-8'});
　　　  　console.log(detectResult);
          res.end( notUtf8String );
          return;
         }

         var dt = new Date();
         console.log(decodeURIComponent(body));
         //console.log(body);
         //console.log(dt);
         console.log(dateformat(dt, 'isoDateTime'));
         fs.writeFileSync("message/message-" + dateformat(dt, 'yyyy-mm-dd-HH-MM-ss') + ".txt",decodeURIComponent(body),{flag: "w"});
         res.end();
     } catch (err) {
         console.log(err.name + ': ' + err.message);
         process.exit(-1);
     }

    });
  }
}).listen(49152);