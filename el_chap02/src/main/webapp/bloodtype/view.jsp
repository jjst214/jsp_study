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
		String type_value = request.getParameter("bloodtype");
		String url = null;
		
		if(type_value == null){
			response.sendRedirect("../forwardTag.jsp");
			return;
		}else if(type_value.equals("A")){
			url = "type_a.jsp";
		}else if(type_value.equals("B")){
			url = "type_b.jsp";
		}else if(type_value.equals("O")){
			url = "type_o.jsp";
		}else{
			url = "type_ab.jsp";
		}
	%>
	<jsp:forward page="<%=url %>"></jsp:forward>
</body>
</html>