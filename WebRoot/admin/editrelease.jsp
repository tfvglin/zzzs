<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="css/release.css" type="text/css">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<script type="text/javascript" src="js/calendar.js"></script>
 <center><b><font color="black" style='font-weight:bold;display:inline;'>�༭�������</font></b></center>
<form name="release" method="post" action="subEditRelease">
	  <table width="50%" align="center" border="0" cellspacing="1" cellpadding="4" class="tableoutline">	   
		<tr class="firstalt" nowrap>
          <td>�������:</td>
          <td>
              <input type="hidden" name="id" size="50" maxlength="140" value="${request.releaseId}" >
              <input type="text" name="title" size="50" maxlength="140" value="${request.releaseName}" ></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��ʼʱ��:</td>
          <td><input  type="text" name="begin" size="50" maxlength="140"  value="${request.releaseBegin}"  onclick=SelectDate(this)></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��ֹʱ��:</td>
          <td><input  type="text" name="end" size="50" maxlength="140"  value="${request.releaseEnd}"  onclick=SelectDate(this)></td>
        </tr>
        <tr class="firstalt" nowrap>
          <td>��ݣ�����λ��:</td>
          <td><input  type="text" name="year" size="50" maxlength="140"  value="${request.year}"  onclick=SelectDate(this)></td>
        </tr>
		<tr class="tbhead">
          <td colspan="2" align="center"><input type="submit" name="button" value="�ύ����" /></td>
		</tr>
	  </table>
	</form>