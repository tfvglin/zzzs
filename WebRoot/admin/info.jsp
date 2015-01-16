<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="admin.SessionCounter"%> 
<link rel="stylesheet" href="css/release.css" type="text/css">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<script type="text/javascript" src="js/calendar.js"></script>
<body>
  <div class="grid-view">
	<table style="width:40%;margin:0 auto;"class="items">
	    <tr id="cat"><td class="tbhead" colspan="2"><b><font color="black">查看总体信息</font></b></td></tr>
		<tr class="odd">
          <td align=center>已注册用户数:</td>
          <td align=center>${request.reg}</td>
        </tr>
        <tr class="even">
          <td align=center>高水平运动员提交人数:</td>
          <td align=center>${request.athlete}</td>
        </tr>
        <tr class="odd">
          <td align=center>保送生提交人数:</td>
          <td align=center>${request.recommend}</td>
        </tr>
        <tr class="even">
          <td align=center>自主招生提交人数:</td>
          <td align=center>${request.self}</td>
        </tr>        
        <tr class="odd">
          <td align=center>已打印准考证人数:</td>
          <td align=center>${request.admissionamount}</td>
        </tr>
        <tr class="even">
          <td align=center>已打印最大考场号:</td>
          <td align=center>${request.maxroom}</td>
        </tr>
        <!--<tr class="odd">
          <td align=center>当前在线用户数:</td>
          <td align=center>${request.reg}</td>
        </tr>-->
	  </table>
</div>