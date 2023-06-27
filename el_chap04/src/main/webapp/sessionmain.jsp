<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//시:분:초 형태로 지정
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	//getCreationTime() --> 세션생성시간을 long타입으로 리턴
	long creationtime = session.getCreationTime();
	String creationTimeStr = dateFormat.format(new Date(creationtime));
	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = dateFormat.format(new Date(lastTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>session 설정 확인</h2>
	<ul>
		<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 : <%=session.getId() %></li>
		<li>최초 요청 시간 : <%=creationTimeStr %></li>
		<li>마지막 요청 시간 : <%=lastTimeStr %></li>
	</ul>
</body>
</html>