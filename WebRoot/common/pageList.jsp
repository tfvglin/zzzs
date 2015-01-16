<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script language="javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<center>
	<c:set var="curPage" value="1" />
	<!--pNames表示请求中的所有参数的名字，包括当前页号的名字curPage-->
	<c:set var="pNames" value="${pageContext.request.parameterNames}" />
	<!--遍历请求中的所有参数-->
	<c:forEach items="${pNames}" var="pn">
		<!--如果参数的名字不是curPage -->
		<c:if test="${pn!='curPage'}">
			<!--将参数值存放到params对象中，params对象可以理解为一个map对象-->
			<c:set var="params" value="${params}&${pn}=${param[pn]}" />
			<!--将参数值存放到隐藏控件对应的变量hid中-->
<!--每个控件名还是原来的参数名-->
			<c:set var="hid">
			${hid} <input type=hidden name=${pn } value=${param[pn]}>
			</c:set>
		</c:if>
		<!--如果参数的名字是curPage -->
		<c:if test="${pn=='curPage'}">
			<!--定义变量curPage，值即为参数值-->
			<c:set var="curPage" value="${param[pn]}" />
		</c:if>
	</c:forEach>
	<!--aNames表示request中的所有属性的名字，包括当前页的记录列表和总页数-->
	<c:set var="aNames" value="${pageContext.request.attributeNames}" />
	<c:forEach items="${aNames}" var="an">
		<c:if test="${requestScope.attribute[an]}">
			<c:if test="${an.list!=null&&an.totalPage!=null}">
				<c:set var="totalPage" value="${an.totalPage}" />
			</c:if>
		</c:if>
	</c:forEach>
	<!--actionUrl表示页面跳转的地址-->
	<form action="${pageContext.request.contextPath}${actionUrl}" Method="get" onSubmit="return validateForm(this)">
		<!--利用hidden控件传递本页面的所有请求参数-->
		<!--hid变量中是多个隐藏控件-->
		${hid}
		<!--当前页不是第一页，则应该有"上一页"；当前页不是最后一页，则应该有"下一页"-->
		<!--每次页面跳转传递的参数包括当前页号curPage和params，即所有其他查询参数-->
		<c:if test="${curPage>1}">
			<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=1${params}">首页</a>&nbsp;
	<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=${curPage-1}${params}">上一页</a>&nbsp;
</c:if>
		<c:if test="${curPage<=1}">
	首页&nbsp;上一页&nbsp;
</c:if>
		<!--pageInfo表示request中的页面信息，包括当前页显示列表和总页数-->
		<c:if test="${curPage<pageInfo.totalPage}">
			<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=${curPage+1}${params}">下一页</a>&nbsp;
	<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=${pageInfo.totalPage}${params}">尾页</a>&nbsp;
</c:if>
		<c:if test="${curPage>=pageInfo.totalPage}">
	下一页&nbsp;尾页&nbsp;
</c:if>
		转去第
		<input type="text" name="curPage" size="3" numberInfo="请输入有效页码！">
		页
		<input type="submit" value="Go">
		页数：<font color="red">${curPage}/${pageInfo.totalPage}</font>
	</form>
</center>