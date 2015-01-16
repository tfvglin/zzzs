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
  $("#number").click(function(){
      //alert($("#name").val());
      if($("#number").val()=="������")
      {
          $("#number").val("");
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
function do_sumbmitzy(Name,Email)
{
    if (confirm("��ȷ��Ҫɾ����Ϊ"+Name+"��ѧ����"))
    {
        window.location.href="delAthlete?idcard="+Email;
    }
    //alert(Name);
}
function do_AthleteAdmissionGrant()
{
    if (confirm("��ȷ��Ҫ���Ÿ�ˮƽ�˶�Ա��׼��֤��?"))
    {
        window.location.href="grantAthlete";
    }
}
function do_AthleteGrade()
{
    if (confirm("��ȷ��Ҫ������ˮƽ�˶�Ա�ĳɼ���?"))
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
  if((name=="����"||name==""||name==null)&&(number=="������"||number==""||number==null)&&(idcard=="���֤��"||idcard==""||idcard==null)){
    alert("����������һ������������");
    searchathlete.name.focus();
    return;
  }
  if(number!="������"&&number!=""&&number!=null)
  {
    if(number.length!=10)
    {
      alert("��������ȷ�ı����ţ�");
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
          <span class="field"><input type="text" name="name" value="����" id="name" /></span>
          <input type="text" name="number" value="������" id="number"/>
          <input type="text" name="idcard" value="���֤��" id="idcard" />
          <input type="button" value="����" onClick="checkNumber();"/>
      </form>
      <br />      
      <a class="red" href="getAthleteAdmission" style="display:inline;">�༭��ˮƽ�˶�Ա׼��֤</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="AthleteAdmissionGrant" class="bt" value="���Ÿ�ˮƽ�˶�Ա׼��֤" onclick="javascript:do_AthleteAdmissionGrant();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a class="red" href="exportAthlete" style="display:inline;">������ˮƽ�˶�Աͳ�Ʊ�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!--<input type="button" class="bt" value="�����ˮƽ�˶�Ա���˽��" onclick="javascript:importAthlete();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="AthleteGrade" class="bt" value="������ˮƽ�˶�Ա�ɼ�" onclick="javascript:do_AthleteGrade();" />-->
    </td>
  </tr>  
<tr>
<td>
<br />
<center><b><font color="black" style='font-weight:bold;display:inline;'>��ˮƽ�˶�Ա</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr>
    <th align="center" width="5%"><b>���</b></th>
	<th align="center" width="8%"><b>��������</b></th>
	<th align="center" width="5%"><b>������</b></th>
	<th align="center" width="6%"><b>ʡ��</b></th>
	<th align="center" width="8%"><b>���֤��</b></th>
	<th align="center" width="5%"><b>����</b></th>
	<th align="center" width="27%"><b>����</b></th>
	<th align="center" width="32%" colspan="4"><b>�������</b></th>
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
<td align=center><a class="red" href='subAthleteStatus?status=��ˮƽ�˶�Ա�����ѼĴ�&idcard=<s:property value="IDcard" />'>�յ�����</a></td>
<td align=center>
  <a class="red" href='athletestatus?status=<s:property value="Status" />&name=<s:property value="Name" />&idcard=<s:property value="IDcard" />'><s:property value="Status" /></a>
</td>
<td align=center><a class="red" href='athleteDetail?idcard=<s:property value="IDcard"  />'>�鿴</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="ɾ��" onclick="javascript:do_sumbmitzy('<s:property value="Name" />','<s:property value="IDcard" />');" />
</td>
</tr>
</s:iterator>
</table>
</div>
</td>
</tr>
</table>
<%@ include file="/common/pageList.jsp" %>