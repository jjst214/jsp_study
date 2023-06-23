<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("name", "green");
	Cookie cookie2 = new Cookie("id", "abc");
	cookie2.setMaxAge(30);
	response.addCookie(cookie);
	response.addCookie(cookie2);
%>
</body>
</html>