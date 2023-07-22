<%@page import="java.text.NumberFormat"%>
<%@page import="mvc_con.ProductDTO"%>
<%@page import="mvc_con.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc_con.CartDAO"%>
<%@page import="mvc_con.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/deliveryForm.css">
<%@ include file="/header/header.jsp" %>
	<%
	int totalPrice = 0;
	String pid = session.getAttribute("pid").toString();
	String qty = session.getAttribute("qty").toString();
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(pid);
	MemberDAO mem = new MemberDAO();
	MemberDTO mdto = mem.getMemberInfo(sessionId);
	mem.close();
	//가격에 쉼표 찍는용도
	NumberFormat numberFormat = NumberFormat.getInstance();
	%>
<title>상품 주문 페이지</title>
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
				<table border="1">
					<thead>
						<tr>
							<th style="width:60px;"></th>
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
						String url = dto.getPimage().substring(0,dto.getPimage().lastIndexOf("."));
						
						%>
						
						<tr>
							<!-- <td style="width:60px;"><input type="checkbox" name="chkbox" value="<%=dto.getPid() %>" onclick="checkSelectAll(this)"/></td>-->
							<td style="width:60px;"><a href="#none" class="delBtn" onclick="delete_check();"><img src="${pageContext.request.contextPath }/images/ico/x-symbol.png"/></a></td>
							<td style="width:100px;"><img src="./uploads/<%=url %>/<%=dto.getPimage()%>" width=80px; height=80px;"></td>
							<td style="width:600px;"><%=dto.getPname() %></td>
							<td style="width:130px;"><%=numberFormat.format(Integer.parseInt(dto.getPprice())) %>원</td>
							<td style="width:50px;"><%=qty %></td>
							<td style="width:100px;">기본배송</td>
							<td style="width:160px;"><%=numberFormat.format(Integer.parseInt(dto.getPprice()) * Integer.parseInt(qty))%>원</td>
						</tr>
					</tbody>
					
						<%
						totalPrice += Integer.parseInt(dto.getPprice()) * Integer.parseInt(qty);
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
			</div>
			<div id="orderWrite">
				<h5 class="delInfo">배송 정보</h5>
				<form method="post" action="${pageContext.request.contextPath }/mvc_con/directorder.do" onsubmit="return validateForm(this)">
				<input type="hidden" value="<%=qty %>" name="qty"/>
				<input type="hidden" value="<%=totalPrice %>" name="total"/>
				<input type="hidden" value="<%=pid %>" name="pid"/>
				<table border="1">
					<tr>
						<th>본인 수령여부</th>
						<td><input type="checkbox" name="self" onclick="toggle(this)"></td>
					</tr>
					<tr>
						<th>받으시는 분<strong>&nbsp;*</strong></th>
						<td><input type="text" name="name" id="name" class="order-name" placeholder="이름"></td>
					</tr>
					<tr>
						<th>주소<strong>&nbsp;*</strong></th>
						<td>
							<input class="order-post"type="text" name="postcode" id="sample6_postcode" readonly>
							<input class="Btn order-post" type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
							<input class="order-addr" type="text" name="address" id="sample6_address" placeholder="주소"><br>
							<input class="order-addr2" type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소">
							<input class="order-addr3" type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목">
						</td>
					</tr>
					<tr>
						<th>연락처<strong>&nbsp;*</strong></th>
						<td>
							<input class="order-phone" type="text" name="phone1" id="phone1" class="phone" maxlength="3"> -
						    <input class="order-phone2" type="text" name="phone2" id="phone2" class="phone" maxlength="4"> -
						    <input class="order-phone2" type="text" name="phone3" id="phone3" class="phone" maxlength="4">
						</td>
					</tr>
				</table>
				<h5 class="delInfo">결제수단</h5>
				<div class="payArea">
					<div class="payment">
						<div class="payment-type">
							<div><input type="radio" id="pay1" name="payment" value="1" checked>무통장입금</div>
							<div><input type="radio" id="pay2" name="payment" value="2">신용/체크카드</div>
							<div><input type="radio" id="pay3" name="payment" value="3">카카오페이</div>
						</div>
						<div class="payment-form">
							
						</div>
					</div>
					<div class="total">
					</div>
				</div>
				<div class="order-btns">
					<input type="submit" value="주문하기">
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	function toggle(e){
		let name = document.getElementById('name');
		let post = document.getElementById('sample6_postcode');
		let addr = document.getElementById('sample6_address');
		let addr2 = document.getElementById('sample6_detailAddress');
		let phone1 = document.getElementById('phone1');
		let phone2 = document.getElementById('phone2');
		let phone3 = document.getElementById('phone3');
		if(e.checked){
			name.value="<%=mdto.getmNAME()%>";
			post.value="<%=mdto.getmPOST()%>";
			addr.value="<%=mdto.getmADDRESS().substring(0,mdto.getmADDRESS().lastIndexOf("/"))%>";
			addr2.value="<%=mdto.getmADDRESS().substring(mdto.getmADDRESS().lastIndexOf("/")+1, mdto.getmADDRESS().length())%>";
			phone1.value="<%=mdto.getmPHONE().substring(0,3)%>";
			phone2.value="<%=mdto.getmPHONE().substring(3,7)%>";
			phone3.value="<%=mdto.getmPHONE().substring(7,11)%>";
		}else{
			name.value="";
			post.value="";
			addr.value="";
			addr2.value="";
			phone1.value="";
			phone2.value="";
			phone3.value="";
		}
	}
	function delete_check(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}else{
			const url = "${pageContext.request.contextPath }/mvc_con/cart.do?type=delete&mid=<%=sessionId%>&pid=<%=dto.getPid()%>";
			location.href=url;
		}
	}
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	function validateForm(form) {
		if(form.name.value == "") {
			alert("이름을 입력하세요");
			form.name.focus();
			return false;
		}			
		if(form.postcode.value == "") {
			alert("우편번호를 검색해주세요");
			form.postcode.focus();
			return false;
		}
		if(form.address.value == "" || form.detailAddress.value == "") {
			alert("주소를 정확히 입력해주세요");
			form.detailAddress.focus();
			return false;
		}		
		if(form.phone1.value == "" || form.phone2.value == "" || form.phone3.value == "") {
			alert("전화번호를 입력하세요");
			form.phone1.focus();
			return false;
		}
		if(form.pwd.value != form.pwd2.value) {
			alert("비밀번호가 일치하지 않습니다");
			form.pwd2.focus();
			return false;
		}
	}
</script>
<%@ include file="/footer/footer.jsp" %>