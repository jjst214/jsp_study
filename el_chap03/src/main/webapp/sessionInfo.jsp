<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<p>세션정보</p>
<p>세션아이디 : <%=session.getId() %></p>
<%
	time.setTime(session.getCreationTime());
%>
<p>세션생성 시간 : <%= formatter.format(time) %></p>
<%
	time.setTime(session.getLastAccessedTime());
%>
<p>가장 최근 접근 시간 : <%= formatter.format(time) %></p>
</body>
</html>