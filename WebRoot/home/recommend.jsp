<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import = "java.util.*,java.text.*"%>
<link href="${pageContext.request.contextPath}/css/homeindex.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/s-1_new.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/caChecker1.0.3.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ymPrompt.js" type="text/javascript"></script>
    <div>
	    <div class="mainwrap">
		    <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">���� &gt;<span style="font-size:24px;">������</span><span style="font-size:24px;margin-left:50px;">��ǰ״̬��${session.status}</span></div>
				<div class="tips" style="color:#666;padding:20px 10px;">
					�밴���²��裬��˳�����&nbsp;&nbsp;
					<br />
					<span>ע�⣺ֻ��ÿһ����ɺ���ܽ�����һ��������</span>
				</div>
			<div class="fixedwide">
		        <ul class="regstep">
		            <li <s:if test='#session.status!="��δ�ύ�����"&&#session.status!="��δ�ύ�����������"'>class="noactived"</s:if>>
				       <ul class="clearfix">
						    <li class="num">1</li>
							<li class="txt">
								<h3>��д���������������</h3>
								��д�걣����������������ǵñ���
								<br/>����ʱ�䣺<s:property value="#parameters.begin" /> 00:00:00-<s:property value="#parameters.end" /> 18:00:00
							</li>
							<li class="btn" ><a href="getRecommend" class="linkbtn btnred"  <s:if test='#session.status!="��δ�ύ�����"&&#session.status!="��δ�ύ�����������"'>disabled="disabled" onclick="return false;"</s:if>>��д���������</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="��δ�ύ�����������"'>class="noactived"</s:if>><!-- ����Ѿ��ύ������д -->
					    <ul class="clearfix">
						    <li class="num">2</li>
							<li class="txt">
								<h3>�ύ��Ԥ�����������������</h3>
								��˶���������ύ���ύ���������޸������
								<br/>�ύʱ�䣺<s:property value="#parameters.begin" /> 00:00:00-<s:property value="#parameters.end" /> 18:00:00
							</li>
							<li class="btn" ><a href="confirmrecommend" class="linkbtn btnred" <s:if test='#session.status!="��δ�ύ�����������"'>disabled="disabled" onclick="return false;"</s:if>> �ύ��Ԥ��</a>
							</li>
						</ul>
					</li>
				    <li <s:if test='#session.status=="��δ�ύ�����"||#session.status=="��δ�ύ�����������"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">3</li>
							<li class="txt">
								<h3>���ϴ�ӡ���������������</h3>
								�ύ���ӡ���������������
							</li>
							<li class="btn">
								<a href="printRecommend" class="linkbtn btnred" target="_blank" <s:if test='#session.status=="��δ�ύ�����"||#session.status=="��δ�ύ�����������"'>disabled="disabled" onclick="return false;"</s:if>>��ӡ</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="�����������ѼĴ�"&&#session.status!="���ύ���������������"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">4</li>
							<li class="txt">
								<h3>��ѯ���������Ƿ�Ĵ�</h3>
							</li>
							<li class="btn">
								<a href="getIfRecommendReceive" class="linkbtn btnred" <s:if test='#session.status!="�����������ѼĴ�"&&#session.status!="���ύ���������������"'>disabled="disabled" onclick="return false;"</s:if>>�鿴</a>
							</li>
						</ul>
					</li>							
                    <li <s:if test='#session.status!="����������ͨ��"&&#session.status!="����������ͨ��"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">5</li>
							<li class="txt">
								<h3>�鿴����������ĳ�����</h3>
							</li>
							<li class="btn">
								<a href="getRecommendTrial" class="linkbtn btnred"  <s:if test='#session.status!="����������ͨ��"&&#session.status!="����������ͨ��"'>disabled="disabled" onclick="return false;"</s:if>>�鿴������</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="����������ͨ��"||#session.recommendAdmission!="��"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">6</li>
							<li class="txt"><h3>��ӡ׼��֤</h3></li>
							<li class="btn">
								<a href="printRecommendAdmission" class="linkbtn btnred" target="_blank" <s:if test='#session.status!="����������ͨ��"||#session.recommendAdmission!="��"'>disabled="disabled" onclick="return false;"</s:if>>��ӡ׼��֤</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="����ͨ��"&&#session.status!="���˲�ͨ��"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">7</li>
							<li class="txt"><h3>��ѯ���˽��	</h3></li>
							<li class="btn"><a href="${pageContext.request.contextPath}/user/GetRecommendGrade" class="linkbtn btnred" <s:if test='#session.status!="����ͨ��"&&#session.status!="���˲�ͨ��"'>disabled="disabled" onclick="return false;"</s:if>>��ѯ���˽��	</a>
							</li>
						</ul>
					</li>
                </ul>
			</div>
        </div>
    </div>
