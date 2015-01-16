<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/homeindex.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/s-1_new.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/caChecker1.0.3.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ymPrompt.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
<div>
  <div class="mainwrap">
    <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">报名 &gt; 申请保送生 &gt; <span style="font-size:24px;">表格填写</span></div>
      <div class="tablestep tablestepcolor_5">
        <script language="javaScript"> 
function confm(url){
document.tygspForm.add.value="ksjbxxfirst";
document.tygspForm.submit();
}
function checkLength(value, min,max){
    if(value.length>=min&&value.length<=max) return true;
    else   return false;
}
function checkNumber(){	
  var gettime=window.document.tygspForm.gettime.value;      
  if(gettime==""||gettime==null){
    alert("获得时间不能为空！");
    tygspForm.gettime.focus();
    return;
  }  
  tygspForm.submit();
}
</script>
<ul>
    <s:if test="#request.username==null"><li class="error"></s:if><s:else><li class="correct"></s:else>
	<s:if test="#request.username==null"><span>未填写完整</span></s:if>		
	<a href="getRecommend"></a>
	</li>
	<s:if test="#request.mobile==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.mobile==null"><span>未填写完整</span></s:if>		
	<a href="getRecommendContact"></a>
	</li>
	<s:if test="#request.firstrelation==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.firstrelation==null"><span>未填写完整</span></s:if>	
	<a href="getRecommendRelation"></a>
	</li>
	<s:if test="#request.highschool==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.highschool==null"><span>未填写完整</span></s:if>	
	<a href="getRecommendSchool"></a>
	</li>
	<s:if test="#request.specialty==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.specialty==null"><span>未填写完整</span></s:if>	
	<a href="#"></a>
	</li>
	<s:if test="#request.height==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.height==null"><span>未填写完整</span></s:if>	
	<a href="getRecommendAppend"></a>
	</li>
</ul>
      </div>
      <div class="tips" style="color:#da4837;"><span>提示: 标识'(*)'的为同学在填写基本信息的必填项。填写完成请点击“保存并继续”按钮以保存填写的信息。</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subRecommendSpecialty">
		    <div class="tablesection">
            	<h2>专业志愿</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">运动项目<span class="note">(*)</span></div>
                        <div class="form">
                            <select name="project" >
                                <option value="健美操" <s:if test='#request.specialty=="健美操"'>selected=selected</s:if>>健美操</option>
								<option value="游泳" <s:if test='#request.specialty=="游泳"'>selected=selected</s:if>>游泳</option>
							</select>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">运动等级<span class="note">(*)</span></div>
                        <div class="form">
                            <select name="level" >
                                <option value="国际级运动健将" <s:if test='#request.level=="国际级运动健将"'>selected=selected</s:if>>国际级运动健将</option>
							    <option value="运动健将" <s:if test='#request.level=="运动健将"'>selected=selected</s:if>>运动健将</option>
							    <option value="一级运动员" <s:if test='#request.level=="一级运动员"'>selected=selected</s:if>>一级运动员</option>
								<option value="其他" <s:if test='#request.level=="其他"'>selected=selected</s:if>>其他</option>
							</select>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">获得时间<span class="note">(*)</span></div>
                        <div class="form">
                            <input name="gettime" type="text" class="inp" value="${request.gettime}" maxlength="30" onclick=SelectDate(this) />
                        </div>
                    </div>                    
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
                         <a href="getRecommendSchool" class="linkbtn">&laquo; 上一步</a>&nbsp;&nbsp;
                         <a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="保存并继续  &raquo;" name="" onClick="checkNumber();"></a>
                    </div>
                    <div class="rightbtn">
                         <!-- <a href="#" class="linkbtn btnred" onclick="zancun();">保存并继续  &raquo;</a> -->
                    </div>
                </div>
            </div>
        </form>
      </div>
    <script type="text/javascript" src="http://sns.join-tsinghua.edu.cn/statistics/statistics.js?domain=zsyw"></script><!-- 统计 add by wangxinyi 20131021 -->
 		    </div>
    
   
   
    
  </div>
</body>
</html>