<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name 파라미터 값 :
	<% 	try{
			%>
			<%=request %>
			<%
		}catch(Exception e){
			out.println("name 파라미터가 올바르지 않습니다.");
		}
	%>
	<%= request.getParameter("name").toUpperCase() %>
</body>
</html>