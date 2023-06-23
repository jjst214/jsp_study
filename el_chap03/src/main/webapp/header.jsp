<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지 입니다.</title>
<style>
	*{margin:0; padding:0; box-sizing:none}
	li{list-style:none}
	a{text-decoration:none; color:black;}
	#wrap{
		width:100%;
		max-width:1200px;
		height:100px;
		display:flex;
		align-items:center;
		justify-content:space-between;
		margin:0 auto;
	}
	#wrap ul{
		display:flex;
		align-items:center;
	}
	#wrap ul li:first-child{
		border-right: 2px solid #ccc;
	}
	#wrap ul li a{
		margin:0px 5px;
	} 
	
</style>
</head>

<body>
<div id="wrap">
<h2><a href="index.jsp">Green</a></h2>
<ul>
<%
	Cookie[] cookies = request.getCookies();
	boolean islogin = false;
	if(cookies.length>0){
		for(Cookie cookiev:cookies){
			if(cookiev.getName().equals("username")
			&& cookiev.getValue().equals("admin")){
				islogin = true;
			}
		}
	}
	//쿠키의 이름이 username이고 값이 admin일때
	if(islogin){
		%>
		<li><a href="logout_process.jsp">로그아웃</a></li>
		<li>정보수정</li>
		<%
	}
	//로그아웃 되었을때
	else{
		%>
		<li><a href="login.jsp">로그인</a></li>
		<li>회원가입</li>
		<%
	}
%>
	</ul>
</div>
