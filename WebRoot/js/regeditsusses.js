function loginInfo(arg1,arg2,arg3){
	var msg =[
		"<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>注册成功!请牢记以下您的注册信息.</font>",
		"<br/>","<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>用&nbsp;户&nbsp;名:"+arg1+"</font>",
		"<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>密&nbsp;&nbsp;&nbsp;&nbsp;码:"+arg2+"</font>",
		"<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>电子邮件:"+arg3+"</font>",	
		"<br/>","<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='btnStyle' type='button' onclick=doSend('"+arg1+"','"+arg2+"')  value = '登录系统'/>",
		"&nbsp;&nbsp;<input class='btnStyle' type='button' onclick='ymPrompt.doHandler(\"close\");'  value = '关&nbsp;&nbsp;闭'/>",
	].join('');
	
	ymPrompt.win(msg,320,220,'注册成功提示');
}	

function doSend(arg1,arg2) {
	alert(arg1 + arg2);
	var url = "/j_acegi_login.do?j_username=" + arg1 + "&j_password=" + arg2;
	alert(url);
	window.location = url;
}

