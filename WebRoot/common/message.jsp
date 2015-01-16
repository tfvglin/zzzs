<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
    <head><title>统一信息提示</title></head>
	<body>
	    <center>
		    <h1><font color="red">${request.messageInfo}</font></h1>
			<a href="${pageContext.request.contextPath}/${request.forward}" >返回</a>
		</center>
	</body>
</html>