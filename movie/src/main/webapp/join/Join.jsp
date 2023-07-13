<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
	<form name="joinForm" method="post" 
	action="../member/join.do" onsubmit="return validateForm(this)">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id">
					<button class="Btn" type="button" onclick="winopen()">중복확인</button>					
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwd2"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<select id="year" name="year"></select> 년
					<select id="month" name="month"></select> 월
					<select id="day" name="day"></select> 일
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="phone1" class="phone" maxlength="3"> -
				    <input type="text" name="phone2" class="phone" maxlength="4"> -
				    <input type="text" name="phone3" class="phone" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
					<input class="Btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address" id="sample6_address" placeholder="주소"><br>
					<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="Btn" type="reset" value="취소">
					<input class="Btn" type="submit" value="회원가입">									
				</td>
			</tr>
		</table>
	</form>
<%@ include file="../footer/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		function validateForm(form) {
			if(form.id.value == "") {
				alert("아이디를 입력하세요");
				form.id.focus();
				return false;
			}			
			if(form.pwd.value == "") {
				alert("비밀번호를 입력하세요");
				form.pwd.focus();
				return false;
			}
			if(form.name.value == "") {
				alert("이름을 입력하세요");
				form.name.focus();
				return false;
			}		
			if(form.phone1.value == "" || form.phone2.value == "" || form.phone3.value == "") {
				alert("전화번호를 입력하세요");
				form.phone1.focus();
				return false;
			}
			if(form.postcode.value == "" || form.address.value == "") {
				alert("주소를 입력하세요");
				form.postcode.focus();
				return false;
			}
			if(form.detailAddress.value == "") {
				alert("상세주소를 입력하세요");
				form.detailAddress.focus();
				return false;
			}
			if(form.pwd.value != form.pwd2.value) {
				alert("비밀번호가 일치하지 않습니다");
				form.pwd2.focus();
				return false;
			}
		}
		
        // 생년 옵션을 생성합니다.
        function createYearOptions(selectElement, start, end) {
            for (let i = start; i >= end; i--) {
                let option = document.createElement('option');
                option.text = i;
                option.value = i;
                selectElement.appendChild(option);
            }
        }
        function createMonthOptions(selectElement, start, end) {
            for (let i = start; i <= end; i++) {
                let option = document.createElement('option');
                option.text = i;
                option.value = i;
                selectElement.appendChild(option);
            }
        }

        // 생년 select 요소를 가져옵니다.
        let yearSelect = document.getElementById('year');
        let monthSelect = document.getElementById('month');
        let daySelect = document.getElementById('day');

        // 년도 옵션을 생성합니다.
        createYearOptions(yearSelect, 2023, 1900);
        createMonthOptions(monthSelect, 1, 12);
        createMonthOptions(daySelect, 1, 31);
        
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
        
        let id = document.querySelector("#id");
        function winopen(){
        	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
        	//1. 아이디가 없으면 알림창과 진행x    
        	console.log(id.value);
        	if(id.value =="" || id.value.length < 0){
        		alert("아이디를 먼저 입력해주세요");
        		id.focus();
        	}else{
        		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
        		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
        		window.open("joinIdCheck.jsp?userid="+id.value,"","width=500, height=300");
        	}
        }
    </script>