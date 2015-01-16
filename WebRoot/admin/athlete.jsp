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
  $("#number").click(function(){
      //alert($("#name").val());
      if($("#number").val()=="报名号")
      {
          $("#number").val("");
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
        window.location.href="delAthlete?idcard="+Email;
    }
    //alert(Name);
}
function do_AthleteAdmissionGrant()
{
    if (confirm("您确定要发放高水平运动员的准考证吗?"))
    {
        window.location.href="grantAthlete";
    }
}
function do_AthleteGrade()
{
    if (confirm("您确定要公布高水平运动员的成绩吗?"))
    {
        window.location.href="../admin/AthleteGrade";
    }
}
function importAthlete(){
    window.location.href="importAthlete";
}
</script>	
<script language="javaScript">
function checkNumber(){	
  var name=window.document.searchathlete.name.value; 
  var number=window.document.searchathlete.number.value;
  var idcard=window.document.searchathlete.idcard.value;      
  if((name=="姓名"||name==""||name==null)&&(number=="报名号"||number==""||number==null)&&(idcard=="身份证号"||idcard==""||idcard==null)){
    alert("请至少输入一个查找条件！");
    searchathlete.name.focus();
    return;
  }
  if(number!="报名号"&&number!=""&&number!=null)
  {
    if(number.length!=10)
    {
      alert("请输入正确的报名号！");
      searchathlete.number.focus();
      return;
    }
  }
    
  searchathlete.submit();
}
</script>
<table cellpadding="0" cellspacing="0" border="0" align="center" width="96%" class="tblborder">
  <tr>
    <td>
      <form name="searchathlete" action="searchAthlete" method="post" class="stdform stdform2 margin20">
          <span class="field"><input type="text" name="name" value="姓名" id="name" /></span>
          <input type="text" name="number" value="报名号" id="number"/>
          <input type="text" name="idcard" value="身份证号" id="idcard" />
          <input type="button" value="查找" onClick="checkNumber();"/>
      </form>
      <br />      
      <a class="red" href="getAthleteAdmission" style="display:inline;">编辑高水平运动员准考证</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="AthleteAdmissionGrant" class="bt" value="发放高水平运动员准考证" onclick="javascript:do_AthleteAdmissionGrant();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a class="red" href="exportAthlete" style="display:inline;">导出高水平运动员统计表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!--<input type="button" class="bt" value="导入高水平运动员考核结果" onclick="javascript:importAthlete();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="AthleteGrade" class="bt" value="公布高水平运动员成绩" onclick="javascript:do_AthleteGrade();" />-->
    </td>
  </tr>  
<tr>
<td>
<br />
<center><b><font color="black" style='font-weight:bold;display:inline;'>高水平运动员</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr>
    <th align="center" width="5%"><b>序号</b></th>
	<th align="center" width="8%"><b>考生姓名</b></th>
	<th align="center" width="5%"><b>报名号</b></th>
	<th align="center" width="6%"><b>省份</b></th>
	<th align="center" width="8%"><b>身份证号</b></th>
	<th align="center" width="5%"><b>科类</b></th>
	<th align="center" width="27%"><b>高中</b></th>
	<th align="center" width="32%" colspan="4"><b>管理操作</b></th>
</tr>
</thead>
<s:iterator id="athlete" value="#request.pageInfo.list"  status="st">
<s:if test="#st.odd"><tr class="odd"></s:if>
<s:if test="#st.even"><tr class="even"></s:if>
<td align=center><s:property value="#st.count"/></td>
<td align=center><s:property value="Name" /><input type="hidden" name="name" value='<s:property value="Name" />' /></td>
<td align=center><s:property value="Number" /></td>
<td align=center><s:property value="Province" /></td>
<td align=center><s:property value="IDcard" /></td>
<td align=center><s:property value="Subject" /></td>
<td align=center><s:property value="HighSchool" /></td>
<td align=center><a class="red" href='subAthleteStatus?status=高水平运动员资料已寄达&idcard=<s:property value="IDcard" />'>收到资料</a></td>
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