function getElementsByName_iefix(tag, name) {
	var elem = document.getElementsByTagName(tag);
	var arr = new Array();
	for (i = 0, iarr = 0; i < elem.length; i++) {
		att = elem[i].getAttribute("name");
		if (att == name) {
			arr[iarr] = elem[i];
			iarr++;
		}
	}
	return arr;
}
/**
add_step_common.jsp页面中 点击导航栏的时候触发提交按钮，同时将导航栏的url传到后台去 
*/

var jquery = jQuery.noConflict();//解决jquery与prototype.js冲突的问题(中学信息表页面使用了prototype-1.4.0.js) 将$换为jquery

jquery.changePage = function(url){
		jquery("#pageNextValue").attr("value",url);
		jquery('#saveAndContinue').trigger('click');
	};
	
