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
		//요청객체.getHeader("cookie")
		//쿠키를 문자열로 반환
		String cookiestring = request.getHeader("cookie");
		out.println(cookiestring);
		out.println("</br>");
		Cookie[] cookies = request.getCookies();
		if(cookiestring != null && cookies.length > 0){
			for(Cookie cookiea:cookies){
				if(cookiea.getName().equals("name")){
					//새로운 쿠키 생성
					Cookie cookie = new Cookie("name", "blue");
					//응답에 쿠키를 추가
					response.addCookie(cookie);
				}
				out.println(cookiea.getName() + " : " + cookiea.getValue());
				out.println("</br>");
			}
		}
	%>
</body>
</html>