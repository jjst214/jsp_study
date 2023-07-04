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
	<c:set var="iTag">
		i태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	<h2>기본사용</h2>
	<c:out value="${iTag }"/>
	<h2>escapeXml속성</h2>
	<c:out value="${iTag }" escapeXml="false"/>
	<h2>default속성</h2>
	<c:out value="${param.name }" default="이름없음"/>
	<c:out value="" default="빈 문자열도 값입니다"/>
</body>
</html>