<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/release.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#idcard").click(function(){
      //alert($("#name").val());
      if($("#idcard").val()=="���֤��")
      {
          $("#idcard").val("");
      }
  });
});
function do_sumbmitzy(IDcard)
{
    if (confirm("��ȷ��Ҫɾ�����֤��Ϊ"+IDcard+"���˺���"))
    {
        window.location.href="delAccount?idcard="+IDcard;
    }
    //alert(Name);
}
function do_AthleteAdmissionGrant()
{
    if (confirm("��ȷ��Ҫ���Ÿ�ˮƽ�˶�Ա��׼��֤��"))
    {
        window.location.href="../admin/AthleteAdmissionGrant";
    }
}
</script>	
<script language="javaScript">
function checkNumber(){	
  var idcard=window.document.searchathlete.idcard.value;      
  if(idcard==""||idcard==null){
    alert("���������֤�ţ�");
    searchathlete.idcard.focus();
    return;
  }
  searchathlete.submit();
}
</script>
<table cellpadding="0" cellspacing="0" border="0" align="center" width="96%" class="tblborder">
  <tr>
    <td>
      <form name="searchathlete" action="searchAccount" method="post">
          <input type="text" name="idcard" value="���֤��" id="idcard" />
          <input type="button" value="����" onClick="checkNumber();"/>
      </form>
    </td>
  </tr>  
<tr>
<td>
<br />
<center><b><font color="black" style='font-weight:bold;display:inline;'>��ע���û�</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr bgcolor="#E0FFFF">
    <th align="center" width="5%"><b>���</b></th>
	<th align="center" width="20%"><b>��������</b></th>
	<th align="center" width="20%"><b>���֤��</b></th>
	<th align="center" width="55%" colspan="2"><b>�������</b></th>
</tr>
<s:iterator id="account" value="#request.pageInfo.list"  status="st">
<s:if test="#st.odd"><tr class="odd"></s:if>
<s:if test="#st.even"><tr class="even"></s:if>
<td align=center><s:property value="#st.count"/></td>
<td align=center><s:property value="Email" /></td>
<td align=center><s:property value="IDcard" /></td>
<td align=center><a class="red" href="admin/updateEmail.jsp?idcard=<s:property value="IDcard" />&email=<s:property value="Email" />">�޸�����</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="ɾ��" onclick="javascript:do_sumbmitzy('<s:property value="IDcard" />');" /></td>
</tr>
</s:iterator>
</table>
</div>
</td>
</tr>
</table>
<%@ include file="/common/pageList.jsp" %>