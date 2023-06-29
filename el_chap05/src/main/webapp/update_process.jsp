<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	String id = String.valueOf(session.getAttribute("UserId"));
	BoardDAO dao = new BoardDAO();
	int result = dao.updatePost(num, title, content, id);
	//수정 성공
	if(result == 1){
		
	}else{
		//수정실패
	}
%>