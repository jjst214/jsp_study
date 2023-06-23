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
	int time = session.getMaxInactiveInterval()/60;
	out.println("세션 유효시간 : " + time + "분<br>");
	//세션 유효시간 변경
	session.setMaxInactiveInterval(60*60);
	int time2 = session.getMaxInactiveInterval()/60;
	out.println("세션 유효시간 : " + time2 + "분<br>");
%>
</body>
</html>