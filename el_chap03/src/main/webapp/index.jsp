<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
	for(Cookie cookie:cookies){
		if(cookie.getName().equals("username")){
			out.println(cookie.getValue());
		}
	}
	out.println("안녕하세요");
%>

</body>
</html>