<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>���������������ϱ���ϵͳ</title>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/comm.css" rel="stylesheet"  type="text/css" />
	<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet"  type="text/css" />
	<link href="${pageContext.request.contextPath}/css/s-1.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/checkform.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/ymPrompt.js"></script>
	<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/ymPrompt.css" />
	<script src="${pageContext.request.contextPath}/js/caChecker1.0.3.js" type="text/javascript"></script>
</head>
    <script src="${pageContext.request.contextPath}/js/regeditsusses.js" type="text/javascript"></script>
	<body>
        <%@ include file="/common/header.jsp"%>
		<div class="content">
			<div class="contentWrap">
				<h1>
				    ���û�ע��
				</h1>
				<div class="regtable">
					 
					 
	<form name="loginForm" action="userLogin" method="post" >
					

		<table width="80%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div   style="width:930px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<p style="color:#666666; text-decoration:none; font-family:Arial;">
							�װ���ͬѧ��
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���ã���ӭ��ע���������ӿƼ���ѧ�����������ϱ���ϵͳ�û���
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ע��Ϊ�����������ϱ���ϵͳ���û��������Ը���ע��ʱ��д��<font color='red'>����</font>��<font color='red'>����</font>��¼�����������ϱ���ϵͳ���������뱣�ͺ����������������ˮƽ�˶�Ա�Լ��ɼ���¼ȡ��ѯ�ȡ�
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							�ύǰ���μ��������������,����������¼ϵͳΨһ������.лл!
						</p>
						<p align="right"
							style="color:#666666; text-decoration:none; font-family:Arial;">
							�������ӿƼ���ѧ�����칫��
						</p>
					</div>
					<br/><br/>
					<div style="align:center;color:rgb(255, 114, 0);">
					<p align="center">
							<b>
									��ϲ��ע��ɹ������μ���������Ϣ��
							</b>
					</p>
					<br/>
					</div>		
						<div>
					<center>
					  <table class="table_data_zhuce1" >
								<tr >
									<td  >
										E-mail:
									</td>
									<td>
										 ${request.email}
									</td>
								</tr>
									<tr  >
									<td  >
										����:
									</td>
									<td>
										${request.userpass}
										 <input type="hidden" name="username"  value = "${request.email}"/>
										 <input type = "hidden" name = "userpass" value = "${request.userpass}"/>
									</td>
								</tr>								
								<tr >
									<td  >
										 ���֤��:
									</td>
									<td>
										 ${request.sfzh}  
									</td>
								</tr>								
							</table>
							</center>
							<p align="center">
								<br />	
<script >
function doLogin(){
  var frm = window.document.loginForm;
  frm.submit();
}
</script>
<input name="save" type="button" class="regbtnnew"  onClick="doLogin();" value="���ϵ�¼"  />
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button"  id="return"  class="regbtnnew"
									onclick="window.close();" value="�� &nbsp; ��" />
							</p>
						</div>
				</td>
			</tr>
		</table>
		
		</form>
		
		
					 
					 
               
					
				</div>

				<div class="clear"></div>
			</div>
		</div>
    <%@ include file="/common/footer.jsp" %>
	</body>
	<!--body end-->
</html>
