<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
    <head><title>ͳһ��Ϣ��ʾ</title></head>
	<body>
	    <center>
		    <h1><font color="red">${request.messageInfo}</font></h1>
			<a href="${pageContext.request.contextPath}/${request.forward}" >����</a>
		</center>
	</body>
</html>