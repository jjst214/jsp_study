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
	//if(grade.equals("5") || grade.equals("10")){
		%>
		
		<div class="wrap">
			<c:if test="${sessionScope.Grade eq '5' or sessionScope.Grade eq '10'}">
			<h2 style="text-align:center; padding: 50px 0;">상품 상세(관리자)</h2>
			</c:if>
			
			<div id="productInfo" class="inner">
				<div id="pimage">
					<img src="uploads/<%=url %>/<%=dto.getPimage()%>"/>
				</div>
				<div>
					<h2 class="title"><%=dto.getPname() %></h2>
					<p><span class="product-etc">가격</span>&emsp;&emsp;<%=numberFormat.format(Integer.parseInt(dto.getPprice())) %>원</p>
					<c:if test="${sessionScope.Grade eq '5' or sessionScope.Grade eq '10'}">
					<p><span class="product-etc">재고</span>&emsp;&emsp;<%=dto.getPstock() %></p>
					</c:if>
					<p><span class="product-etc">배송방법</span>&emsp;&emsp; 택배</p>
					<p><span class="product-etc">상품설명</span></p>
					<textarea rows="20" cols="60" id="detailArea" readonly><%=dto.getPdetail() %></textarea>
					<c:choose>
					<c:when test="${sessionScope.Grade eq '5' || sessionScope.Grade eq '10' }">
					<button type="submit" id="editbtn"
					 onclick="location.href='${pageContext.request.contextPath }/mvc_con/product.do?p_type=edit&pid=<%=dto.getPid()%>'">상품수정</button>
					</c:when>
					<c:otherwise>
					<div class="selectOption">
						<h4><%=dto.getPname() %></h4>
						<span>
							<input type="text" value="1" id="pcount">
							<a href="#none" onclick="count('up');"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" class="up"></a>
							<a href="#none" onclick="count('down');"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" class="down"></a>
						</span>
						<p id="totalPrice"><%=numberFormat.format(Integer.parseInt(dto.getPprice())) %>원</p>
					</div>
					<div class="pdt_btn">
						<a href="#" onclick="loginChk(this);" id="buy">BUY IT NOW</a>
						<a href="#" onclick="loginChk(this);">ADD TO CART</a>
					</div>
					</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div id="detailView" class="inner">
				<img src="uploads/<%=url%>/<%=dto.getPimage2()%>"/>
			</div>
		</div>
		<script>
			//제품 구매 시 로그인 여부 체크
			function loginChk(e){
				let isLogin = "<%=session.getAttribute("UserId")%>";
				let qty = document.querySelector("#pcount").value;
				const buyUrl = "<%=request.getContextPath()%>/mvc_con/directorder.do?pid=<%=dto.getPid()%>&qty=";
				const addcartUrl = "${pageContext.request.contextPath }/mvc_con/cart.do?mid=<%=sessionId%>&pid=<%=dto.getPid()%>&type=add&qty=";
				if(isLogin == null || isLogin == "null"){
					location.href='${pageContext.request.contextPath }/member/login.do';
				}else{
					if(e.id == "buy"){
						//구매 버튼을 클릭하면 주문화면으로 이동
						location.href=buyUrl+qty;
						
					}else{
						//장바구니 버튼 클릭이면 카트에 추가 
						location.href=addcartUrl+qty;
					}
				}
			}
			
			function count(type){
				let total = document.querySelector("#totalPrice");
				let count = document.querySelector("#pcount");
				let num = count.value;
				
				let price = <%=dto.getPprice()%>;
				
				if(type === 'up'){
					num = Number(num) + 1;
					count.value = num;
				}else if(type === 'down'){
					if(num != 1){
						num = Number(num) - 1;
						count.value = num;
					}
				}
				let result = Number(price) * Number(num);
				let format = result.toLocaleString();
				total.innerHTML = format+"원";	
			}
		</script>
		<%
	//}else{
		%>
		
		<%
	//}
%>

<%@ include file="/footer/footer.jsp" %>