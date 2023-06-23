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
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies){
			if(cookie.getValue().equals("admin")){
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				response.sendRedirect("header.jsp");
			}
		}
	%>
</body>
</html>