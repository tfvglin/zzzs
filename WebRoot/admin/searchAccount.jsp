<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/release.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#name").click(function(){
      //alert($("#name").val());
      if($("#name").val()=="姓名")
      {
          $("#name").val("");
      }
  });
  $("#registration").click(function(){
      //alert($("#name").val());
      if($("#registration").val()=="报名号")
      {
          $("#registration").val("");
      }
  });
  $("#idcard").click(function(){
      //alert($("#name").val());
      if($("#idcard").val()=="身份证号")
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
  if(idcard=="身份证号"||idcard==""||idcard==null){
    alert("请输入身份证号！");
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
          <input type="text" name="idcard" value="身份证号" id="idcard" />
          <input type="button" value="提交" onClick="checkNumber();"/>
      </form>
    </td>
  </tr>
<tr>
<td>
<center><b><font color="black" style='font-weight:bold;display:inline;'>注册账号查找</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr>
	<th align="center" width="25%"><b>学生邮箱</b></td>
	<th align="center" width="25%"><b>身份证号</b></td>
	<th align="center" width="50" colspan="2"><b>管理操作</b></td>
</tr>
</thead>
<tr class=firstalt>
<td align=center>${request.email}</td>
<td align=center>${request.idcard}</td>
<td align=center><a class="red" href="${pageContext.request.contextPath}/admin/updateEmail.jsp?idcard=${request.idcard}&email=${request.email}">修改邮箱</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="删除" onclick="javascript:do_sumbmitzy('<s:property value="IDcard" />');" /></td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>