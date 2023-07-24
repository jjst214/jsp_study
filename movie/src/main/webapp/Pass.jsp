<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 확인</h2>
	<form action="./pass.do" method="post">
		<input type="hidden" name="qID" value="${param.qID}" />
		<input type="hidden" name="mode" value="${param.mode}" />
		<p>비밀번호 : <input type="password" name="pass"></p>
		<p>
			<button type="submit">확인</button>
			<button type="reset">취소</button>
			<button type="button" 
				onclick="location.href='${pageContext.request.contextPath }/qna/qna.do'">목록보기</button>
		</p>
	</form>
</body>
</html>