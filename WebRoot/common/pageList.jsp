<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script language="javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<center>
	<c:set var="curPage" value="1" />
	<!--pNames��ʾ�����е����в��������֣�������ǰҳ�ŵ�����curPage-->
	<c:set var="pNames" value="${pageContext.request.parameterNames}" />
	<!--���������е����в���-->
	<c:forEach items="${pNames}" var="pn">
		<!--������������ֲ���curPage -->
		<c:if test="${pn!='curPage'}">
			<!--������ֵ��ŵ�params�����У�params����������Ϊһ��map����-->
			<c:set var="params" value="${params}&${pn}=${param[pn]}" />
			<!--������ֵ��ŵ����ؿؼ���Ӧ�ı���hid��-->
<!--ÿ���ؼ�������ԭ���Ĳ�����-->
			<c:set var="hid">
			${hid} <input type=hidden name=${pn } value=${param[pn]}>
			</c:set>
		</c:if>
		<!--���������������curPage -->
		<c:if test="${pn=='curPage'}">
			<!--�������curPage��ֵ��Ϊ����ֵ-->
			<c:set var="curPage" value="${param[pn]}" />
		</c:if>
	</c:forEach>
	<!--aNames��ʾrequest�е��������Ե����֣�������ǰҳ�ļ�¼�б����ҳ��-->
	<c:set var="aNames" value="${pageContext.request.attributeNames}" />
	<c:forEach items="${aNames}" var="an">
		<c:if test="${requestScope.attribute[an]}">
			<c:if test="${an.list!=null&&an.totalPage!=null}">
				<c:set var="totalPage" value="${an.totalPage}" />
			</c:if>
		</c:if>
	</c:forEach>
	<!--actionUrl��ʾҳ����ת�ĵ�ַ-->
	<form action="${pageContext.request.contextPath}${actionUrl}" Method="get" onSubmit="return validateForm(this)">
		<!--����hidden�ؼ����ݱ�ҳ��������������-->
		<!--hid�������Ƕ�����ؿؼ�-->
		${hid}
		<!--��ǰҳ���ǵ�һҳ����Ӧ����"��һҳ"����ǰҳ�������һҳ����Ӧ����"��һҳ"-->
		<!--ÿ��ҳ����ת���ݵĲ���������ǰҳ��curPage��params��������������ѯ����-->
		<c:if test="${curPage>1}">
			<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=1${params}">��ҳ</a>&nbsp;
	<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=${curPage-1}${params}">��һҳ</a>&nbsp;
</c:if>
		<c:if test="${curPage<=1}">
	��ҳ&nbsp;��һҳ&nbsp;
</c:if>
		<!--pageInfo��ʾrequest�е�ҳ����Ϣ��������ǰҳ��ʾ�б����ҳ��-->
		<c:if test="${curPage<pageInfo.totalPage}">
			<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=${curPage+1}${params}">��һҳ</a>&nbsp;
	<a class="red" href="${pageContext.request.contextPath}${actionUrl}?curPage=${pageInfo.totalPage}${params}">βҳ</a>&nbsp;
</c:if>
		<c:if test="${curPage>=pageInfo.totalPage}">
	��һҳ&nbsp;βҳ&nbsp;
</c:if>
		תȥ��
		<input type="text" name="curPage" size="3" numberInfo="��������Чҳ�룡">
		ҳ
		<input type="submit" value="Go">
		ҳ����<font color="red">${curPage}/${pageInfo.totalPage}</font>
	</form>
</center>