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
		    <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">���� &gt;<span style="font-size:24px;">��ˮƽ�˶�Ա</span><span style="font-size:24px;margin-left:50px;">��ǰ״̬��${session.status}</span></div>
				<div class="tips" style="color:#666;padding:20px 10px;">
					�밴���²��裬��˳�����&nbsp;&nbsp;
					<br />
					<span>ע�⣺ֻ��ÿһ����ɺ���ܽ�����һ��������</span>
				</div>
			<div class="fixedwide">
		        <ul class="regstep">
		            <li <s:if test='#session.status!="��δ�ύ�����"&&#session.status!="��δ�ύ��ˮƽ�˶�Ա�����"'>class="noactived"</s:if>>
				       <ul class="clearfix">
						    <li class="num">1</li>
							<li class="txt">
								<h3>��д��ˮƽ�˶�Ա���������</h3>
								��д���ˮƽ�˶�Ա������������ǵñ���
								<br/>����ʱ�䣺<s:property value="#parameters.begin" /> 00:00:00-<s:property value="#parameters.end" /> 18:00:00
							</li>
							<li class="btn" ><a href="getAthlete" class="linkbtn btnred"  <s:if test='#session.status!="��δ�ύ�����"&&#session.status!="��δ�ύ��ˮƽ�˶�Ա�����"'>disabled="disabled" onclick="return false;"</s:if>>��д���������</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="��δ�ύ��ˮƽ�˶�Ա�����"'>class="noactived"</s:if>><!-- ����Ѿ��ύ������д -->
					    <ul class="clearfix">
						    <li class="num">2</li>
							<li class="txt">
								<h3>�ύ��Ԥ����ˮƽ�˶�Ա���������</h3>
								��˶���������ύ���ύ���������޸������
								<br/>�ύʱ�䣺<s:property value="#parameters.begin" /> 00:00:00-<s:property value="#parameters.end" /> 18:00:00
							</li>
							<li class="btn" ><a href="confirmathlete" class="linkbtn btnred" <s:if test='#session.status!="��δ�ύ��ˮƽ�˶�Ա�����"'>disabled="disabled" onclick="return false;"</s:if>> �ύ��Ԥ��</a>
							</li>
						</ul>
					</li>
				    <li <s:if test='#session.status=="��δ�ύ�����"||#session.status=="��δ�ύ��ˮƽ�˶�Ա�����"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">3</li>
							<li class="txt">
								<h3>���ϴ�ӡ��ˮƽ�˶�Ա���������</h3>
								�ύ���ӡ��ˮƽ�˶�Ա���������
							</li>
							<li class="btn">
								<a href="printAthlete" class="linkbtn btnred" target="_blank" <s:if test='#session.status=="��δ�ύ�����"||#session.status=="��δ�ύ��ˮƽ�˶�Ա�����"'>disabled="disabled" onclick="return false;"</s:if>>��ӡ</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="��ˮƽ�˶�Ա�����ѼĴ�"&&#session.status!="���ύ��ˮƽ�˶�Ա���������"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">4</li>
							<li class="txt">
								<h3>��ѯ���������Ƿ�Ĵ�</h3>
							</li>
							<li class="btn">
								<a href="getIfAthleteReceive" class="linkbtn btnred" <s:if test='#session.status!="��ˮƽ�˶�Ա�����ѼĴ�"&&#session.status!="���ύ��ˮƽ�˶�Ա���������"'>disabled="disabled" onclick="return false;"</s:if>>�鿴</a>
							</li>
						</ul>
					</li>							
                    <li <s:if test='#session.status!="��ˮƽ�˶�Ա����ͨ��"&&#session.status!="��ˮƽ�˶�Ա����ͨ��"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">5</li>
							<li class="txt">
								<h3>�鿴��ˮƽ�˶�Ա����ĳ�����</h3>
							</li>
							<li class="btn">
								<a href="getAthleteTrial" class="linkbtn btnred"  <s:if test='#session.status!="��ˮƽ�˶�Ա����ͨ��"&&#session.status!="��ˮƽ�˶�Ա����ͨ��"'>disabled="disabled" onclick="return false;"</s:if>>�鿴������</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="��ˮƽ�˶�Ա����ͨ��"||#session.athleteAdmission!="��"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">6</li>
							<li class="txt"><h3>��ӡ׼��֤</h3></li>
							<li class="btn">
								<a href="printAthleteAdmission" class="linkbtn btnred" target="_blank" <s:if test='#session.status!="��ˮƽ�˶�Ա����ͨ��"||#session.athleteAdmission!="��"'>disabled="disabled" onclick="return false;"</s:if>>��ӡ׼��֤</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="����ͨ��"&&#session.status!="���˲�ͨ��"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">7</li>
							<li class="txt"><h3>��ѯ���˽��	</h3></li>
							<li class="btn"><a href="${pageContext.request.contextPath}/user/GetAthleteGrade" class="linkbtn btnred" <s:if test='#session.status!="����ͨ��"&&#session.status!="���˲�ͨ��"'>disabled="disabled" onclick="return false;"</s:if>>��ѯ���˽��	</a>
							</li>
						</ul>
					</li>
                </ul>
			</div>
        </div>
    </div>
