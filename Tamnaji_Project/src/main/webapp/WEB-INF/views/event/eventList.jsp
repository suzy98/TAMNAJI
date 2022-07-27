<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>탐나지 - 이벤트</title>
<style>
    
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


@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}



body{
    position: relative;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}


    /* 만들어놓고 필요한 곳에서 쓸 수 있다 */
:root {
  --text-color: black;
  --background-color: #f8ded2;
  --accent-color: #ff4d00;
}

/* 폰트는 최상위 컴포넌트에 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'NanumSquareRound';
}




        		.bk-list {
	list-style: none;
	position: relative;
}

.bk-list li {
	position: relative;
	width: 300px;
	float: left;
	z-index: 1;
	margin: 0px 50px 40px 0;
	-webkit-perspective: 1800px;
	-moz-perspective: 1800px;
	perspective: 1800px;
}

.bk-list li:last-child {
	margin-right: 0;
}

.bk-info {
	position: relative;
	margin-top: 430px;
}

.bk-info h3 {
	padding: 25px 0 10px;
	margin-bottom: 20px;
	border-bottom: 1px solid rgba(0,0,0,0.3);
	font-size: 26px;
}

.bk-info h3 span:first-child {
	font-size: 14px;
	font-weight: 400;
	text-transform: uppercase;
	padding-bottom: 5px;
	display: block;
	color: #777;
}

.bk-info p {
	line-height: 24px;
	color: #444;
	min-height: 160px;
}

.bk-info button {
	background: #c9c6c4;
	border: none;
    border-radius: 100px;
	color: #fff;
	display: inline-block;
	padding: 2px 12px;
	font-weight: 700;
	font-size: 14px;
	text-transform: uppercase;
	cursor: pointer;
    margin-right: 5px;
	box-shadow: 1px 1px 1px rgba(0,0,0,0.15);
}

.bk-info button.bk-active,
.bk-info button:active {
	box-shadow: 
		0 1px 0 rgba(255, 255, 255, 0.8), 
		inset 0 -1px 1px rgba(0,0,0,0.2);
}

.no-touch .bk-info button:hover,
.bk-info button.bk-active {
	background: #9acc98;
}

.bk-list li .bk-book {
	position: absolute;
	width: 100%;
	height: 400px;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-webkit-transition: -webkit-transform .5s;
	-moz-transition: -moz-transform .5s;
	transition: transform .5s;
}

.bk-list li .bk-book.bk-bookdefault:hover {
	-webkit-transform: rotate3d(0,1,0,35deg);
	-moz-transform: rotate3d(0,1,0,35deg);
	transform: rotate3d(0,1,0,35deg);
}

.bk-list li .bk-book > div,
.bk-list li .bk-front > div {
	display: block;
	position: absolute;
}

.bk-list li .bk-front {
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-webkit-transform-origin: 0% 50%;
	-moz-transform-origin: 0% 50%;
	transform-origin: 0% 50%;
	-webkit-transition: -webkit-transform .5s;
	-moz-transition: -moz-transform .5s;
	transition: transform .5s;
	-webkit-transform: translate3d(0,0,20px);
	-moz-transform: translate3d(0,0,20px);
	transform: translate3d(0,0,20px);
	z-index: 10;
}

.bk-list li .bk-front > div {
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

.bk-list li .bk-page {
	-webkit-transform: translate3d(0,0,19px);
	-moz-transform: translate3d(0,0,19px);
	transform: translate3d(0,0,19px);
	display: none;
	width: 295px;
	height: 390px;
	top: 5px;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
	z-index: 9;
}

.bk-list li .bk-front,
.bk-list li .bk-back,
.bk-list li .bk-front > div {
	width: 300px;
	height: 400px;
}

.bk-list li .bk-left,
.bk-list li .bk-right {
	width: 40px;
	left: -20px;
}

.bk-list li .bk-top,
.bk-list li .bk-bottom {
	width: 295px;
	height: 40px;
	top: -15px;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
}

.bk-list li .bk-back {
	-webkit-transform: rotate3d(0,1,0,-180deg) translate3d(0,0,20px);
	-moz-transform: rotate3d(0,1,0,-180deg) translate3d(0,0,20px);
	transform: rotate3d(0,1,0,-180deg) translate3d(0,0,20px);
	box-shadow: 10px 10px 30px rgba(0,0,0,0.3);
	border-radius: 3px 0 0 3px;
}

.bk-list li .bk-cover-back {
	background-color: #000;
	-webkit-transform: rotate3d(0,1,0,-180deg);
	-moz-transform: rotate3d(0,1,0,-180deg);
	transform: rotate3d(0,1,0,-180deg);
}

.bk-list li .bk-right {
	height: 390px;
	top: 5px;
	-webkit-transform: rotate3d(0,1,0,90deg) translate3d(0,0,295px);
	-moz-transform: rotate3d(0,1,0,90deg) translate3d(0,0,295px);
	transform: rotate3d(0,1,0,90deg) translate3d(0,0,295px);
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
}

.bk-list li .bk-left {
	height: 400px;
	-webkit-transform: rotate3d(0,1,0,-90deg);
	-moz-transform: rotate3d(0,1,0,-90deg);
	transform: rotate3d(0,1,0,-90deg);
}

.bk-list li .bk-top {
	-webkit-transform: rotate3d(1,0,0,90deg);
	-moz-transform: rotate3d(1,0,0,90deg);
	transform: rotate3d(1,0,0,90deg);
}

.bk-list li .bk-bottom {
	-webkit-transform: rotate3d(1,0,0,-90deg) translate3d(0,0,390px);
	-moz-transform: rotate3d(1,0,0,-90deg) translate3d(0,0,390px);
	transform: rotate3d(1,0,0,-90deg) translate3d(0,0,390px);
}

/* Transform classes */

