<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="admin.SessionCounter"%> 
<link rel="stylesheet" href="css/release.css" type="text/css">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<script type="text/javascript" src="js/calendar.js"></script>
<body>
  <div class="grid-view">
	<table style="width:40%;margin:0 auto;"class="items">
	    <tr id="cat"><td class="tbhead" colspan="2"><b><font color="black">�鿴������Ϣ</font></b></td></tr>
		<tr class="odd">
          <td align=center>��ע���û���:</td>
          <td align=center>${request.reg}</td>
        </tr>
        <tr class="even">
          <td align=center>��ˮƽ�˶�Ա�ύ����:</td>
          <td align=center>${request.athlete}</td>
        </tr>
        <tr class="odd">
          <td align=center>�������ύ����:</td>
          <td align=center>${request.recommend}</td>
        </tr>
        <tr class="even">
          <td align=center>���������ύ����:</td>
          <td align=center>${request.self}</td>
        </tr>        
        <tr class="odd">
          <td align=center>�Ѵ�ӡ׼��֤����:</td>
          <td align=center>${request.admissionamount}</td>
        </tr>
        <tr class="even">
          <td align=center>�Ѵ�ӡ��󿼳���:</td>
          <td align=center>${request.maxroom}</td>
        </tr>
        <!--<tr class="odd">
          <td align=center>��ǰ�����û���:</td>
          <td align=center>${request.reg}</td>
        </tr>-->
	  </table>
</div>