<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">


<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<%
	//로그인 세션 받아오기
	String sessionId = (String)session.getAttribute("UserId");
	String grade = (String)session.getAttribute("Grade");
%>

</head>
<body>
	<header>
		<div id="top_nav">
			<h1><a href="${pageContext.request.contextPath }/index.jsp">로고</a></h1>
			<p><input type="text"/></p>
			<ul>
			<%
				if(sessionId == null || grade == null){
					%>
					<li><a href="${pageContext.request.contextPath }/member/login.do">로그인</a></li>
					<span>&nbsp;|&nbsp;</span>
					<li><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></li>
					<%
				}else{
					//sessionId가 있다면 --> 1:일반유저 / 5,10:관리자
					if(grade.equals("1")){
						%>
						<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						<span>&nbsp;|&nbsp;</span>
						<li><a href="#">회원정보</a></li>
						<span>&nbsp;|&nbsp;</span>
						<li><a href="#">마이페이지</a></li>
						<%
					}else if(grade.equals("10")){
						%>
						<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						<span>&nbsp;|&nbsp;</span>
						<div class="dropdown">
					      <a href="#" class="dropbtn">상품관리</a>
					      <div class="dropdown-content">
					        <a href="${pageContext.request.contextPath }/Add.jsp">상품등록</a>
					        <a href="${pageContext.request.contextPath }/mvc_con/product.do?p_type=delete">상품삭제</a>
					      </div>
					    </div> 
						<%
					}
				}
				%>

			</ul>
		</div>
		<nav id="nav_menu">
			<ul>
				<li><a href="#">축구화</a></li>
				<li><a href="#">유니폼</a></li>
				<li><a href="#">용품</a></li>
				<li><a href="#">구매후기</a></li>
				<li><a href="#">QnA</a></li>
			</ul>
		</nav>
	</header>
	