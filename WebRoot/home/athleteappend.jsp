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
      <div class="tablestep tablestepcolor_6">
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
  var height=window.document.tygspForm.height.value; 
  var weight=window.document.tygspForm.weight.value;     
  if(height==""||height==null){
    alert("身高不能为空！");
    tygspForm.height.focus();
    return;
  } 
  if(weight==""||weight==null){
    alert("体重不能为空！");
    tygspForm.weight.focus();
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
	<a href="getAthleteRelation"></a>
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
	<a href="#"></a>
	</li>
</ul>
      </div>
      <div class="tips" style="color:#da4837;"><span>提示: 标识'(*)'的为同学在填写基本信息的必填项。填写完成请点击“保存并继续”按钮以保存填写的信息。</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subAthleteAppend">
		     <div class="tablesection">
            	<h2>附加信息</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">身高<span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="height" value="${request.height}" class="inp" maxlength="12"/>
                            <span>cm</span> 
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">体重<span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="weight" value="${request.weight}" class="inp" maxlength="12"/>
                            <span>kg</span>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">特长<span class="note"></span></div>
                        <div class="form">
                            <textarea 	wrap="hard" name="strength" rows="100" cols=100" type="_moz" >${request.strength}
                            </textarea>
                            <!--<div class="info"><span class="calcu">(<font color="red"><span id="sqlyCount">0</span> </font>/1500)</span></div>-->                            
                        </div>
                    </div>  
                    <div class="item clearfix">
                        <div class="txt">获奖情况<span class="note"></span></div>
                        <div class="form">
                            <textarea 	wrap="hard" name="awards" rows="100" cols=100" type="_moz" >${request.awards}
                            </textarea>
                            <!--<div class="info"><span class="calcu">(<font color="red"><span id="awardsCount">0</span> </font>/1500)</span></div>-->                            
                        </div>
                    </div>                  
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
                         <a href="getAthleteSpecialty" class="linkbtn">&laquo; 上一步</a>&nbsp;&nbsp;
                         <a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="保存并继续  &raquo;" name="" onClick="checkNumber();"></a>
                     </div>
                     <div class="rightbtn">
                         <!-- <a href="#" class="linkbtn btnred" onclick="zancun();">保存并继续  &raquo;</a> -->
                    </div>
                </div>
            </div>
        </form>
      </div>
  </div>
</div>