<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/release.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
<script type="text/javascript">
function do_sumbmitzy(Name,Id)
{
    if (confirm("��ȷ��Ҫɾ����Ϊ"+Name+"�����������"))
    {
        window.location.href="admin/delRelease?releaseId="+Id;
    }
    //alert(Name);
}
</script>
<center><b><font color="black" style='font-weight:bold;display:inline;'>�����������</font></b></center>
<div class="grid-view">
<table class="items" style="width:70%;margin:0 auto;">
<thead>
<tr bgcolor="#E0FFFF">
    <th align="center" width="10%"><b>���</b></th>
	<th align="center" width="20%"><b>�����������</b></th>
	<th align="center" width="10%"><b>��ʼʱ��</b></th>
	<th align="center" width="10%"><b>����ʱ��</b></th>
	<th align="center" width="10%"><b>���</b></th>
	<th align="center" width="40%" colspan="2"><b>�������</b></th>
</tr>
<s:iterator id="signup" value="#request.signups"  status="st">
<s:if test="#st.odd"><tr class="odd"></s:if>
<s:if test="#st.even"><tr class="even"></s:if>
<td align=center><s:property value="#st.count"/></td>
    <td align=center><s:property value="Name" /></td>
    <td align=center><s:property value="Begin" /></td>
    <td align=center><s:property value="End" /></td>
    <td align=center><s:property value="Year" /></td>
    <td align=center><a href="editRelease?releaseId=${signup.Id}">�༭</a></td>
    <td align=center><input type="button" name="delRelease" class="bt" value="ɾ��" onclick="javascript:do_sumbmitzy('<s:property value="Name" />','<s:property value="Id" />');"  /></td>
</tr>
</s:iterator>
</table>
</div>
    <form name="releast" method="post" action="subRelease">
	  <table width="40%" align="center" border="0" cellspacing="1" cellpadding="4">
	    <tr id="cat"><td class="tbhead" colspan="2"><b><font color="black">����������</font></b></td></tr>
        <tr nowrap>
          <td width="50%">�����������:</td>
          <td width="50%"><input  type="text" name="title" size="40" maxlength="40" value=""  width="100%"></td>
        </tr>
        <tr nowrap>
          <td>��ʼʱ��:</td>
          <td><input  type="text" name="begin" size="40" maxlength="40" value="" width="100%" onclick=SelectDate(this)></td>
        </tr>
        <tr nowrap>
          <td>����ʱ��:</td>
          <td><input  type="text" name="end" size="40" maxlength="40" value="" width="100%" onclick=SelectDate(this)></td>
        </tr>
        <tr nowrap>
          <td>��ݣ�����λ��:</td>
          <td><input  type="text" name="year" size="40" maxlength="40" value="" width="100%"></td>
        </tr>
		<tr class="tbhead">
          <td colspan="2" align="center"><input type="submit" name="button" value="�ύ����" /></td>
		</tr>
	  </table>
	</form>
</body>
</html>