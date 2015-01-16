<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validation.js"></script>
  	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.jsp"></script> -->
	<title>西电特殊类型招生报名系统 找回密码</title>
	<link href="${pageContext.request.contextPath}/css/findpassword.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css" />
</head>
<script>
function doLogin(){
var IDcard=window.document.findForm.idcard.value;
if(IDcard==null||IDcard==""){
    alert("身份证号不能为空！");
    findForm.idcard.focus();
    return;
  }
  if (IDcard.length != 15 && IDcard.length != 18){  
    alert("输入身份证号码格式不正确!");  
    findForm.idcard.focus();
    return;  
  }
  var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};   
  if(area[parseInt(IDcard.substr(0,2))]==null) {  
      alert("身份证号码不正确(地区非法)!");  
      findForm.idcard.focus();
      return;  
  }
  if(IDcard.length == 15){  
      pattern= /^\d{15}$/;  
      if (pattern.exec(IDcard)==null){  
      alert("15位身份证号码必须为数字！");
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
          alert('输入身份证号码不格式正确!'); 
          findForm.idcard.focus();  
          return;  
      }  
      break;  
      case '04':  
      case '06':  
      case '09':  
      case '11':  
      if(day>30){  
          alert('输入身份证号码不格式正确!');
          findForm.idcard.focus();  
          return;  
      }  
      break;  
      case '02':  
      if((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {  
          if(day>29) {  
              alert('输入身份证号码不格式正确!');  
              findForm.idcard.focus();  
              return;  
          }  
      } else {  
          if(day>28) {  
              alert('输入身份证号码不格式正确!'); 
              findForm.idcard.focus(); 
              return;  
          }  
      }  
      break;  
      default:  
          alert('输入身份证号码不格式正确!');
          findForm.idcard.focus();   
          return;  
      }  
      var nowYear = new Date().getYear();  
      if(nowYear - parseInt(birth)<15 || nowYear - parseInt(birth)>100) {  
          alert('输入身份证号码不格式正确!');  
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
          alert("输入身份证号码格式不正确!");
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
      alert("输入身份证号码格式不正确!"); 
      findForm.idcard.focus(); 
      return;  
  }
  findForm.submit();
}

//初始化函数
function init(){
  window.document.title = "请您登录";
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
					找回密码
				</h1>
				<div class="regtable">
					<form name="findForm" action="subFindPassword" method="post">
						<input type="hidden" name="token"
							value="7f495b55efc0777c7eed3bf29279c8e6" />

						
							<div class="getpassword">
								<div class="tips important">
									我们会将您的密码重置并发送到您注册时填写的电子邮箱									
								</div>
								<div class="item clearfix">
									<div class="txt">
										身份证号
										<span class="important">(*)</span>
									</div>
									<div class="form">
										<input type="text" name="idcard" id="idcard" class="inp"  value="" />
										<div class="info">
											输入注册时的考生身份证号。
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
											
												<input name="" value="找回密码" type="button" onClick="doLogin();" class="btn" />
											
										</div>
									</div>
								</div>
							</div>
						

					</form>
					
					
                <!-- 如果 email 不为空 ，说明已经将密码发送到了学生注册时的邮箱-->

				
				

				
					
				</div>

				<div class="clear"></div>
			</div>
		</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>