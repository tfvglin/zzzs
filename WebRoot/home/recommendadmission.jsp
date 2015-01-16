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
      document.getElementById("noprint").style.display = "none";
      //$("#myPrintArea").printArea(); 
      window.print();
      document.getElementById("noprint").style.display = "block";   
});  
}); 	
	</script>
<style type="text/css">
body{
width:1000px;
 border-top:none;
 background:none;
 margin:40 auto;
 font-size:20px;
}

.Noprint{display:none;} 
	.PageNext{page-break-after: always;} 
	.budayin.td{}
.budayin.idname{}
</style>
<div class="fixedwide">
    <!--<div style="float:right;" >
				<p class="rightbtn">
				    <a href="/zzzs/home/recommend.jsp" class="linkbtn">&laquo; 返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
	</div>-->
	<div class="tips" id="noprint">
	    <s:if test='#request.status!="尚未提交申请表"&&#request.status!="尚未提交保送生申请表"'><div class="leftbtn">
			<a href="javascript:;" class="linkbtn btnred" id="biuuu_button">打印</a>提示：为获取最佳打印效果，请使用Firefox浏览器
		</div></s:if>
	</div>
    <div class="printtable" id="myPrintArea">
		<div class="clearfix" width="922">	    
		    <div class="title">
		        <span class="titlename" style="text-align:center;line-height: 30px;font-size: 30px;font-weight: bold;">西安电子科技大学</span>
		        <br />
		        <span class="titlename" style="font-size: 25px;text-align:center">2015年保送生选拔考试</span>
		        <br />
		        <span class="titlename" style="font-size: 25px;text-align:center">准考证</span>
		        <br />
		    </div>
		</div>		
	</div>
	<div class="clearfix" style="width:95%;">
		    <div class="right" class="photo">
				<img src="${pageContext.request.contextPath}/upload/${request.photo}" align="right"
					height="112.5" width="90"/>
			</div>		
			<div class="recommendadmissionpersonal">    
            <table width="60%" border="0" >
              <tr>
                <td width=30% style="font-size: 25px;">姓名：<span style="font-size: 25px;">${request.username}</span></td>
                <td style="font-size: 25px;">性别：<span style="font-size: 25px;">${request.sex}</span></td>
              </tr>
              <tr>
                <td width=30% style="font-size: 25px;">省份：
                  <span style="font-size: 25px;">${request.province}
                  </span></td>
                <td style="font-size: 25px;">科类：<span style="font-size: 25px;">${request.subject}</span></td>
              </tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">报名号：<span style="font-size: 25px;">${request.number}</span></td>
              </tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">身份证号：<span style="font-size: 25px;">${request.idcard}</span></td>
              </tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">毕业中学：<span style="font-size: 25px;">${request.highschool}</span></td>
              </tr>
              <tr><td></td></tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">考试时间安排：</td>
              </tr>
           </table>
           </div>
           <div class="recommendadmissionexam">
             <table width="100%" border="0">
             <tr>
               <td width=25% align="center" style="font-size: 25px;">日期</td>
               <td width=25% align="center" style="font-size: 25px;">时间</td>
               <td width=20% align="center" style="font-size: 25px;">考试项目</td>
               <td width=30% align="center" style="font-size: 25px;">考试地点</td>
             </tr>
             <tr>
               <td width=25% align="center"><span style="font-size: 25px;">${request.aerobicsdate}</span></td>
               <td width=25% align="center"><span style="font-size: 25px;">${request.aerobicsbegin}-${request.aerobicsend}</span></td>
               <td width=20% align="center"><span style="font-size: 25px;">健美操</span></td>
               <td width=30% align="center"><span style="font-size: 25px;">${request.aerobicsaddress}</span></td>
             </tr>
             <tr>
               <td width=25% align="center"><span style="font-size: 25px;">${request.swimdate}</span></td>
               <td width=25% align="center"><span style="font-size: 25px;">${request.swimbegin}-${request.swimend}</span></td>
               <td width=20% align="center"><span style="font-size: 25px;">游泳</span></td>
               <td width=30% align="center"><span style="font-size: 25px;">${request.swimaddress}</span></td>
             </tr>
             <tr>
               <td width=25% align="center"><span style="font-size: 25px;">${request.culturaldate}</span></td>
               <td width=25% align="center"><span style="font-size: 25px;">${request.culturalbegin}-${request.culturalend}</span></td>
               <td width=20% align="center"><span style="font-size: 25px;">文化课</span></td>
               <td width=30% align="center"><span style="font-size: 25px;">${request.culturaladdress}</span></td>
             </tr>
           </table>
           <br />           
           <span style="font-size:16px;font-weight:bold;font-size: 25px;">考试注意事项：</span>
           <br />           
         </div>
         <table width="100%" border="0">
             <tr height=40><td width=3%></td><td style="font-size: 25px;">1、参加健美操测试的考生请提前30分钟到考试地点门口集合；</td></tr>
             <tr height=40><td width=3%></td><td style="font-size: 25px;">2、参加游泳测试的考生请提前20分钟到考试地点集合；</td></tr>
             <tr height=40><td width=3%></td><td style="font-size: 25px;">3、参加文化课考试请携带本人身份证及准考证，提前15分钟到达考场，并自备相关文具；</td></tr>
             <tr height=40><td width=3%></td><td style="font-size: 25px;">4、招生办公室联系电话：029-88202335，88202267。</td></tr>
         </table>
         <table width="100%" border="0">
             <tr height=100><td align='center'></td></tr>
         </table>
         <div class="printtable">
		   <div class="clearfix" width="100%">	    
		     <div class="title">
		        <span class="bigword" style="text-align:center;font-size: 25px;">欢迎报考西电，祝您考试成功！</span>
		     </div>
		   </div>		
	     </div>
         <table width="100%" border="0">
             <tr height=100><td align='center'></td></tr>
         </table>
         <table width="100%" border="0">
              <tr height=40><td width='60%'></td><td align='center' style="font-size: 25px;">西安电子科技大学招生办公室</td></tr>             
         </table>        
	   </div>	
</div>