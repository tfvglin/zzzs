<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<head>
  <meta http-equiv="content-type" content="text/html; charset=gbk">
  <title>�������ӿƼ���ѧ����������-���Ʊ���ϵͳ</title> 
  <link href="css/reset.css" rel="stylesheet" type="text/css">
  <link href="css/css.css" rel="stylesheet" type="text/css">
  <link href="css/s-1_new.css" rel="stylesheet" type="text/css">
  <link href="css/checkform.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="css/ymPrompt.css">
</head>
<div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">
  <span style="font-size:24px;">����</span><span style="font-size:24px;">��ǰ״̬��${session.status}</span>
</div>
<div class="tips" style="color:#666;padding:20px 10px;">����������ڱ����У�������ѡ����б�����</div>
<div class="nofixedwide">
  <ul class="selectentrance clearfix">
    <s:set name="current" value="#request.current" />    
    <s:iterator value="#request.signups" id="signup">    
      <s:set name="name" value="Name" />
      <s:set name="end" value="End" />
      <li>           
	    <h3><span><s:property value="Name" /></span></h3>
		<p>��ʼʱ�䣺<br><s:property value="Begin" /> 00:00:00<br>��ֹʱ�䣺<br><s:property value="End" /> 18:00:00</p>
		
		
		<!-- ��ˮƽ�˶�Ա -->
		
		<s:if test='#name=="��ˮƽ�˶�Ա"'>
		  <!-- δ�ύ�������δ��ʱ -->
		  <s:if test='(#session.status=="��δ�ύ�����"||#session.status=="��δ�ύ��ˮƽ�˶�Ա�����")&&(#request.current<=#end)'>
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">����</a>
		  </s:if>
		  <!-- ���ύ�������δ��ʱ -->
		  <s:if test='(#session.status!="��δ�ύ�����"&&#session.status!="��δ�ύ��ˮƽ�˶�Ա�����")&&(#request.current<=#end)'>
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">��ѯ/����</a>
		  </s:if>
		</s:if>
		<!-- �ѹ�ʱ��δ�ύ����� -->
		  <!--<s:if test="(#status==��δ�ύ�����||#status==��δ�ύ��ˮƽ�˶�Ա�����)&&(#end<#current)">
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn" disabled="disabled" onclick="return false;">����</a>
		   -->
		 
		<!--</s:if>-->
		<!-- ������ -->
		<s:if test="#name=='������'">
		<!-- δ�ύ�������δ��ʱ -->
	
		  <s:if test='(#session.status=="��δ�ύ�����"||#session.status=="��δ�ύ�����������")&&(#request.current<=#end)'>
		    <a href="recommend?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">����</a>
		  </s:if>
		  <s:if test='(#session.status!="��δ�ύ�����"&&#session.status!="��δ�ύ�����������")&&(#request.current<=#end)'>
		    <a href="athlete?begin=${signup.Begin}&end=${signup.End}" class="linkbtn">��ѯ/����</a>
		  </s:if>
		</s:if>
		<!--�������� -->
		<!--<s:if test="#name==��������">
		  <s:if test="(#status==��δ�ύ�����||#status==��δ�ύ�������������)&&(#end<#current)">
		    <a href="${pageContext.request.contextPath}/home/athlete.jsp?begin=${signup.Begin}&end=${signup.End}" class="linkbtn" disabled="disabled" onclick="return false;">����</a>
		  </s:if>
		</s:if>-->
	  </li>  
    </s:iterator>				
  </ul>
</div>
<div class="tips"></div>
<div class="nofixedwide"><ul class="selectentrance clearfix"></ul></div>
<div class="footer">Copyright &#169; 2015 �������ӿƼ���ѧ �����칫��</div>