.bk-list li .bk-viewinside .bk-front {
	-webkit-transform: translate3d(0,0,20px) rotate3d(0,1,0,-160deg);
	-moz-transform: translate3d(0,0,20px) rotate3d(0,1,0,-160deg);
	transform: translate3d(0,0,20px) rotate3d(0,1,0,-160deg);
}

.bk-list li .bk-book.bk-viewinside {
	-webkit-transform: translate3d(0,0,150px) rotate3d(0,1,0,0deg);
	-moz-transform: translate3d(0,0,150px) rotate3d(0,1,0,0deg);
	transform: translate3d(0,0,150px) rotate3d(0,1,0,0deg);
}

.bk-list li .bk-book.bk-viewback {
	-webkit-transform: translate3d(0,0,0px) rotate3d(0,1,0,180deg);
	-moz-transform: translate3d(0,0,0px) rotate3d(0,1,0,180deg);
	transform: translate3d(0,0,0px) rotate3d(0,1,0,180deg);
}

.bk-list li .bk-viewback .bk-back {
	z-index: 10;
}

/* Main colors and content */

.bk-list li .bk-page,
.bk-list li .bk-right,
.bk-list li .bk-top,
.bk-list li .bk-bottom {
	background-color: #fff;
}

.bk-list li .bk-front > div {
	border-radius: 0 3px 3px 0;
	box-shadow: 
		inset 4px 0 10px rgba(0, 0, 0, 0.1);
}

.bk-list li .bk-front:after {
	content: '';
	position: absolute;
	top: 1px;
	bottom: 1px;
	left: -1px;
	width: 1px;
}

.bk-list li .bk-cover:after,
.bk-list li .bk-back:after {
	content: '';
	position: absolute;
	top: 0;
	left: 10px;
	bottom: 0;
	width: 3px;
	background: rgba(0,0,0,0.06);
	box-shadow: 1px 0 3px rgba(255, 255, 255, 0.1);
}

.bk-list li .bk-back:after {
	left: auto;
	right: 10px;
}

.bk-left h2 {
	width: 400px;
	height: 40px;
	-webkit-transform-origin: 0 0;
	-moz-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: rotate(90deg) translateY(-40px);
	-moz-transform: rotate(90deg) translateY(-40px);
	transform: rotate(90deg) translateY(-40px);
}

.bk-content {
	position: absolute;
	top: 25px;
	left: 20px;
	bottom: 20px;
	right: 20px;
	padding: 20px;
	overflow: hidden;
	background: #fff;
	opacity: 0;
	pointer-events: none;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transition: opacity 0.3s ease-in-out;
	-moz-transition: opacity 0.3s ease-in-out;
	transition: opacity 0.3s ease-in-out;
	cursor: default;
}

.bk-content-current {
	opacity: 1;
	pointer-events: auto;
}

