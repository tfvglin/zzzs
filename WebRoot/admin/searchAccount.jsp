<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/release.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#name").click(function(){
      //alert($("#name").val());
      if($("#name").val()=="����")
      {
          $("#name").val("");
      }
  });
  $("#registration").click(function(){
      //alert($("#name").val());
      if($("#registration").val()=="������")
      {
          $("#registration").val("");
      }
  });
  $("#idcard").click(function(){
      //alert($("#name").val());
      if($("#idcard").val()=="���֤��")
      {
          $("#idcard").val("");
      }
  });
});
</script>	
</head>
<body>
<script language="javaScript">
function checkNumber(){
  var idcard=window.document.searchathlete.idcard.value;      
  if(idcard=="���֤��"||idcard==""||idcard==null){
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
          <input type="button" value="�ύ" onClick="checkNumber();"/>
      </form>
    </td>
  </tr>
<tr>
<td>
<center><b><font color="black" style='font-weight:bold;display:inline;'>ע���˺Ų���</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr>
	<th align="center" width="25%"><b>ѧ������</b></td>
	<th align="center" width="25%"><b>���֤��</b></td>
	<th align="center" width="50" colspan="2"><b>�������</b></td>
</tr>
</thead>
<tr class=firstalt>
<td align=center>${request.email}</td>
<td align=center>${request.idcard}</td>
<td align=center><a class="red" href="${pageContext.request.contextPath}/admin/updateEmail.jsp?idcard=${request.idcard}&email=${request.email}">�޸�����</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="ɾ��" onclick="javascript:do_sumbmitzy('<s:property value="IDcard" />');" /></td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>