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
		    <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">报名 &gt;<span style="font-size:24px;">高水平运动员</span><span style="font-size:24px;margin-left:50px;">当前状态：${session.status}</span></div>
				<div class="tips" style="color:#666;padding:20px 10px;">
					请按以下步骤，按顺序操作&nbsp;&nbsp;
					<br />
					<span>注意：只有每一步完成后才能进行下一步操作。</span>
				</div>
			<div class="fixedwide">
		        <ul class="regstep">
		            <li <s:if test='#session.status!="尚未提交申请表"&&#session.status!="尚未提交高水平运动员申请表"'>class="noactived"</s:if>>
				       <ul class="clearfix">
						    <li class="num">1</li>
							<li class="txt">
								<h3>填写高水平运动员报名申请表</h3>
								填写完高水平运动员报名申请表后请记得保存
								<br/>报名时间：<s:property value="#parameters.begin" /> 00:00:00-<s:property value="#parameters.end" /> 18:00:00
							</li>
							<li class="btn" ><a href="getAthlete" class="linkbtn btnred"  <s:if test='#session.status!="尚未提交申请表"&&#session.status!="尚未提交高水平运动员申请表"'>disabled="disabled" onclick="return false;"</s:if>>填写报名申请表</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="尚未提交高水平运动员申请表"'>class="noactived"</s:if>><!-- 如果已经提交则不能填写 -->
					    <ul class="clearfix">
						    <li class="num">2</li>
							<li class="txt">
								<h3>提交和预览高水平运动员报名申请表</h3>
								请核对无误后再提交。提交后不允许再修改申请表
								<br/>提交时间：<s:property value="#parameters.begin" /> 00:00:00-<s:property value="#parameters.end" /> 18:00:00
							</li>
							<li class="btn" ><a href="confirmathlete" class="linkbtn btnred" <s:if test='#session.status!="尚未提交高水平运动员申请表"'>disabled="disabled" onclick="return false;"</s:if>> 提交和预览</a>
							</li>
						</ul>
					</li>
				    <li <s:if test='#session.status=="尚未提交申请表"||#session.status=="尚未提交高水平运动员申请表"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">3</li>
							<li class="txt">
								<h3>网上打印高水平运动员报名申请表</h3>
								提交后打印高水平运动员报名申请表
							</li>
							<li class="btn">
								<a href="printAthlete" class="linkbtn btnred" target="_blank" <s:if test='#session.status=="尚未提交申请表"||#session.status=="尚未提交高水平运动员申请表"'>disabled="disabled" onclick="return false;"</s:if>>打印</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="高水平运动员资料已寄达"&&#session.status!="已提交高水平运动员报名申请表"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">4</li>
							<li class="txt">
								<h3>查询申请资料是否寄达</h3>
							</li>
							<li class="btn">
								<a href="getIfAthleteReceive" class="linkbtn btnred" <s:if test='#session.status!="高水平运动员资料已寄达"&&#session.status!="已提交高水平运动员报名申请表"'>disabled="disabled" onclick="return false;"</s:if>>查看</a>
							</li>
						</ul>
					</li>							
                    <li <s:if test='#session.status!="高水平运动员初审通过"&&#session.status!="高水平运动员初审不通过"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">5</li>
							<li class="txt">
								<h3>查看高水平运动员申请的初审结果</h3>
							</li>
							<li class="btn">
								<a href="getAthleteTrial" class="linkbtn btnred"  <s:if test='#session.status!="高水平运动员初审通过"&&#session.status!="高水平运动员初审不通过"'>disabled="disabled" onclick="return false;"</s:if>>查看初审结果</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="高水平运动员初审通过"||#session.athleteAdmission!="是"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">6</li>
							<li class="txt"><h3>打印准考证</h3></li>
							<li class="btn">
								<a href="printAthleteAdmission" class="linkbtn btnred" target="_blank" <s:if test='#session.status!="高水平运动员初审通过"||#session.athleteAdmission!="是"'>disabled="disabled" onclick="return false;"</s:if>>打印准考证</a>
							</li>
						</ul>
					</li>
					<li <s:if test='#session.status!="考核通过"&&#session.status!="考核不通过"'>class="noactived"</s:if>>
						<ul class="clearfix">
							<li class="num">7</li>
							<li class="txt"><h3>查询考核结果	</h3></li>
							<li class="btn"><a href="${pageContext.request.contextPath}/user/GetAthleteGrade" class="linkbtn btnred" <s:if test='#session.status!="考核通过"&&#session.status!="考核不通过"'>disabled="disabled" onclick="return false;"</s:if>>查询考核结果	</a>
							</li>
						</ul>
					</li>
                </ul>
			</div>
        </div>
    </div>
