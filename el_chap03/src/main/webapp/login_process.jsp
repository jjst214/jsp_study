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
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	if(uid.equals("admin") && upw.equals("1234")){
		Cookie cookie = new Cookie("username","admin");
		response.addCookie(cookie);
		response.sendRedirect("index.jsp");
		
	}else{
		response.sendRedirect("login.jsp");
		return;
	}
%>

</body>
</html>