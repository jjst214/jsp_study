<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
<% 
	if(session.getAttribute("UserName") != null){
	%>
	<li><a href="/chap02/logout_process.jsp">로그아웃</a></li>
	<li><a href="/chap02/memberlist.jsp">회원목록</a></li>
	<% 
	}else {
	%>
	<li><a href="/chap02/login.jsp">로그인</a></li>
	<li><a href="/chap02/joinForm.jsp">회원가입</a></li>
	<%	
	}
%>	
	<li><a href="/chap02/boardlist.jsp">게시판</a></li>
</ul>