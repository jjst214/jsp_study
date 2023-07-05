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
	<h2>url태그로 링크 걸기</h2>
	<c:url value="../inc/otherpage.jsp" var="url">
		<c:param name="userParam1" value="aaa"/> 
		<c:param name="userParam2" value="bbb"/> 
	</c:url>
	<a href="${url }">otherpage바로가기</a>
</body>
</html>