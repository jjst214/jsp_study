<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<h2>While Example</h2>
	<p>
	<%for(int i=0; i<Integer.parseInt(request.getParameter("count")); i++){%>
		<%= request.getParameter("word")%>
	<%
	} %>
	</p>
</body>
</html>