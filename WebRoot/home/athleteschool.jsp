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
		           <div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">���� &gt; �����ˮƽ�˶�Ա &gt; <span style="font-size:24px;">������д</span></div>
      <div class="tablestep tablestepcolor_4">
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
  var highschool=window.document.tygspForm.highschool.value; 
  var highlink=window.document.tygspForm.highlink.value; 
  var highdepartment=window.document.tygspForm.highdepartment.value; 
  var highlinktel=window.document.tygspForm.highlinktel.value;  
  var highaddress=window.document.tygspForm.highaddress.value;
  var highpost=window.document.tygspForm.highpost.value; 
  var highbegin=window.document.tygspForm.highbegin.value; 
  var highend=window.document.tygspForm.highend.value; 
  var midschool=window.document.tygspForm.midschool.value;  
  var midlink=window.document.tygspForm.midlink.value; 
  var midbegin=window.document.tygspForm.midbegin.value;  
  var midend=window.document.tygspForm.midend.value;     
  if(highschool==""||highschool==null){
    alert("���в���Ϊ�գ�");
    tygspForm.highschool.focus();
    return;
  }
  if(highlink==""||highlink==null){
    alert("������ϵ����������Ϊ�գ�");
    tygspForm.highlink.focus();
    return;
  }
  if(highdepartment==""||highdepartment==null){
    alert("������ϵ�˵�λ����Ϊ�գ�");
    tygspForm.highdepartment.focus();
    return;
  }
  if(highlinktel==""||highlinktel==null){
    alert("������ϵ�˵绰����Ϊ�գ�");
    tygspForm.highlinktel.focus();
    return;
  }
  if(highaddress==""||highaddress==null){
    alert("���е�ַ����Ϊ�գ�");
    tygspForm.highaddress.focus();
    return;
  }
  if(highpost==""||highpost==null){
    alert("�����ʱ಻��Ϊ�գ�");
    tygspForm.highpost.focus();
    return;
  }
  if(highbegin==""||highbegin==null){
    alert("������ʼʱ�䲻��Ϊ�գ�");
    tygspForm.highbegin.focus();
    return;
  }
  if(highend==""||highend==null){
    alert("������ֹʱ�䲻��Ϊ�գ�");
    tygspForm.highend.focus();
    return;
  }
  if(midschool==""||midschool==null){
    alert("���в���Ϊ�գ�");
    tygspForm.midschool.focus();
    return;
  }
  if(midlink==""||midlink==null){
    alert("������ϵ�˲���Ϊ�գ�");
    tygspForm.midlink.focus();
    return;
  }
  if(midbegin==""||midbegin==null){
    alert("������ʼʱ�䲻��Ϊ�գ�");
    tygspForm.midbegin.focus();
    return;
  }
  if(midend==""||midend==null){
    alert("���н���ʱ�䲻��Ϊ�գ�");
    tygspForm.midend.focus();
    return;
  }
  tygspForm.submit();
}
</script>


<ul>
    <s:if test="#request.username==null"><li class="error"></s:if><s:else><li class="correct"></s:else>
	<s:if test="#request.username==null"><span>δ��д����</span></s:if>		
	<a href="getAthlete"></a>
	</li>
	<s:if test="#request.mobile==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.mobile==null"><span>δ��д����</span></s:if>		
	<a href="getAthleteContact"></a>
	</li>
	<s:if test="#request.firstrelation==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.firstrelation==null"><span>δ��д����</span></s:if>	
	<a href="getAthleteRelation"></a>
	</li>
	<s:if test="#request.highschool==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.highschool==null"><span>δ��д����</span></s:if>	
	<a href="#"></a>
	</li>
	<s:if test="#request.project==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.project==null"><span>δ��д����</span></s:if>	
	<a href="getAthleteSpecialty"></a>
	</li>
	<s:if test="#request.height==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.height==null"><span>δ��д����</span></s:if>	
	<a href="getAthleteAppend"></a>
	</li>
</ul>

      </div>
      <div class="tips" style="color:#da4837;"><span>��ʾ: ��ʶ'(*)'��Ϊͬѧ����д������Ϣ�ı������д������������沢��������ť�Ա�����д����Ϣ��</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subAthleteSchool">
		    <div class="tablesection">
            	<h2>ѧϰ����</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">���� <span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="highschool" value="${request.highschool}" class="inp" maxlength="120"/> 
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">������ϵ��<span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="highlink" value="${request.highlink}" class="inp" maxlength="12"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">������ϵ�˲���<span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="highdepartment" value="${request.highdepartment}" class="inp" maxlength="120"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">������ϵ�˵绰 <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="highlinktel" type="text" class="inp" value="${request.hightel}" maxlength="30" />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">���е�ַ <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="highaddress" type="text" class="inp" value="${request.highaddress}" maxlength="160"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">�����ʱ� <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="highpost" type="text" class="inp" value="${request.highpost}" maxlength="6"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">������ʼʱ�� <span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="highbegin" class="inp" value="${request.highbegin}" class="inp" maxlength="12" onclick=SelectDate(this) /> 
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">���н���ʱ��<span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="highend" value="${request.highend}" class="inp" maxlength="12" onclick=SelectDate(this) />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">����<span class="note">(*)</span></div>
                        <div class="form">
                            <input name="midschool" type="text" class="inp" value="${request.midschool}" maxlength="300" />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">������ϵ�� <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="midlink" type="text" class="inp" value="${request.midlink}" maxlength="16"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">������ʼʱ��<span class="note">(*)</span></div>
                        <div class="form">
                            <input name="midbegin" type="text" class="inp" value="${request.midbegin}" maxlength="16" onclick=SelectDate(this) />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">���н���ʱ��<span class="note">(*)</span></div>
                        <div class="form">
                            <input name="midend" type="text" class="inp" value="${request.midend}" maxlength="16" onclick=SelectDate(this) />
                        </div>
                    </div>
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
                         <a href="getAthleteRelation" class="linkbtn">&laquo; ��һ��</a>&nbsp;&nbsp;
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