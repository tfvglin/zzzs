<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="css/release.css" type="text/css">
	<script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
	<form name="release" method="post" action="subAthleteAdmission">
	  <table width="50%" align="center" border="0" cellspacing="1" cellpadding="4" class="tableoutline">
	     <s:if test="tip!=null"><div class="error"><s:property value="tip"/></div></s:if>
	     <s:actionerror cssClass="error"/>
	    <tr id="cat"><td class="tbhead" colspan="2"><b><font color="black">�༭��ˮƽ�˶�Ա׼��֤</font></b></td></tr>
		<tr class="firstalt" nowrap>
          <td>�����ٿ�������:</td>
          <td>
              <input type="text" name="aerobicsdate" size="50" maxlength="140" value="${aerobicsdate}"  onclick=SelectDate(this)></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�����ٿ�ʼʱ��:</td>
          <td>
              <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
              <input  type="text" class="Wdate" name="aerobicsbegin" size="50" maxlength="140" value="${aerobicsbegin}" onClick="WdatePicker({dateFmt:'HH:mm'})">
          </td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�����ٽ���ʱ��:</td>
          <td>
              <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
              <input  type="text" class="Wdate" name="aerobicsend" size="50" maxlength="140" value="${aerobicsend}" onClick="WdatePicker({dateFmt:'HH:mm'})">
          </td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�����ٿ��Եص�:</td>
          <td><input  type="text" name="aerobicsaddress" size="50" maxlength="140" value="${aerobicsaddress}"></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��Ӿ��������:</td>
          <td>
              <input type="text" name="swimdate" size="50" maxlength="140" value="${swimdate}"  onclick=SelectDate(this)></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��Ӿ��ʼʱ��:</td>
          <td>
              <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
              <input  type="text" class="Wdate" name="swimbegin" size="50" maxlength="140" value="${swimbegin}" onClick="WdatePicker({dateFmt:'HH:mm'})">
          </td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��Ӿ����ʱ��:</td>
          <td>
              <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
              <input  type="text" class="Wdate" name="swimend" size="50" maxlength="140" value="${swimend}" onClick="WdatePicker({dateFmt:'HH:mm'})">
          </td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��Ӿ���Եص�:</td>
          <td><input  type="text" name="swimaddress" size="50" maxlength="140" value="${swimaddress}"></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�Ļ��ο�������:</td>
          <td>
              <input type="text" name="culturaldate" size="50" maxlength="140" value="${culturaldate}"  onclick=SelectDate(this)></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�Ļ��ο�ʼʱ��:</td>
          <td>
              <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
              <input  type="text" class="Wdate" name="culturalbegin" size="50" maxlength="140" value="${culturalbegin}" onClick="WdatePicker({dateFmt:'HH:mm'})">
          </td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�Ļ��ν���ʱ��:</td>
          <td>
              <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
              <input  type="text" class="Wdate" name="culturalend" size="50" maxlength="140" value="${culturalend}" onClick="WdatePicker({dateFmt:'HH:mm'})">
          </td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>�Ļ��ο��Եص�:</td>
          <td><input  type="text" name="culturaladdress" size="50" maxlength="140" value="${culturaladdress}"></td>
        </tr>
		<tr class="tbhead">
          <td colspan="2" align="center"><input type="submit" name="button" value="�ύ����" /></td>
		</tr>
	  </table>
	</form>
</body>
</html>