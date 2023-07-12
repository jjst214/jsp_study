<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/footer.css">

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<title>Insert title here</title>

</head>
<body>
	<header>
		<div id="top_nav">
			<h1><a href="#">로고</a></h1>
			<p><input type="text"/></p>
			<ul>
				<%
				if(session.getAttribute("UserName") != null){
					//유저네임 세션이 있다면?  1:일반유저, 2:관리자
					if(session.getAttribute("grade").equals("1")){
						%>
						<li><a href="#">로그아웃</a></li>
						<li><a href="#">회원정보</a></li>
						<li><a href="#">마이페이지</a></li>
						<%
					}else{
						%>
						<li><a href="#">로그아웃</a></li>
						<li><a href="#">상품등록</a></li>
						<%
					}
					
				}else{
					%>
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
					<%
				}
				%>
				<li><a href="mvc_con/add.do">등록</a></li>
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
	