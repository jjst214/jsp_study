<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../inc/booklist.xml" var="booklist" charEncoding="UTF-8"/>
	<!-- 변수에 담긴 xml을 파싱하여 blist변수에 할당 -->
	<x:parse xml="${booklist }" var="blist"/>
	<h2>파싱</h2>
	제목 : <x:out select="$blist/booklist/book[1]/name" />
	저자 : <x:out select="$blist/booklist/book[1]/author" />
	가격 : <x:out select="$blist/booklist/book[1]/price" />
	
	<h2>파싱2</h2>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>저자</td>
			<td>가격</td>
		</tr>
		<x:forEach select="$blist/booklist/book" var="item">
		<tr>
			<td><x:out select="$item/name"/></td>
			<td><x:out select="$item/author"/></td>
			<td><x:out select="$item/price"/></td>
		</tr>
		</x:forEach>
	</table>
</body>
</html>