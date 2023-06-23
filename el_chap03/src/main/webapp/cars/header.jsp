<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0; padding:0; box-sizing:none;}
	li{list-style:none;}
	a{text-decoration:none; color:black;}
	#nav_form{
		margin: 0 auto;
		width:100%;
		max-width:1200px;
		height:100px;
		display:flex;
		justify-content:space-around;
		align-items:center;
	}
</style>
</head>
<body>
<div id="nav_form">
	<h2><a href="createCar.jsp">차량설정</a></h2>
	<h2><a href="index.jsp">logo</a></h2>
	<ul>
		<%	
			Cookie[] cookies = request.getCookies();
			boolean isLogin = false;
			String userid = "";
			if(cookies.length>1){
				for(Cookie cookie : cookies){
					if(cookie.getValue().equals("admin")){
						isLogin = true;
						userid = "admin";
					}
				}
			}
			
			if(isLogin){
		%>
				<li><a href="logout_process.jsp">로그아웃</a></li>
				<li><a href="#">정보수정</a></li>
		<%			
			}else{
		%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="#">회원가입</a></li>
		<%
			}
		%>
		
	</ul>
</div>