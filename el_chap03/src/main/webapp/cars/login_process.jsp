<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("userid");
	String upw = request.getParameter("userpw");
	
	if(uid.equals("admin") && upw.equals("a1234")){
		Cookie cookie = new Cookie("user", uid);
		session.setAttribute("user", uid);
		response.addCookie(cookie);
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("login.jsp");
		return;
	}
%>