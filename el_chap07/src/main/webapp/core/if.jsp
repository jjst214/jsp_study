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
<!-- 변수선언 -->
<c:set var="number" value="100"/>
<c:set var="string" value="java"/>
<h2>JSTL의 if로 짝수/홀수 판단하기</h2>
<c:if test="${number mod 2 eq 0 }" var="result">
	${number }는 짝수입니다.
</c:if>
<p>결과 : ${result }</p>

<h2>문자열 비교와 else구문 흉내내기</h2>
<c:if test="${string eq 'java' }" var="result2">
	문자열은 java입니다.
</c:if>
<c:if test="${not result2 }">
	문자열은 java가 아닙니다.
</c:if>
</body>
</html>