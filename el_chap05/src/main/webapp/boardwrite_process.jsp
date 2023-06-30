<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//입력값 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//DTO객체 생성 후 DTO객체에 입력값 설정
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	
	//오라클 연결후 글쓰기 메소드 호출
	BoardDAO dao = new BoardDAO();
	int result = dao.insertWrite(dto);
	dao.close();
	if(result == 1){
		%>
		<script>
			alert("게시글이 등록되었습니다.");
			location.replace("boardlist.jsp");
		</script>
		<%
	}else{
		%>
		<script>
			alert("게시글 등록에 실패했습니다.");
			location.replace("boardlist.jsp");
		</script>
		<%
	}
%>
