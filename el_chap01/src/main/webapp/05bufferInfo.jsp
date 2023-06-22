<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
버퍼크기 : <%= out.getBufferSize() %>
남은크기 : <%= out.getRemaining() %>
autoFlush : <%= out.isAutoFlush() %>
</body>
</html>