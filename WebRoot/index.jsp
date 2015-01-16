<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <script type="text/javascript" src="js/validation.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
  	<title>本科报名系统</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<script>
function doLogin(){
	
  var frm = window.document.frm;
  if(isEmpty(frm.username.value)){
    alert("邮箱不能为空！");
    frm.username.focus();
    return;
  }
  
  if(confirmSubmited(frm)){   	
  	//frm.password.value = MD5(frm.password.value); //对密码的MD5加密
  	frm.username.value=frm.username.value.replace(/\s+/g,""); //add 去掉空格 by wangxinyi 20130103 
  	frm.userpass.value =frm.userpass.value;
    frm.submit();
  }
}
var travel=true;
var hotkey=13;   /* hotkey即为热键的键值,是ASII码,这里13代表回车键 */
 if (document.layers)
 document.captureEvents(Event.KEYPRESS);
 function gogo(e){ 
	 if (document.layers) {
         if (e.which==hotkey&&travel) document.forms[0].submit();
     }
     else if (document.forms[0]){
         if (window.event.keyCode==hotkey) document.forms[0].submit();
     }
 }
 //document.onkeypress=gogo ;
 document.onkeypress=function(e){
	 e=e||window.event;
	 if (document.layers) {
         if (e.which==hotkey&&travel) document.forms[0].submit();
     }
     else if (document.forms[0]){
         if (e.keyCode==hotkey) document.forms[0].submit();
     }
};
function xslogin(){
window.location='regedit';
}
function doTeacherLogin(){
  var frm = window.document.frm;
  if(isEmpty(frm.username.value)){
    alert("邮箱不能为空！");
    frm.username.focus();
    return;
  }
  if(confirmSubmited(frm)){ 
    frm.submit();
  }
}

//初始化函数
function init(){
  window.document.title = "请您登录";
  window.document.frm.username.focus();
}
//Event.observe(window, "load", init, false);
</script>


<body>


<!-- Copyright ?2008. Spidersoft Ltd -->
<style>
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>
<%@ include file="common/header.jsp" %>
<div class="content"  >
	<div class="TopPic"></div>
    <div class="contentWrap">
 	 <div class="column_1">
            <h1>西安电子科技大学特殊类型招生报名系统</h1>
            <p class="introTxt">本系统用于西安电子科技大学自主选拔录取、保送生、高水平运动员等特殊类型招生考试的申请、管理和结果查询等。
            <br /><br />
            第一次使用本系统进行报名时，请先注册。<span style="color:#da4837;font-weight:bold">同一身份证号每年只允许注册一次</span>，注册成功后，可用于报考相关的类别。注册时的用户名和密码将是考生在本系统申请和查询结果等信息的唯一依据。</p>
            <div class="regSection">
              还不是本系统的用户？ &nbsp; &nbsp; <a href="javascript:xslogin();">注册新用户</a></div>
        </div>
        <div class="colum_2">
        	<div class="loginSection">
        		<h3>学生登录</h3>
        		  <div class="table1">
				    <s:if test="tip!=null">
                      <div class="error">
	                    <s:property value="tip"/>
                      </div>
                    </s:if>
                    <s:actionerror cssClass="error"/>      
                <form name="frm" action="userLogin" method="post">
                	邮箱<br />
                    <input name="username" type="text" id="textfield" tabindex="1" class="inp"/><br />
                    密码<br />
                    <input name="userpass" type="password"  id="textfield2" tabindex="2" class="inp"/>
                    <div class="btnWrap"><a href="findpassword" style="font-size:14px">&nbsp;忘记密码？ </a><input name="" value="登录" type="button" class="btn"  onClick="doLogin();" tabindex="3" /></div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
  </div>　　　
</div>
<table width="1280">
<tr><td align="center" style="color:red;">提示：若页面未正常加载则可能为网络状况不佳，请尝试刷新。</td></tr></table>
<%@ include file="common/footer.jsp" %>
</body>
</html>