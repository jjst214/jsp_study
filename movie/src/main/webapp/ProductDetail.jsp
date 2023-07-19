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
	String url = dto.getPimage().substring(0,dto.getPimage().lastIndexOf("."));
	if(grade.equals("5") || grade.equals("10")){
		%>
		<div class="wrap">
			<h2 style="text-align:center; padding: 50px 0;">상품 상세(관리자)</h2>
			
			<div id="productInfo" class="inner">
				<div id="pimage">
					<img src="uploads/<%=url %>/<%=dto.getPimage() %>"/>
				</div>
				<div>
					<h2><%=dto.getPname() %></h2>
					<p style="font-weight:bold;"><span>가격</span>&emsp;&emsp;<%=numberFormat.format(Integer.parseInt(dto.getPprice())) %>원</p>
					<p style="font-weight:bold;"><span>재고</span>&emsp;&emsp;<%=dto.getPstock() %></p>
					<p>상품설명</p>
					<textarea rows="20" cols="60" id="detailArea" readonly><%=dto.getPdetail() %></textarea>
					<button type="submit" id="editbtn"
					 onclick="location.href='${pageContext.request.contextPath }/mvc_con/product.do?p_type=edit&pid=<%=dto.getPid()%>'">상품수정</button>
				</div>
				
			</div>
		</div>
		
		<%
	}else{
		%>
		
		<%
	}
%>

<%@ include file="/footer/footer.jsp" %>