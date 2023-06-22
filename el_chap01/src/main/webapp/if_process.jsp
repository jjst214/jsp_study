<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>
</head>
<body bgcolor="<%=request.getParameter("color")%>">
	<h2>If-else Example</h2>
	<p><%= request.getParameter("name") %>님이 좋아하는 색깔은
	<%= request.getParameter("color") %> 입니다.</p>
</body>
</html>