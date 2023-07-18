<%@page import="java.text.NumberFormat"%>
<%@page import="mvc_con.ProductDAO"%>
<%@page import="mvc_con.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
<title>상품상세</title>
<%
	NumberFormat numberFormat = NumberFormat.getInstance();
	String num = request.getParameter("num");
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(num);
	dao.close();
	if(grade.equals("5") || grade.equals("10")){
		%>
		<div class="wrap">
			<h2 style="text-align:center; padding: 50px 0;">상품 상세(관리자)</h2>
			
			<div id="productInfo" class="inner">
				<div id="pimage">
					<img src="uploads/<%=dto.getPimage()%>"/>
				</div>
				<div>
					<h2><%=dto.getPname() %></h2>
					<p>가격 : \<%=numberFormat.format(Integer.parseInt(dto.getPprice())) %></p>
					<p>남은 재고 : <%=dto.getPstock() %></p>
					<p>상품설명</p>
					<textarea rows="20" cols="60" readonly><%=dto.getPdetail() %></textarea>
					
				</div>
			</div>
		</div>
		
		<%
	}
%>

<%@ include file="/footer/footer.jsp" %>