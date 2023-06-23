<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="person.Person" scope="request"/>
	<p>아이디 : <%=person.getId() %></p>
	<p>이름 : <%=person.getName() %></p>
	<%
		person.setId(20182005);
		person.setName("홍길동");
	%>
	<jsp:include page="useBean.jsp"/>
</body>
</html>