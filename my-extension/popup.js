//ON THE KUMO PROJECTより
//誰かが作ったソフトウェアに頼ることより自分の力で解決する事の方が大切な事です。
//勉強することや誰かに頼むことお金で解決する事など様々な解決方法がありますが何もせずに、
//与えられたものだけを受け取っていても物事は前に進まない。

const allowedDomains = [
  //銀行
  "mufg.jp",
  "smbc.co.jp",
  "mizuhobank.co.jp",
  "resonabank.co.jp",
  "jp-bank.japanpost.jp",
  //クレジットカード会社
  "smbc-card.com",
  "jcb.co.jp",
  "saisoncard.co.jp",
  //証券会社
  "nomura.co.jp",
  "daiwa.jp",
  "sbisec.co.jp",
  "rakuten-sec.co.jp",
  //保険会社
  "nissay.co.jp",
  "meijiyasuda.co.jp",
  "tokiomarine-nichido.co.jp",
  "sonysonpo.co.jp",
  //信用金庫/信用組合
  "tokyo-shinkin.co.jp"
];

chrome.tabs.query({ active: true, currentWindow: true }, function(tabs) {
  const currentTab = tabs[0];
  const url = new URL(currentTab.url);
  const domain = url.hostname.replace(/^www\./, ""); // www.を除去して比較しやすく

  document.getElementById("url").textContent = currentTab.url;

  // ドメインが許可リストに含まれているかチェック
  if (!allowedDomains.includes(domain)) {
    alert("⚠️ このサイトのドメインは許可されていません: " + domain);
  }
});
