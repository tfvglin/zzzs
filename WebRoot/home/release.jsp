<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
  <meta http-equiv="content-type" content="text/html; charset=gbk">
  <title>西安电子科技大学本科招生网-本科报名系统</title> 
  <link href="css/reset.css" rel="stylesheet" type="text/css">
  <link href="css/css.css" rel="stylesheet" type="text/css">
  <link href="css/s-1_new.css" rel="stylesheet" type="text/css">
  <link href="css/checkform.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="css/ymPrompt.css">
</head>
<div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">
  <span style="font-size:24px;">报名</span><span style="font-size:24px;">当前状态：${session.status}</span>
</div>
<div class="tips" style="color:#666;padding:20px 10px;">以下类别正在报名中，您可以选择进行报名：</div>
<div class="nofixedwide">
  <ul class="selectentrance clearfix">
    <s:set name="current" value="#request.current" />    
    <s:iterator value="#request.signups" id="signup">    
      <s:set name="name" value="Name" />
      <s:set name="end" value="End" />
      <li>           
	    <h3><span><s:property value="Name" /></span></h3>
		<p>开始时间：<br><s:property value="Begin" /> 00:00:00<br>截止时间：<br><s:property value="End" /> 18:00:00</p>
		
		
		<!-- 高水平运动员 -->
		
		<s:if test='#name=="高水平运动员"'>
		  <!-- 未提交申请表且未过时 -->
		  <s:if test='(#session.status=="尚未提交申请表"||#session.status=="尚未提交高水平运动员申请表")&&(#request.current<=#end)'>
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">报名</a>
		  </s:if>
		  <!-- 已提交申请表且未过时 -->
		  <s:if test='(#session.status!="尚未提交申请表"&&#session.status!="尚未提交高水平运动员申请表")&&(#request.current<=#end)'>
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">查询/操作</a>
		  </s:if>
		</s:if>
		<!-- 已过时且未提交申请表 -->
		  <!--<s:if test="(#status==尚未提交申请表||#status==尚未提交高水平运动员申请表)&&(#end<#current)">
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn" disabled="disabled" onclick="return false;">报名</a>
		   -->
		 
		<!--</s:if>-->
		<!-- 保送生 -->
		<s:if test="#name=='保送生'">
		<!-- 未提交申请表且未过时 -->
	
		  <s:if test='(#session.status=="尚未提交申请表"||#session.status=="尚未提交保送生申请表")&&(#request.current<=#end)'>
		    <a href="recommend?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">报名</a>
		  </s:if>
		  <s:if test='(#session.status!="尚未提交申请表"&&#session.status!="尚未提交保送生申请表")&&(#request.current<=#end)'>
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">查询/操作</a>
		  </s:if>
		</s:if>
		<!--自主招生 -->
		<!--<s:if test="#name==自主招生">
		  <s:if test="(#status==尚未提交申请表||#status==尚未提交自主招生申请表)&&(#end<#current)">
		    <a href="${pageContext.request.contextPath}/home/athlete.jsp?begin=${signup.Begin}&end=${signup.End}" class="linkbtn" disabled="disabled" onclick="return false;">报名</a>
		  </s:if>
		</s:if>-->
	  </li>  
    </s:iterator>				
  </ul>
</div>
<div class="tips"></div>
<div class="nofixedwide"><ul class="selectentrance clearfix"></ul></div>
<div class="footer">Copyright &#169; 2015 西安电子科技大学 招生办公室</div>