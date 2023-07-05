<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = application.getInitParameter("username");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>컨텍스트 초기화 매개변수 출력</h2>
	<p><%=name %></p>
	<p>${initParam.username }</p>
</body>
</html>