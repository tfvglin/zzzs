<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <script type="text/javascript" src="js/validation.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
  	<title>���Ʊ���ϵͳ</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<script>
function doLogin(){
	
  var frm = window.document.frm;
  if(isEmpty(frm.username.value)){
    alert("���䲻��Ϊ�գ�");
    frm.username.focus();
    return;
  }
  
  if(confirmSubmited(frm)){   	
  	//frm.password.value = MD5(frm.password.value); //�������MD5����
  	frm.username.value=frm.username.value.replace(/\s+/g,""); //add ȥ���ո� by wangxinyi 20130103 
  	frm.userpass.value =frm.userpass.value;
    frm.submit();
  }
}
var travel=true;
var hotkey=13;   /* hotkey��Ϊ�ȼ��ļ�ֵ,��ASII��,����13����س��� */
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
    alert("���䲻��Ϊ�գ�");
    frm.username.focus();
    return;
  }
  if(confirmSubmited(frm)){ 
    frm.submit();
  }
}

//��ʼ������
function init(){
  window.document.title = "������¼";
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
            <h1>�������ӿƼ���ѧ����������������ϵͳ</h1>
            <p class="introTxt">��ϵͳ�����������ӿƼ���ѧ����ѡ��¼ȡ������������ˮƽ�˶�Ա�����������������Ե����롢����ͽ����ѯ�ȡ�
            <br /><br />
            ��һ��ʹ�ñ�ϵͳ���б���ʱ������ע�ᡣ<span style="color:#da4837;font-weight:bold">ͬһ���֤��ÿ��ֻ����ע��һ��</span>��ע��ɹ��󣬿����ڱ�����ص����ע��ʱ���û��������뽫�ǿ����ڱ�ϵͳ����Ͳ�ѯ�������Ϣ��Ψһ���ݡ�</p>
            <div class="regSection">
              �����Ǳ�ϵͳ���û��� &nbsp; &nbsp; <a href="javascript:xslogin();">ע�����û�</a></div>
        </div>
        <div class="colum_2">
        	<div class="loginSection">
        		<h3>ѧ����¼</h3>
        		  <div class="table1">
				    <s:if test="tip!=null">
                      <div class="error">
	                    <s:property value="tip"/>
                      </div>
                    </s:if>
                    <s:actionerror cssClass="error"/>      
                <form name="frm" action="userLogin" method="post">
                	����<br />
                    <input name="username" type="text" id="textfield" tabindex="1" class="inp"/><br />
                    ����<br />
                    <input name="userpass" type="password"  id="textfield2" tabindex="2" class="inp"/>
                    <div class="btnWrap"><a href="findpassword" style="font-size:14px">&nbsp;�������룿 </a><input name="" value="��¼" type="button" class="btn"  onClick="doLogin();" tabindex="3" /></div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
  </div>������
</div>
<table width="1280">
<tr><td align="center" style="color:red;">��ʾ����ҳ��δ�������������Ϊ����״�����ѣ��볢��ˢ�¡�</td></tr></table>
<%@ include file="common/footer.jsp" %>
</body>
</html>