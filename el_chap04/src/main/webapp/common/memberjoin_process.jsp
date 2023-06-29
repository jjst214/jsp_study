<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPass(pw);
	dto.setName(name);
	int result = dao.insertMember(dto);
	dao.close();
	response.sendRedirect("index.jsp");
%>