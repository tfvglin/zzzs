<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gbk">
  <title>西安电子科技大学本科招生网-本科报名系统</title> 
  <link href="css/reset.css" rel="stylesheet" type="text/css">
  <link href="css/css.css" rel="stylesheet" type="text/css">
  <link href="css/s-1_new.css" rel="stylesheet" type="text/css">
  <link href="css/checkform.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="css/ymPrompt.css">
  <script src="js/caChecker1.js" type="text/javascript"></script>
  <script src="js/jquery-1.js" type="text/javascript"></script>
  <script src="js/jquery.js" type="text/javascript"></script>
  <script src="js/jquery_002.js" type="text/javascript"></script>
  <script src="js/utils.js" type="text/javascript"></script>
  <script src="js/loginLog.js" type="text/javascript"></script>
  <script src="js/statistics.js" type="text/javascript"></script>
</head>
<body>
<div class="header">
  <div class="headerwrap clearfix">
    <div class="logo"><a href="#"></a></div>
    <div class="user">
      <ul>     
        <li> 注册用户：${session.email} 身份证号：${request.IDcard} </li>
        <li><a href="password" class="setting">修改密码</a></li>
        <li><a href="logout"  target="_top">退出</a></li>
      </ul>
    </div>
  </div>
  <div class="topred"></div>
</div>	
<div class="content clearfix">
	
<script type="text/javascript">
function baoming(val){
	if(val!=null){
		if(val==2){			
			document.location.href = "/student.bz_wsbm_ksjbxxb.do?m=addJbxx";
		}else{			
			document.location.href = "/student.v_bz_wsbm_chooseSqlb.do?m=sqlbList&flag=1";
		}		
	}else{
		return;
	}
}
</script>
<div class="leftcolumn">
	<ul class="yahei">
		<li class=" current">
			<a href="getSignup" class="reg" target="userManageMain">报名</a>
		</li>
		<!--TODO：所有类别拆分后使用 <li	class="">
			<a href="#" class="query" onclick="baoming(2);">基本信息维护</a>
		</li> -->
	</ul>
</div>
<div class="maincolumn">
  <div class="mainwrap">
    <iframe src="getSignup" width="100%" height='400px' style="overflow-x:hidden;overflow-y:scroll;" frameborder="1" name="userManageMain" id='userManageMain'></iframe>  
  </div>
</div>
</div>
<div>
<div id="maskLevel" style="position: absolute; top: 0px; left: 0px; text-align: center; z-index: 10000; background: none repeat scroll 0% 0% rgb(0, 0, 0); opacity: 0.1; width: 1349px; height: 610px; display: none;"></div>
<!--<div id="ym-window" style="position: absolute; z-index: 10001; width: 380px; height: 200px; left: 0px; top: 44px; display: none;">
  <div class="ym-tl" id="ym-tl">
    <div class="ym-tr">
      <div class="ym-tc" style="cursor:move;">
        <div class="ym-header-text"></div>
        <div class="ym-header-tools"><div class="ymPrompt_close" title="关闭" onclick='ymPrompt.doHandler("close")'>&nbsp;</div>
      </div>
    </div>
  </div>
</div>-->
<div style="display: none;" class="ym-ml" id="ym-btnl">
  <div class="ym-mr">
    <div class="ym-btn"></div>
  </div>
</div>
<div class="ym-bl" id="ym-bl">
  <div class="ym-br">
    <div class="ym-bc"></div>
  </div>
</div>
</div>
</div>
</body>
</html>