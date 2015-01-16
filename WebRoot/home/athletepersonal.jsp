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
      <div class="tablestep tablestepcolor_1">
        <script language="javaScript"> 
function confm(url){
document.tygspForm.add.value="ksjbxxfirst";
document.tygspForm.submit();
}
function checkNumber(){	
  var name=window.document.tygspForm.xm.value;  
  if(name==null||name==""){
    alert("��������Ϊ�գ�");
    tygspForm.xm.focus();
    return;
  }
  tygspForm.submit();
}
</script>
<ul>
    <s:if test="#request.username==null"><li class="error"></s:if><s:else><li class="correct"></s:else>
	<s:if test="#request.username==null"><span>δ��д����</span></s:if>		
	<a href="#"></a>
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
          <form name="tygspForm" method="post" id="sqForm" action="subAthletePersonal">
	          <div class="tablesection">
            	<h2>������Ϣ</h2>
                <div class="fixedwide">
                <div class="item clearfix">
                	<div class="txt">���� <span class="note">(*)</span></div>
                    <div class="form"><input type="text" name="xm" value="${request.username}"  class="inp" />
                    
                    	<div class="info">ֻ�ܰ������ֻ�Ӣ����ĸ</div>
                    </div>
                </div>
                <div class="item clearfix">
                	<div class="txt">�Ա� <span class="note">(*)</span></div>
                    <div class="form">
                        <select name="xbm" >
                             <option value="��" <s:if test='#request.sex=="��"'>selected=selected</s:if>>��</option>
							 <option value="Ů" <s:if test='#request.sex=="Ů"'>selected=selected</s:if>>Ů</option>
						</select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
  <div class="item clearfix">
    <div class="txt">���� <span class="note">(*)</span></div>
      <div class="form">
        <select size="1" name="mzm" >
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="�ɹ���" <s:if test='#request.nation=="�ɹ���"'>selected=selected</s:if>>�ɹ���</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="ά�����" <s:if test='#request.nation=="ά�����"'>selected=selected</s:if>>ά�����</option>		
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>	
		<option value="׳��" <s:if test='#request.nation=="׳��"'>selected=selected</s:if>>׳��</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>	
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>
		<option value="��������" <s:if test='#request.nation=="��������"'>selected=selected</s:if>>��������</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>	
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>
		<option value="���" <s:if test='#request.nation=="���"'>selected=selected</s:if>>���</option>
		<option value="��ɽ��" <s:if test='#request.nation=="��ɽ��"'>selected=selected</s:if>>��ɽ��</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>
		<option value="ˮ��" <s:if test='#request.nation=="ˮ��"'>selected=selected</s:if>>ˮ��</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>		
		<option value="�¶�������" <s:if test='#request.nation=="�¶�������"'>selected=selected</s:if>>�¶�������</option>		
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>	
		<option value="���Ӷ���" <s:if test='#request.nation=="���Ӷ���"'>selected=selected</s:if>>���Ӷ���</option>
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>		
		<option value="Ǽ��" <s:if test='#request.nation=="Ǽ��"'>selected=selected</s:if>>Ǽ��</option>		
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="ë����" <s:if test='#request.nation=="ë����"'>selected=selected</s:if>>ë����</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>	
		<option value="��������" <s:if test='#request.nation=="��������"'>selected=selected</s:if>>��������</option>		
	    <option value="ŭ��" <s:if test='#request.nation=="ŭ��"'>selected=selected</s:if>>ŭ��</option>		
		<option value="���α����" <s:if test='#request.nation=="���α����"'>selected=selected</s:if>>���α����</option>		
		<option value="����˹��" <s:if test='#request.nation=="����˹��"'>selected=selected</s:if>>����˹��</option>			
		<option value="���¿���" <s:if test='#request.nation=="���¿���"'>selected=selected</s:if>>���¿���</option>			
		<option value="�°���" <s:if test='#request.nation=="�°���"'>selected=selected</s:if>>�°���</option>		
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="ԣ����" <s:if test='#request.nation=="ԣ����"'>selected=selected</s:if>>ԣ����</option>			
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>		
		<option value="��������" <s:if test='#request.nation=="��������"'>selected=selected</s:if>>��������</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="���״���" <s:if test='#request.nation=="���״���"'>selected=selected</s:if>>���״���</option>			
		<option value="������" <s:if test='#request.nation=="������"'>selected=selected</s:if>>������</option>			
		<option value="�Ű���" <s:if test='#request.nation=="�Ű���"'>selected=selected</s:if>>�Ű���</option>			
		<option value="�����" <s:if test='#request.nation=="�����"'>selected=selected</s:if>>�����</option>			
		<option value="��ŵ��" <s:if test='#request.nation=="��ŵ��"'>selected=selected</s:if>>��ŵ��</option>			
		<option value="����" <s:if test='#request.nation=="����"'>selected=selected</s:if>>����</option>			
		<option value="���Ѫͳ" <s:if test='#request.nation=="���Ѫͳ"'>selected=selected</s:if>>���Ѫͳ</option>			
		<option value="��ѧ��" <s:if test='#request.nation=="��ѧ��"'>selected=selected</s:if>>��ѧ��</option>	
	  </select>
      <div class="info">&nbsp;</div>
    </div>
  </div>
  <div class="item clearfix">
    <div class="txt">�߿����� <span class="note">(*)</span></div>
    <div class="form">
      <select size="1" name="ssm">
        <option value="������" <s:if test='#request.province=="������"'>selected=selected</s:if>>������</option>
		<option value="�����" <s:if test='#request.province=="�����"'>selected=selected</s:if>>�����</option>		
		<option value="�ӱ�ʡ" <s:if test='#request.province=="�ӱ�ʡ"'>selected=selected</s:if>>�ӱ�ʡ</option>		
		<option value="ɽ��ʡ" <s:if test='#request.province=="ɽ��ʡ"'>selected=selected</s:if>>ɽ��ʡ</option>			
		<option value="���ɹ���" <s:if test='#request.province=="���ɹ���"'>selected=selected</s:if>>���ɹ���</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="������ʡ" <s:if test='#request.province=="������ʡ"'>selected=selected</s:if>>������ʡ</option>			
		<option value="�Ϻ���" <s:if test='#request.province=="�Ϻ���"'>selected=selected</s:if>>�Ϻ���</option>		
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="�㽭ʡ" <s:if test='#request.province=="�㽭ʡ"'>selected=selected</s:if>>�㽭ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="ɽ��ʡ" <s:if test='#request.province=="ɽ��ʡ"'>selected=selected</s:if>>ɽ��ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="�㶫ʡ" <s:if test='#request.province=="�㶫ʡ"'>selected=selected</s:if>>�㶫ʡ</option>			
		<option value="������" <s:if test='#request.province=="������"'>selected=selected</s:if>>������</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="������" <s:if test='#request.province=="������"'>selected=selected</s:if>>������</option>		
		<option value="�Ĵ�ʡ" <s:if test='#request.province=="�Ĵ�ʡ"'>selected=selected</s:if>>�Ĵ�ʡ</option>		
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="������" <s:if test='#request.province=="������"'>selected=selected</s:if>>������</option>		
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>			
		<option value="����ʡ" <s:if test='#request.province=="����ʡ"'>selected=selected</s:if>>����ʡ</option>		
		<option value="�ຣʡ" <s:if test='#request.province=="�ຣʡ"'>selected=selected</s:if>>�ຣʡ</option>		
		<option value="������" <s:if test='#request.province=="������"'>selected=selected</s:if>>������</option>		
		<option value="�½���" <s:if test='#request.province=="�½���"'>selected=selected</s:if>>�½���</option>		
		<option value="̨��ʡ" <s:if test='#request.province=="̨��ʡ"'>selected=selected</s:if>>̨��ʡ</option>
		<option value="����ر�������" <s:if test='#request.province=="����ر�������"'>selected=selected</s:if>>����ر�������</option>
		<option value="�����ر�������" <s:if test='#request.province=="�����ر�������"'>selected=selected</s:if>>�����ر�������</option>
	  </select>
      <div class="info">&nbsp;</div>
    </div>
  </div>
                <div class="line"></div>
                <div class="item clearfix">
                	<div class="txt">�������� <span class="note">(*)</span></div>
                    <div class="form">
                        <input type="text" name="csrq" value="${request.birthday}" class="inp"  onclick=SelectDate(this)>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
                 <div class="line"></div>
  <div class="item clearfix">
    <div class="txt">������ò <span class="note">(*)</span></div>
      <div class="form">
        <select id="zzmm" size="1" name="zzmmm">
		  <option value="����" <s:if test='#request.politic=="����"'>selected=selected</s:if>>����</option>
		  <option value="�й���Ա" <s:if test='#request.politic=="�й���Ա"'>selected=selected</s:if>>�й���Ա</option>
		  <option value="�й�Ԥ����Ա" <s:if test='#request.politic=="�й�Ԥ����Ա"'>selected=selected</s:if>>�й�Ԥ����Ա</option>	
		  <option value="������Ա" <s:if test='#request.politic=="������Ա'>selected=selected</s:if>>������Ա</option>
		  <option value="Ⱥ��" <s:if test='#request.politic=="Ⱥ��"'>selected=selected</s:if>>Ⱥ��</option>
		</select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
                <div class="item clearfix">
                	<div class="txt">�߿�������</div>
                    <div class="form">
                        <input type="text" name="language" value="${request.entranceno}" class="inp">
                    </div>
                </div>
   <div class="item clearfix">
     <div class="txt">������� <span class="note">(*)</span></div>
       <div class="form">
         <select size="1" name="kslbm">
		   <option value="����Ӧ��" <s:if test='#request.isyingjie=="����Ӧ��"'>selected=selected</s:if>>����Ӧ��</option>
		   <option value="ũ��Ӧ��" <s:if test='#request.isyingjie=="ũ��Ӧ��"'>selected=selected</s:if>>ũ��Ӧ��</option>
		   <option value="��������" <s:if test='#request.isyingjie=="��������"'>selected=selected</s:if>>��������</option>
		   <option value="ũ������" <s:if test='#request.isyingjie=="ũ������"'>selected=selected</s:if>>>ũ������</option>
		 </select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
  <div class="item clearfix">
    <div class="txt">ѧ����� <span class="note">(*)</span></div>
    <div class="form">	
      <select size="1" name="xklb">
	    <option value="�Ŀ�" <s:if test='#request.subject=="�Ŀ�"'>selected=selected</s:if>>�Ŀ�</option>
		<option value="���" <s:if test='#request.subject=="���"'>selected=selected</s:if>>���</option>
	  </select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
                 <div class="line"></div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                    <div class="leftbtn">
                         <!--  <a href="#" class="linkbtn btnred" onclick="zancun();">���沢����  &raquo;</a>  -->
                    	<a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="���沢����  &raquo;" name="" onClick="checkNumber();"></a>
                    </div>
                </div>
            </div>
            </div>
        </form>
      </div>
      </div>
      </div>
