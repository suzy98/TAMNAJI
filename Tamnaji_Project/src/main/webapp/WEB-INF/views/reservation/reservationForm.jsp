<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<style>

	
	/*----------------------------------------------------------------------*/
	/*컨텐츠 관련*/
	
	
	
	#aside {
	  margin-left: 8%;
	  width: 700px;
	  height: 100%;
	  margin-bottom: 20%;
	}
	
	
	
	#right-content {
	  margin-left: 5%;
	  width: 300px;
	  height: 100%;
	  border: 1px solid pink;
	  display: inline-block;
	  
	}
	
	
	
			select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
			input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
			textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
	
	
	/*-------------------------------------------*/
	
	
	/*예약 박스 -------------------------------------------*/
	
	#right-box {
		left: 73%;
		width: 320px;
		height: 320px;
		border-radius: 50px;
		padding: 10px;
		background-color: white;
		box-shadow: 0 0 5px rgb(220, 217, 215);
		position: fixed;
	}
	
	#space-text {
	  margin-top: 30px;
	  margin-bottom: 30px;
	  margin-left: 10px;
	  font-size: 15px;
	}
	
	#space-price {
		font-size: 27px;
	}
	
	#space-res {
		margin-bottom: 30px;
		text-align: center;
	}
	
	#space-res button {
		background-color: rgb(99, 199, 99);
		color: white;
		width: 270px;
		padding: 13px;
		border: none;
		border-radius: 50px;
		font-size: 20px;
	}
	
	#space-res button:hover {
	  background-color: #0ba52f;
	  cursor: pointer;
	}
	
	
	/*환불계좌명 선택 -----------------------------------------*/
	
	.select-box {
		 position: relative;
	   float: left;
		 display: block;
		 width: 90px;
	   padding-left: 1px;
	   margin-right: 10px;
	   font-size: 14px;
	   text-align: center;
	   border-radius: 10px;
	
	}
	
	 .select-box__current {
		 position: relative;
		 cursor: pointer;
		 outline: none;
	   background-color: #fcfcfc;
	   color: rgb(90, 90, 90);
	   border: none;
	   border-radius: 10px;
	}
	 .select-box__current:focus + .select-box__list {
		 opacity: 1;
		 animation-name: none;
	}
	 .select-box__current:focus + .select-box__list .select-box__option {
		 cursor: pointer;
	}
	 .select-box__current:focus .select-box__icon {
		 transform: translateY(-50%) rotate(180deg);
	}
	 .select-box__icon {
		 position: absolute;
		 top: 50%;
		 right: 15px;
		 transform: translateY(-50%);
		 width: 10px;
		 opacity: 0.3;
		 transition: 0.2s ease;
	}
	 .select-box__value {
		 display: flex;
		 border-radius: 50px;
	
	}
	 .select-box__input {
		 display: none;
	}
	 .select-box__input:checked + .select-box__input-text {
		 display: block;
	}
	 .select-box__input-text {
		 display: none;
		 width: 100%;
		 margin: 0;
		 padding: 11px;
	   padding-left: 1px;
	   background-color: #fcfcfc;
	   box-shadow: 0 0 1px rgb(138, 136, 136);
	   border: none;
	   text-align: center;
	   border-radius: 10px;
	}
	 .select-box__list {
		 position: absolute;
		 width: 100%;
		 padding: 0;
		 list-style: none;
		 opacity: 0;
		 animation-name: HideList;
		 animation-duration: 0.5s;
		 animation-delay: 0.5s;
		 animation-fill-mode: forwards;
		 animation-timing-function: step-start;
	   background-color: #fcfcfc;
	   border: none;
	   border-radius: 10px;
	}
	 .select-box__option {
		 display: block;
		 padding: 5px;
	   background-color: #fcfcfc;
	}
	 .select-box__option:hover, .select-box__option:focus {
		 background-color: #ddf1db;
		 cursor: pointer;
	}
	 @keyframes HideList {
		 from {
			 transform: scaleY(1);
		}
		 to {
			 transform: scaleY(0);
		}
	}
	
	
	#help {
		margin-top: 10px;
		background-color: #fcfcfc;
		box-shadow: 0 0 2px #c5c5c5;
	}
	
	#help li {
		width: 90px;
		border: none;
		box-shadow: none;
		background: none;
		border-radius: 10px;
		padding: 5px;
	}
	
	#help li:last-child {
		width: 90px;
		background: white;
		border: none;
		border-radius: 20px;
		padding: 5px;
	}
	
	
	
	
	/*공간 예약 정보 -----------------------------*/
	
	#res-table {
	  width: 700px;
	  height: 200px;
	  border-collapse: separate;
	  border-radius: 10px;
	  box-shadow: 0 0 1px rgb(230, 230, 230);
	  border: 1px solid rgba(238, 238, 238, 0.911);
	  margin-bottom: 50px;
	}
	
	
	
	#res-table-image {
	  width: 300px;
	  height: 200px;
	  border-spacing: 0 1px;
	  border-top-left-radius: 10px;
	  border-bottom-left-radius: 10px;
	  display: block;
	  border-collapse: collapse;
	  border-collapse: 0;
	}
	
	#res-title,#res-info-title {
	  margin-top: 50px;
	  margin-bottom: 50px;
	  padding-bottom: 40px;
	  font-size: 25px;
	  border-bottom: 1px solid rgb(240, 239, 239);
	}
	
	#space-header {
	  padding-top: 15px;
	  width: 340px;
	  height: 50px;
	  padding-bottom: 20px;
	  font-size: 23px;
	  font-weight: bold;
	  border-spacing: 0 1px;
	  
	}
	
	.res-detail {
	  font-weight: 600;
	  font-size: 13px;
	}
	
	.res-detail-2 {
	  font-size: 13px;
	}
	
	
	/*예약자 정보*/
	
	#res-user-table {
	  width: 500px;
	  height: 200px;
	  font-size: 17px;
	}
	
	.res-user-input {
	  width: 410px;
	  height: 45px;
	  background-color: #fcfcfc;
	  box-shadow: 0 0 1px rgb(138, 136, 136);
	  border: none;
	  padding: 10px;
	  padding-left: 20px;
	  margin-bottom: 40px;
	  border-radius: 10px;
	}
	
	.account-input {
	  height: 40px;
	  background-color: #fcfcfc;
	  box-shadow: 0 0 1px rgb(138, 136, 136);
	  border: none;
	  padding: 10px;
	  padding-left: 20px;
	  margin-right: 5px;
	  margin-bottom: 40px;
	  border-radius: 10px;
	}
	
	
	.res-user-title {
	  margin-bottom: 20px;
	}
	
	
	/*결제 라디오 버튼*/
	.rad-label {
	  display: flex;
	  align-items: center;
	
	  border-radius: 100px;
	  padding: 14px 16px;
	  margin: 0px;
	  cursor: pointer;
	  transition: .3s;
	}
	
	.rad-label:hover,
	.rad-label:focus-within {
	  background: hsla(0, 0%, 80%, .14);
	}
	
	.rad-input {
	  position: absolute;
	  left: 0;
	  top: 0;
	  width: 1px;
	  height: 1px;
	  opacity: 0;
	  z-index: -1;
	}
	
	.rad-design {
	  width: 22px;
	  height: 22px;
	  border-radius: 100px;
	
	  background: linear-gradient(to right bottom, hsl(120, 44%, 85%), hsl(113, 78%, 39%));
	  position: relative;
	}
	
	.rad-design::before {
	  content: '';
	
	  display: inline-block;
	  width: inherit;
	  height: inherit;
	  border-radius: inherit;
	
	  background: hsl(0, 0%, 90%);
	  transform: scale(1.1);
	  transition: .3s;
	}
	
	.rad-input:checked+.rad-design::before {
	  transform: scale(0);
	}
	
	.rad-text {
	  color: hsl(0, 0%, 60%);
	  margin-left: 14px;
	  letter-spacing: 3px;
	  text-transform: uppercase;
	  font-size: 18px;
	
	  transition: .3s;
	}
	
	.rad-input:checked~.rad-text {
	  color: hsl(0, 0%, 40%);
	  font-weight: 800;
	}
	
	i {
	  color: rgb(140, 173, 130);
	  margin-right: 5px;
	}
	
	  </style>

