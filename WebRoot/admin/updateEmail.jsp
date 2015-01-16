<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/release.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
	<form name="release" method="post" action="subEmail">
	  <table width="50%" align="center" border="0" cellspacing="1" cellpadding="4" class="tableoutline">
	    <tr id="cat"><td class="tbhead" colspan="2"><b><font color="black">编辑学生邮箱</font></b></td></tr>
		<tr class="firstalt" nowrap>
          <td>身份证号:</td>
          <td><input type="hidden" name="idcard" size="40" maxlength="40" value="<s:property value="#parameters.idcard" />"><s:property value="#parameters.idcard" /></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>更改邮箱:</td>
          <td><input  type="text" name="email" size="50" maxlength="140" value="<s:property value="#parameters.email" />"></td>
        </tr>
		<tr class="tbhead">
          <td colspan="2" align="center"><input type="submit" name="button" value="提交内容" /></td>
		</tr>
	  </table>
	</form>