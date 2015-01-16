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
    <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">报名 &gt; 申请高水平运动员 &gt; <span style="font-size:24px;">表格填写</span></div>
      <div class="tablestep tablestepcolor_3">
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
  var firstrelation=window.document.tygspForm.firstrelation.value; 
  var firstname=window.document.tygspForm.firstname.value; 
  var firstunit=window.document.tygspForm.firstunit.value; 
  var firstedu=window.document.tygspForm.firstedu.value;  
  var firsttel=window.document.tygspForm.firsttel.value;   
  if(firstrelation==""||firstrelation==null){
    alert("第一联系人关系不能为空！");
    tygspForm.firstrelation.focus();
    return;
  }
  if(firstname==""||firstname==null){
    alert("第一联系人姓名不能为空！");
    tygspForm.firstname.focus();
    return;
  }
  if(firstunit==""||firstunit==null){
    alert("第一联系人单位不能为空！");
    tygspForm.firstunit.focus();
    return;
  }
  if(firstedu==""||firstedu==null){
    alert("第一联系人学历不能为空！");
    tygspForm.firstedu.focus();
    return;
  }
  if(firsttel==""||firsttel==null){
    alert("第一联系人电话不能为空！");
    tygspForm.firsttel.focus();
    return;
  }
  tygspForm.submit();
}
</script>


<ul>
    <s:if test="#request.username==null"><li class="error"></s:if><s:else><li class="correct"></s:else>
	<s:if test="#request.username==null"><span>未填写完整</span></s:if>		
	<a href="getAthlete"></a>
	</li>
	<s:if test="#request.mobile==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.mobile==null"><span>未填写完整</span></s:if>		
	<a href="getAthleteContact"></a>
	</li>
	<s:if test="#request.firstrelation==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.firstrelation==null"><span>未填写完整</span></s:if>	
	<a href="#"></a>
	</li>
	<s:if test="#request.highschool==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.highschool==null"><span>未填写完整</span></s:if>	
	<a href="getAthleteSchool"></a>
	</li>
	<s:if test="#request.project==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.project==null"><span>未填写完整</span></s:if>	
	<a href="getAthleteSpecialty"></a>
	</li>
	<s:if test="#request.height==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.height==null"><span>未填写完整</span></s:if>	
	<a href="getAthleteAppend"></a>
	</li>
</ul>

      </div>
      <div class="tips"><span style="color:#da4837;">提示: 标识'(*)'的为同学在填写基本信息的必填项。填写完成请点击“保存并继续”按钮以保存填写的信息。</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subAthleteRelation">
		      <div class="tablesection">
            	<h2>家庭情况</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">第一联系人关系 <span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="firstrelation" value="${request.firstrelation}" class="inp" maxlength="12"/> 
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第一联系人姓名<span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="firstname" value="${request.firstname}" class="inp" maxlength="12"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第一联系人单位 <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="firstunit" type="text" class="inp" value="${request.firstunit}" maxlength="300" />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第一联系人学历 <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="firstedu" type="text" class="inp" value="${request.firstedu}" maxlength="16"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第一联系人电话 <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="firsttel" type="text" class="inp" value="${request.firsttel}" maxlength="16"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第二联系人关系 <span class="note"></span></div>
                        <div class="form">
                            <input  type="text" name="secondrelation" value="${request.secondrelation}" class="inp" maxlength="12"/> 
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第二联系人姓名<span class="note"></span></div>
                        <div class="form">
                            <input  type="text" name="secondname" value="${request.secondname}" class="inp" maxlength="12"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第二联系人单位 <span class="note"></span></div>
                        <div class="form">
                            <input name="secondunit" type="text" class="inp" value="${request.secondunit}" maxlength="300" />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第二联系人学历 <span class="note"></span></div>
                        <div class="form">
                            <input name="secondedu" type="text" class="inp" value="${request.secondedu}" maxlength="16"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">第二联系人电话 <span class="note"></span></div>
                        <div class="form">
                            <input name="secondtel" type="text" class="inp" value="${request.secondtel}" maxlength="16"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
                         <a href="getAthleteContact" class="linkbtn">&laquo; 上一步</a>&nbsp;&nbsp;
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
  <!--<script type="text/javascript">		
		oForm = document.getElementById('sqForm');
		oForm.m.value = 'saveAdd';
		
		
	</script>-->
</body>
</html>
