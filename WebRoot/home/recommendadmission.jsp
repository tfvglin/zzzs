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
				    <a href="/zzzs/home/recommend.jsp" class="linkbtn">&laquo; ����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
	</div>-->
	<div class="tips" id="noprint">
	    <s:if test='#request.status!="��δ�ύ�����"&&#request.status!="��δ�ύ�����������"'><div class="leftbtn">
			<a href="javascript:;" class="linkbtn btnred" id="biuuu_button">��ӡ</a>��ʾ��Ϊ��ȡ��Ѵ�ӡЧ������ʹ��Firefox�����
		</div></s:if>
	</div>
    <div class="printtable" id="myPrintArea">
		<div class="clearfix" width="922">	    
		    <div class="title">
		        <span class="titlename" style="text-align:center;line-height: 30px;font-size: 30px;font-weight: bold;">�������ӿƼ���ѧ</span>
		        <br />
		        <span class="titlename" style="font-size: 25px;text-align:center">2015�걣����ѡ�ο���</span>
		        <br />
		        <span class="titlename" style="font-size: 25px;text-align:center">׼��֤</span>
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
                <td width=30% style="font-size: 25px;">������<span style="font-size: 25px;">${request.username}</span></td>
                <td style="font-size: 25px;">�Ա�<span style="font-size: 25px;">${request.sex}</span></td>
              </tr>
              <tr>
                <td width=30% style="font-size: 25px;">ʡ�ݣ�
                  <span style="font-size: 25px;">${request.province}
                  </span></td>
                <td style="font-size: 25px;">���ࣺ<span style="font-size: 25px;">${request.subject}</span></td>
              </tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">�����ţ�<span style="font-size: 25px;">${request.number}</span></td>
              </tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">���֤�ţ�<span style="font-size: 25px;">${request.idcard}</span></td>
              </tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">��ҵ��ѧ��<span style="font-size: 25px;">${request.highschool}</span></td>
              </tr>
              <tr><td></td></tr>
              <tr>
                <td colspan=2 style="font-size: 25px;">����ʱ�䰲�ţ�</td>
              </tr>
           </table>
           </div>
           <div class="recommendadmissionexam">
             <table width="100%" border="0">
             <tr>
               <td width=25% align="center" style="font-size: 25px;">����</td>
               <td width=25% align="center" style="font-size: 25px;">ʱ��</td>
               <td width=20% align="center" style="font-size: 25px;">������Ŀ</td>
               <td width=30% align="center" style="font-size: 25px;">���Եص�</td>
             </tr>
             <tr>
               <td width=25% align="center"><span style="font-size: 25px;">${request.aerobicsdate}</span></td>
               <td width=25% align="center"><span style="font-size: 25px;">${request.aerobicsbegin}-${request.aerobicsend}</span></td>
               <td width=20% align="center"><span style="font-size: 25px;">������</span></td>
               <td width=30% align="center"><span style="font-size: 25px;">${request.aerobicsaddress}</span></td>
             </tr>
             <tr>
               <td width=25% align="center"><span style="font-size: 25px;">${request.swimdate}</span></td>
               <td width=25% align="center"><span style="font-size: 25px;">${request.swimbegin}-${request.swimend}</span></td>
               <td width=20% align="center"><span style="font-size: 25px;">��Ӿ</span></td>
               <td width=30% align="center"><span style="font-size: 25px;">${request.swimaddress}</span></td>
             </tr>
             <tr>
               <td width=25% align="center"><span style="font-size: 25px;">${request.culturaldate}</span></td>
               <td width=25% align="center"><span style="font-size: 25px;">${request.culturalbegin}-${request.culturalend}</span></td>
               <td width=20% align="center"><span style="font-size: 25px;">�Ļ���</span></td>
               <td width=30% align="center"><span style="font-size: 25px;">${request.culturaladdress}</span></td>
             </tr>
           </table>
           <br />           
           <span style="font-size:16px;font-weight:bold;font-size: 25px;">����ע�����</span>
           <br />           
         </div>
         <table width="100%" border="0">
             <tr height=40><td width=3%></td><td style="font-size: 25px;">1���μӽ����ٲ��ԵĿ�������ǰ30���ӵ����Եص��ſڼ��ϣ�</td></tr>
             <tr height=40><td width=3%></td><td style="font-size: 25px;">2���μ���Ӿ���ԵĿ�������ǰ20���ӵ����Եص㼯�ϣ�</td></tr>
             <tr height=40><td width=3%></td><td style="font-size: 25px;">3���μ��Ļ��ο�����Я���������֤��׼��֤����ǰ15���ӵ��￼�������Ա�����ľߣ�</td></tr>
             <tr height=40><td width=3%></td><td style="font-size: 25px;">4�������칫����ϵ�绰��029-88202335��88202267��</td></tr>
         </table>
         <table width="100%" border="0">
             <tr height=100><td align='center'></td></tr>
         </table>
         <div class="printtable">
		   <div class="clearfix" width="100%">	    
		     <div class="title">
		        <span class="bigword" style="text-align:center;font-size: 25px;">��ӭ�������磬ף�����Գɹ���</span>
		     </div>
		   </div>		
	     </div>
         <table width="100%" border="0">
             <tr height=100><td align='center'></td></tr>
         </table>
         <table width="100%" border="0">
              <tr height=40><td width='60%'></td><td align='center' style="font-size: 25px;">�������ӿƼ���ѧ�����칫��</td></tr>             
         </table>        
	   </div>	
</div>