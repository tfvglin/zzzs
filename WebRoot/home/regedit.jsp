<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html;charset=gbk">
<title>�������ӿƼ���ѧ ������������ϵͳ</title>
<link href="css/regedit.css" rel="stylesheet" type="text/css">
<!--<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/s-1.css" rel="stylesheet" type="text/css">
<link href="../css/checkform.css" rel="stylesheet" type="text/css">
<script src="../js/caChecker1.0.3.js" type="text/javascript"></script>
<script src="../js/caChecker1.0.3.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
<link rel="stylesheet" type="text/css" href="../css/ymPrompt.css">
<script src="../js/check_regedit.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>-->
<script type="text/javascript">
function checkLength(value, min,max){
    if(value.length>=min&&value.length<=max) return true;
    else   return false;
}
function checkNumber(){	
  //var name=window.document.regForm.xm.value;
  var password=window.document.regForm.userpass.value;
  var qrmm=window.document.regForm.qrmm.value;
  var IDcard=window.document.regForm.sfzh.value;  
  var emailvalue=window.document.regForm.email.value;
  var photo=document.regForm.upfile.value;
  /*if(name==null||name==""){
    alert("��������Ϊ�գ�");
    regForm.xm.focus();
    return;
  }*/
  var temp1=emailvalue.indexOf("@");
  var temp2=emailvalue.indexOf(".");
  if(temp1<0||temp2<temp1)
  {
      alert("��������ȷ�ĵ����ʼ���");
      regForm.email.focus();
      return;
  }
  if(password==null||password==""){
    alert("���벻��Ϊ�գ�");
    regForm.userpass.focus();
    return;
  }
  if(password!=qrmm){
    alert("�����������벻ͬ��");
    regForm.qrmm.focus();
    return;
  }
  if(IDcard==null||IDcard==""){
    alert("���֤�Ų���Ϊ�գ�");
    regForm.sfzh.focus();
    return;
  }
  if (IDcard.length != 15 && IDcard.length != 18){  
    alert("�������֤�����ʽ����ȷ!");  
    regForm.sfzh.focus();
    return;  
  }
  var area={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"};   
  if(area[parseInt(IDcard.substr(0,2))]==null) {  
      alert("���֤���벻��ȷ(�����Ƿ�)!");  
      regForm.sfzh.focus();
      return;  
  }
  if(IDcard.length == 15){  
      pattern= /^\d{15}$/;  
      if (pattern.exec(IDcard)==null){  
      alert("15λ���֤�������Ϊ���֣�");
      regForm.sfzh.focus();  
      return;  
  }
  var birth = parseInt("19" + IDcard.substr(6,2));  
  var month = IDcard.substr(8,2);  
  var day = parseInt(IDcard.substr(10,2));  
  switch(month) {  
      case '01':  
      case '03':  
      case '05':  
      case '07':  
      case '08':  
      case '10':  
      case '12':  
      if(day>31){  
          alert('�������֤���벻��ʽ��ȷ!'); 
          regForm.sfzh.focus();  
          return;  
      }  
      break;  
      case '04':  
      case '06':  
      case '09':  
      case '11':  
      if(day>30){  
          alert('�������֤���벻��ʽ��ȷ!');
          regForm.sfzh.focus();  
          return;  
      }  
      break;  
      case '02':  
      if((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {  
          if(day>29) {  
              alert('�������֤���벻��ʽ��ȷ!');  
              regForm.sfzh.focus();  
              return;  
          }  
      } else {  
          if(day>28) {  
              alert('�������֤���벻��ʽ��ȷ!'); 
              regForm.sfzh.focus(); 
              return;  
          }  
      }  
      break;  
      default:  
          alert('�������֤���벻��ʽ��ȷ!');
          regForm.sfzh.focus();   
          return;  
      }  
      var nowYear = new Date().getYear();  
      if(nowYear - parseInt(birth)<15 || nowYear - parseInt(birth)>100) {  
          alert('�������֤���벻��ʽ��ȷ!');  
          regForm.sfzh.focus();  
          return;  
      }  
  }  
  var Wi = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);  
  var   lSum        = 0;  
  var   nNum        = 0;  
  var   nCheckSum   = 0;  
  for (i = 0; i < 17; ++i)  
  {  
      if ( IDcard.charAt(i) < '0' || IDcard.charAt(i) > '9' )  
      {  
          alert("�������֤�����ʽ����ȷ!");
          regForm.sfzh.focus();  
          return;  
      }  
      else  
      {  
          nNum = IDcard.charAt(i) - '0';  
      }  
      lSum += nNum * Wi[i];  
  }  
  if( IDcard.charAt(17) == 'X' || IDcard.charAt(17) == 'x')  
  {  
      lSum += 10*Wi[17];  
  }  
  else if ( IDcard.charAt(17) < '0' || IDcard.charAt(17) > '9' )  
  {  
      alert("�������֤�����ʽ����ȷ!"); 
      regForm.sfzh.focus(); 
      return;  
  }
  if(!checkLength(emailvalue,5,1000))
  {
      alert("��������ȷ�ĵ����ʼ���");
      regForm.email.focus();
      return;
  }
  
  if(photo==null||photo==""){
    alert("��ѡ�����ĵ��Ӱ�֤���գ�");
    return;
  }
  if(photo!=null&&photo!=""){
    var position=photo.indexOf(".");
    var type=photo.substr(position);
    //alert(type);
    if(type!=".jpg"&&type!=".JPG"&&type!=".jpeg"&&type!=".JPEG"&&type!=".png"&&type!=".PNG"&&type!=".gif"&&type!=".GIF")
    {
        alert("��ע�⣬�ϴ���ͼƬ����Ϊjpg��png��gif��ʽ");
        return;
    }    
  }  
  //alert("test");
  regForm.submit();
}
</script>
</head>
<body>
<%@ include file="/common/header.jsp" %>
		<div class="content">
			<div class="contentWrap">
				<div class="column_3">
					<h1>
						���û�ע��
					</h1>
					<div class="regtable">
					    <s:if test="tip!=null">
                          <div class="error">
	                        <s:property value="tip"/>
                          </div>
                        </s:if>
                        <s:actionerror cssClass="error"/>
						<form name="regForm" action="regSubmit" method="post" enctype="multipart/form-data">
					      <!--<div class="item clearfix">
								<div class="txt">
									����
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input type="text" class="inp" size="30" name="xm" maxlength="30" />
								</div>
							</div>-->
					      <div class="item clearfix">
								<div class="txt">
									�����ʼ�
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input type="text" class="inp" size="30" name="email" maxlength="30" />
									<div class="info">
										���ڵ�½�������һء�
										<span class="important"><strong>�ǳ���Ҫ������д��ʵ���䲢�μ�</strong></span>
									</div>
								</div>
							</div>
					        <div class="item clearfix">
								<div class="txt">
									����
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input name="userpass" class="inp" type="password" maxlength="50" />
									<div class="info">
										6λ����Ӣ����ĸ�����֡�
									</div>
								</div>
							</div>
							<div class="item clearfix">
								<div class="txt">
									ȷ������
									<span class="important">(*)</span>
								</div>
								<div class="form">
									<input class="inp" type="password" maxlength="50" name="qrmm" />
									<div class="info">
										�ٴ�ȷ�����롣
									</div>
								</div>
							</div>
							<div class="item clearfix">
								<div class="txt">���֤��<span class="important">(*)</span></div>
								<div class="form">
									<input name="sfzh" class="inp" type="text" maxlength="18" />
									<div class="info">
										�����������֤�ţ�
										<span class="important">�ǳ���Ҫ</span>��
										<br />
										<span class="important"><strong>ͬһ���֤��ÿ��ֻ����ע��һ�Ρ�</strong></span>
									</div>
								</div>
							</div>											
							<div class="item clearfix">
									<div class="txt">
										һ����Ƭ
										<span class="important">(*)</span>
									</div>
									<div class="form">
										<s:file name="upload" id="upfile"/>
										<div class="info">
											<span class="important">���ϴ�����һ�����֤����,��С���ܳ���30K,����Ϊjpg��png��gif��ʽ</span>
										</div>
									</div>
							</div>						
							<div class="item clearfix">
								<div class="txt"></div>
								<div class="form">
									<div class="regbtn">
										<input name="save" type="button" class="regbtnnew" value="ע�����û�" onClick="checkNumber();">
									</div>
								</div>
							</div>

						</form>
                    </div>
				</div>
				<div class="colum_4">
					<div class="notesSection">
						<h3>
							��ӭע��
						</h3>
						<p>
							���ã���ӭ��ע���������ӿƼ���ѧ������������
							<br>
							<br>


							ע��Ϊ�������������û��������Ը���ע��ʱ��д���û����������¼�����������������������������ͱ��͡������ˮƽ�˶�Ա�����������س����Լ��ɼ���¼ȡ��ѯ�ȡ�
							<br>
							<br>


							�ύʱ���μ�������������룬����������¼ϵͳΨһ�����ݡ�лл��
						</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
<%@ include file="/common/footer.jsp" %>
<div><div id="maskLevel" style="position:absolute;top:0;left:0;display:none;text-align:center;z-index:10000;"></div><div id="ym-window" style="position:absolute;z-index:10001;display:none"><div class="ym-tl" id="ym-tl"><div class="ym-tr"><div class="ym-tc" style="cursor:move;"><div class="ym-header-text"></div><div class="ym-header-tools"></div></div></div></div><div class="ym-ml" id="ym-ml"><div class="ym-mr"><div class="ym-mc"><div class="ym-body"></div></div></div></div><div class="ym-ml" id="ym-btnl"><div class="ym-mr"><div class="ym-btn"></div></div></div><div class="ym-bl" id="ym-bl"><div class="ym-br"><div class="ym-bc"></div></div></div></div></div></body></html><div id="ym-window" style="position:absolute;z-index:10001;display:none"><div class="ym-tl" id="ym-tl"><div class="ym-tr"><div class="ym-tc" style="cursor:move;"><div class="ym-header-text"></div><div class="ym-header-tools"></div></div></div></div><div class="ym-ml" id="ym-ml"><div class="ym-mr"><div class="ym-mc"><div class="ym-body"></div></div></div></div><div class="ym-ml" id="ym-btnl"><div class="ym-mr"><div class="ym-btn"></div></div></div><div class="ym-bl" id="ym-bl"><div class="ym-br"><div class="ym-bc"></div></div></div></div></div></body></html>