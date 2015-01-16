<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>西安电子科技大学特殊类型网上报名管理系统</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css">
  	body{padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; line-height: 1.8; padding-top: 0px; list-style-type: none}
	body,td {font-size: 12px; color: #393939}
	#but {background: url(../images/bg_button_search.jpg); width: 59px; color: #fff; border-top-style: none; border-right-style: none; border-left-style: none; height: 18px; border-bottom-style: none}
	#dht {margin-top: 5px}
	#dht a:link {font-weight: bold; font-size:14px; color: #fff; text-decoration: none}
	#dht a:visited {font-weight: bold; font-size:14px;color: #fff; text-decoration: none}
	#dht a:hover {color: #000; font-size:14px;}
	#jlxdt a:link {font-size:13px; color: #393939; text-decoration: none}
	#jlxdt a:visited {font-size:13px;color: #393939; text-decoration: none}
	#jlxdt a:hover {color: #0066ca; font-size:13px;}
	#jlxdt .curSelect{color:#0066ca;}
	a:link { color: #393939; text-decoration: none}
	a:visited {color: #393939; text-decoration: none}
	a:hover {color: #0066ca; text-decoration:underline}
	div,ul,li,td{ word-break:break-word}
	ul,li,form,h1,h2,h3,h4,h5,dl,dt,dd{ margin:0; padding:0; list-style:none}
  	.left{ width:200px; float:left; }
	.left h1{ background:url(images/main_07.jpg) left top no-repeat; line-height:30px; font-size:14px; color:#324168; text-align:center}
	.left ul{ margin-left:20px; line-height:26px}
	.left ul h3{ margin-top:10px; background:url(../images/main_24.jpg) left center no-repeat; padding-left:20px; font-weight:normal; font-size:14px}
	.left ul li{ background:url(images/tag_ypzyh_line.jpg) 20px center no-repeat; line-height:35px; padding-left:35px; font-size:14px}
	.left h4{ margin-top:10px;margin-left:20px; background:url(../images/main_41.jpg) left center no-repeat; padding-left:20px; font-weight:normal; font-size:12px}
	.line1 {border-top-width: 1px;border-bottom-width: 1px;border-top-style: solid;border-bottom-style: solid;border-top-color: #FFFFFF;border-bottom-color: #FFFFFF;font-size:12px; color:black; }
  	.flan{color:#0033FF}
	.fred{color:#FF0000}
  </style>
<body style="width:1280px;margin:0 auto;">
<%@ include file="/common/adminheader.jsp" %>
<table  width="1280px" height="" border="0" cellpadding="0" cellspacing="0" style="align:center;">
      <tr>
         <td width="200px" valign="top" bgcolor="#e4ebfd">
		<div class="left">
 	  		<h1>后台管理菜单</h1>
			<table width="200" border="0" cellspacing="3" cellpadding="0" class="line1">
			  <tr>
				<td width="37" rowspan="2" valign="top"><img height="36" src="images/gif-0018.gif" width="39" /></td>
				<td height="20"><span style="font-weight:bold">您好!</span></td>
			  </tr>
			  <tr align="center">
			  	<td colspan="2">用户名:${session.admin}</td>
		      </tr>
 		 </table>
			<ul>			    
				<li><a href="getRelease" target="userManageMain">招生类别管理</a></li>
				<li><a href="regList" target="userManageMain">注册账号管理</a></li>
				<li><a href="getAthletes" target="userManageMain">高水平运动员管理</a></li>	
				<li><a href="recommendList" target="userManageMain">保送生管理</a></li>
				<li><a href="selfList" target="userManageMain">自主招生管理</a></li>
				<li><a href="getRooms" target="userManageMain">考场管理</a></li>
				<li><a href="adminLogout" target="_top">退出系统</a></li>
                <!--<li><a href="managepublicity.php" target="userManageMain">上传初审结果</a></li>				
				<li><a href="article.php?action=add" target="userManageMain">上传复试成绩</a></li>--> 
			</ul>
		</div>
		
		</td>
    		<td width="1080px" valign="top" align="center">  
					<iframe src="getInfo" width="100%" height='700px' scrolling="yes" frameborder="1" name="userManageMain" id='userManageMain'></iframe>
			</td>
  </tr>
</table>
</body>