</head>
<body>
	
	<jsp:include page="../common/header.jsp" />

	  <!-- 여기부터 컨텐츠 영역 ---------------------------->
  
  <div class="container" style=" padding-top:5%; margin: 0 auto; height: 800px;">
	<div style="margin: 0 auto; padding-left: 8%; float: left; padding-bottom: 50px;">
	  <p id="res-title">예약하기</p>
	  <table id="res-table">
		<tr>`
		  <td rowspan="7">
			<img id="res-table-image" src="${space.changeName}"></td>
		  <td id="space-header" colspan="2">${space.spaceTitle}</td>
		</tr>
		<tr>
		  <td class="res-detail">
			<i class="fa fa-check-square" aria-hidden="true"></i>
			공간 정보</td>
		  <td class="res-detail-2">${space.categoryName} >${space.categoryDetail}</td>
		</tr>
		<tr>
		  <td class="res-detail">
			<i class="fa fa-check-square" aria-hidden="true"></i> 
			예약 타입</td>
		  <td id="item_name" class="res-detail-2">${room.roomTitle}</td>
		</tr>
		<tr>
		  <td class="res-detail">
			<i class="fa fa-check-square" aria-hidden="true"></i> 
			체크인</td>
		  <td class="res-detail-2"><span id="check_In_Date">
			<fmt:parseDate value="${body.checkInDate}" var="checkInValue" pattern="yyyyMMdd" />
			<fmt:formatDate value="${checkInValue}" pattern="yyyy년 MM월 dd일" />
		</span> 15시</td>
		</tr>
		<tr>
		  <td class="res-detail">
			<i class="fa fa-check-square" aria-hidden="true"></i>
			 체크아웃</td>
		  <td class="res-detail-2"><span id="check_Out_Date">
			<fmt:parseDate value="${body.checkOutDate}" var="checkOutValue" pattern="yyyyMMdd" />
			<fmt:formatDate value="${checkOutValue}" pattern="yyyy년 MM월 dd일" />
		</span> 12시</td>
		</tr>
		<tr>
			<td class="res-detail">
				<i class="fa fa-check-square" aria-hidden="true"></i>
				이용일수</td>
			<td class="res-detail-2"><span id="quantity">${body.stayPeriod}</span>일</td>
		</tr>
		<tr>
		  <td class="res-detail" style="padding-bottom: 10px;">
			<i class="fa fa-check-square" aria-hidden="true"></i>
			 예약 인원</td>
		  <td class="res-detail-2" style="padding-bottom: 8px;">${body.peopleCount}명</td>
		</tr>
	  </table>
  </div>
  
  <div style="float: right; margin-top: 2.5%; margin-right: 7%; justify-content: space-between;">
	<div id="right-box">
	  
	  <div id="space-text"><span id="space-price">₩<b id="price">${room.price * body.stayPeriod * body.peopleCount}</b>원</span>&nbsp; / 최종 금액</div>
	  <div id="space-res">
		<button id="pay-btn">결제하기</button>
	  </div>
	  
	  <div id="payment">
		<label class="rad-label">
		  <input type="radio" class="rad-input" name="paymentMethod" value="카카오페이">
		  <div class="rad-design"></div>
		  <div class="rad-text">카카오페이
			<img width="40px" height="18px" src="https://cdnimage.ebn.co.kr/news/201902/news_1550115035_972617_main1.png">
		  </div>
		</label>
	  
		<label class="rad-label">
		  <input type="radio" class="rad-input" name="paymentMethod" value="무통장입금">
		  <div class="rad-design"></div>
		  <div class="rad-text">무통장입금</div>
		</label>
	  </div>
  
	</div>
  
  </div>
  
  
  
	<div class="content" id="aside">    
  
	 <div id="res-information">
		<p id=res-info-title>예약자 정보</p>
		
		<table id="res-user-table" >
		  <tr>
			<td>
			<p class="res-user-title">* 이름</p>  
			<input id="reservationName" type="text" class="res-user-input" required value="${loginUser.memberName}"/>
			</td>
		  </tr>
  
		  <tr>
			<td>          
			<p class="res-user-title">* 연락처</p>
			<c:choose>
				<c:when test="${loginUser.phone eq null}">
					<input id="phone" type="text" class="res-user-input" placeholder="- 없이 숫자만 입력" required="true" />
				</c:when>
				<c:otherwise>
					<input id="phone" type="text" class="res-user-input" placeholder="- 없이 숫자만 입력" value="${loginUser.phone}" required="true"/>
				</c:otherwise>
			</c:choose>
		  </td>
  
		  </tr>
		  <tr>
			<td>
			<p class="res-user-title">* 이메일</p>  
			<input id="email" type="email" class="res-user-input" required value="${loginUser.memberId}"/>
			</td>
		  </tr>
		  <tr>
			<td>
			  <p class="res-user-title">환불 계좌 (무통장입금 시 필수 입력)</p>
			  <div class="select-box">
				<div class="select-box__current" tabindex="1">
					<div class="select-box__value"><input class="select-box__input" type="radio" id="0" value="국민" name="bankName" checked="checked" />
						<p class="select-box__input-text" style="padding-left: 1px;">국민</p>
					</div>
					<div class="select-box__value"><input class="select-box__input" type="radio" id="1" value="우리" name="bankName" />
						<p class="select-box__input-text">우리</p>
					</div>
					<div class="select-box__value"><input class="select-box__input" type="radio" id="2" value="신한" name="bankName" />
						<p class="select-box__input-text">신한</p>
					</div>
					<div class="select-box__value"><input class="select-box__input" type="radio" id="3" value="농협" name="bankName" />
						<p class="select-box__input-text">농협</p>
					</div>
					<div class="select-box__value"><input class="select-box__input" type="radio" id="4" value="기업" name="bankName" />
						<p class="select-box__input-text">기업</p>
					</div>
					<div class="select-box__value"><input class="select-box__input" type="radio" id="5" value="카카오" name="bankName" />
						<p class="select-box__input-text">카카오</p>
					</div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true" />
				</div>
				<ul class="select-box__list" id="help">
					<li><label class="select-box__option" for="0" aria-hidden="aria-hidden">국민</label></li>
					<li><label class="select-box__option" for="1" aria-hidden="aria-hidden">우리</label></li>
					<li><label class="select-box__option" for="2" aria-hidden="aria-hidden">신한</label></li>
					<li><label class="select-box__option" for="3" aria-hidden="aria-hidden">농협</label></li>
					<li><label class="select-box__option" for="4" aria-hidden="aria-hidden">기업</label></li>
					<li><label class="select-box__option" for="5" aria-hidden="aria-hidden">카카오</label></li>
				</ul>
			</div>
			  <input id="accountName" type="text" class="account-input" placeholder="예금주" value="${loginUser.memberName}" style="width: 100px;"/>
			  <input id="accountNumber" type="text" class="account-input" placeholder="계좌번호 (- 없이 숫자만 입력)" value="${loginUser.accountNumber}" style="width: 200px;">
			</td>
		  </tr>
		</table>
		
	 </div>
  </div>
	
	<script>

		$(function(){

			var bank__ = "";
			var bankObj__ = document.getElementsByClassName('select-box__option');
			var bankNameObj__ = document.getElementsByClassName('select-box__input');
			for(var bo = 0; bo < bankObj__.length; bo++){
				if( bankObj__[bo].innerText == "${loginUser.bankName}"){
					bankNameObj__[bo].checked = true;
				}
			}

			var item_name = document.getElementById("item_name");
			var total_amount = document.getElementById('price').innerText;
			var quantity = document.getElementById('quantity').innerText;
			/*
			var total_amount = parseInt(price)*parseInt(quantity);
			console.log(total_amount);
			document.getElementById('total_amount').innerText = total_amount;
			*/
			
			


			document.getElementById('pay-btn').addEventListener('click', () => {
						
						var paymentMethod_ = "";
						var obj_ = document.getElementsByName('paymentMethod');
						for(var i = 0; i < obj_.length; i++){
							if(obj_[i].checked == true){
								paymentMethod_ = obj_[i].value;
							}
						}
				
						var phone__ = $('#phone');
						var name__ = $('#reservationName');
						var email__ = $('#email');
						var accountName__ = $('#accountName');
						var accountNumber__ = $('#accountNumber');
								
								if( phone__.val() != "" && name__.val() != "" && email__.val()  != "" && paymentMethod_ != "" ){
									if(paymentMethod_ == '카카오페이'){
										payProcess(item_name, quantity, total_amount, paymentMethod_);
									} else {
										if( accountName__.val() != "" && accountNumber__.val() != ""){
											payProcess(item_name, quantity, total_amount, paymentMethod_);
										}	else {
											alert("필수 입력 값을 입력해주세요.");
										}
									}
								} else {
									alert("필수 입력 값을 입력해주세요.");
								}
				})

		});
		
		function payProcess(item_name, quantity, total_amount, paymentMethod_){ 
			var bankName_ = "";
			var bankObj_ = document.getElementsByName('bankName');
			for(var b = 0; b < bankObj_.length; b++){
				if( bankObj_[b].checked == true){
					bankName_ =bankObj_[b].value;
				}
			}

			var body = {
			paymentMethod : paymentMethod_
			, roomNo : parseInt("${room.roomNo}")
			, checkInDate : "${body.checkInDate}"
			, checkOutDate : "${body.checkOutDate}"
			, memberNo : parseInt("${loginUser.memberNo}")
			, memberId : "${loginUser.memberId}"
			, reservationName : document.getElementById('reservationName').value
			, phone : document.getElementById('phone').value
			, email : document.getElementById('email').value
			, item_name : item_name.innerText
			, quantity : quantity
			, total_amount : String(total_amount)
			, peopleCount : parseInt("${body.peopleCount}")
			, payload : "${space.spaceTitle} ${room.roomTitle} 예약"
			, bankName : bankName_
			, accountName : document.getElementById('accountName').value
			, accountNumber : document.getElementById('accountNumber').value
			}

			if(paymentMethod_ == '카카오페이'){
				fetch(
				"reservation/kakaopay"
				, {
					headers:{"content-type":"application/json; charset=UTF-8"}
					, body:JSON.stringify(body)
					, method:'post'
				})
				.then(res => res.json())
				.then(res => {
					var url = res.next_redirect_pc_url;	// 파싱한 JSON 값에서 원하는 키 값을 입력해 벨류값을 뽑아온다.
					location.href = url;
				})
				.catch( err => {

				})
			} else {
				deposit_Submit(body);
			}
		}
		
		function deposit_Submit(body){

			var formLayout = document.createElement("form"); // 폼객체 생성
				formLayout.setAttribute("charset", "UTF-8");
				formLayout.setAttribute("method", "post"); //GET, POST
				formLayout.setAttribute("action", 'reservation/deposit');

				for (let [key, value] of Object.entries(body)) {
					if(key == 'roomNo' || key == 'memberNo' || key == "peopleCount" ){
						inputCreate(formLayout, "number", key, value);
					}
					inputCreate(formLayout, "text", key, value);
				}
				

				document.body.appendChild(formLayout); //body에 폼 레이아웃 추가
				formLayout.submit(); //실행 및 제출 실시
				document.body.removeChild(formLayout); //body에서 폼 레이아웃 삭제  	
			}	

		function inputCreate(formLayout, type_, name_, value_){
			var inputLayout = document.createElement("input"); // input 객체 생성
			inputLayout.setAttribute("type", type_);
			inputLayout.setAttribute("name", name_);
			inputLayout.setAttribute("value", value_);
			formLayout.appendChild(inputLayout); // 폼에 추가 실시
		};

	</script>
	
	
    <script>
    $(window).scroll(function(){    
    $("#right-box").css("margin-top",Math.max(-70,0-$(this).scrollTop()));});
    </script>
   
	
	
	<br><br><br><br><br>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>
