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
	String userid = (String)session.getAttribute("userid");
	session.removeAttribute("userpw");
	String userpw = (String)session.getAttribute("userpw");
	out.println("설정된 세션의 속성값1 : " + userid);
	out.println("설정된 세션의 속성값2 : " + userpw);
%>
</body>
</html>