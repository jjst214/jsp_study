<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("personObj", new Person("김그린", 28));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역 전달받은 값 읽기</h2>
	<ul>
		<li>Person 객체 이름 : ${personObj.name }</li>
		<li>Person 객체 나이 : ${personObj.age }</li>
	</ul>
	<jsp:forward page="objectResult.jsp">
		<jsp:param name="firstNum" value="10"/>
		<jsp:param name="secondNum" value="20"/>
	</jsp:forward>
</body>
</html>