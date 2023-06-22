<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String p1 = request.getParameter("phone1");
	String p2 = request.getParameter("phone2");
	String p3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	try{
		if(p1=="none" || email=="none" || month=="none" || day=="none"){
			response.sendRedirect("join.jsp");
		}	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</head>
<body>
	<p>이름 : <%=request.getParameter("name") %></p>
	<p>아이디 : <%=request.getParameter("uid") %></p>
	<p>비밀번호 : <%=request.getParameter("upw") %></p>
	<p>이메일 : <%=request.getParameter("email") %> @ <%= request.getParameter("email_com") %></p>
	<p>생년월일 : <%=request.getParameter("year") %>년 <%=request.getParameter("month") %>월 <%=request.getParameter("day") %>일</p>
	<p>휴대폰번호 : <%out.print(p1 + "-" + p2 + "-" + p3); %></p>
</body>
</html>