<%@page import="java.text.NumberFormat"%>
<%@page import="mvc_con.ProductDTO"%>
<%@page import="mvc_con.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc_con.CartDAO"%>
<%@page import="mvc_con.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
	<%
	int totalPrice = 0;
	String pid = session.getAttribute("pid").toString();
	String qty = session.getAttribute("qty").toString();
	CartDAO dao = new CartDAO();
	List<CartDTO> lists = dao.selectCartList(sessionId);
	//가격에 쉼표 찍는용도
	NumberFormat numberFormat = NumberFormat.getInstance();
	%>
	
<body>
	<div class="wrap" class="inner">
		<div class="titleArea">
			<h2>ORDER</h2>
		</div>
		<div class="inner">
			<div id="orderList">
				<h3>상품 주문내역</h3>
				<a href="#" onclick="history.back();">이전페이지</a>
			</div>
			<div id="orderTable">
				<form method="post" action="">
				<table border="1">
					<thead>
						<tr>
							<th style="width:60px;"><input type="checkbox" name="selectall" value="selectall" onclick="selectAll(this)"></th>
							<th style="width:100px;">이미지</th>
							<th style="width:600px;">상품정보</th>
							<th style="width:130px;">판매가</th>
							<th style="width:50px;">수량</th>
							<th style="width:100px;">배송구분</th>
							<th style="width:160px;">합계</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(CartDTO item:lists){
						ProductDAO productDao = new ProductDAO();
						ProductDTO productInfo = productDao.selectProduct(item.getPid());
						String url = productInfo.getPimage().substring(0,productInfo.getPimage().lastIndexOf("."));
						
						%>
						
						<tr>
							<td style="width:60px;"><a href="#none" onclick="delete_check();"></a></td>
							<td style="width:100px;"><img src="./uploads/<%=url %>/<%=productInfo.getPimage()%>" width=80px; height=80px;"></td>
							<td style="width:600px;"><%=productInfo.getPname() %></td>
							<td style="width:130px;"><%=productInfo.getPprice() %></td>
							<td style="width:50px;"><%=item.getCcount() %></td>
							<td style="width:100px;">기본배송</td>
							<td style="width:160px;"><%=numberFormat.format(Integer.parseInt(productInfo.getPprice()) * Integer.parseInt(item.getCcount()))%>원</td>
						</tr>
						
					</tbody>
					
						<%
						totalPrice += Integer.parseInt(productInfo.getPprice()) * Integer.parseInt(item.getCcount());
						}
					%>
					<tfoot>
						<tr>
							<td></td>
							<td colspan="6" style="text-align:right;">
								<span>상품구매합계: <%=numberFormat.format(totalPrice) %>원</span>
							</td>
						</tr>
					</tfoot>
				</table>
				</form>
				<div id="deletePdt">
					
				</div>
			</div>
		</div>
	</div>

	<script>
	//전체선택/해제
	function checkSelectAll(checkbox)  {
	  const selectall = document.querySelector('input[name="selectall"]');
	  
	  if(checkbox.checked === false)  {
	    selectall.checked = false;
	  }
	}

	function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('chkbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	function delete_check(){
		const checkboxes = 'input[name="chkbox"]:checked';
		const selected = document.querySelectorAll(checkboxes);
		if(selected.length == 0){
			alert("삭제 할 상품을 선택해주세요.");
			return false;
		}else{
			if(!confirm("정말 삭제하시겠습니까?")){
				return false;
			}else{
				location.href('${pageContext.request.contextPath }/index.jsp?sel='+selected);
			}
		}
	}
</script>
<%@ include file="/footer/footer.jsp" %>