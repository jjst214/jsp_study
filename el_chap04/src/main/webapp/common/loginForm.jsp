<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="link.jsp"></jsp:include>
	<h2>로그인하기</h2>
	<form action="login_process.jsp" method="post">
	<p>아이디<input type="text" name="id"/></p>
	<p>비밀번호<input type="text" name="pw"/></p>
	<p><input type="submit" value="전송"/>
	<input type="reset" value="취소"/>
	</p>
	</form>
</body>
</html>