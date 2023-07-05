<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	
	//DB연결
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPass(pass);
	dto.setName(name);
	int result = dao.insertMember(dto);
	dao.close();
	out.println(result);
%>