function loginInfo(arg1,arg2,arg3){
	var msg =[
		"<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>ע��ɹ�!���μ���������ע����Ϣ.</font>",
		"<br/>","<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>��&nbsp;��&nbsp;��:"+arg1+"</font>",
		"<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>��&nbsp;&nbsp;&nbsp;&nbsp;��:"+arg2+"</font>",
		"<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=2>�����ʼ�:"+arg3+"</font>",	
		"<br/>","<br/>",
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='btnStyle' type='button' onclick=doSend('"+arg1+"','"+arg2+"')  value = '��¼ϵͳ'/>",
		"&nbsp;&nbsp;<input class='btnStyle' type='button' onclick='ymPrompt.doHandler(\"close\");'  value = '��&nbsp;&nbsp;��'/>",
	].join('');
	
	ymPrompt.win(msg,320,220,'ע��ɹ���ʾ');
}	

function doSend(arg1,arg2) {
	alert(arg1 + arg2);
	var url = "/j_acegi_login.do?j_username=" + arg1 + "&j_password=" + arg2;
	alert(url);
	window.location = url;
}

