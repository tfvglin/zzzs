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
      <form name="searchathlete" action="searchAthlete" method="post">
          <input type="text" name="name" value="����" id="name" />
          <input type="text" name="number" value="������" id="number" />
          <input type="text" name="idcard" value="���֤��" id="idcard" />
          <input type="button" value="�ύ" onClick="checkNumber();"/>
      </form>
    </td>
  </tr>
<tr>
<td>
<center><b><font color="black" style='font-weight:bold;display:inline;'>��ˮƽ�˶�Ա</font></b></center>
<div class="grid-view">
<table class="items">
<thead>
<tr>
	<th align="center" width="8%"><b>��������</b></th>
	<th align="center" width="5%"><b>������</b></th>
	<th align="center" width="6%"><b>ʡ��</b></th>
	<th align="center" width="8%"><b>���֤��</b></th>
	<th align="center" width="5%"><b>����</b></th>
	<th align="center" width="27%"><b>����</b></th>
	<th align="center" width="32%" colspan="4"><b>�������</b></th>
</tr>
</thead>
<tr class=firstalt>
<td align=center>${request.name}</td>
<td align=center>${request.number}</td>
<td align=center>${request.province}</td>
<td align=center>${request.idcard}</td>
<td align=center>${request.subject}</td>
<td align=center>${request.highschool}</td>
<td align=center><a class="red" href='subAthleteStatus?status=��ˮƽ�˶�Ա�����ѼĴ�&idcard=${request.idcard}'>�յ�����</a></td>
<td align=center><a class="red" href='athletestatus?status=${request.status}&name=${request.name}&idcard=${request.idcard}'>�޸�״̬</a></td>
<td align=center><a class="red" href='athleteDetail?idcard=${request.idcard}' target="_blank">�鿴</a></td>
<td align=center><input type="button" name="Submit" class="bt" value="ɾ��" onclick="javascript:do_sumbmitzy('<s:property value="Name" />',''${request.idcard}');" /></td>
</tr>
</table>
</div>
</td>
</tr>
</table>