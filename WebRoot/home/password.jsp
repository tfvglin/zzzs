<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/homeindex.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/s-1_new.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/caChecker1.0.3.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ymPrompt.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
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
                var oldpassword=document.tygspForm.oldpassword.value;
                var password=document.tygspForm.password.value; 
                var confirmpassword=document.tygspForm.confirmpassword.value;      
                if(oldpassword==null||oldpassword==""){
                    alert("���������ľ����룡");
                    return;
                }
                if(password==null||password==""){
                    alert("���������������룡");
                    return;
                }
                if(password!=confirmpassword){
                    alert("��������ȷ�����벻����");
                    return;
                }
                tygspForm.submit();
            }
</script>
<div class="maincolumn">
    <div class="mainwrap">
	    <div class="navtitle yahei">�޸�����</div>
      <div class="tips">��ǰ��¼�û���${session.email}<br/></div>
      <div class="nofixedwide">
          <s:if test="tip!=null">
                      <div class="error">
	                    <s:property value="tip"/>
                      </div>
                    </s:if>
                    <s:actionerror cssClass="error"/>
          <form name="tygspForm" method="post" id="sqForm" action="changePassword">
		      <div class="tablesection">
            	<h2>�û���</h2>
                <div class="fixedwide">
                    <div class="item clearfix">
                        <div class="txt">������<span class="note">(*)</span></div>
                        <div class="form">
						    <input type="password" name="oldpassword" class="inp" />
						</div>
                    </div> 
                    <div class="item clearfix">
                        <div class="txt">������<span class="note">(*)</span></div>
                        <div class="form">
						    <input type="password" name="password" class="inp" />
						</div>
                    </div>
                    <div class="item clearfix">
                        <div class="txt">ȷ��������<span class="note">(*)</span></div>
                        <div class="form">
						    <input type="password" name="confirmpassword" class="inp" />
						</div>
                    </div>                 
                </div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                	 <div class="leftbtn">
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
	
		<script type="text/javascript">		
		//oForm = document.getElementById('sqForm');
		//oForm.m.value = 'saveAdd';
		
		
	</script>