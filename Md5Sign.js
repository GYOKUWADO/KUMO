//usege is node Md5Sign.js [FileName] [Seed]

//const json = require('./Product_IMG.json');

require('date-utils');
let now = new Date();

const program = require("commander");

program.parse(process.argv);

const FileName = program.args[0];
const Seed = program.args[1];

const crypto = require("crypto");
const fs = require("fs");

function md5file(filePath) {
    const target = fs.readFileSync(filePath);
    const md5hash = crypto.createHash('md5');
    md5hash.update(target);
    return md5hash.digest("hex");
}

function md5hex(str /*: string */) {
  const md5 = crypto.createHash('md5')
  return md5.update(str, 'binary').digest('hex')
}

//console.log(md5file(FileName));

function MD5SimpleBlockchainSign() {
  md5baseVal = md5file(FileName);
  TheBaseMailAddress = 'kenzihashimoto@ares.eonet.ne.jp'; //Your mail address in The This

  console.log('Date:                          ' + now.toFormat('YYYY/MM/DD HH:MI:SS'));
  console.log('FileName:                      ' + FileName);
  console.log('File to MD5-Algorithm Val:     ' + md5baseVal);
  console.log('TheBaseMailAddress:            ' + TheBaseMailAddress);

  if (Seed == undefined){
    SingBaseVal = TheBaseMailAddress + md5baseVal;

    const md5SimpleBlockchainSign = md5hex(SingBaseVal);
   
    console.log('Seed:                          ' + Seed);
    console.log('SignBaseVal:                   ' + SingBaseVal);
    console.log('MD5SimpleBlockchainSignature:  ' + md5SimpleBlockchainSign);
  } else {
    SingBaseVal = Seed + TheBaseMailAddress + md5baseVal;

    const md5SimpleBlockchainSign = md5hex(SingBaseVal);

    //console.log('Seed:                          ' + Seed);
    //console.log('SignBaseVal:                   ' + SingBaseVal);
    console.log('MD5SimpleBlockchainSignature:  ' + md5SimpleBlockchainSign);
    console.log('Seed is Your good country');
  }
}

MD5SimpleBlockchainSign();