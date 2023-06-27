<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<%
		//로그인 상태 확인 - 로그아웃 상태 일 때
		if(session.getAttribute("UserId") == null){
			%>
			<form action="loginprocess.jsp" method="post">
				<p>아이디 : <input type="text" name="id"/></p>
				<p>패스워드 : <input type="password" name="pwd"/></p>
				<p><input type="submit" value="로그인"/></p>
			</form>
			<%
		}else{
			//로그인상태일때
			%>
			<p><%=session.getAttribute("UserName") %>회원님 로그인 되셨습니다.<br>
				<a href="logoutprocess.jsp">로그아웃</a>
			</p>
			<%
		}
		
		
		
	%>
</body>
</html>