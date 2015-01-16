<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="css/release.css" type="text/css">
<script language="javaScript"> 
function confm(url){
document.tygspForm.add.value="ksjbxxfirst";
document.tygspForm.submit();
}
function checkNumber(){
  tygspForm.submit();
}
</script>
<table cellpadding="0" cellspacing="0" border="0" align="center" width="96%" class="tblborder">
<tr>
<td>
<form name="tygspForm" method="post" id="sqForm" action="subAthleteStatus">
<table width="100%" align="center" border="0" cellspacing="1" cellpadding="4" class="tableoutline">
<tr>
	<td class="tbhead" colspan="2">
	<b><font color="black">高水平运动员</font></b>
	</td>
</tr>
<tr bgcolor="#E0FFFF">
    <td align="center" width="20%"><b>考生姓名</b></td>
	<td align="center" width="80%"><b>${param.name}</b></td>
</tr>
<tr bgcolor="#E0FFFF">
    <td align="center" width="20%"><b>当前状态</b></td>
	<td align="center" width="80%"><b>${param.status}</b><input type="hidden" name="idcard"  value = "${param.idcard}"/></td>
</tr>
<tr bgcolor="#E0FFFF">
    <td align="center" width="20%"><b>选择状态</b></td>
	<td align="center" width="80%">
	  <select size="1" name="status">
        <option value="尚未提交高水平运动员申请表"  <s:if test='#parameters.status[0]=="尚未提交申请表"||#parameters.status[0]=="尚未提交高水平运动员申请表"'>selected=selected</s:if>>撤销提交</option>
        <option value="高水平运动员资料已寄达" <s:if test='#parameters.status[0]=="高水平运动员资料已寄达"'>selected=selected</s:if>>高水平运动员收到资料</option>
        <option value="高水平运动员初审通过" <s:if test='#parameters.status[0]=="高水平运动员初审通过"'>selected=selected</s:if>>高水平运动员初审通过</option>
        <option value="高水平运动员初审不通过" <s:if test='#parameters.status[0]=="高水平运动员初审不通过"'>selected=selected</s:if>>高水平运动员初审不通过</option>
        <option value="高水平运动员考核通过" <s:if test='#parameters.status[0]=="高水平运动员考核通过"'>selected=selected</s:if>>高水平运动员考核通过</option>
      </select>
    </td>
</tr>
<tr>
	<td class="tbhead" colspan="2">
	<a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="确认修改  &raquo;" name="" onClick="checkNumber();"></a>
	</td>
</tr>
</table>
</form>
</td>
</tr>
</table>