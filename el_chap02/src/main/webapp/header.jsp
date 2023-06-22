<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String siteTitle = request.getParameter("title");
	Calendar cal = (Calendar)request.getAttribute("time");
%>
<body>
	<div>
		<h1><%= siteTitle %></h1>
		<ul>
			<li>menu1</li>
			<li>menu2</li>
			<li>menu3</li>
		</ul>
		<p>현재 시간은 <%=cal.get(Calendar.HOUR) %>시
		<%=cal.get(Calendar.MINUTE) %>분
		<%=cal.get(Calendar.SECOND) %>초
		</p>
	</div>
</body>
</html>