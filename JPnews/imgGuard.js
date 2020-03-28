/*
* 画像保存禁止
* @return none
*/
function imgGuard(name){
  //PCの右クリックによる画像保存禁止処理
  $(name).on('contextmenu',function(e){
    return false;
  });
  $(name).on('mousedown mouseup',function(e){
    return false;
  });
  //スマホ長押しによる画像保存禁止処理
  $(name).css({
    'pointer-events':'none',//iphone対応するための記述
    '-webkit-touch-callout':'none',
    '-webkit-user-select':'none',
    '-moz-touch-callout':'none',
    '-moz-user-select':'none',
    'touch-callout':'none',
    'user-select':'none'
  });
}

//DOMがよみこまれた段階で実装
$(function(){
  imgGuard('.imgGuard');
});