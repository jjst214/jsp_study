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
		String option = request.getParameter("code");
		String viewURL = null;
		if(option.equals("A")){
			//response.sendRedirect("module/a.jsp");
			viewURL = "module/a.jsp";
		}else if(option.equals("B")){
			//response.sendRedirect("module/b.jsp");
			viewURL = "module/b.jsp";
		}else{
			//response.sendRedirect("module/c.jsp");
			viewURL = "module/c.jsp";
		}
	%>
	<jsp:forward page="<%=viewURL %>"></jsp:forward>
</body>
</html>