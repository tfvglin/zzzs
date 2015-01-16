<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/homeindex.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/s-1_new.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/caChecker1.0.3.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ymPrompt.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.PrintArea.js"></script>
<div>
    <div class="mainwrap">
		<div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">
			报名 &gt;高水平运动员&gt;
			<span  style="font-size:24px;">预览</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<s:if test="#request.number!=null">
			  <span style="font-size:20px;color:red">您的报名号为：${request.number }，请牢记，它将作为考生的唯一识别标识</span>
			</s:if>
		</div>
		<center><iframe name="print" src="getAthletePreview" scrolling="no" frameborder="0" width="1050" height="1485"></iframe></center>
	</div>
</div>
<script language="javascript" type="text/javascript">
 function dyniframesize(down) { 
 var pTar = null; 
 if (document.getElementById){
 pTar = document.getElementById(down); 
 } else{
 eval('pTar = ' + down + ';'); 
 } 
 if (pTar && !window.opera){ 
 //begin resizing iframe 
 pTar.style.display="block"; 
 if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
//ns6 syntax 
pTar.height = pTar.contentDocument.body.offsetHeight +20; 
pTar.width = pTar.contentDocument.body.scrollWidth+20; 
} else if (pTar.Document && pTar.Document.body.scrollHeight){
//ie5+ syntax 
pTar.height = pTar.Document.body.scrollHeight; 
pTar.width = pTar.Document.body.scrollWidth; 
} } } 
</script>