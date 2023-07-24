<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"></script>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<%
	//로그인 세션 받아오기
	String sessionId = (String)session.getAttribute("UserId");
	String grade = (String)session.getAttribute("Grade");
	if(grade == null){
		grade = "0";
	}
	MemberDAO nameDAO = new MemberDAO();
	MemberDTO nameDTO = nameDAO.getMemberInfo(sessionId);
	nameDAO.close();
%>

</head>
<body>
	<header>
		<div id="top_nav">
			<h1><a href="${pageContext.request.contextPath }/index.jsp">로고</a></h1>
			<form method="get" action="${pageContext.request.contextPath }/mvc_con/list.do" id="searchForm">
				<input type="hidden" name="cate" value="all">
				<input type="text" name="searchWord" id="searchWord" placeholder="상품명을 검색해보세요"/>
			</form>
			<ul>
			<%
				//비회원, 비로그인이 보는 헤더
				if(sessionId == null || grade == null){
					%>
					<li><a href="${pageContext.request.contextPath }/member/login.do">로그인</a></li>
					<span>&nbsp;|&nbsp;</span>
					<li><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></li>
					<%
				}else{
					//sessionId가 있다면 --> 1:고객 로그인 / 5,10:관리자 로그인
					if(grade.equals("1")){
						%>
						<li><%=nameDTO.getmNAME() %>&nbsp;님</li>
						<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						<span>&nbsp;|&nbsp;</span>
						<li><a href="#">회원정보</a></li>
						<span>&nbsp;|&nbsp;</span>
						<li id="drop">
							<a href="#">마이페이지</a>
							<ul class="header-drop">
								<li><a href="${pageContext.request.contextPath }/mvc_con/service.do?type=cart">장바구니</a></li>
								<li><a href="${pageContext.request.contextPath }/mvc_con/service.do?type=olist">주문내역</a></li>
							</ul>
						</li>
						<%
					}else if(grade.equals("10") || grade.equals("5")){
						%>
						<li>관리자 로그인 중입니다.</li>
						<li><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						<span>&nbsp;|&nbsp;</span>
					    <li><a href="${pageContext.request.contextPath }/mvc_con/product.do?p_type=manage&cate=all">상품관리</a></li>
						<%
					}
				}
				%>

			</ul>
		</div>
		<nav id="nav_menu">
			<ul>
				<li><a href="${pageContext.request.contextPath }/mvc_con/list.do?cate=1">사료</a></li>
				<li><a href="${pageContext.request.contextPath }/mvc_con/list.do?cate=2">간식</a></li>
				<li><a href="${pageContext.request.contextPath }/mvc_con/list.do?cate=3">패션</a></li>
				<li><a href="${pageContext.request.contextPath }/mvc_con/list.do?cate=4">장난감/훈련용품</a></li>
				<li><a href="${pageContext.request.contextPath }/qna/qna.do">QnA</a></li>
			</ul>
		</nav>
	</header>
	