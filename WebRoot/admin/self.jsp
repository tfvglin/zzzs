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
function do_sumbmitzy(Name,Email)
{
    if (confirm("您确定要删除名为"+Name+"的学生吗？"))
    {
        window.location.href="../admin/SelfDeleteAction?email="+Email;
    }
    //alert(Name);
}
function do_exemption(Name,Email)
{
    if (confirm("您确定要设置名为"+Name+"的学生免笔试吗？"))
    {
        window.location.href="../admin/ExemptionAction?email="+Email;
    }
    //alert(Name);
}
function do_SelfAdmissionGrant()
{
    if (confirm("您确定要发放自主招生的准考证吗?"))
    {
        window.location.href="../admin/SelfAdmissionGrant";
    }
}
</script>	
</head>
<body>
<script language="javaScript">
function checkNumber(){	
  var name=window.document.searchself.name.value; 
  var registration=window.document.searchself.registration.value;
  var idcard=window.document.searchself.idcard.value;      
  if((name=="姓名"||name==""||name==null)&&(registration=="报名号"||registration==""||registration==null)&&(idcard=="身份证号"||idcard==""||idcard==null)){
    alert("请至少输入一个查找条件！");
    searchself.name.focus();
    return;
  }
  if(registration!="报名号"&&registration!=""&&registration!=null)
  {
    if(registration.length!=10)
    {
      alert("请输入正确的报名号！");
      searchself.registration.focus();
      return;
    }
  }
  searchself.submit();
}
function do_SelfTrial(){
    window.location.href="ExcelToMysql?type=self";
}
function do_ImportGrade(){
    window.location.href="GradeToMysql?type=self";
}
</script>
<table cellpadding="0" cellspacing="0" border="0" align="center" width="100%" class="tblborder">
  <tr>
    <td>
      <form name="searchself" action="SearchSelfAction" method="post">
          <input type="text" name="name" value="姓名" id="name" />
          <input type="text" name="registration" value="报名号" id="registration" />
          <input type="text" name="idcard" value="身份证号" id="idcard" />
          <input type="button" value="查找" onClick="checkNumber();"/>
      </form>
      <!--<a class="red" href="../admin/SelfExcelAction" style="display:inline;">导出自主招生统计表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" class="bt" value="导入自主招生初审结果" onclick="javascript:do_SelfTrial();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->      
      <a class="red" href="../admin/SelfAdmission" style="display:inline;">编辑自主招生准考证</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="SelfAdmissionGrant" class="bt" value="发放自主招生准考证" onclick="javascript:do_SelfAdmissionGrant();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!--<input type="button" class="bt" value="导入成绩" onclick="javascript:do_ImportGrade();" />-->
    </td>
  </tr>
<tr>
<td>
<center><b><font color="black" style='font-weight:bold;display:inline;'>自主招生</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr bgcolor="#E0FFFF">
    <th align="center" width="5%"><b>序号</b></th>
	<th align="center" width="7%"><b>姓名</b></th>
	<th align="center" width="5%"><b>报名号</b></th>
	<th align="center" width="6%"><b>省份</b></th>
	<th align="center" width="8%"><b>身份证号</b></th>
	<th align="center" width="5%"><b>科类</b></th>
	<th align="center" width="20%"><b>高中</b></th>
	<th align="center" width="5%"><b>考场号</b></th>
	<th align="center" width="5%"><b>座位号</b></th>
	<th align="center" width="30%" colspan="4"><b>管理操作</b></th>
</tr>
</thead>
<s:iterator id="recommend" value="#request.pageInfo.list"  status="st">
<s:if test="#st.odd"><tr class="odd"></s:if>
<s:if test="#st.even"><tr class="even"></s:if>
<td align=center><s:property value="#st.count"/></td>
<td align=center><s:property value="Name" /><input type="hidden" name="name" value='<s:property value="Name" />' /></td>
<td align=center><s:property value="Number" /></td>
<td align=center><s:property value="Province" /></td>
<td align=center><s:property value="IDcard" /></td>
<td align=center><s:property value="Subject" /></td>
<td align=center><s:property value="HighSchool" /></td>
<td align=center><a class="red" href='receiveAthlete?idcard=<s:property value="IDcard" />'>收到资料</a></td>
<td align=center>
  <a class="red" href='athletestatus?status=<s:property value="Status" />&name=<s:property value="Name" />&idcard=<s:property value="IDcard" />'><s:property value="Status" /></a>
</td>
<td align=center><a class="red" href='athleteDetail?idcard=<s:property value="IDcard"  />'>查看</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="删除" onclick="javascript:do_sumbmitzy('<s:property value="Name" />','<s:property value="IDcard" />');" />
</td>
</tr>
</s:iterator>
</table>
</div>
</td>
</tr>
</table>
<%@ include file="/common/pageList.jsp" %>