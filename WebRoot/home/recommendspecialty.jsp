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
    <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">���� &gt; ���뱣���� &gt; <span style="font-size:24px;">�����д</span></div>
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
    alert("���ʱ�䲻��Ϊ�գ�");
    tygspForm.gettime.focus();
    return;
  }  
  tygspForm.submit();
}
</script>
<ul>
    <s:if test="#request.username==null"><li class="error"></s:if><s:else><li class="correct"></s:else>
	<s:if test="#request.username==null"><span>δ��д����</span></s:if>		
	<a href="getRecommend"></a>
	</li>
	<s:if test="#request.mobile==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.mobile==null"><span>δ��д����</span></s:if>		
	<a href="getRecommendContact"></a>
	</li>
	<s:if test="#request.firstrelation==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.firstrelation==null"><span>δ��д����</span></s:if>	
	<a href="getRecommendRelation"></a>
	</li>
	<s:if test="#request.highschool==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.highschool==null"><span>δ��д����</span></s:if>	
	<a href="getRecommendSchool"></a>
	</li>
	<s:if test="#request.specialty==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.specialty==null"><span>δ��д����</span></s:if>	
	<a href="#"></a>
	</li>
	<s:if test="#request.height==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.height==null"><span>δ��д����</span></s:if>	
	<a href="getRecommendAppend"></a>
	</li>
</ul>
      </div>
      <div class="tips" style="color:#da4837;"><span>��ʾ: ��ʶ'(*)'��Ϊͬѧ����д������Ϣ�ı������д������������沢��������ť�Ա�����д����Ϣ��</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subRecommendSpecialty">
		    <div class="tablesection">
            	<h2>רҵ־Ը</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">�˶���Ŀ<span class="note">(*)</span></div>
                        <div class="form">
                            <select name="project" >
                                <option value="������" <s:if test='#request.specialty=="������"'>selected=selected</s:if>>������</option>
								<option value="��Ӿ" <s:if test='#request.specialty=="��Ӿ"'>selected=selected</s:if>>��Ӿ</option>
							</select>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">�˶��ȼ�<span class="note">(*)</span></div>
                        <div class="form">
                            <select name="level" >
                                <option value="���ʼ��˶�����" <s:if test='#request.level=="���ʼ��˶�����"'>selected=selected</s:if>>���ʼ��˶�����</option>
							    <option value="�˶�����" <s:if test='#request.level=="�˶�����"'>selected=selected</s:if>>�˶�����</option>
							    <option value="һ���˶�Ա" <s:if test='#request.level=="һ���˶�Ա"'>selected=selected</s:if>>һ���˶�Ա</option>
								<option value="����" <s:if test='#request.level=="����"'>selected=selected</s:if>>����</option>
							</select>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">���ʱ��<span class="note">(*)</span></div>
                        <div class="form">
                            <input name="gettime" type="text" class="inp" value="${request.gettime}" maxlength="30" onclick=SelectDate(this) />
                        </div>
                    </div>                    
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
                         <a href="getRecommendSchool" class="linkbtn">&laquo; ��һ��</a>&nbsp;&nbsp;
                         <a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="���沢����  &raquo;" name="" onClick="checkNumber();"></a>
                    </div>
                    <div class="rightbtn">
                         <!-- <a href="#" class="linkbtn btnred" onclick="zancun();">���沢����  &raquo;</a> -->
                    </div>
                </div>
            </div>
        </form>
      </div>
    <script type="text/javascript" src="http://sns.join-tsinghua.edu.cn/statistics/statistics.js?domain=zsyw"></script><!-- ͳ�� add by wangxinyi 20131021 -->
 		    </div>
    
   
   
    
  </div>
</body>
</html>