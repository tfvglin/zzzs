<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
  	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.jsp"></script> -->
	<title>��������������������ϵͳ �һ�����</title>
	<link href="${pageContext.request.contextPath}/css/findpassword.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css" />
</head>
<script>
function doLogin(){
var IDcard=window.document.findForm.idcard.value;
if(IDcard==null||IDcard==""){
    alert("���֤�Ų���Ϊ�գ�");
    findForm.idcard.focus();
    return;
  }
  if (IDcard.length != 15 && IDcard.length != 18){  
    alert("�������֤�����ʽ����ȷ!");  
    findForm.idcard.focus();
    return;  
  }
  var area={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"};   
  if(area[parseInt(IDcard.substr(0,2))]==null) {  
      alert("���֤���벻��ȷ(�����Ƿ�)!");  
      findForm.idcard.focus();
      return;  
  }
  if(IDcard.length == 15){  
      pattern= /^\d{15}$/;  
      if (pattern.exec(IDcard)==null){  
      alert("15λ���֤�������Ϊ���֣�");
      findForm.idcard.focus();  
      return;  
  }
  var birth = parseInt("19" + IDcard.substr(6,2));  
  var month = IDcard.substr(8,2);  
  var day = parseInt(IDcard.substr(10,2));  
  switch(month) {  
      case '01':  
      case '03':  
      case '05':  
      case '07':  
      case '08':  
      case '10':  
      case '12':  
      if(day>31){  
          alert('�������֤���벻��ʽ��ȷ!'); 
          findForm.idcard.focus();  
          return;  
      }  
      break;  
      case '04':  
      case '06':  
      case '09':  
      case '11':  
      if(day>30){  
          alert('�������֤���벻��ʽ��ȷ!');
          findForm.idcard.focus();  
          return;  
      }  
      break;  
      case '02':  
      if((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {  
          if(day>29) {  
              alert('�������֤���벻��ʽ��ȷ!');  
              findForm.idcard.focus();  
              return;  
          }  
      } else {  
          if(day>28) {  
              alert('�������֤���벻��ʽ��ȷ!'); 
              findForm.idcard.focus(); 
              return;  
          }  
      }  
      break;  
      default:  
          alert('�������֤���벻��ʽ��ȷ!');
          findForm.idcard.focus();   
          return;  
      }  
      var nowYear = new Date().getYear();  
      if(nowYear - parseInt(birth)<15 || nowYear - parseInt(birth)>100) {  
          alert('�������֤���벻��ʽ��ȷ!');  
          findForm.idcard.focus();  
          return;  
      }  
  }  
  var Wi = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);  
  var   lSum        = 0;  
  var   nNum        = 0;  
  var   nCheckSum   = 0;  
  for (i = 0; i < 17; ++i)  
  {  
      if ( IDcard.charAt(i) < '0' || IDcard.charAt(i) > '9' )  
      {  
          alert("�������֤�����ʽ����ȷ!");
          findForm.idcard.focus();  
          return;  
      }  
      else  
      {  
          nNum = IDcard.charAt(i) - '0';  
      }  
      lSum += nNum * Wi[i];  
  }  
  if( IDcard.charAt(17) == 'X' || IDcard.charAt(17) == 'x')  
  {  
      lSum += 10*Wi[17];  
  }  
  else if ( IDcard.charAt(17) < '0' || IDcard.charAt(17) > '9' )  
  {  
      alert("�������֤�����ʽ����ȷ!"); 
      findForm.idcard.focus(); 
      return;  
  }
  findForm.submit();
}

//��ʼ������
function init(){
  window.document.title = "������¼";
  window.document.frm.j_username.focus();
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
<%@ include file="/common/header.jsp" %>
<div class="content">
			<div class="TopPic"></div>
			<div class="contentWrap">
				<h1>
					�һ�����
				</h1>
				<div class="regtable">
					<form name="findForm" action="subFindPassword" method="post">
						<input type="hidden" name="token"
							value="7f495b55efc0777c7eed3bf29279c8e6" />

						
							<div class="getpassword">
								<div class="tips important">
									���ǻὫ�����������ò����͵���ע��ʱ��д�ĵ�������									
								</div>
								<div class="item clearfix">
									<div class="txt">
										���֤��
										<span class="important">(*)</span>
									</div>
									<div class="form">
										<input type="text" name="idcard" id="idcard" class="inp"  value="" />
										<div class="info">
											����ע��ʱ�Ŀ������֤�š�
											<br />
										</div>
									</div>
								</div>
								<br />
								<br />
								<div class="item clearfix">
									<div class="txt"></div>
									<div class="form">
										<div class="passwordbtn">
											
												<input name="" value="�һ�����" type="button" onClick="doLogin();" class="btn" />
											
										</div>
									</div>
								</div>
							</div>
						

					</form>
					
					
                <!-- ��� email ��Ϊ�� ��˵���Ѿ������뷢�͵���ѧ��ע��ʱ������-->

				
				

				
					
				</div>

				<div class="clear"></div>
			</div>
		</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>