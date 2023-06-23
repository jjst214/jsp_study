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
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		if(userid.equals("admin") && userpw.equals("1234")){
			session.setAttribute("userid", userid);
			session.setAttribute("userpw", userpw);
			out.println("세션 설정에 성공했습니다.");
			out.println(userid + "님 환영합니다.");
		}else{
			out.println("세션 설정에 실패했습니다.");
		}
		
	%>
</body>
</html>