<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html;charset=gbk">
<title>西安电子科技大学 本科招生报名系统</title>
<link href="css/regedit.css" rel="stylesheet" type="text/css">
<!--<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/s-1.css" rel="stylesheet" type="text/css">
<link href="../css/checkform.css" rel="stylesheet" type="text/css">
<script src="../js/caChecker1.0.3.js" type="text/javascript"></script>
<script src="../js/caChecker1.0.3.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
<link rel="stylesheet" type="text/css" href="../css/ymPrompt.css">
<script src="../js/check_regedit.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>-->
<script type="text/javascript">
function checkLength(value, min,max){
    if(value.length>=min&&value.length<=max) return true;
    else   return false;
}
function checkNumber(){	
  //var name=window.document.regForm.xm.value;
  var password=window.document.regForm.userpass.value;
  var qrmm=window.document.regForm.qrmm.value;
  var IDcard=window.document.regForm.sfzh.value;  
  var emailvalue=window.document.regForm.email.value;
  var photo=document.regForm.upfile.value;
  /*if(name==null||name==""){
    alert("姓名不能为空！");
    regForm.xm.focus();
    return;
  }*/
  var temp1=emailvalue.indexOf("@");
  var temp2=emailvalue.indexOf(".");
  if(temp1<0||temp2<temp1)
  {
      alert("请输入正确的电子邮件！");
      regForm.email.focus();
      return;
  }
  if(password==null||password==""){
    alert("密码不能为空！");
    regForm.userpass.focus();
    return;
  }
  if(password!=qrmm){
    alert("两次输入密码不同！");
    regForm.qrmm.focus();
    return;
  }
  if(IDcard==null||IDcard==""){
    alert("身份证号不能为空！");
    regForm.sfzh.focus();
    return;
  }
  if (IDcard.length != 15 && IDcard.length != 18){  
    alert("输入身份证号码格式不正确!");  
    regForm.sfzh.focus();
    return;  
  }
  var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};   
  if(area[parseInt(IDcard.substr(0,2))]==null) {  
      alert("身份证号码不正确(地区非法)!");  
      regForm.sfzh.focus();
      return;  
  }
  if(IDcard.length == 15){  
      pattern= /^\d{15}$/;  
      if (pattern.exec(IDcard)==null){  
      alert("15位身份证号码必须为数字！");
      regForm.sfzh.focus();  
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
          regForm.sfzh.focus();  
          return;  
      }  
      break;  
      case '04':  
      case '06':  
      case '09':  
      case '11':  
      if(day>30){  
          alert('输入身份证号码不格式正确!');
          regForm.sfzh.focus();  
          return;  
      }  
      break;  
      case '02':  
      if((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {  
          if(day>29) {  
              alert('输入身份证号码不格式正确!');  
              regForm.sfzh.focus();  
              return;  
          }  
      } else {  
          if(day>28) {  
              alert('输入身份证号码不格式正确!'); 
              regForm.sfzh.focus(); 
              return;  
          }  
      }  
      break;  
      default:  
          alert('输入身份证号码不格式正确!');
          regForm.sfzh.focus();   
          return;  
      }  
      var nowYear = new Date().getYear();  
      if(nowYear - parseInt(birth)<15 || nowYear - parseInt(birth)>100) {  
          alert('输入身份证号码不格式正确!');  
          regForm.sfzh.focus();  
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
          regForm.sfzh.focus();  
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
      regForm.sfzh.focus(); 
      return;  
  }
  if(!checkLength(emailvalue,5,1000))
  {
      alert("请输入正确的电子邮件！");
      regForm.email.focus();
      return;
  }
  
  if(photo==null||photo==""){
    alert("请选择您的电子版证件照！");
    return;
  }
  if(photo!=null&&photo!=""){
    var position=photo.indexOf(".");
    var type=photo.substr(position);
    //alert(type);
    if(type!=".jpg"&&type!=".JPG"&&type!=".jpeg"&&type!=".JPEG"&&type!=".png"&&type!=".PNG"&&type!=".gif"&&type!=".GIF")
    {
        alert("请注意，上传的图片必须为jpg、png或gif格式");
        return;
    }    
  }  
  //alert("test");
  regForm.submit();
}
</script>
</head>
<body>
<%@ include file="/common/header.jsp" %>
		<div class="content">
			<div class="contentWrap">
				<div class="column_3">
					<h1>
						新用户注册
					</h1>
					<div class="regtable">
					    <s:if test="tip!=null">
                          <div class="error">
	                        <s:property value="tip"/>
                          </div>
                        </s:if>
                        <s:actionerror cssClass="error"/>
						<form name="regForm" action="regSubmit" method="post" enctype="multipart/form-data">
					      <!--<div class="item clearfix">
								<div class="txt">
									姓名
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input type="text" class="inp" size="30" name="xm" maxlength="30" />
								</div>
							</div>-->
					      <div class="item clearfix">
								<div class="txt">
									电子邮件
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input type="text" class="inp" size="30" name="email" maxlength="30" />
									<div class="info">
										用于登陆和密码找回。
										<span class="important"><strong>非常重要，请填写真实邮箱并牢记</strong></span>
									</div>
								</div>
							</div>
					        <div class="item clearfix">
								<div class="txt">
									密码
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input name="userpass" class="inp" type="password" maxlength="50" />
									<div class="info">
										6位以上英文字母或数字。
									</div>
								</div>
							</div>
							<div class="item clearfix">
								<div class="txt">
									确认密码
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input class="inp" type="password" maxlength="50" name="qrmm" />
									<div class="info">
										再次确认密码。
									</div>
								</div>
							</div>
							<div class="item clearfix">
								<div class="txt">身份证号<span class="important">(*)</span></div>
								<div class="form">
									<input name="sfzh" class="inp" type="text" maxlength="18" />
									<div class="info">
										考生本人身份证号，
										<span class="important">非常重要</span>。
										<br />
										<span class="important"><strong>同一身份证号每年只允许注册一次。</strong></span>
									</div>
								</div>
							</div>											
							<div class="item clearfix">
									<div class="txt">
										一寸照片
										<span class="important">(*)</span>
									</div>
									<div class="form">
										<s:file name="upload" id="upfile"/>
										<div class="info">
											<span class="important">请上传个人一寸免冠证件照,大小不能超过30K,必须为jpg、png或gif格式</span>
										</div>
									</div>
							</div>						
							<div class="item clearfix">
								<div class="txt"></div>
								<div class="form">
									<div class="regbtn">
										<input name="save" type="button" class="regbtnnew" value="注册新用户" onClick="checkNumber();">
									</div>
								</div>
							</div>

						</form>
                    </div>
				</div>
				<div class="colum_4">
					<div class="notesSection">
						<h3>
							欢迎注册
						</h3>
						<p>
							您好！欢迎您注册西安电子科技大学本科招生网。
							<br>
							<br>


							注册为本科招生网的用户，您可以根据注册时填写的用户名和密码登录本科招生网，可以申请自主招生和保送、申请高水平运动员、申请艺术特长生以及成绩和录取查询等。
							<br>
							<br>


							提交时请牢记您的邮箱和密码，它将是您登录系统唯一的依据。谢谢！
						</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
<%@ include file="/common/footer.jsp" %>
<div><div id="maskLevel" style="position:absolute;top:0;left:0;display:none;text-align:center;z-index:10000;"></div><div id="ym-window" style="position:absolute;z-index:10001;display:none"><div class="ym-tl" id="ym-tl"><div class="ym-tr"><div class="ym-tc" style="cursor:move;"><div class="ym-header-text"></div><div class="ym-header-tools"></div></div></div></div><div class="ym-ml" id="ym-ml"><div class="ym-mr"><div class="ym-mc"><div class="ym-body"></div></div></div></div><div class="ym-ml" id="ym-btnl"><div class="ym-mr"><div class="ym-btn"></div></div></div><div class="ym-bl" id="ym-bl"><div class="ym-br"><div class="ym-bc"></div></div></div></div></div></body></html><div id="ym-window" style="position:absolute;z-index:10001;display:none"><div class="ym-tl" id="ym-tl"><div class="ym-tr"><div class="ym-tc" style="cursor:move;"><div class="ym-header-text"></div><div class="ym-header-tools"></div></div></div></div><div class="ym-ml" id="ym-ml"><div class="ym-mr"><div class="ym-mc"><div class="ym-body"></div></div></div></div><div class="ym-ml" id="ym-btnl"><div class="ym-mr"><div class="ym-btn"></div></div></div><div class="ym-bl" id="ym-bl"><div class="ym-br"><div class="ym-bc"></div></div></div></div></div></body></html>