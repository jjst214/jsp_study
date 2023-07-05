<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("username", "green");
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠기값 얻기</h2>
	<p>username값 : ${cookie.username.value }</p>
	<h2>http 헤더 읽기</h2>
	<ul>
		<li>host : ${header.host }</li>
		<li>user-agent : ${header["user-agent"] }</li>
		<li>cookie : ${header.cookie }</li>
	</ul>
	<h2>컨텍스트 초기화 매개변수 읽기</h2>
	<p>${initParam.username }</p>
	<h2>컨텍스트 루트 경로 읽기</h2>
	<p>${pageContext.request.contextPath }</p>
</body>
</html>