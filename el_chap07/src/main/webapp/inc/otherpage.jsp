<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>다른페이지입니다.</h2>
	<ul>
		<li>저장된 값 : ${requestScope.requestVar }</li>
		<li>매개변수 : ${param.userParam1 }</li>
		<li>매개변수 : ${param.userParam2 }</li>
	</ul>
</body>
</html>