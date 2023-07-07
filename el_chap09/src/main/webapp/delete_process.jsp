<%@page import="fileupload.MyFileDTO"%>
<%@page import="fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("num");
	MyFileDAO dao = new MyFileDAO();
	MyFileDTO dto = dao.detailview(idx);
	int result = dao.deletePost(idx);
	
	if(result == 1){
		%>
		<script>
			alert("게시글이 삭제되었습니다.");
			location.replace("filelist.jsp");
		</script>
		<%
	}else{
		%>
		<script>
			alert("게시글 삭제에 실패했습니다.");
			location.replace("filelist.jsp");
		</script>
		<%
	}
%>