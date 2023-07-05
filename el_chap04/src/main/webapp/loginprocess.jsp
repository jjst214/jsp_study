<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//로그인 폼으로부터 받은 아이디와 패스워드
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pwd");
	//web.xml 에서 가져온 데이터베이스 정보
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePwd");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePw);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
	dao.close();
	
	//로그인 성공 여부에 따른 처리
	if(memberDTO.getId() != null){
		//로그인성공
		//session
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
	}
	response.sendRedirect("loginForm.jsp");
%>