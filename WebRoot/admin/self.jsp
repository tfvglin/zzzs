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
function do_sumbmitzy(Name,Email)
{
    if (confirm("��ȷ��Ҫɾ����Ϊ"+Name+"��ѧ����"))
    {
        window.location.href="../admin/SelfDeleteAction?email="+Email;
    }
    //alert(Name);
}
function do_exemption(Name,Email)
{
    if (confirm("��ȷ��Ҫ������Ϊ"+Name+"��ѧ���������"))
    {
        window.location.href="../admin/ExemptionAction?email="+Email;
    }
    //alert(Name);
}
function do_SelfAdmissionGrant()
{
    if (confirm("��ȷ��Ҫ��������������׼��֤��?"))
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
  if((name=="����"||name==""||name==null)&&(registration=="������"||registration==""||registration==null)&&(idcard=="���֤��"||idcard==""||idcard==null)){
    alert("����������һ������������");
    searchself.name.focus();
    return;
  }
  if(registration!="������"&&registration!=""&&registration!=null)
  {
    if(registration.length!=10)
    {
      alert("��������ȷ�ı����ţ�");
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
          <input type="text" name="name" value="����" id="name" />
          <input type="text" name="registration" value="������" id="registration" />
          <input type="text" name="idcard" value="���֤��" id="idcard" />
          <input type="button" value="����" onClick="checkNumber();"/>
      </form>
      <!--<a class="red" href="../admin/SelfExcelAction" style="display:inline;">������������ͳ�Ʊ�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" class="bt" value="������������������" onclick="javascript:do_SelfTrial();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->      
      <a class="red" href="../admin/SelfAdmission" style="display:inline;">�༭��������׼��֤</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="SelfAdmissionGrant" class="bt" value="������������׼��֤" onclick="javascript:do_SelfAdmissionGrant();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!--<input type="button" class="bt" value="����ɼ�" onclick="javascript:do_ImportGrade();" />-->
    </td>
  </tr>
<tr>
<td>
<center><b><font color="black" style='font-weight:bold;display:inline;'>��������</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr bgcolor="#E0FFFF">
    <th align="center" width="5%"><b>���</b></th>
	<th align="center" width="7%"><b>����</b></th>
	<th align="center" width="5%"><b>������</b></th>
	<th align="center" width="6%"><b>ʡ��</b></th>
	<th align="center" width="8%"><b>���֤��</b></th>
	<th align="center" width="5%"><b>����</b></th>
	<th align="center" width="20%"><b>����</b></th>
	<th align="center" width="5%"><b>������</b></th>
	<th align="center" width="5%"><b>��λ��</b></th>
	<th align="center" width="30%" colspan="4"><b>�������</b></th>
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
<td align=center><a class="red" href='receiveAthlete?idcard=<s:property value="IDcard" />'>�յ�����</a></td>
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