/*
* �摜�ۑ��֎~
* @return none
*/
function imgGuard(name){
  //PC�̉E�N���b�N�ɂ��摜�ۑ��֎~����
  $(name).on('contextmenu',function(e){
    return false;
  });
  $(name).on('mousedown mouseup',function(e){
    return false;
  });
  //�X�}�z�������ɂ��摜�ۑ��֎~����
  $(name).css({
    'pointer-events':'none',//iphone�Ή����邽�߂̋L�q
    '-webkit-touch-callout':'none',
    '-webkit-user-select':'none',
    '-moz-touch-callout':'none',
    '-moz-user-select':'none',
    'touch-callout':'none',
    'user-select':'none'
  });
}

//DOM����݂��܂ꂽ�i�K�Ŏ���
$(function(){
  imgGuard('.imgGuard');
});