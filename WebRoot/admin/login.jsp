<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<script type="text/javascript" src="js/page.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<title>���Ʊ���ϵͳ</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<script>
function doLogin(){
	
  var frm = window.document.frm;
  if(isEmpty(frm.username.value)){
    alert("�û�������Ϊ�գ�");
    frm.username.focus();
    return;
  }
  
  if(confirmSubmited(frm)){   	
  	//frm.j_password.value = MD5(frm.j_password.value); //�������MD5����
  	frm.username.value=frm.username.value.replace(/\s+/g,""); //add ȥ���ո� by wangxinyi 20130103 
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
    alert("�����Ų���Ϊ�գ�");
    frm.username.focus();
    return;
  }
  if(confirmSubmited(frm)){ 
    frm.submit();
  }
}

//��ʼ������
/*function init(){
  window.document.title = "������¼";
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
            <h1>������������ϵͳ</h1>
            <p class="introTxtManage">��ϵͳ�����������ӿƼ���ѧ��������������������ˮƽ�˶�Ա�������س���������Ϣ�ɼ��ȵ����롢����ͽ����ѯ�ȡ�
            <br /><br />
            ��һ��ʹ�ñ�ϵͳ���б���ʱ������ע�ᡣ<span style="color:#da4837;font-weight:bold">ͬһ���֤��ÿ��ֻ����ע��һ��</span>��ע��ɹ��󣬿����ڱ�����ص����ע��ʱ���û��������뽫�ǿ����ڱ�ϵͳ����Ͳ�ѯ�������Ϣ��Ψһ���ݡ�</p>

        </div>
        <div class="colum_2">
        	<div class="loginSection">
        		<h3>����Ա��¼</h3>
        		  <div class="table1">
				      
                <form name="frm" action="subAdminLogin" method="post">
                	�˺�<br />
                    <input name="username" type="text" id="textfield" tabindex="1" class="inp"/><br />
                    ����<br />
                    <input name="password" type="password"  id="textfield2" tabindex="2" class="inp"/>
                    <div class="btnWrap"><input name="" value="��¼" type="button" class="btn"  onClick="doLogin();" tabindex="3" /></div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
<div class="footer">
		<a href="admin/login.jsp" tabindex="5">     </a>��������
</div>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>
