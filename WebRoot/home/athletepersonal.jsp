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
      <div class="tablestep tablestepcolor_1">
        <script language="javaScript"> 
function confm(url){
document.tygspForm.add.value="ksjbxxfirst";
document.tygspForm.submit();
}
function checkNumber(){	
  var name=window.document.tygspForm.xm.value;  
  if(name==null||name==""){
    alert("姓名不能为空！");
    tygspForm.xm.focus();
    return;
  }
  tygspForm.submit();
}
</script>
<ul>
    <s:if test="#request.username==null"><li class="error"></s:if><s:else><li class="correct"></s:else>
	<s:if test="#request.username==null"><span>未填写完整</span></s:if>		
	<a href="#"></a>
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
	<a href="getAthleteAppend"></a>
	</li>
</ul>

      </div>
      <div class="tips"><span style="color:#da4837;">提示: 标识'(*)'的为同学在填写基本信息的必填项。填写完成请点击“保存并继续”按钮以保存填写的信息。</span></div>
      <div class="nofixedwide">
          <form name="tygspForm" method="post" id="sqForm" action="subAthletePersonal">
	          <div class="tablesection">
            	<h2>个人信息</h2>
                <div class="fixedwide">
                <div class="item clearfix">
                	<div class="txt">姓名 <span class="note">(*)</span></div>
                    <div class="form"><input type="text" name="xm" value="${request.username}"  class="inp" />
                    
                    	<div class="info">只能包含汉字或英文字母</div>
                    </div>
                </div>
                <div class="item clearfix">
                	<div class="txt">性别 <span class="note">(*)</span></div>
                    <div class="form">
                        <select name="xbm" >
                             <option value="男" <s:if test='#request.sex=="男"'>selected=selected</s:if>>男</option>
							 <option value="女" <s:if test='#request.sex=="女"'>selected=selected</s:if>>女</option>
						</select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
  <div class="item clearfix">
    <div class="txt">民族 <span class="note">(*)</span></div>
      <div class="form">
        <select size="1" name="mzm" >
		<option value="汉族" <s:if test='#request.nation=="汉族"'>selected=selected</s:if>>汉族</option>
		<option value="蒙古族" <s:if test='#request.nation=="蒙古族"'>selected=selected</s:if>>蒙古族</option>
		<option value="回族" <s:if test='#request.nation=="回族"'>selected=selected</s:if>>回族</option>
		<option value="藏族" <s:if test='#request.nation=="藏族"'>selected=selected</s:if>>藏族</option>
		<option value="维吾尔族" <s:if test='#request.nation=="维吾尔族"'>selected=selected</s:if>>维吾尔族</option>		
		<option value="苗族" <s:if test='#request.nation=="苗族"'>selected=selected</s:if>>苗族</option>
		<option value="彝族" <s:if test='#request.nation=="彝族"'>selected=selected</s:if>>彝族</option>	
		<option value="壮族" <s:if test='#request.nation=="壮族"'>selected=selected</s:if>>壮族</option>
		<option value="布依族" <s:if test='#request.nation=="布依族"'>selected=selected</s:if>>布依族</option>
		<option value="朝鲜族" <s:if test='#request.nation=="朝鲜族"'>selected=selected</s:if>>朝鲜族</option>
		<option value="满族" <s:if test='#request.nation=="满族"'>selected=selected</s:if>>满族</option>
		<option value="侗族" <s:if test='#request.nation=="侗族"'>selected=selected</s:if>>侗族</option>
		<option value="瑶族" <s:if test='#request.nation=="瑶族"'>selected=selected</s:if>>瑶族</option>
		<option value="白族" <s:if test='#request.nation=="白族"'>selected=selected</s:if>>白族</option>	
		<option value="土家族" <s:if test='#request.nation=="土家族"'>selected=selected</s:if>>土家族</option>
		<option value="哈尼族" <s:if test='#request.nation=="哈尼族"'>selected=selected</s:if>>哈尼族</option>
		<option value="哈萨克族" <s:if test='#request.nation=="哈萨克族"'>selected=selected</s:if>>哈萨克族</option>
		<option value="傣族" <s:if test='#request.nation=="傣族"'>selected=selected</s:if>>傣族</option>
		<option value="黎族" <s:if test='#request.nation=="黎族"'>selected=selected</s:if>>黎族</option>
		<option value="傈僳族" <s:if test='#request.nation=="傈僳族"'>selected=selected</s:if>>傈僳族</option>	
		<option value="佤族" <s:if test='#request.nation=="佤族"'>selected=selected</s:if>>佤族</option>
		<option value="畲族" <s:if test='#request.nation=="畲族"'>selected=selected</s:if>>畲族</option>
		<option value="高山族" <s:if test='#request.nation=="高山族"'>selected=selected</s:if>>高山族</option>
		<option value="拉祜族" <s:if test='#request.nation=="拉祜族"'>selected=selected</s:if>>拉祜族</option>
		<option value="水族" <s:if test='#request.nation=="水族"'>selected=selected</s:if>>水族</option>
		<option value="东乡族" <s:if test='#request.nation=="东乡族"'>selected=selected</s:if>>东乡族</option>			
		<option value="纳西族" <s:if test='#request.nation=="纳西族"'>selected=selected</s:if>>纳西族</option>			
		<option value="景颇族" <s:if test='#request.nation=="景颇族"'>selected=selected</s:if>>景颇族</option>		
		<option value="柯尔克孜族" <s:if test='#request.nation=="柯尔克孜族"'>selected=selected</s:if>>柯尔克孜族</option>		
		<option value="土族" <s:if test='#request.nation=="土族"'>selected=selected</s:if>>土族</option>	
		<option value="达斡尔族" <s:if test='#request.nation=="达斡尔族"'>selected=selected</s:if>>达斡尔族</option>
		<option value="仫佬族" <s:if test='#request.nation=="仫佬族"'>selected=selected</s:if>>仫佬族</option>		
		<option value="羌族" <s:if test='#request.nation=="羌族"'>selected=selected</s:if>>羌族</option>		
		<option value="布朗族" <s:if test='#request.nation=="布朗族"'>selected=selected</s:if>>布朗族</option>			
		<option value="撒拉族" <s:if test='#request.nation=="撒拉族"'>selected=selected</s:if>>撒拉族</option>			
		<option value="毛难族" <s:if test='#request.nation=="毛难族"'>selected=selected</s:if>>毛难族</option>			
		<option value="仡佬族" <s:if test='#request.nation=="仡佬族"'>selected=selected</s:if>>仡佬族</option>			
		<option value="锡伯族" <s:if test='#request.nation=="锡伯族"'>selected=selected</s:if>>锡伯族</option>			
		<option value="阿昌族" <s:if test='#request.nation=="阿昌族"'>selected=selected</s:if>>阿昌族</option>			
		<option value="普米族" <s:if test='#request.nation=="普米族"'>selected=selected</s:if>>普米族</option>	
		<option value="塔吉克族" <s:if test='#request.nation=="塔吉克族"'>selected=selected</s:if>>塔吉克族</option>		
	    <option value="怒族" <s:if test='#request.nation=="怒族"'>selected=selected</s:if>>怒族</option>		
		<option value="乌孜别克族" <s:if test='#request.nation=="乌孜别克族"'>selected=selected</s:if>>乌孜别克族</option>		
		<option value="俄罗斯族" <s:if test='#request.nation=="俄罗斯族"'>selected=selected</s:if>>俄罗斯族</option>			
		<option value="鄂温克族" <s:if test='#request.nation=="鄂温克族"'>selected=selected</s:if>>鄂温克族</option>			
		<option value="德昂族" <s:if test='#request.nation=="德昂族"'>selected=selected</s:if>>德昂族</option>		
		<option value="保安族" <s:if test='#request.nation=="保安族"'>selected=selected</s:if>>保安族</option>			
		<option value="裕固族" <s:if test='#request.nation=="裕固族"'>selected=selected</s:if>>裕固族</option>			
		<option value="京族" <s:if test='#request.nation=="京族"'>selected=selected</s:if>>京族</option>		
		<option value="塔塔尔族" <s:if test='#request.nation=="塔塔尔族"'>selected=selected</s:if>>塔塔尔族</option>			
		<option value="独龙族" <s:if test='#request.nation=="独龙族"'>selected=selected</s:if>>独龙族</option>			
		<option value="鄂伦春族" <s:if test='#request.nation=="鄂伦春族"'>selected=selected</s:if>>鄂伦春族</option>			
		<option value="赫哲族" <s:if test='#request.nation=="赫哲族"'>selected=selected</s:if>>赫哲族</option>			
		<option value="门巴族" <s:if test='#request.nation=="门巴族"'>selected=selected</s:if>>门巴族</option>			
		<option value="珞巴族" <s:if test='#request.nation=="珞巴族"'>selected=selected</s:if>>珞巴族</option>			
		<option value="基诺族" <s:if test='#request.nation=="基诺族"'>selected=selected</s:if>>基诺族</option>			
		<option value="其他" <s:if test='#request.nation=="其他"'>selected=selected</s:if>>其他</option>			
		<option value="外国血统" <s:if test='#request.nation=="外国血统"'>selected=selected</s:if>>外国血统</option>			
		<option value="留学生" <s:if test='#request.nation=="留学生"'>selected=selected</s:if>>留学生</option>	
	  </select>
      <div class="info">&nbsp;</div>
    </div>
  </div>
  <div class="item clearfix">
    <div class="txt">高考考区 <span class="note">(*)</span></div>
    <div class="form">
      <select size="1" name="ssm">
        <option value="北京市" <s:if test='#request.province=="北京市"'>selected=selected</s:if>>北京市</option>
		<option value="天津市" <s:if test='#request.province=="天津市"'>selected=selected</s:if>>天津市</option>		
		<option value="河北省" <s:if test='#request.province=="河北省"'>selected=selected</s:if>>河北省</option>		
		<option value="山西省" <s:if test='#request.province=="山西省"'>selected=selected</s:if>>山西省</option>			
		<option value="内蒙古区" <s:if test='#request.province=="内蒙古区"'>selected=selected</s:if>>内蒙古区</option>			
		<option value="辽宁省" <s:if test='#request.province=="辽宁省"'>selected=selected</s:if>>辽宁省</option>			
		<option value="吉林省" <s:if test='#request.province=="吉林省"'>selected=selected</s:if>>吉林省</option>		
		<option value="黑龙江省" <s:if test='#request.province=="黑龙江省"'>selected=selected</s:if>>黑龙江省</option>			
		<option value="上海市" <s:if test='#request.province=="上海市"'>selected=selected</s:if>>上海市</option>		
		<option value="江苏省" <s:if test='#request.province=="江苏省"'>selected=selected</s:if>>江苏省</option>			
		<option value="浙江省" <s:if test='#request.province=="浙江省"'>selected=selected</s:if>>浙江省</option>			
		<option value="安徽省" <s:if test='#request.province=="安徽省"'>selected=selected</s:if>>安徽省</option>			
		<option value="福建省" <s:if test='#request.province=="福建省"'>selected=selected</s:if>>福建省</option>			
		<option value="江西省" <s:if test='#request.province=="江西省"'>selected=selected</s:if>>江西省</option>		
		<option value="山东省" <s:if test='#request.province=="山东省"'>selected=selected</s:if>>山东省</option>			
		<option value="河南省" <s:if test='#request.province=="河南省"'>selected=selected</s:if>>河南省</option>		
		<option value="湖北省" <s:if test='#request.province=="湖北省"'>selected=selected</s:if>>湖北省</option>			
		<option value="湖南省" <s:if test='#request.province=="湖南省"'>selected=selected</s:if>>湖南省</option>		
		<option value="广东省" <s:if test='#request.province=="广东省"'>selected=selected</s:if>>广东省</option>			
		<option value="广西区" <s:if test='#request.province=="广西区"'>selected=selected</s:if>>广西区</option>			
		<option value="海南省" <s:if test='#request.province=="海南省"'>selected=selected</s:if>>海南省</option>		
		<option value="重庆市" <s:if test='#request.province=="重庆市"'>selected=selected</s:if>>重庆市</option>		
		<option value="四川省" <s:if test='#request.province=="四川省"'>selected=selected</s:if>>四川省</option>		
		<option value="贵州省" <s:if test='#request.province=="贵州省"'>selected=selected</s:if>>贵州省</option>		
		<option value="云南省" <s:if test='#request.province=="云南省"'>selected=selected</s:if>>云南省</option>			
		<option value="西藏区" <s:if test='#request.province=="西藏区"'>selected=selected</s:if>>西藏区</option>		
		<option value="陕西省" <s:if test='#request.province=="陕西省"'>selected=selected</s:if>>陕西省</option>			
		<option value="甘肃省" <s:if test='#request.province=="甘肃省"'>selected=selected</s:if>>甘肃省</option>		
		<option value="青海省" <s:if test='#request.province=="青海省"'>selected=selected</s:if>>青海省</option>		
		<option value="宁夏区" <s:if test='#request.province=="宁夏区"'>selected=selected</s:if>>宁夏区</option>		
		<option value="新疆区" <s:if test='#request.province=="新疆区"'>selected=selected</s:if>>新疆区</option>		
		<option value="台湾省" <s:if test='#request.province=="台湾省"'>selected=selected</s:if>>台湾省</option>
		<option value="香港特别行政区" <s:if test='#request.province=="香港特别行政区"'>selected=selected</s:if>>香港特别行政区</option>
		<option value="澳门特别行政区" <s:if test='#request.province=="澳门特别行政区"'>selected=selected</s:if>>澳门特别行政区</option>
	  </select>
      <div class="info">&nbsp;</div>
    </div>
  </div>
                <div class="line"></div>
                <div class="item clearfix">
                	<div class="txt">出生日期 <span class="note">(*)</span></div>
                    <div class="form">
                        <input type="text" name="csrq" value="${request.birthday}" class="inp"  onclick=SelectDate(this)>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
                 <div class="line"></div>
  <div class="item clearfix">
    <div class="txt">政治面貌 <span class="note">(*)</span></div>
      <div class="form">
        <select id="zzmm" size="1" name="zzmmm">
		  <option value="其他" <s:if test='#request.politic=="其他"'>selected=selected</s:if>>其他</option>
		  <option value="中共党员" <s:if test='#request.politic=="中共党员"'>selected=selected</s:if>>中共党员</option>
		  <option value="中共预备党员" <s:if test='#request.politic=="中共预备党员"'>selected=selected</s:if>>中共预备党员</option>	
		  <option value="共青团员" <s:if test='#request.politic=="共青团员'>selected=selected</s:if>>共青团员</option>
		  <option value="群众" <s:if test='#request.politic=="群众"'>selected=selected</s:if>>群众</option>
		</select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
                <div class="item clearfix">
                	<div class="txt">高考报名号</div>
                    <div class="form">
                        <input type="text" name="language" value="${request.entranceno}" class="inp">
                    </div>
                </div>
   <div class="item clearfix">
     <div class="txt">考生类别 <span class="note">(*)</span></div>
       <div class="form">
         <select size="1" name="kslbm">
		   <option value="城镇应届" <s:if test='#request.isyingjie=="城镇应届"'>selected=selected</s:if>>城镇应届</option>
		   <option value="农村应届" <s:if test='#request.isyingjie=="农村应届"'>selected=selected</s:if>>农村应届</option>
		   <option value="城镇往届" <s:if test='#request.isyingjie=="城镇往届"'>selected=selected</s:if>>城镇往届</option>
		   <option value="农村往届" <s:if test='#request.isyingjie=="农村往届"'>selected=selected</s:if>>>农村往届</option>
		 </select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
  <div class="item clearfix">
    <div class="txt">学科类别 <span class="note">(*)</span></div>
    <div class="form">	
      <select size="1" name="xklb">
	    <option value="文科" <s:if test='#request.subject=="文科"'>selected=selected</s:if>>文科</option>
		<option value="理科" <s:if test='#request.subject=="理科"'>selected=selected</s:if>>理科</option>
	  </select>
                     <div class="info">&nbsp;</div>
                    </div>
                </div>
                 <div class="line"></div>
            </div>
            <div class="submitsection clearfix">
                <div class="fixedwide">
                    <div class="leftbtn">
                         <!--  <a href="#" class="linkbtn btnred" onclick="zancun();">保存并继续  &raquo;</a>  -->
                    	<a href="javascript:;" class="linkbtn btnred"><input class="btninlink" type="button"  value="保存并继续  &raquo;" name="" onClick="checkNumber();"></a>
                    </div>
                </div>
            </div>
            </div>
        </form>
      </div>
      </div>
      </div>
