<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.PrintArea.js"></script>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/s-1_new.css" rel="stylesheet" type="text/css">
<script language="javaScript"> 
/*	function doPrint(){
			 //alert("���������-->�ļ�-->ҳ������-->ҳ�߾��ҳü/ҳ����ȥ��ҳü��ҳ�ţ�");
			 document.getElementById("noprint").style.display = "none";
			 window.print();			
			 document.getElementById("noprint").style.display = "block";	
	}*/
	$(document).ready(function(){  
  $("#biuuu_button").click(function(){
      /*document.getElementById("noprint").style.display = "none";
      //$("#myPrintArea").printArea(); 
      window.print();
      document.getElementById("noprint").style.display = "block";*/   
});  
}); 	
</script>
<style type="text/css">
body{
 border-top:none;
 background:none;
 margin:0 auto;
}

.Noprint{display:none;} 
	.PageNext{page-break-after: always;} 
	.budayin.td{}
.budayin.idname{}
</style>
<center>
<div class="fixedwide">
    <div class="printtable" id="myPrintArea">
		<div class="clearfix" width="922">
		    <div class="right" class="photo">
				<img src="upload/${request.photo}" align="right" height="112.5" width="90"/>
			</div>		    
		    <div class="title">
		        <span class="titlename" style="text-align:center">���� ${request.username} ��ϸ��Ϣ</span>
		        <br />
		        <br />
		        <span class="titlename" style="text-align:center">�����ţ�${request.number}</span>
		     </div>
		</div>
		<h2>���˻������</h2>		
		<div class="titlename">�߿������ţ�${request.entranceno}</div>	
		<br />	
		<table width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td width="12.5%" align="center"><span class="titlename">����</span></td>
				<td width="12.5%" align="center">${request.username}</td>
				<td width="12.5%" align="center"><span class="titlename">�Ա�</span></td>
				<td width="12.5%" align="center">${request.sex}</td>
				<td width="12.5%" align="center"><span class="titlename">����</span></td>
				<td width="12.5%" align="center">${request.nation}
				</td>
				<td width="12.5%" align="center"><span class="titlename">������ò</span></td>
				<td width="12.5%" align="center">${request.politic}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">��������</span></td>
				<td colspan="3">${request.birthday}</td>
				<td align="center"><span class="titlename">���֤��</span></td>
				<td colspan="3">${request.idcard}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">�˶���Ŀ</span></td>
				<td align="center">${request.specialty}</td>
				<td align="center"><span class="titlename">�˶��ȼ�</span></td>
				<td align="center">${request.level}</td>
				<td align="center"><span class="titlename">���ʱ��</span></td>
				<td align="center">${request.gettime}</td>
				<td align="center"><span class="titlename">ʡ��</span></td>
				<td align="center">${request.province}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">������ѧ</span></td>  
				<td colspan="5">${request.highschool}</td>
				<td align="center"><span class="titlename">����</span></td>
				<td align="center">${request.subject}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">��ѧ��ϵ��</span></td>  
				<td align="center">${request.highlink}</td>
				<td align="center"><span class="titlename">����</span></td>
				<td align="center" colspan="2">${request.highdepartment}</td>
				<td align="center"><span class="titlename">��ϵ�绰</span></td>
				<td colspan="2">${request.hightel}</span></td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">��ѧͨ�ŵ�ַ</span></td>  
				<td colspan="4">${request.highaddress}</td>
				<td align="center"><span class="titlename">��ѧ�ʱ�</span></td>
				<td colspan="2">${request.highpost}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">��ͥͨ�ŵ�ַ</span></td>  
				<td colspan="4">${request.homeaddress}</td>
				<td align="center"><span class="titlename">��ͥ�ʱ�</span></td>
				<td colspan="2">${request.homepost}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">��ͥ�绰(������)</span></td>  
				<td colspan="3">${request.hometel}</td>
				<td align="center"><span class="titlename">������ϵ�绰</span></td>
				<td colspan="3">${request.mobile}</td>
			</tr>		
		</table>
		<h2>��Ҫ��ͥ��Ա�������</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="12.5%" align="center"><span class="titlename">�뱾�˹�ϵ</span></td>
				<td width="12.5%" align="center"><span class="titlename">����</span></td>
				<td width="45%" align="center"><span class="titlename">������λ��ְ��</span></td>
				<td width="15%" align="center"><span class="titlename">���ѧ��</span></td>
				<td width="15%" align="center"><span class="titlename">��ϵ�绰</span></td>
			</tr>
			<tr>
				<td width="12.5%" align="center">${request.firstrelation}</td>
				<td width="12.5%" align="center">${request.firstname}</td>
				<td width="45%" align="center">${request.firstunit}</td>
				<td width="15%" align="center">${request.firstedu}</td>
				<td width="15%" align="center">${request.firsttel}</span></td>
			</tr>
			<tr Height="30px">
				<td width="12.5%" align="center">${request.secondrelation}</td>
				<td width="12.5%" align="center">${request.secondname}</td>
				<td width="45%" align="center">${request.secondunit}</td>
				<td width="15%" align="center">${request.secondedu}</td>
				<td width="15%" align="center">${request.secondtel}</td>
			</tr>
			<!--<tr Height="30px">
				<td width="12.5%" align="center"></td>
				<td width="12.5%" align="center"></td>
				<td width="45%" align="center"></td>
				<td width="15%" align="center"></td>
				<td width="15%" align="center"></td>
			</tr>
			<tr Height="30px">
				<td width="12.5%" align="center"></td>
				<td width="12.5%" align="center"></td>
				<td width="45%" align="center"></td>
				<td width="15%" align="center"></td>
				<td width="15%" align="center"></td>
			</tr>-->
		</table>
		<h2>�ܽ������</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			    <td width="12.5%" align="center"><span class="titlename">�ܽ����̶�</span></td>
				<td width="40%" align="center"><span class="titlename">����ѧУ����ע��ʡ�У�</span></td>
				<td width="17.5%" align="center"><span class="titlename">��ʼʱ��</span></td>
				<td width="17.5%" align="center"><span class="titlename">��ֹʱ��</span></td>
				<td width="12.5%" align="center"><span class="titlename">֤����</span></td>
			</tr>
			<tr>
			    <td width="12.5%" align="center"><span class="titlename">����</span></td>
				<td width="40%" align="center">${request.highschool}</td>
				<td width="17.5%" align="center">${request.highbegin}</td>
				<td width="17.5%" align="center">${request.highend}</td>
				<td width="12.5%" align="center">${request.highlink}</td>
			</tr>
			<tr>
			    <td width="12.5%" align="center"><span class="titlename">����</span></td>
				<td width="40%" align="center">${request.midschool}</td>
				<td width="17.5%" align="center">${request.midbegin}</td>
				<td width="17.5%" align="center">${request.midend}</td>
				<td width="12.5%" align="center">${request.midlink}</td>
			</tr>			
		</table>
		<h2>�����س��������</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			    <td width="20%" align="center"><span class="titlename">�����س�</span></td>
				<td width="80%">${request.strength}</td>
			</tr>
			<tr>
			    <td width="20%" align="center"><span class="titlename">�����</span></td>
				<td width="80%">${request.awards}</td>
			</tr>
		</table>
	</div>
	<br/>	
</div>
</center>