.bk-content p {
	padding: 0 0 5px;
	-webkit-font-smoothing: antialiased;
	color: #000;
	font-size: 13px;
	line-height: 20px;
	text-align: justify;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.bk-page nav {
	display: block;
	text-align: center;
	margin-top: 20px;
	position: relative;
	z-index: 100;
	cursor: pointer;
}

.bk-page nav span {
	display: inline-block;
	width: 20px;
	height: 20px;
	color: #aaa;
	background: #f0f0f0;
	border-radius: 50%;
}

/* Individual style & artwork */

/* Book 1 */
.book-1 .bk-front > div,
.book-1 .bk-back,
.book-1 .bk-left,
.book-1 .bk-front:after {
	background-color: #81b0f7;
}

.book-1 .bk-cover {
	background-image: url(../images/1.png);	
	background-repeat: no-repeat;
	background-position: 10px 40px;
}

.book-1 .bk-cover h2 {
	position: absolute;
	bottom: 0;
	right: 0;
	left: 0;
	padding: 30px;
	background: rgba(255,255,255,0.2);
	color: #fff;
	text-shadow: 0 -1px 0 rgba(0,0,0,0.1);
}

.book-1 .bk-cover h2 span:first-child,
.book-1 .bk-left h2 span:first-child {
	text-transform: uppercase;
	font-weight: 400;
	font-size: 13px;
	padding-right: 20px;
}

.book-1 .bk-cover h2 span:first-child {
	display: block;
}



.book-1 .bk-left h2 {
	color: #fff;
	font-size: 15px;
	line-height: 40px;
	padding-right: 10px;
	text-align: right;
}

.book-1 .bk-back p {
	color: #fff;
	font-size: 13px;
	padding: 40px;
	text-align: center;
	font-weight: 700;
}

/* Book 2 */

.book-2 .bk-front > div,
.book-2 .bk-back,
.book-2 .bk-left,
.book-2 .bk-front:after {
	background-color: rgb(250, 181, 124);
}

.book-2 .bk-cover {
	background-image: url(../images/2.png);	
	background-repeat: no-repeat;
	background-position: 98% 0%;
}

.book-2 .bk-cover h2, 
.book-2 .bk-left h2 {
	color: #fff;

	font-weight: 400;
}

.book-2 .bk-cover h2 {
	font-size: 138px;
	line-height: 102px;
	padding: 30px;
}

.book-2 .bk-cover h2 span:first-child {
	position: relative;
	display: block;
}

.book-2 .bk-cover h2 span:first-child:before {
	content: '';
	
	text-transform: uppercase;
	position: absolute;
	color: rgb(100, 100, 100);
	font-size: 20px;
	right: -15px;
	bottom: -60px;
}

.book-2 .bk-cover h2 span:last-child {
	font-size: 100px;
	line-height: 80px;
	display: block;
	position: relative;
}

.book-2 .bk-cover h2 span:last-child:before {
	content: '';
	font-size: 16px;
	color: rgb(94, 92, 92);
	position: absolute;
	top: -32px;
	left: 62px;

}

.book-2 .bk-cover h2 span:last-child:after {
	content: '';
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: #f9ed65;
	position: absolute;
	top: -150px;
	left: 190px;
}

.book-2 .bk-left h2 {
	font-size: 20px;
	line-height: 40px;
	padding-right: 10px;
	text-align: right;
}

.book-2 .bk-back p {
	color: rgb(255, 255, 255);
	font-size: 13px;

	padding: 40px;
	text-align: center;
}

/* Book 3 */

.book-3 .bk-front > div,
.book-3 .bk-back,
.book-3 .bk-left,
.book-3 .bk-front:after {
	background-color: #a4d4a8;
}

.book-3 .bk-cover {
	background-image: url(../images/3.png);	
	background-repeat: no-repeat;
	background-position: 100% 95%;
}

.book-3 .bk-cover h2 {
	position: absolute;
	top: 40px;
	right: 40px;
	left: 40px;
	padding-top: 15px;
	color: #fff;
	text-shadow: 0 -1px 0 rgba(0,0,0,0.1);
}

.book-3 .bk-cover h2 span:first-child,
.book-3 .bk-left h2 span:first-child {
	text-transform: uppercase;
	font-weight: 400;
	font-size: 13px;
	padding-right: 20px;
}

.book-3 .bk-cover h2 span:first-child {
	display: block;
}



.book-3 .bk-left h2 {
	color: #fff;
	font-size: 14px;
	line-height: 40px;
	text-align: center;
}

.book-3 .bk-back img {
	width: 200px;
	display: block;
	margin: 30px auto 0;
}

.book-3 .bk-back p {
	color: #fff;
	font-size: 13px;

	padding: 40px;
	text-align: center;
	text-shadow: 0 -1px 0 rgba(0,0,0,0.1);
}

/* Fallbacks */

.no-csstransforms3d .bk-list li .bk-book > div,
.no-csstransforms3d .bk-list li .bk-book .bk-cover-back {
	display: none;
}

.no-csstransforms3d .bk-list li .bk-book > div.bk-front {
	display: block;
}

.no-csstransforms3d .bk-info button,
.no-js .bk-info button {
	display: none;
}


html { height: 100%; }

*,
*:after,
*:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

/* Clearfix hack by Nicolas Gallagher: http://nicolasgallagher.com/micro-clearfix-hack/ */
.clearfix:before,
.clearfix:after {
    content: " ";
    display: table;
}

.clearfix:after {
    clear: both;
}

.clearfix {
    *zoom: 1;
}


.demo-2 body {
	background: url(../images/wood.jpg);
}

a {
	color: #555;
	text-decoration: none;
}

.container {
	width: 100%;
	position: relative;
}

.main,
.container > header {
	width: 90%;
	max-width: 1120px;
	margin: 0 auto;
	position: relative;
	padding: 0 30px 50px 30px;
}

.container > header {
	padding: 30px 30px 40px 30px;
}

.container > header h1 {
	font-size: 34px;
	line-height: 38px;
	margin: 0;
	font-weight: 700;
	color: #333;
	float: left;
}

#bk-content-1 {
    background: url(최저가.png);
}
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    
	
    <div class="main" style="margin-top: 150px;">
        <ul id="bk-list" class="bk-list clearfix">
            
						<!-- 더미데이터 -->
						<li>
							<div class="bk-book book-1 bk-bookdefault">
								<div class="bk-front">
									<div class="bk-cover">
										<h2>
											<span style="font-size: 20px;" >모든 공간 최저가 보장!</span>
										</h2>
									</div>
									<div class="bk-cover-back"></div>
								</div>
								<div class="bk-page" >
									<div class="bk-content bk-content-current" style="background: url(https://user-images.githubusercontent.com/102042383/178903351-28500d1b-3056-4645-9904-c6e4fb1eb0d3.png) no-repeat; background-size: contain;">
									</div>
									
								</div>
								<div class="bk-back">
									<p>호기심이 많으신 분이시군요! <br>
										저희 탐나지 요리조리 잘 둘러봐주세요 :)
										 </p>
								</div>
								<div class="bk-right"></div>
								<div class="bk-left">
									<h2>
										<span>제주 최저가 보장 공간 플랫폼 탐나지</span>
										<span></span>
									</h2>
								</div>
								<div class="bk-top"></div>
								<div class="bk-bottom"></div>
							</div>
							<div class="bk-info">
								<button class="bk-bookback">Flip</button>
								<button class="bk-bookview">View inside</button>
							
							</div>
						</li>

						<li>
							<div class="bk-book book-2 bk-bookdefault">
								<div class="bk-front">
									<div class="bk-cover">
										<h2>
											<span>we love</span>
											<span>Food!</span>
										</h2>
									</div>
									<div class="bk-cover-back"></div>
								</div>
								<div class="bk-page">
									<div class="bk-content" style="background: url(https://user-images.githubusercontent.com/102042383/178916066-5977ee91-645b-4bbe-828d-fbd3ca6dcd0e.png) no-repeat; background-size: contain;">
									</div>
									
								</div>
								<div class="bk-back">
									<p><br><br><br>
										커뮤니티에 남겨주시면 되고, <br>
										선착순이 아님 추첨입니다 :) <br><br><br>
										제주 쩝쩝박사님의 추천을 <br>
										기다립니다!</p>
								</div>
								<div class="bk-right"></div>
								<div class="bk-left">
									<h2>
										<span>jeju, 어디까지 알고 있니?</span>
			
									</h2>
								</div>
								<div class="bk-top"></div>
								<div class="bk-bottom"></div>
							</div>
							<div class="bk-info">
								<button class="bk-bookback">Flip</button>
								<button class="bk-bookview">View inside</button>
								
							</div>
						</li>
						<li>
							<div class="bk-book book-3 bk-bookdefault">
								<div class="bk-front">
									<div class="bk-cover">
										<h2>
											<span>내게 맞는 제주도 공간은?</span>
											<span>딱 맞는 공간 찾기!</span>
										</h2>
									</div>
									<div class="bk-cover-back"></div>
								</div>
								<div class="bk-page">
									<div class="bk-content bk-content-current" onClick="location.href='mbtiPage.sp'" style="background: url(https://user-images.githubusercontent.com/102042383/179126731-9634be27-402a-4791-a6b0-30d7799362af.png) no-repeat; background-size: contain;">
										
									</div>
								</div>
								<div class="bk-back">
									
									<p>원래는 mbti 테스트까지 만들고 싶었어요 
									누구에게나 그럴듯한 계획은 있는 거니까요,,, 주륵 </p>
								</div>
								<div class="bk-right"></div>
								<div class="bk-left">
									<h2>
										<span>SHOW ME YOUR MBTI</span>
										<span>엠비티아이가 뭐예요?</span>
									</h2>
								</div>
								<div class="bk-top"></div>
								<div class="bk-bottom"></div>
							</div>
							<div class="bk-info">
								<button class="bk-bookback">Flip</button>
								<button class="bk-bookview">View inside</button>
								
							</div>
						</li>


						<!-- 더미데이터 종료시점 -->


            
            <c:forEach var="e" items="${list}" varStatus="status">
                <li>
                    <div class="bk-book book-${ (status.index % 3 ) + 1 } bk-bookdefault">
                        <div class="bk-front">
                            <div class="bk-cover">
                                <h2>
                                    <span>${e.eventTitle}</span>
                                    <span></span>
                                </h2>
                            </div>
                            <div class="bk-cover-back"></div>
                        </div>
                        <div class="bk-page" >
                            <div class="bk-content bk-content-current" style="background: url(https://${e.originName}) no-repeat; background-size: contain;">
                            
                            </div>
                            
                        </div>
                        <div class="bk-back">
                            <p>${e.eventContent}</p>
                        </div>
                        <div class="bk-right"></div>
                        <div class="bk-left">
                            <h2>
                                <span>${e.eventTitle}</span>
                                <span></span>
                            </h2>
                        </div>
                        <div class="bk-top"></div>
                        <div class="bk-bottom"></div>
                    </div>
                    <div class="bk-info">
                        <button class="bk-bookback">Flip</button>
                        <button class="bk-bookview">View inside</button>
                    
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    
    
    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>


