<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본객체 사용하여 자원읽기</title>
</head>
<body>
<%
	String resourcePath = "/file/message.txt";

%>
자원의 실제 경로 <%= application.getRealPath(resourcePath) %>
<br>
<%
	char[] buff = new char[128];
	int len = -1;
	URL url = application.getResource(resourcePath);
	try{
		InputStreamReader fr = new InputStreamReader(url.openStream(), "UTF-8");
		while((len = fr.read(buff)) != -1){
			out.println(new String(buff, 0, len));
		}
	}
	
	catch(IOException e){
		out.println("예외 발생 : " + e.getMessage());
	}
%>
</body>
</html>