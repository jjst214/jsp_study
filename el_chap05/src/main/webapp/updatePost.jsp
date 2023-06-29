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
	request.setCharacterEncoding("utf-8");
	int get = Integer.parseInt(request.getParameter("num"));
	String user = String.valueOf(session.getAttribute("UserId"));
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getPost(get);
	dao.close();
%>
<form action="update_process.jsp" method="post">
	<div>
		<input type="hidden" name="num" value="<%=dto.getNum()%>">
		<input type="hidden" name="num" value="<%=dto.getId()%>">
		<h2>글 수정</h2>
		<p>제목 : <input type="text" name="title" value="<%=dto.getTitle()%>"/></p>
		<textarea rows="30" cols="100" name="content"><%=dto.getContent() %></textarea>
		<p><input type="submit" value="수정"/></p>
	</div>
</form>
</body>
</html>