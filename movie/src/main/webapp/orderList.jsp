<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="mvc_con.ProductDAO"%>
<%@page import="mvc_con.ProductDTO"%>
<%@page import="javax.imageio.spi.ImageTranscoderSpi"%>
<%@page import="mvc_con.OrdersDetailDTO"%>
<%@page import="mvc_con.OrdersDetailDAO"%>
<%@page import="mvc_con.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc_con.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%
	OrdersDAO dao = new OrdersDAO();
	OrdersDetailDAO ddao = new OrdersDetailDAO();
	ProductDAO pdao = new ProductDAO();
	List<OrdersDTO> lists = dao.orderLists(sessionId);
	//가격에 쉼표 찍는용도
	NumberFormat numberFormat = NumberFormat.getInstance();
	//주문날짜 표기
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/orderList.css">
<title>주문내역 조회 페이지</title>

<body>
	<div class="wrap" class="inner">
		<div class="titleArea">
			<h2>ORDER LIST</h2>
			<%
				
			%>
		</div>
		<div class="inner">
			<div id="orderList">
				<h3>상품 주문내역</h3>
				<a href="#" onclick="history.back();">이전페이지</a>
			</div>
			<!-- 주문번호, 이미지 , 주문일, 주문상품이름, 주문자정보(id,name), 결제정보, 결제총액 -->
			<div id="orderTable" class="olist">
				<table border="1">
					<thead>
						<tr>
							<th style="width:80px;">주문번호</th>
							<th style="width:110px;">상품이미지</th>
							<th style="width:530px;">상품명</th>
							<th style="width:130px;">주문자정보</th>
							<th style="width:90px;">주문일</th>
							<th style="width:100px;">결제수단</th>
							<th style="width:160px;">결제총액</th>
						</tr>
					</thead>
					<tbody>
						<% 
						for(OrdersDTO dto:lists){
							OrdersDetailDTO ddto = ddao.orderItem(dto.getOid());
							ProductDTO pdto = pdao.selectProduct(ddto.getPid());
							String url = pdto.getPimage().substring(0,pdto.getPimage().lastIndexOf("."));
						%>
						<tr>
							<td style="width:80px;"><%=dto.getOid() %></td>
							<td style="width:110px;"><img src="./uploads/<%=url%>/<%=pdto.getPimage()%>" width=80px; height=80px;></td>
							<td style="width:530px;"><%=pdto.getPname() %>&nbsp;x<%=ddto.getOdqty() %></td>
							<td style="width:130px;">
								<p><%=dto.getMid() %></p>
								<p><%=dto.getOname() %></p>
							</td>
							<td style="width:90px;"><%=dto.getOrdate() %></td>
							<td style="width:100px;">
								<%if(dto.getOpayment().equals("1")) {
										%>무통장입금<%
									}else if(dto.getOpayment().equals("2")){
										%>신용카드<%
									}else{
										%>카카오페이<%
									}
								%>
							</td>
							<td style="width:160px;"><%=numberFormat.format((Integer.parseInt(pdto.getPprice()) * Integer.parseInt(ddto.getOdqty())))  %>원</td>
						</tr>
						<%
						}
						ddao.close();
						pdao.close();
						%>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td colspan="6" style="text-align:right;">
							
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

<%@ include file="/footer/footer.jsp" %>