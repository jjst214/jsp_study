<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>el 산술연산</h2>
<%
	pageContext.setAttribute("x", 10);
	pageContext.setAttribute("y", 6);
%>
<p> num1 : ${num1 }</p>
<p> num2 : ${num2 }</p>
<p> num1 + num2 : ${param.x + num2 }</p>
<p> num1 - num2 : ${num1 - num2 }</p>
<p> num1 * num2 : ${num1 * num2 }</p>
<p> num1 / num2 : ${num1 / num2 }</p>
<p> num1 div num2: ${num1 div num2}</p>
<p> num1 % num2: ${num1 % num2}</p>
<p> num1 mod num2: ${num1 mod num2}</p>
</body>
</html>