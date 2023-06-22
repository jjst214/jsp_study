<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="el_chap02.member.MemberInfo" scope="page"/>
	<%
		member.setName("green");
		member.setId("하하하하하하");
		member.setAddress("울산");
		
		out.println(member.getName());
		out.println(member.getId());
		out.println(member.getAddress());
	%>
</body>
</html>