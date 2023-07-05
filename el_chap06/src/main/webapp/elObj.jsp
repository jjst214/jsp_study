<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//내장객체에 속성 추가하기
	pageContext.setAttribute("페이지스코프", "페이지영역");
	String pageValue = (String)pageContext.getAttribute("scopeValue");
	pageContext.setAttribute("requestValue", "리퀘스트영역");
	pageContext.setAttribute("sessionValue", "세션영역");
	pageContext.setAttribute("appValue-", "어플리케이션 영역");
	
	pageContext.setAttribute("scopeValue", "페이지스코프");
	request.setAttribute("scopeValue", "리퀘스트스코프");
	session.setAttribute("scopeValue", "세션스코프");
	application.setAttribute("scopeValue", "애플리케이션스코프");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>각 영역에 저장된 속성 읽기</h2>
	<p>${pageScope["페이지스코프"] }</p>
	<ul>
	<!-- 
		객체 표현 방식 3가지
		page->request->session->applicaion 순으로 찾음
		${pageScope.scopeValue }
		${pageScope["scopeValue"]}
		${pageScope['scopeValue'] }
		* 속성명에 특수 기호나 한글이 있을때는 대괄호만 사용 할 수 있음!!
	-->
		<li>페이지 영역 : ${pageScope["페이지스코프"]}</li>
		<li>리퀘스트 영역 : ${pageScope.requestValue}</li>
		<li>세션 영역 : ${pageScope.sessionValue}</li>
		<li>애플리케이션 영역 : ${pageScope["appValue-"]}</li>
		
	</ul>
	<p>${scopeValue }</p>
</body>
</html>