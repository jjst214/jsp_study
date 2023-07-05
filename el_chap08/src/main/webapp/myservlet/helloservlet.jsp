<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 jsp에서 출력하기</h2>
	<p>
		<strong>
		<%=request.getAttribute("message") %>
		</strong>
		<a href="./helloservlet.do">바로가기</a>
	</p>
</body>
</html>