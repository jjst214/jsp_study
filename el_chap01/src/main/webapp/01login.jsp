<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = request.getParameter("memberId");
	if(id != null && id.equals("green")){
		response.sendRedirect("while_form.jsp");
	}else{
		%>
		<body>
			잘못된 아이디 입니다.
		</body>
		<%
	}
%>

</html>