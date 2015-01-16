<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>西电特殊类型网上报名系统</title>
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
				    新用户注册
				</h1>
				<div class="regtable">
					 
					 
	<form name="loginForm" action="userLogin" method="post" >
					

		<table width="80%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td>
					<div   style="width:930px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<p style="color:#666666; text-decoration:none; font-family:Arial;">
							亲爱的同学：
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您好！欢迎您注册西安电子科技大学特殊类型网上报名系统用户。
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注册为特殊类型网上报名系统的用户，您可以根据注册时填写的<font color='red'>邮箱</font>和<font color='red'>密码</font>登录特殊类型网上报名系统，可以申请保送和自主招生、申请高水平运动员以及成绩和录取查询等。
							<br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							提交前请牢记您的邮箱和密码,它将是您登录系统唯一的依据.谢谢!
						</p>
						<p align="right"
							style="color:#666666; text-decoration:none; font-family:Arial;">
							西安电子科技大学招生办公室
						</p>
					</div>
					<br/><br/>
					<div style="align:center;color:rgb(255, 114, 0);">
					<p align="center">
							<b>
									恭喜您注册成功，请牢记您以下信息：
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
										密码:
									</td>
									<td>
										${request.userpass}
										 <input type="hidden" name="username"  value = "${request.email}"/>
										 <input type = "hidden" name = "userpass" value = "${request.userpass}"/>
									</td>
								</tr>								
								<tr >
									<td  >
										 身份证号:
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
<input name="save" type="button" class="regbtnnew"  onClick="doLogin();" value="马上登录"  />
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button"  id="return"  class="regbtnnew"
									onclick="window.close();" value="关 &nbsp; 闭" />
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
