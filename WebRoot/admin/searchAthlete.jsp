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
      <form name="searchathlete" action="searchAthlete" method="post">
          <input type="text" name="name" value="姓名" id="name" />
          <input type="text" name="number" value="报名号" id="number" />
          <input type="text" name="idcard" value="身份证号" id="idcard" />
          <input type="button" value="提交" onClick="checkNumber();"/>
      </form>
    </td>
  </tr>
<tr>
<td>
<center><b><font color="black" style='font-weight:bold;display:inline;'>高水平运动员</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr>
	<th align="center" width="8%"><b>考生姓名</b></th>
	<th align="center" width="5%"><b>报名号</b></th>
	<th align="center" width="6%"><b>省份</b></th>
	<th align="center" width="8%"><b>身份证号</b></th>
	<th align="center" width="5%"><b>科类</b></th>
	<th align="center" width="27%"><b>高中</b></th>
	<th align="center" width="32%" colspan="4"><b>管理操作</b></th>
</tr>
</thead>
<tr class=firstalt>
<td align=center>${request.name}</td>
<td align=center>${request.number}</td>
<td align=center>${request.province}</td>
<td align=center>${request.idcard}</td>
<td align=center>${request.subject}</td>
<td align=center>${request.highschool}</td>
<td align=center><a class="red" href='subAthleteStatus?status=高水平运动员资料已寄达&idcard=${request.idcard}'>收到资料</a></td>
<td align=center><a class="red" href='athletestatus?status=${request.status}&name=${request.name}&idcard=${request.idcard}'>修改状态</a></td>
<td align=center><a class="red" href='athleteDetail?idcard=${request.idcard}' target="_blank">查看</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="删除" onclick="javascript:do_sumbmitzy('<s:property value="Name" />',''${request.idcard}');" /></td>
</tr>
</table>
</div>
</td>
</tr>
</table>