<%@page import="mvc_con.CartDAO"%>
<%@page import="mvc_con.CartDTO"%>
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
	CartDAO dao = new CartDAO();
	OrdersDetailDAO ddao = new OrdersDetailDAO();
	ProductDAO pdao = new ProductDAO();
	List<CartDTO> lists = dao.selectCartList(sessionId);
	//가격에 쉼표 찍는용도
	NumberFormat numberFormat = NumberFormat.getInstance();
%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/orderList.css">
<title>주문내역 조회 페이지</title>

<body>
	<div class="wrap" class="inner">
		<div class="titleArea">
			<h2>CART</h2>
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
							<th style="width:130px;">구매갯수</th>
							<th style="width:90px;">주문일</th>
							<th style="width:100px;">결제수단</th>
							<th style="width:160px;">결제총액</th>
						</tr>
					</thead>
					<tbody>
						<% 
						for(CartDTO dto:lists){
							ProductDTO pdto = pdao.selectProduct(dto.getPid());
							String url = pdto.getPimage().substring(0,pdto.getPimage().lastIndexOf("."));
						%>
						<c:set var="price" value="<%=pdto.getPprice() %>"></c:set>
						<tr>
							<td style="width:80px;"><%=dto.getCid() %></td>
							<td style="width:110px;"><img src="./uploads/<%=url%>/<%=pdto.getPimage()%>" width=80px; height=80px;></td>
							<td style="width:530px;"><%=pdto.getPname() %></td>
							<td style="width:130px;">
								<span>
									<input type="text" value="<%=dto.getCcount() %>" id="pcount" onblur="qty_focusout();">
									<a href="#none" onclick="count('up');"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" class="up"></a>
									<a href="#none" onclick="count('down');"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" class="down"></a>
								</span>
							</td>
							<td style="width:90px;"></td>
							<td style="width:100px;">
								
							</td>
							<td style="width:160px;"><%=numberFormat.format((Integer.parseInt(pdto.getPprice()) * Integer.parseInt(dto.getCcount())))  %>원</td>
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
<script>
function count(type){
	let total = document.querySelector("#totalPrice");
	let count = document.querySelector("#pcount");
	
	let price = ${price};
	
	if(type === 'up'){
		count.value = Number(count.value) + 1;
	}else if(type === 'down'){
		if(count.value != 1){
			count.value = Number(count.value) - 1;
		}
	}
	let result = Number(price) * Number(count.value);
	let format = result.toLocaleString();
	total.innerHTML = format+"원";	
}

function qty_focusout(){
	let qty = document.querySelector("#pcount");
	let total = document.querySelector("#totalPrice");
	let price = ${price};
	
	if(qty.value < 1){
		qty.value = 1;
	}
	let result = Number(price) * Number(qty.value);
	let format = result.toLocaleString();
	total.innerHTML = format+"원";
}
</script>
<%@ include file="/footer/footer.jsp" %>