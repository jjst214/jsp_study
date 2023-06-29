<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/link.jsp"/>
	<h2>로그인 페이지</h2>
	<form action="login_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"/></p>
		<p>패스워드 : <input type="password" name="pass"/></p>
		<p>
			<input type="submit" value="로그인"/>
			<input type="reset" value="취소"/>
		</p>
	</form>
</body>
</html>