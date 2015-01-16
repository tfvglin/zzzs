<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<script type="text/javascript" src="js/page.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<title>本科报名系统</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<script>
function doLogin(){
	
  var frm = window.document.frm;
  if(isEmpty(frm.username.value)){
    alert("用户名不能为空！");
    frm.username.focus();
    return;
  }
  
  if(confirmSubmited(frm)){   	
  	//frm.j_password.value = MD5(frm.j_password.value); //对密码的MD5加密
  	frm.username.value=frm.username.value.replace(/\s+/g,""); //add 去掉空格 by wangxinyi 20130103 
    frm.submit();
  }
}
function xslogin(){
window.location='/zzzs/home/regedit.jsp';
}

function xsfindpasswors(){
window.location='/student.bz_wsbm_password.do?m=beforeFindPassword';
}

function doTeacherLogin(){
  var frm = window.document.frm;
  if(isEmpty(frm.username.value)){
    alert("报名号不能为空！");
    frm.username.focus();
    return;
  }
  if(confirmSubmited(frm)){ 
    frm.submit();
  }
}

//初始化函数
/*function init(){
  window.document.title = "请您登录";
  window.document.frm.username.focus();
}
Event.observe(window, "load", init, false);*/
</script>


<body>
<!-- Copyright ?2008. Spidersoft Ltd -->
<style>
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>
<%@ include file="/common/header.jsp" %>
<div class="content"  >
	<div class="TopPic"></div>
    <div class="contentWrap">
 	 <div class="column_1">
            <h1>本科招生报名系统</h1>
            <p class="introTxtManage">本系统用于西安电子科技大学自主招生、保送生、高水平运动员、艺术特长生招生信息采集等的申请、管理和结果查询等。
            <br /><br />
            第一次使用本系统进行报名时，请先注册。<span style="color:#da4837;font-weight:bold">同一身份证号每年只允许注册一次</span>，注册成功后，可用于报考相关的类别。注册时的用户名和密码将是考生在本系统申请和查询结果等信息的唯一依据。</p>

        </div>
        <div class="colum_2">
        	<div class="loginSection">
        		<h3>管理员登录</h3>
        		  <div class="table1">
				      
                <form name="frm" action="subAdminLogin" method="post">
                	账号<br />
                    <input name="username" type="text" id="textfield" tabindex="1" class="inp"/><br />
                    密码<br />
                    <input name="password" type="password"  id="textfield2" tabindex="2" class="inp"/>
                    <div class="btnWrap"><input name="" value="登录" type="button" class="btn"  onClick="doLogin();" tabindex="3" /></div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
<div class="footer">
		<a href="admin/login.jsp" tabindex="5">     </a>　　　　
</div>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>
