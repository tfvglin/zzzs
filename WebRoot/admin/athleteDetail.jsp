<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>   
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.PrintArea.js"></script>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/s-1_new.css" rel="stylesheet" type="text/css">
<script language="javaScript"> 
/*	function doPrint(){
			 //alert("请在浏览器-->文件-->页面设置-->页边距和页眉/页脚中去除页眉和页脚！");
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
		        <span class="titlename" style="text-align:center">考生 ${request.username} 详细信息</span>
		        <br />
		        <br />
		        <span class="titlename" style="text-align:center">报名号：${request.number}</span>
		     </div>
		</div>
		<h2>个人基本情况</h2>		
		<div class="titlename">高考报名号：${request.entranceno}</div>	
		<br />	
		<table width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td width="12.5%" align="center"><span class="titlename">姓名</span></td>
				<td width="12.5%" align="center">${request.username}</td>
				<td width="12.5%" align="center"><span class="titlename">性别</span></td>
				<td width="12.5%" align="center">${request.sex}</td>
				<td width="12.5%" align="center"><span class="titlename">民族</span></td>
				<td width="12.5%" align="center">${request.nation}
				</td>
				<td width="12.5%" align="center"><span class="titlename">政治面貌</span></td>
				<td width="12.5%" align="center">${request.politic}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">出生日期</span></td>
				<td colspan="3">${request.birthday}</td>
				<td align="center"><span class="titlename">身份证号</span></td>
				<td colspan="3">${request.idcard}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">运动项目</span></td>
				<td align="center">${request.specialty}</td>
				<td align="center"><span class="titlename">运动等级</span></td>
				<td align="center">${request.level}</td>
				<td align="center"><span class="titlename">获得时间</span></td>
				<td align="center">${request.gettime}</td>
				<td align="center"><span class="titlename">省份</span></td>
				<td align="center">${request.province}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">所在中学</span></td>  
				<td colspan="5">${request.highschool}</td>
				<td align="center"><span class="titlename">科类</span></td>
				<td align="center">${request.subject}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">中学联系人</span></td>  
				<td align="center">${request.highlink}</td>
				<td align="center"><span class="titlename">部门</span></td>
				<td align="center" colspan="2">${request.highdepartment}</td>
				<td align="center"><span class="titlename">联系电话</span></td>
				<td colspan="2">${request.hightel}</span></td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">中学通信地址</span></td>  
				<td colspan="4">${request.highaddress}</td>
				<td align="center"><span class="titlename">中学邮编</span></td>
				<td colspan="2">${request.highpost}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">家庭通信地址</span></td>  
				<td colspan="4">${request.homeaddress}</td>
				<td align="center"><span class="titlename">家庭邮编</span></td>
				<td colspan="2">${request.homepost}</td>
			</tr>
			<tr>
				<td align="center"><span class="titlename">家庭电话(含区号)</span></td>  
				<td colspan="3">${request.hometel}</td>
				<td align="center"><span class="titlename">本人联系电话</span></td>
				<td colspan="3">${request.mobile}</td>
			</tr>		
		</table>
		<h2>主要家庭成员基本情况</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="12.5%" align="center"><span class="titlename">与本人关系</span></td>
				<td width="12.5%" align="center"><span class="titlename">姓名</span></td>
				<td width="45%" align="center"><span class="titlename">工作单位及职务</span></td>
				<td width="15%" align="center"><span class="titlename">最高学历</span></td>
				<td width="15%" align="center"><span class="titlename">联系电话</span></td>
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
		<h2>受教育情况</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			    <td width="12.5%" align="center"><span class="titlename">受教育程度</span></td>
				<td width="40%" align="center"><span class="titlename">所在学校（请注明省市）</span></td>
				<td width="17.5%" align="center"><span class="titlename">起始时间</span></td>
				<td width="17.5%" align="center"><span class="titlename">终止时间</span></td>
				<td width="12.5%" align="center"><span class="titlename">证明人</span></td>
			</tr>
			<tr>
			    <td width="12.5%" align="center"><span class="titlename">高中</span></td>
				<td width="40%" align="center">${request.highschool}</td>
				<td width="17.5%" align="center">${request.highbegin}</td>
				<td width="17.5%" align="center">${request.highend}</td>
				<td width="12.5%" align="center">${request.highlink}</td>
			</tr>
			<tr>
			    <td width="12.5%" align="center"><span class="titlename">初中</span></td>
				<td width="40%" align="center">${request.midschool}</td>
				<td width="17.5%" align="center">${request.midbegin}</td>
				<td width="17.5%" align="center">${request.midend}</td>
				<td width="12.5%" align="center">${request.midlink}</td>
			</tr>			
		</table>
		<h2>个人特长、获奖情况</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			    <td width="20%" align="center"><span class="titlename">个人特长</span></td>
				<td width="80%">${request.strength}</td>
			</tr>
			<tr>
			    <td width="20%" align="center"><span class="titlename">获奖情况</span></td>
				<td width="80%">${request.awards}</td>
			</tr>
		</table>
	</div>
	<br/>	
</div>
</center>