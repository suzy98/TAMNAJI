    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>탐나지 - MBTI</title>
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
    line-height: 45px;
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
    max-width: 800px;
    width: 100%;
    padding-top: 5px;
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
    margin-top: 70px;
    text-align: center;
    border-bottom: 2px solid #e7f1e4;
    padding: 8px 8px 50px 8px;
    }
    .receipt__title {
    margin-bottom: 32px;
    font-weight: 600;
    font-size: 30px;
    line-height: 40px;
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
    }
    .receipt .btn:hover {
    box-shadow: inset 0px -40px 0px #f89327;
    color: white;
    }

    .anime {
    position: relative;
    max-width: 800px;
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


    #mbti-input {
    width: 170px;
    margin-top: 50px;
    margin-bottom: 110px;
    padding: 14px 20px;
    background-color: #eeeeee;
    border: none;
    border-radius: 50px;
    font-size: 20px;
    text-align: center;
    text-transform: uppercase;
    }

    #mbti-input:focus {
    outline: 1px solid #eceae9;
    box-shadow: 0 0 10px #38bd04;
    }

    .mbti-color-g {
    color: rgb(66, 192, 66);
    }

    .mbti-color-o {
    color: #fd6500;
    }


    /*공간---------------------*/

    .space-list {
    width: 100%;
    max-width: 800px;
    display: flex;
    margin: auto;
    margin-top: 35px;
    flex-wrap: wrap;
    padding: 0;
    justify-content: center;

    }

    .card:hover {
    cursor: pointer;
    }

    .space-list li.card {
    cursor: pointer;
    width: calc(50% - 13px);
    border: 1px solid #EBEFF6;
    border-radius: 10px;
    overflow: hidden;
    transition: all 0.3s;
    margin-bottom: 47px;
    margin-left: 15px;
    margin-right: 15px;
    box-shadow: 0 0px 10px #E9EBEC;  
    background-color: white;
    }
    .space-list li.card:hover {
    box-shadow: 0 8px 10px #eceae9;
    transform: translateY(-8px);
    }
    .space .room-img-wrap {
    display: flex;
    width: 100%;
    height: 239px;
    }
    .space .room-img-wrap img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    }
    .space .room-info-wrap {
    padding: 13px 22px;
    padding-bottom: 0;
    position: relative;
    box-sizing: border-box;
    }
    .space .room-info-wrap .heart {
    position: absolute;
    right: 22px;
    top: 30px;
    cursor: pointer;

    }
    .space .room-info-wrap .heart img {
    width: 15px;
    float: right;
    }
    .space .room-info{
    color: #000000;
    font-size: 13px;
    }
    .space .room-info .room-tit {
    font-size: 15px;
    margin-top: 13px;
    margin-bottom: 8px;
    font-weight: 500;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
    }

    .room-des {
    font-size: 12px;
    color: gray;
    }

    .room-tit {
    font-size: 20px;
    color: black;
    font-weight: 700;
    }

    .room-price {
    font-size: 20px;
    margin-top: 40px;
    font-weight: 600;
    }

    .room-price span {
    padding: 6px;
    background-color: #fd6500;
    font-size: 12px;
    color: white;
    border-radius: 100px;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-right: 6px;
    }

    .card-more {
    margin-top: 30px;
    margin-left: 20px;
    margin-right: 20px;
    font-size: 12px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    }



    a {
    text-decoration: none;
    }






    /*드래그 컬러*/
    ::selection{color:black;background:#eef5eb;}
    ::-moz-selection{color:black;background:#eef5eb;}

    /* 스크롤 바 */
    ::-webkit-scrollbar { width: 7px; }
    ::-webkit-scrollbar-track {
        background-color: rgba(216, 230, 216, 0.5);
    }
    ::-webkit-scrollbar-thumb { background-color: #69ca69; }
    ::-webkit-scrollbar-button { display: none; }

    </style>
    </head>
    <body>
    <jsp:include page="../common/header.jsp" />

    <div class="wrapper" style="padiing-bottom: 5%; margin-bottom: 10%;">


        <div class="container" style="margin-bottom: 10%;">
        
            <div class="receipt" style="margin-bottom: 15%; ">
                <div class="receipt__message">
                    <h1 class="receipt__title">
                    <a class="mbti-color-o">${mbti}</a>인
                    <c:choose>
                        <c:when test="${ empty loginUser }">
                            <a class="mbti-color-g">게스트</a>님께 <br>
                        </c:when>
                        <c:otherwise>
                            <a class="mbti-color-g">${loginUser.nickname}</a>님께 <br>
                        </c:otherwise>
                    </c:choose>
                    추천드리는 공간입니다!
                    </h1>
                    <a class="btn" href="mbtiPage.sp">이전 페이지로 돌아가기</a>
                </div>

                <div class="price">
                    <div class="content-2" id="content" style=" height:100%; padding-top: 30px; padding-bottom: 30px; ">
                        <ul class="space-list">
                            <c:forEach var="l" items="${list}">   
                                <li class="card" style=" width: 220px; height: 300px;">
                                <a href="space?sno=${l.spaceNo}">
                                    <div class="room-img-wrap">
                                        <img src="${l.changeName}" style="width: 100%; height:140px;">
                                    </div>
                                    <div class="room-info-wrap" style="margin-top:20px;" > 
                                        <div class="room-info" style="text-align: center;">
                                            <p class="room-des">${l.spaceSubTitle}</p>
                                            <a class="room-tit">${l.spaceTitle}</a>
                                        </div>
                                    </div>
                                </a>
                                </li>
                            </c:forEach> 
                        </ul>
                    </div>
                </div>
        
        
            
            </div>
        </div>
        </div>
        
        
        
        <script>
            window.addEventListener("load", event => {
        const container = document.querySelector(".container"),
            receipt = document.querySelector(".receipt");
        
            printReceipt();
        
        function printReceipt() {
            container.classList.add("anime");
            container.style.height = receipt.clientHeight + 45 + "px";
        }
        });
        </script>

    </body>
    </html>