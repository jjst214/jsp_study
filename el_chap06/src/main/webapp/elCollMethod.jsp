<%@page import="el.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyElClass myClass = new MyElClass();
	pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역에 저장 후 메소드 호출하기</h2>
	<p>
		001225-3000000 => ${myClass.getGender("001225-3000000") }
		001225-2000000 => ${myClass.getGender("001225-2000000") }
	</p>
</body>
</html>