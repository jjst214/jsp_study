<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	
	//DTO 객체에 변경 값 저장
	BoardDTO dto = new BoardDTO();
	dto.setContent(content);
	dto.setTitle(title);
	dto.setNum(num);
	
	//데이터베이스 반영
	BoardDAO dao = new BoardDAO();
	int result = dao.updatePost(dto);
	dao.close();
	
	if(result == 1){
		response.sendRedirect("boardView.jsp?num=" + dto.getNum());
	}else{
		%>
		<script>
			alert("글 수정에 실패했습니다.");
			location.replace("boardlist.jsp?num=<%=dto.getNum()%>");
		</script>
		<%
	}
%>