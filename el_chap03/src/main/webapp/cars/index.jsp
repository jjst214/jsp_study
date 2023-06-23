<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="car" class="Car.Car" scope="request"/>
<%
	
	if(isLogin){
		JOptionPane.showMessageDialog(null, userid+"님 환영합니다.");	
		%>
		<div id="wrap">
			<h2><%= userid%>님의 차량 정보</h2>
			<ul>
				<li>
					소유 차량 회사 : <%=car.getCompany() %>
				</li>
				<li>
					차량 이름 : <%=car.getName() %>
				</li>
				<li>
					최대 가속도 : <%=car.getMaxSpeed() %>
				</li>
				<li>
					차량유형 : <%=car.getType() %> 
				</li>
				<li>
					스포츠 모드 탑재 여부 : <%=car.get %>
				</li>
			</ul>
		</div>
		<%
	}else{
		
		%>
		
		<%
	}
	
%>
</body>
</html>