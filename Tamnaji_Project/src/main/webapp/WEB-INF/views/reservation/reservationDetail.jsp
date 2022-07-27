<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
@font-face {
font-family: 'NanumSquareRound';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
font-weight: normal;
font-style: normal;
}

/* 만들어놓고 필요한 곳에서 쓸 수 있다 */
:root {
--text-color: black;
--background-color: #f8ded2;
--accent-color: #ff4d00;
}

/* 폰트는 최상위 컴포넌트에 */
* {
box-sizing: border-box;
font-family: 'NanumSquareRound';
}


*:focus {
outline: 0;
}
* input::-webkit-outer-spin-button,
* input::-webkit-inner-spin-button {
-webkit-appearance: none;
margin: 0;
}

body {
background-color: #f5f5f5;
font-family: "Barlow", sans-serif;
font-weight: normal;
background-color: white;
}


.wrapper {
width: 100%;
height: 100vh;
min-height: 400px;
font-family: "Barlow", sans-serif;
display: grid;
grid-template-columns: 1fr;
align-items: center;
justify-content: center;
position: relative;
padding: 0 5%;
}
@media screen and (max-width: 460px) {
.wrapper {
height: auto;
min-height: 100vh;
padding: 0 16px;
}
}

.container {
background-color: transparent;
margin: 40px auto;
text-align: center;
transition: all 0.4s ease;
display: flex;
justify-content: center;
align-items: center;
height: 300px;
}
@media screen and (max-width: 460px) {
.container {
margin: 20px auto;
}
}
.container .cta {
background-color: #59cc59;
color: #ffffff;
padding: 0px 20px;
border: none;
border-radius: 40px;
transition: all 0.3s ease;
font-weight: bold;
font-size: 20px;
line-height: 14px;
height: 50px;
text-align: center;
letter-spacing: 0.06em;
text-transform: uppercase;
cursor: pointer;
box-shadow: 0px 0px 5px rgb(187, 202, 183);
transform: translateY(8px);
}
.container .cta:hover {
box-shadow: 0px 10px 20px rgba(176, 250, 161, 0.4);
}
.container .thanks {
margin-bottom: 12px;
font-weight: 600;
font-size: 30px;
line-height: 20px;
position: absolute;
transform: translateY(-60px);
padding-bottom: 100px;
}

.container .thanks span {
color: gray;
}
.thanks span {
font-size: 15px;
}

.receipt {
max-width: 550px;
width: 100%;
padding: 40px;
background-color: #f5faf5;
margin: 0px auto 0;
text-align: initial;
transition: all 0.3s ease;
display: none;
border-top: dashed 2px #e7f1e4;
border-bottom: dashed 2px #e7f1e4;
}
@media screen and (max-width: 460px) {
.receipt {
padding: 16px;
margin: 28px auto 0;
}
}
.receipt__message {
text-align: center;
border-bottom: 2px solid #e7f1e4;
padding: 8px 8px 50px 8px;
}
.receipt__title {
margin-bottom: 32px;
font-weight: 600;
font-size: 20px;
line-height: 28px;
}
.receipt__text {
margin-bottom: 24px;
font-size: 14px;
line-height: 22px;
}
.receipt .product {
display: flex;
align-items: center;
border-bottom: 2px solid #e7f1e4;
padding: 16px 8px;
}
.receipt .product__name {
font-size: 16px;
line-height: 24px;
font-weight: 600;
margin-bottom: 8px;
}
.receipt .product__quantity {
font-size: 14px;
line-height: 22px;
}
.receipt .product__image {
border: 1px solid #e7f1e4;
width: 90px;
height: 70px;
background-color: white;
margin-right: 16px;
}
.receipt .product__image img {
width: 100%;
height: 100%;
object-fit: cover;
}
.receipt .price__pricing {
display: flex;
justify-content: space-between;
margin: 16px 2px;
padding: 0 8px;
font-size: 14px;
line-height: 22px;
font-weight: 500;
}
.receipt .price__pricing:last-of-type {
margin-bottom: 0px;
}
.receipt .price__total {
display: flex;
justify-content: space-between;
padding: 16px 2px;
border-top: 2px solid #e7f1e4;
font-weight: 500;
font-size: 16px;
line-height: 10px;
}

.receipt .pay__total {
display: flex;
justify-content: space-between;
padding: 20px 2px;
border-top: 2px solid #e7f1e4;
font-weight: 500;
font-size: 16px;
line-height: 10px;
}

.receipt .pay__account {
display: flex;
justify-content: space-between;
padding: 0px 2px;
font-weight: 500;
font-size: 13px;
line-height: 20px;
margin-bottom: 20px;
}

.receipt .pay__totalName {
font-weight: bold;
}

