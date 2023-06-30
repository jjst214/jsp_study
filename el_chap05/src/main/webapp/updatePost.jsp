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
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getPost(get);
	
	String sessionid = session.getAttribute("UserId") == null ? "" : session.getAttribute("UserId").toString();

	//게시글 작성자가 로그인한 아이디인지 확인
	if(!sessionid.equals(dto.getId())){
		%>
		<script>
			alert("작성자 본인만 수정할 수 있습니다.");
			history.back();
		</script>
		<%
	}else{
		%>
			<jsp:include page="common/link.jsp"/>
			<h2>게시글 수정</h2>
			<form action="update_process.jsp" method="post">
				<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="<%=dto.getTitle()%>"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="30" cols="100" name="content"><%=dto.getContent() %></textarea></td>
					</tr>
				</table>
				<button type="submit">수정하기</button>
				<button type="reset">다시입력</button>
				<button type="button" onclick="location.href='boardlist.jsp'">목록보기</button>
			</form>
		<%
	}
	dao.close();
%>

</body>
</html>