<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="today" value="<%=new Date() %>"/>
	<h2>날짜 포맷</h2>
	full : <fmt:formatDate value="${today }" type="date" dateStyle="full"/><br>
	short : <fmt:formatDate value="${today }" type="date" dateStyle="short"/><br>
	long : <fmt:formatDate value="${today }" type="date" dateStyle="long"/><br>
	default : <fmt:formatDate value="${today }" type="date" dateStyle="default"/><br>
	
	<h2>시간 포맷</h2>
	full : <fmt:formatDate value="${today }" type="time" dateStyle="full"/><br>
	short : <fmt:formatDate value="${today }" type="time" dateStyle="short"/><br>
	long : <fmt:formatDate value="${today }" type="time" dateStyle="long"/><br>
	default : <fmt:formatDate value="${today }" type="time" dateStyle="default"/><br>
	
	<h2>날짜/시간 포맷</h2>
	<fmt:formatDate value="${today }" type="both"
	dateStyle="short" timeStyle="short"/><br>
	<fmt:formatDate value="${today }" type="both"
	pattern="yyyy-MM-dd hh:mm:ss"/>
	
	<h2>타임존 설정</h2>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today }" type="both"
		timeStyle="full" dateStyle="full"/>
	</fmt:timeZone>
	
	<h2>로케일 설정</h2>
	한글로 설정 : <fmt:setLocale value="ko_kr"/>
	<fmt:formatNumber value="10000" type="currency"/><br>
	<fmt:formatDate value="${today }"/><br>
	일어로 설정 : <fmt:setLocale value="ja_JP"/>
	<fmt:formatNumber value="10000" type="currency"/><br>
	<fmt:formatDate value="${today }"/><br>
	영어로 설정 : <fmt:setLocale value="en_US"/>
	<fmt:formatNumber value="10000" type="currency"/><br>
	<fmt:formatDate value="${today }"/><br>
</body>
</html>