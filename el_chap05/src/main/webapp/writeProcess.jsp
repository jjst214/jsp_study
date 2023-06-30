<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	for(int i=1; i<=100; i++){
		BoardDTO dto = new BoardDTO();
		dto.setTitle("title" + i);
		dto.setContent("content" + i);
		dto.setId("greeeed");
		dao.insertWrite(dto);
	}
	dao.close();
	
%>