.receipt .price__totalNumber {
font-weight: bold;
}
.receipt .info__infoTitle {
padding: 0 8px;
font-size: 16px;
line-height: 24px;
font-weight: 600;
}
.receipt .info__addressContent {
display: flex;
margin-top: 16px;
}
@media screen and (max-width: 460px) {
.receipt .info__addressContent {
flex-direction: column;
}
}
.receipt .info__address {
background-color: #d7f2d4;
margin-right: 16px;
padding: 16px;
font-size: 12px;
line-height: 18px;
width: 50%;
}
.receipt .info__address:last-of-type {
margin-right: 0px;
}
@media screen and (max-width: 460px) {
.receipt .info__address {
margin-right: 0px;
margin-bottom: 16px;
width: 100%;
}
.receipt .info__address:last-of-type {
margin-bottom: 0px;
}
}
.receipt .info__addressTitle {
margin-bottom: 8px;
font-weight: 600;
font-size: 12px;
line-height: 18px;
}
.receipt .btn {
font-weight: bold;
font-size: 12px;
line-height: 14px;
text-align: center;
letter-spacing: 0.06em;
text-transform: uppercase;
padding: 8px 16px;
background-color: #4ac21b;
border-radius: 50px;
color: white;
transition: all 0.4s ease;
cursor: pointer;
text-decoration: none;
}
.receipt .btn:hover {
box-shadow: inset 0px -40px 0px #fa8f3d;
color: white;
}

.anime {
position: relative;
max-width: 480px;
width: 100%;
overflow: hidden;
}
@media screen and (max-width: 460px) {
.anime {
padding: 0 20px;
}
}
.anime:before, .anime:after {
position: absolute;
content: "";
width: 150px;
height: 20px;
animation: bg 0.7s 0.2s ease forwards;
border-radius: 40px 40px 0px 0px;
z-index: 1;
box-shadow: inset 0px 19px 0px #59cc59;
background-color:  #59cc59;
transition: all 0.3s ease;
}
.anime:after {
margin-top: 20px;
z-index: -1;
border-radius: 0px 0px 40px 40px;
box-shadow: inset 0px -18px 0px #59cc59;
}
@keyframes bg {
0% {
background-color: #59cc59;
width: 140px;
top: 50%;
}
50% {
background-color: #59cc59;
width: 100%;
}
100% {
background-color: #3b963b;
width: 100%;
top: 0px;
}
}
.anime .thanks  {
display: none;
}
.anime .receipt {
animation: receipt 2s 1.2s ease both;
display: block;
}
@keyframes receipt {
0% {
transform: translateY(-110%);
}
20% {
transform: translateY(-90%);
}
30% {
transform: translateY(-80%);
}
40% {
transform: translateY(-70%);
}
60% {
transform: translateY(-60%);
}
70% {
transform: translateY(-40%);
}
100% {
transform: translateY(0%);
}
}
.anime .cta {
display: none;
}

/*모달------------------------------------*/
.popup-wrap {
	 width: 100%;
	 height: 100%;
	 display: none;
	 position: absolute;
	 top: -40px;
	 left: 0px;
   background:rgba(0, 0, 0, 0.5);
}
 .popup-box {
	 width: 450px;
	 padding: 70px;
	 transform: translate(-50%, -50%) scale(0.5);
	 position: absolute;
	 top: 50%;
	 left: 50%;
	 box-shadow: 0px 0px 3px rgba(150, 149, 149, 0.5);
	 border-radius: 20px;
	 background: rgb(253, 255, 252);
	 text-align: center;
}

#popup-header {
    padding-top: 50px;
    font-size: 20px;
}

 .popup-box .close-btn {
	 width: 35px;
	 height: 35px;
	 display: inline-block;
	 position: absolute;
	 top: 15px;
	 right: 15px;
	 -webkit-transition: all ease 0.5s;
	 transition: all ease 0.5s;
	 border-radius: 1000px;
	 background: #94c98f;
     box-shadow: 0px 0px 3px rgba(150, 149, 149, 0.5);
	 font-weight: bold;
     font-size: 22px;
	 text-decoration: none;
	 color: #fff;
	 line-height: 150%;
}
 .popup-box .close-btn:hover {
	 -webkit-transform: rotate(180deg);
	 transform: rotate(180deg);
}
 .transform-in, .transform-out {
	 display: block;
	 -webkit-transition: all ease 0.5s;
	 transition: all ease 0.5s;
}
 .transform-in {
	 -webkit-transform: translate(-50%, -50%) scale(1);
	 transform: translate(-50%, -50%) scale(1);
}
 .transform-out {
	 -webkit-transform: translate(-50%, -50%) scale(0.5);
	 transform: translate(-50%, -50%) scale(0.5);
}

