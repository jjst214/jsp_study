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
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
%>
<body>
	<jsp:include page="header.jsp" flush="false">
		<jsp:param name="title" value="그린컴퓨터아카데미"/>
	</jsp:include>
	main.jsp 입니다.
</body>
</html>