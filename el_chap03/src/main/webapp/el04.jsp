<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>el 비교연산</h2>
	<%
		pageContext.setAttribute("n1", 10);
		pageContext.setAttribute("n2", 7);
		pageContext.setAttribute("age", 18);
		pageContext.setAttribute("str", "");
		pageContext.setAttribute("arr", new String[] {});
	%>
	<p>n1 == n2 : ${n1 == n2 }</p>
	<p>n1 eq n2 : ${n1 eq n2 }</p>
	<p>n1 != n2 : ${n1 != n2 }</p>
	<p>n1 ne n2 : ${n1 ne n2 }</p>
	<p>n1 > n2 : ${n1 > n2 }</p>
	<p>n1 gt n2 : ${n1 gt n2 }</p>
	<p>n1 >= n2 : ${n1 >= n2 }</p>
	<p>n1 ge n2 : ${n1 ge n2 }</p>
	<p>n1 < n2 : ${n1 < n2 }</p>
	<p>n1 lt n2 : ${n1 lt n2 }</p>
	<p>n1 <= n2 : ${n1 <= n2 }</p>
	<p>n1 le n2 : ${n1 le n2 }</p>
	
	<p>${age>20 ? "old" : "young" }</p>
	
	<p>${empty str }</p>
	<p>${empty arr }</p>
</body>
</html>