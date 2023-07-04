<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일반 for문 형태의 forEach태그</h2>
	<c:forEach begin="1" end="3" step="1" var="i">
	<p>반복 ${i } 입니다.
	</c:forEach>
	
	<h2>Status속성 살펴보기</h2>
	<table border="1">
	<c:forEach begin="10" end="15" var="i" step="1" varStatus="loop">
		<tr>
			<td>count : ${loop.count }</td>
			<td>index : ${loop.index }</td>
			<td>current : ${loop.current }</td>
			<td>first : ${loop.first }</td>
			<td>last : ${loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h2>1~100까지 홀수의 합</h2>
	<c:forEach begin="1" end="100" step="1" var="j">
		<c:if test="${j mod 2 eq 1 }">
			<c:set var="sum" value="${sum+j}"></c:set>
		</c:if>
	</c:forEach>
	<p>1~100사이의 정수 중 홀수의 합은? ${sum }</p>
	
	<h2>구구단 출력 -table형태</h2>
	<table border="1">
	<c:forEach begin="2" end="9" step="1" var="i">
		<tr>
		<c:forEach begin="1" end="9" step="1" var="j">
			<td>${i }*${j }=${i*j } </td>
		</c:forEach>
		</tr>
	</c:forEach>
	</table>
	<%
		String[] strArr = {"red", "green", "blue", "yellow"};
	%>
	<c:forEach items="<%=strArr %>" var="str">
		<p>${str }</p>
	</c:forEach>
	<h2>향상된 for문 속성 살펴보기</h2>
	<table border="1">
	<c:forEach items="<%=strArr %>" var="strc" varStatus="loop">
		<tr>
			<td>count : ${loop.count }</td>
			<td>index : ${loop.index }</td>
			<td>current : ${loop.current }</td>
			<td>first : ${loop.first }</td>
			<td>last : ${loop.last }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>