<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("UserName");
	session.removeAttribute("UserId");
	response.sendRedirect("index.jsp");
%>