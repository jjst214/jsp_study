<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>기본객체 우선순위 : 같은 이름으로 다른 영역에 속성이 있으면</h2>
<h2>page > request > session > application</h2>
<%
	pageContext.setAttribute("attr01", "pageVal01");
	request.setAttribute("attr01", "reqVal01");
	session.setAttribute("attr01", "sessionVal01");
	application.setAttribute("attr01", "appVal01");
	
	request.setAttribute("attr02", "reqVal02");
	session.setAttribute("attr02", "sessionVal02");
	application.setAttribute("attr02", "appVal02");
%>
<p>attr01 : ${attr01 }</p>
<p>attr02 : ${attr02 }</p>
</body>
</html>