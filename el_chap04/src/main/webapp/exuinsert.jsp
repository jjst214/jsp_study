<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		//DB연결 - jdbc객체 생성
		JDBCConnect jdbc = new JDBCConnect();
		//입력값 준비
		String id = "test1";
		String pass = "1111";
		String name = "회원1";
		//쿼리문 생성
		//sql문에 ?를 인파라미터라고 하며 정확한 값은 나중에 채우겠다 라는 뜻
		//connection 객체를 통해서 prepareStatement 객체를 생성
		String sql = "insert into member values(?,?,?,sysdate)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pass);
		psmt.setString(3, name);
		//쿼리 수행
		//psmt.executeUpdate() --> 변경된 행 개수를 리턴(int)
		int inResult = psmt.executeUpdate();
		out.println(inResult + "행이 입력되었습니다.");
		//연결 닫기
		jdbc.close();
	%>
</body>
</html>