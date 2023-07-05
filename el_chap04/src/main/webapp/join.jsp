<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	
	<form action="join_proc.jsp" method="post">
		<p>아이디 <input type="text" name="uid"/></p>
		<p>비밀번호 <input type="password" name="upw"/></p>
		<p>닉네임 <input type="text" name="name"/></p>
		<p><input type="submit" value="가입"/></p>
	</form>
</body>
</html>