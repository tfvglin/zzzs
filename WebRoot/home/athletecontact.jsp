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
	<div class="navtitle yahei" style="font-size:16px;text-indent:10px;border-bottom:1px solid #ddd;line-height:65px;">���� &gt; �����ˮƽ�˶�Ա &gt; <span style="font-size:24px;">�����д</span></div>
      <div class="tablestep tablestepcolor_2">
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
  var mobile=window.document.tygspForm.sjhm.value; 
  var tel=window.document.tygspForm.jtdh.value; 
  var address=window.document.tygspForm.txdz.value; 
  var post=window.document.tygspForm.yzbm.value;   
  if(isNaN(mobile)||mobile==""){
    alert("�����ֻ��������Ϊ���֣�");
    tygspForm.sjhm.focus();
    return;
  }
  if(tel==""||tel==null){
    alert("��ͥ�绰����Ϊ�գ�");
    tygspForm.jtdh.focus();
    return;
  }
  if(address==""||address==null){
    alert("��ͥ��ַ����Ϊ�գ�");
    tygspForm.txdz.focus();
    return;
  }
  if(!checkLength(post,6,6)||isNaN(post)){
    alert("��������ȷ���������룡");
    tygspForm.yzbm.focus();
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
	<a href="#"></a>
	</li>
	<s:if test="#request.firstrelation==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.firstrelation==null"><span>δ��д����</span></s:if>	
	<a href="getAthleteRelation"></a>
	</li>
	<s:if test="#request.highschool==null"><li  class="error"></s:if><s:else><li  class="correct"></s:else>
	<s:if test="#request.highschool==null"><span>δ��д����</span></s:if>	
	<a href="getAthleteSchool"></a>
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
      <div class="tips"><span style="color:#da4837;">��ʾ: ��ʶ'(*)'��Ϊͬѧ����д������Ϣ�ı������д������������沢��������ť�Ա�����д����Ϣ��</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subAthleteContact">
		      <div class="tablesection">
            	<h2>��ϵ��ʽ</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">��ϵ�绰 <span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="sjhm" value="${request.mobile}" class="inp" maxlength="12"/> 
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">��ͥ�绰 <span class="note">(*)</span></div>
                        <div class="form">
                            <input  type="text" name="jtdh" value="${request.hometel}" class="inp" maxlength="12"/>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">��ͥסַ <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="txdz" type="text" class="inp" value="${request.homeaddress}" maxlength="300" />
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">��ͥ�������� <span class="note">(*)</span></div>
                        <div class="form">
                            <input name="yzbm" type="text" class="inp" value="${request.homepost}" maxlength="6"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
                         <a href="getAthlete" class="linkbtn">&laquo; ��һ��</a>&nbsp;&nbsp;
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
