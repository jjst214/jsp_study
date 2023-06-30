<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getPost(Integer.parseInt(num));
	String sessionid = session.getAttribute("UserId") == null ? "" : session.getAttribute("UserId").toString();
	if(!sessionid.equals(dto.getId())){
		%>
		<script>
			alert("작성자 본인만 삭제할 수 있습니다.");
			history.back();
		</script>
		<%
	}else{
		int result = dao.deletePost(Integer.parseInt(num));
		if(result == 1){
			%>
			<script>
				alert("게시글이 삭제되었습니다.");
				location.replace("boardlist.jsp");
			</script>
			<%
		}else{
			%>
			<script>
				alert("게시글 삭제에 실패했습니다.");
				location.replace("boardlist.jsp");
			</script>
			<%
		}
	}
	
%>