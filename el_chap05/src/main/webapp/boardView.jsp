<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getPost(Integer.parseInt(request.getParameter("num")));
	dao.close();
%>

	<h2><%=dto.getTitle() %></h2>
	<p>조회수 : <%=dto.getVisitcount() %></p>
	<p>글 내용: <%=dto.getContent() %></p>
	
	<form action="updatePost.jsp" method="post">
		<span>
			<input type="hidden" name="num" value="<%=dto.getNum()%>">
			<input type="submit" value="수정" name="btn"/>
		</span>
	</form>
	<form action="delete_process.jsp" method="post">
		<span>
			<input type="hidden" name="num" value="<%=dto.getNum()%>">
			<input type="submit" value="삭제" name="btn"/>
		</span>
	</form>


</body>
</html>