<script>
var Books = (function() {

var $books = $('#bk-list > li > div.bk-book'),
booksCount = $books.length;

function init() {

$books.each(function() {

    var $book = $(this),
        $other = $books.not($book),
        $parent = $book.parent(),
        $page = $book.children('div.bk-page'),
        $bookview = $parent.find('button.bk-bookview'),
        $content = $page.children('div.bk-content'),
        current = 0;

    $parent.find('button.bk-bookback').on('click', function() {

        $bookview.removeClass('bk-active');

        if ($book.data('flip')) {

            $book.data({
                opened: false,
                flip: false
            }).removeClass('bk-viewback').addClass('bk-bookdefault');

        } else {

            $book.data({
                opened: false,
                flip: true
            }).removeClass('bk-viewinside bk-bookdefault').addClass('bk-viewback');

        }

    });

    $bookview.on('click', function() {

        var $this = $(this);

        $other.data('opened', false).removeClass('bk-viewinside').parent().css('z-index', 0).find('button.bk-bookview').removeClass('bk-active');
        if (!$other.hasClass('bk-viewback')) {
            $other.addClass('bk-bookdefault');
        }

        if ($book.data('opened')) {
            $this.removeClass('bk-active');
            $book.data({
                opened: false,
                flip: false
            }).removeClass('bk-viewinside').addClass('bk-bookdefault');
        } else {
            $this.addClass('bk-active');
            $book.data({
                opened: true,
                flip: false
            }).removeClass('bk-viewback bk-bookdefault').addClass('bk-viewinside');
            $parent.css('z-index', booksCount);
            current = 0;
            $content.removeClass('bk-content-current').eq(current).addClass('bk-content-current');
        }

    });

    if ($content.length > 1) {

        var $navPrev = $('<span class="bk-page-prev">&lt;</span>'),
            $navNext = $('<span class="bk-page-next">&gt;</span>');

        $page.append($('<nav></nav>').append($navPrev, $navNext));

        $navPrev.on('click', function() {
            if (current > 0) {
                --current;
                $content.removeClass('bk-content-current').eq(current).addClass('bk-content-current');
            }
            return false;
        });

        $navNext.on('click', function() {
            if (current < $content.length - 1) {
                ++current;
                $content.removeClass('bk-content-current').eq(current).addClass('bk-content-current');
            }
            return false;
        });

    }

});

}

return {
init: init
};

})();

$(function() {

Books.init();

});
</script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>