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
	<h2>숫자 포맷 설정</h2>
	<c:set var="number1" value="12345"/>
	콤마 O : <fmt:formatNumber value="${number1 }"/>
	콤마 X : <fmt:formatNumber value="${number1 }" groupingUsed="false"/>
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum"/>
	통화기호 : ${printNum }<br>
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	퍼센트 : ${printNum2 }
	
	<h2>문자열을 숫자로 변경</h2>
	<c:set var="number2" value="6,789.01"/>
	<fmt:parseNumber value="${number2 }" var="printNum3" pattern="00,000.00"/>
	소수점까지 : ${printNum3 }<br>
	<fmt:parseNumber value="${number2 }" var="printNum4" integerOnly="true"/>
	정수부분만 : ${printNum4 }
</body>
</html>