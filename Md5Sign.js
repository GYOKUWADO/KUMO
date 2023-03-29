//usege is node Md5Sign.js [FileName] [Seed]
//Line 33 and 34 and 35 rewriting Your Infomation

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
  TheBaseDomain = 'kumo.site';                            //Your Domain in The This
  TheBasePhone = '0743-64-3170'

  console.log('Date:                          ' + now.toFormat('YYYY/MM/DD HH:MI:SS'));
  console.log('FileName:                      ' + FileName);
  console.log('File to MD5-Algorithm Val:     ' + md5baseVal);
  console.log('TheBaseDomain:                 ' + TheBaseDomain);
  
  if (Seed == undefined){
    SingBaseVal = TheBaseDomain + TheBaseMailAddress + md5baseVal;

    const md5SimpleBlockchainSign = md5hex(SingBaseVal);
   
    console.log('TheBaseMailAddress:            ' + TheBaseMailAddress);
    console.log('Seed:                          ' + Seed);
    console.log('SignBaseVal:                   ' + SingBaseVal);
    console.log('MD5SimpleBlockchainHash:       ' + md5SimpleBlockchainSign);
  } else {
    const FingerPrint = md5hex(Seed);
    SingBaseVal = Seed + TheBaseDomain + TheBasePhone + md5baseVal;

    const md5SimpleBlockchainSign = md5hex(SingBaseVal);

    //console.log('Seed:                          ' + Seed);
    //console.log('SignBaseVal:                   ' + SingBaseVal);
    console.log('TheBasePhone:                  ' + TheBasePhone);
    console.log('SeedFingerPrint:               ' + FingerPrint);
    console.log('MD5SimpleBlockchainSignature:  ' + md5SimpleBlockchainSign);
    console.log('There are seeds in this program.');
  }
}

MD5SimpleBlockchainSign();