<%@page import="mvcboard.MVCboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	//MVCboardDTO dto = request.getParameter("dto");
%>
</head>
<body>
	<h2>상세 페이지</h2>
	<div>
		<h3>제목 ${dto.getTitle }</h3>
	</div>
</body>
</html>