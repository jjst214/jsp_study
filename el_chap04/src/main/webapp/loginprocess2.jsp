<%@page import="membership.MemberDAO2"%>
<%@page import="membership.MemberDTO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String uid = request.getParameter("id");
	String upw = request.getParameter("pwd");
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePwd");
	
	MemberDAO2 dao = new MemberDAO2(oracleDriver, oracleURL, oracleId, oraclePw);
	MemberDTO2 dto = dao.getMemberDAO2(uid, upw);
	dao.close();
	
	if(dto.getId() != null){
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
	}
	response.sendRedirect("loginForm.jsp");
%>