#Edit-submit {
    margin-top: 50px;
    margin-bottom: 30px;
    width: 90px;
    padding: 15px;
    background-color: #76bb70;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 50px;
}

</style>
</head>
<body>

<div class="wrapper">


<div class="container">
    <div class="receipt">
    <div class="receipt__message">
      <h2 class="receipt__title">예약 상세 정보</h2>
      <p class="receipt__text">
      예약번호 <strong>${reservation.orderId}</strong>
      </p>
      <a class="btn" href="MyReservationList.me">나의 예약내역으로 돌아가기</a>
    </div>

    <div class="product">
      <figure class="product__image">
      <img src="https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2021/02/22/2100/CJUGH-P052-King-Guestroom-Sea-View.jpg/CJUGH-P052-King-Guestroom-Sea-View.16x9.jpg?imwidth=1280" alt="">
      </figure>
      <div>
      <h3 class="product__name">${reservation.spaceTitle}</h3>
      <p class="product__quantity">
        ${reservation.roomTitle}
      </p>
      </div>

    </div>

    <div class="price">

      <div class="price__pricing">
      <p class="price__princingTitle">
          체크인
      </p>
      <p class="price__princingNumber">
          ${reservation.checkInDate} 15:00
      </p>
      </div>

      <div class="price__pricing">
      <p class="price__princingTitle">
          체크아웃
      </p>
      <p class="price__princingNumber">
        ${reservation.checkOutDate} 12:00
      </p>
      </div>

      <div class="price__pricing">
      <p class="price__princingTitle">
          인원
      </p>
      <p class="price__princingNumber">
          ${reservation.peopleCount}명
      </p>
      </div>

      <div class="pay__total">
      <p class="pay__totalTitle">
          결제수단
      </p>
      <p class="pay__totalName">
          ${reservation.paymentMethod}
      </p>
      </div>
      <div class="price__total">
      <p class="price__totalTitle">
          최종결제금액
      </p>
      <p class="price__totalNumber">
          ₩${reservation.price} 원
      </p>
      </div>

    </div>

    <div class="info">

      <div class="info__addressContent">
      <div class="info__address">
          <h5 class="info__addressTitle">예약자 정보</h5>
          <p class="info__addressText">
          ${reservation.reservationName} <br>
          ${reservation.phone} <br>
          ${reservation.email}
          </p>
          <span class="btn" onclick="reseravtionEdit('${reservation.orderId}')">예약자 정보 수정하기</span>

      </div>

      <div class="info__address">
          <h5 class="info__addressTitle">공간 상세 주소</h5>
          <p class="receipt__addressText" style="font-size: 11px;">
          제주드림타워 그랜드 하얏트 <br>
          ${reservation.address}
          <br>
          ${reservation.phone}<br>
          </p>
      </div>
      </div>
    </div>
    </div>
</div>
</div>

  <script>
  
    $(function(){

    const cta = container = document.querySelector(".container"),
    receipt = document.querySelector(".receipt");
    container.classList.add("anime");

    container.style.height = receipt.clientHeight + 45 + "px";

    });

</script>

<div class="popup-wrap">
    <div class="popup-box">
          <div class="cont">
              
                  <form id="gradeForm" action="reservation/put" method="post">
                        <div class="rev-box">
                          <input type="hidden" name="orderId" value="${reservation.orderId}">
                          <table>
                            <tr>
                                <td style="width: 130px; height: 50px;">예약자 이름</td>
                                <td>${reservation.reservationName}</td>
                            </tr>
                            <tr>
                                <td style="height: 50px">예약자 연락처</td>
                                <td><input style=" height: 30px; width:150px; display:inline;" type="text" name="phone" value="${reservation.phone}" required></td>
                            </tr>
                            <tr>
                                <td style="height: 50px">예약자 이메일</td>
                                <td><input style=" height: 30px; width:150px; display:inline;" type="email" name="email" value="${reservation.email}" required></td>
                            </tr>
                          </table>
                          <button id="Edit-submit" type="submit">작성하기</button>
                    
                  </form>
              </div>
          </div>
          <a class="close-btn popup-close">x</a>
    </div>
            <div class="modal-layer"></div>
  </div>


  <script>
    function reseravtionEdit(orderId){
			console.log(orderId);
			modalUp(this);
		}

    function modalUp(e){
			$('.popup-wrap').fadeIn(500);
			$('.popup-box').removeClass('transform-out').addClass('transform-in');
		
		}
		
		$(document).ready(function() {		
			$('.popup-close').click(function(e) {
			$('.popup-wrap').fadeOut(500);
			$('.popup-box').removeClass('transform-in').addClass('transform-out');
			
			  e.preventDefault();
			}
		);

		});
  </script>


</body>
</html>