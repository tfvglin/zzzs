/**
 * 页面上常用的一些脚本函数。包括对checkbox的全选，反选，改变颜色等。  
 */

/** 捕获用户事件，将回车键转换为tab键 */
window.document.onkeydown = function(evt){
  if(evt === null) {evt = window.event;}

  if(evt && evt.keyCode == 13&& evt.srcElement.type && evt.srcElement.type != 'submit' && evt.srcElement.type != 'button' && evt.srcElement.type != 'textarea' ){
    try{
      evt.keyCode = 9;
    }catch(e){
    }
  }
}

/**
 * 鼠标选中时改变所在行的背景颜色。
 * TODO: TR的样式是写死了，不太好
 * @ck 传来的checkbox对象
 */
function changRowColor(ck){
  var styleName;  
	if (ck.checked){
		styleName = "infoDisTR_Selected"
	}else{
	  styleName = "infoDisTR"
	}
	while (ck.tagName!="TR"){
		ck = ck.parentElement;
	}
	if(ck.tagName=="TR"){
	  ck.className = styleName;
	}	
}

/**
 * 全选，反选
 * @ck 作用的checkbox对象
 * @state 状态，true/false
 */
function checkAll(ck,state){
  if(ck.type == "checkbox"){//checkbox只有一个元素时
    ck.checked = state;
    //changRowColor(ck);
    return;
  }
  for(var i=0; i<ck.length; i++){
    ck[i].checked = state;
    //changRowColor(ck[i]);
  }
}

/**
 * 计算多选框被选中的个数。
 * @ck checkbox对象
 */
function getCheckedCount(ck){
  if(ck.type == "checkbox") return ck.checked ? 1 : 0 ; //只有一个元素
  var num = 0;
  for(var i=0;i<ck.length;i++){
    if(ck[i].checked) num += 1;
  }
  return num;
}

/**
 * 防止表单多次提交函数
 * 如果是第一次提交表单，函数返回true，表示可以提交，否则不能提交
 * frm - 表单对象。第一次提交表单后，会将表单内的所有的button置为不可用
 * added by ZhengWangLi 2004.11.30
 */
var FRM_SUBMITED = false;
function confirmSubmited(frm){
  
  if(!FRM_SUBMITED){
    FRM_SUBMITED = true;
    //为了视觉效果，将表单内所有的按钮置为不可用    
    if(frm){   
      var eles = frm.elements;
      for(var i=0; i < eles.length; i++) {    
        obj= eles.item(i);
        type=obj.type;
        if((type == "button" || type == "submit" || type == "reset") && obj.disabled == false){        
          obj.disabled = true;
        }
      }
    }     
    return true;
  }
  return false;
}

//模仿MSN的消息提示窗口。only use in IE
var oPopup;
var popTop = 50;
function showMsg(msg){
  oPopup = null;
	try{
	  oPopup = window.createPopup();
	  popmsg(msg);
	}catch(e){
	  alert(msg);
	}
}

function popmsg(msgstr){
	
	var winstr="<table style='border: 1 solid  #FFA6CA'  width='241' height='172' border='0' cellpadding='0' cellspacing='0'  >";
	winstr+="<tr><td height='30'> </td></tr><tr><td align='center'><table width='90%' height='110' border='0' cellpadding='0' cellspacing='0'>";
	winstr+="<tr><td valign='top' align='center' style='font-size:12px; color: red; face: Tahoma'>"+msgstr+"</td></tr></table></td></tr></table>";
	oPopup.document.body.innerHTML = winstr;
	popshow();
}
function popshow(){
	//window.status=popTop;
	if(popTop>1720){
		clearTimeout(mytime);
		oPopup.hide();
		return;
	}else if(popTop>1520&&popTop<1720){
		oPopup.show(screen.width-250,screen.height,241,1720-popTop);
	}else if(popTop>1500&&popTop<1520){
		oPopup.show(screen.width-250,screen.height+(popTop-1720),241,172);
	}else if(popTop<180){
		oPopup.show(screen.width-250,screen.height,241,popTop);
	}else if(popTop<220){
		oPopup.show(screen.width-250,screen.height-popTop,241,172);
	}
	popTop+=10;
	var mytime=setTimeout("popshow();",50);
}