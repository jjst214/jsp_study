<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getMemberDTO(request.getParameter("id"), request.getParameter("pw"));
	if(dto.getId() != null){
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
		%>
		<script>
			alert("로그인 되었습니다.");
			location.replace("index.jsp");
		</script>
		<%
	}else {
		%>
			<script>
			alert("로그인 되지 않았습니다.");
			location.replace("index.jsp");
		</script>
		<%
		
	}
	
%>