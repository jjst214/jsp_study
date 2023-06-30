<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	//로그인을 하지 않았다면 이전 페이지로 돌아가기
	if(session.getAttribute("UserId") == null){
		%>
		<script>
		alert("로그인 후 게시판 글을 작성할 수 있습니다.");
		history.back();
		</script>
		<%
	}
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>게시글작성</h2>
<form action="boardwrite_process.jsp" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="30" cols="100">
			</textarea></td>
		</tr>
	</table>
	<button type="submit">글등록</button>
	<button type="reset">취소</button>
</form>
</body>
</html>