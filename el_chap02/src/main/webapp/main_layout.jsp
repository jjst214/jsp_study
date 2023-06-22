<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div><jsp:include page="module/header.jsp" flush="false"/></div>
		<div>
			<div><jsp:include page="module/left.jsp" flush="false"/></div>
			<div>실제페이지 내용</div>
		</div>
		<div><jsp:include page="module/footer.jsp" flush="false"/></div>
	</div>
</body>
</html>