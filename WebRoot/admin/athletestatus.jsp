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
	<b><font color="black">��ˮƽ�˶�Ա</font></b>
	</td>
</tr>
<tr bgcolor="#E0FFFF">
    <td align="center" width="20%"><b>��������</b></td>
	<td align="center" width="80%"><b>${param.name}</b></td>
</tr>
<tr bgcolor="#E0FFFF">
    <td align="center" width="20%"><b>��ǰ״̬</b></td>
	<td align="center" width="80%"><b>${param.status}</b><input type="hidden" name="idcard"  value = "${param.idcard}"/></td>
</tr>
<tr bgcolor="#E0FFFF">
    <td align="center" width="20%"><b>ѡ��״̬</b></td>
	<td align="center" width="80%">
	  <select size="1" name="status">
        <option value="��δ�ύ��ˮƽ�˶�Ա�����"  <s:if test='#parameters.status[0]=="��δ�ύ�����"||#parameters.status[0]=="��δ�ύ��ˮƽ�˶�Ա�����"'>selected=selected</s:if>>�����ύ</option>
        <option value="��ˮƽ�˶�Ա�����ѼĴ�" <s:if test='#parameters.status[0]=="��ˮƽ�˶�Ա�����ѼĴ�"'>selected=selected</s:if>>��ˮƽ�˶�Ա�յ�����</option>
        <option value="��ˮƽ�˶�Ա����ͨ��" <s:if test='#parameters.status[0]=="��ˮƽ�˶�Ա����ͨ��"'>selected=selected</s:if>>��ˮƽ�˶�Ա����ͨ��</option>
        <option value="��ˮƽ�˶�Ա����ͨ��" <s:if test='#parameters.status[0]=="��ˮƽ�˶�Ա����ͨ��"'>selected=selected</s:if>>��ˮƽ�˶�Ա����ͨ��</option>
        <option value="��ˮƽ�˶�Ա����ͨ��" <s:if test='#parameters.status[0]=="��ˮƽ�˶�Ա����ͨ��"'>selected=selected</s:if>>��ˮƽ�˶�Ա����ͨ��</option>
      </select>
    </td>
</tr>
<tr>
	<td class="tbhead" colspan="2">
	<a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="ȷ���޸�  &raquo;" name="" onClick="checkNumber();"></a>
	</td>
</tr>
</table>
</form>
</td>
</tr>
</table>