<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="css/release.css" type="text/css">
 <link rel="stylesheet" href="css/styles.css" type="text/css">
 <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<center><b><font color="black" style='font-weight:bold;display:inline;'>现有考场</font></b></center>
<div class="grid-view">
<table class="items" style="width:70%;margin:0 auto;">
<thead>
<tr bgcolor="#E0FFFF">
    <th align="center" width="10%"><b>考场号</b></th>
	<th align="center" width="20%"><b>对应教室</b></th>
	<th align="center" width="20%"><b>座位数</b></th>
	<th align="center" width="50%" colspan="3"><b>管理操作</b></th>
</tr>
<s:iterator id="room" value="#request.rooms"  status="st">
<s:if test="#st.odd"><tr class="odd"></s:if>
<s:if test="#st.even"><tr class="even"></s:if>
    <td align=center><s:property value="RoomNo" /></td>
    <td align=center><s:property value="ClassRoom" /></td>
    <td align=center><s:property value="SeatAmount" /></td>
    <td align=center><a href="../admin/SelfRoomEditAction?room_id=${room.Id}">编辑</a></td>
    <td align=center><a href="../admin/SelfRoomDelAction?type=self&room_id=${room.Id}">删除</a></td>
    <td align=center><a href="../admin/RoomTable?type=self&room_no=${room.RoomNo}" target="_blank"><input type="button" name="roomtable" value="导出签到表" /></a></td>
</tr>
</s:iterator>
</table>
</div>
    <form name="selfexam" method="post" action="../admin/SelfAddRoomAction">
	  <table width="40%" align="center" border="0" cellspacing="1" cellpadding="4">
	    <tr id="cat"><td class="tbhead" colspan="2"><b><font color="black">添加自主招生考场</font></b></td></tr>
		<tr nowrap>
          <td width="50%">考场号:</td>
          <td width="50%"><input  type="text" name="roomno" size="40" maxlength="40" value="" width="100%" ></td>
        </tr>
        <tr nowrap>
          <td width="50%">对应教室:</td>
          <td width="50%"><input  type="text" name="classroom" size="40" maxlength="40" value=""  width="100%"></td>
        </tr>
        <tr nowrap>
          <td>座位数:</td>
          <td><input  type="text" name="seatamount" size="40" maxlength="40" value="" width="100%"></td>
        </tr>
		<tr class="tbhead">
          <td colspan="2" align="center"><input type="submit" name="button" value="提交内容" /></td>
		</tr>
	  </table>
	</form>
</body>
</html>