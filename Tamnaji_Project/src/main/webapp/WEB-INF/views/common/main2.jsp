<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>탐나지!</title>
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Shadows+Into+Light&display=swap" rel="stylesheet">
  <!-- Optional -->
<script src="//cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.min.js"></script>
<style>


/* 스크롤 바 */
::-webkit-scrollbar { width: 4px; }
::-webkit-scrollbar-track {
        background-color: rgba(216, 230, 216, 0.5);
 }
::-webkit-scrollbar-thumb { background-color: #69ca69; }
::-webkit-scrollbar-button { display: none; }



  .main {
  height: 100%;
  background-color: rgb(253, 252, 237);
}

.box {
  width: 100%;
  height: 100%;
  overflow-x: hidden;
  background-color: rgb(252, 250, 223);
  background: url(https://www.nemopan.com/files/attach/images/2575/234/798/015/acd6ce6166b1d56e3a5d8cdc45dc4ff6.jpg);
  background-size: contain;
  background-repeat: no-repeat;

}

.curtain {
  position: absolute;
  width: 50%;
  height: inherit;
  background-color: black;
  
}

.left {
  position: fixed;
  left: 0;
  background: url(https://user-images.githubusercontent.com/102042383/179432269-3e218aba-7258-4c63-a016-5b5f23872a63.png);
  background-repeat: no-repeat;
  background-size: cover;
}

.right {
  position: fixed;
  background: url(https://user-images.githubusercontent.com/102042383/179432298-891b5446-8138-45b9-91c5-55b96fa23398.png);
  background-size: cover;
  background-repeat: no-repeat;
  right: 0;
}

h2 {
  font-family: 'GmarketSansLight';
  position: absolute;
  top: 25%;
  width: 100vw;
  color: white;
  font-size: 40px;
  text-align: center;
  transform: translateY(-50px);
    opacity: 0;
    animation-name: titleAnimation;
    animation-timing-function:ease;
    animation-duration: 2s;
}


@keyframes titleAnimation {
    0% {
      transform: translateY(-50px);
      opacity: 1;
      -webkit-clip-path: polygon(100% 0, 100% 100%, 0 100%, 0 80%);
      clip-path: polygon(100% 0, 100% 100%, 0 100%, 0 80%);
  }
  20% {
      transform: translateY(0);
      opacity: 1;
      -webkit-clip-path: polygon(100% 0, 100% 100%, 0 100%, 0 15%);
      clip-path: polygon(100% 0, 100% 100%, 0 100%, 0 15%);
  }
  80% {
       transform: translateY(0);
       opacity: 1;
      -webkit-clip-path: polygon(100% 0, 100% 100%, 0 100%, 0 15%);
      clip-path: polygon(100% 0, 100% 100%, 0 100%, 0 15%);
  }
  100% {
       transform: translateY(50px);
       opacity: 1;
      -webkit-clip-path: polygon(100% 0, 100% -0%, 0 100%, 0 100%);
      clip-path: polygon(100% 0, 100% -0%, 0 100%, 0 100%);
    
  }
}

div.left h2 {
  left: 0;
  clip-path: inset(0px 50% 0px 0px); 
}

div.right h2 {  
  left: -100%;
  clip-path: inset(0px 0px 0px 50%);
}




  body{
    position: relative;
    flex-direction: column;
    justify-content: center;
    align-items: center;
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



	a {
	text-decoration: none;
	color: black;
	}


	.navbar {
	width: 100%;
	justify-content: space-around;
	align-items: center;
	background-color: white;
	padding-left: 20px;
	padding-right: 20px;
	border-bottom: 1px solid #ddd;
	height: 70px;
	position: fixed;
	display: flex;
	z-index: 1000;
	}

	.navbar-logo img {
	width: 200px;
	}

	.navbar-logo i {
	color: var(--accent-color);
	}

	/* menu */

	.navbar-menu {
	display: flex;
	padding-left: 0;
	list-style: none;
	background-color: white;
	}

	.navbar-menu li {
	padding: 12px;
	font-size: 15px;
	}

	@media screen and (max-width: 1268px) {
	.navbar-menu {
		display: none;
	}
	}


	/* icon */
	.navbar-icon {
	justify-content: flex-end;
	display: flex;
	list-style: none;
	padding-left: 0px;
	color: var(--text-color);
	}

	.navbar-icon li {
	font-size: larger;
	padding: 12px;
	padding-top: 7px;
	}


	.navbar-icon li a {
	font-size: 13px;
	}

	.navbar-icon li a:hover {

	color: #fd6500;
	cursor: pointer;
	}

	.navbar-more {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 24px;
	color: var(--accent-color);
	}

	#search {
	width: 150px;
	border: 1px solid white;

	}

	#login a, #logout a {
	padding: 7px;
	box-sizing: border-box;
	margin-left: 2px;
	border: 1px solid #fd6500;
	border-radius: 30px;
	color: white;
	background: #fd6500;
	}



	#space-menu {
	margin-left: -50px;
	}

	.menu_item {
	display: inline-block; /*가로로 배치되게*/
	}

	.menu_link {
	display: block; /*menu_link와 menu_item이 동일한 사이즈 갖게*/

	font-size:15px;
	line-height: 24px;
	font-weight: bold;
	color: #444;
	}


	.menu_item.active .menu_link {
	color: black; /* 메인 메뉴 선택, 활성화 효과 */
	}

	.menu_item:hover .menu_link {
	color: #fd6500;
	}

	/*메인메뉴에 active가 있을 경우에 서브메뉴 노출*/
	.menu_item.active .submenu {
	display: block; /* 메인 메뉴 활성화 시 서브 메뉴 노출 처리 */
	}


	/*서브메뉴*/
	.submenu {
	margin-top: 12px;
	padding-bottom: 25px;
	display: none; 
	position: absolute;
	left: 0;
	width: 100%;
	height: 50px;
	min-width: 700px;
	border-bottom: 1px solid #ddd;
	background-color: white;
	}

	#submenu1 {
	padding-left: 26%;
	}

	#submenu2 {
	padding-left: 26%;
	}

	.submenu_item {
	display: inline-block;
	}
	.submenu_link {

	display: block;
	padding: 5px 5px;
	font-size: 14px;
	line-height: 20px;
	color: #333;
	}
	/* 서브 메뉴 선택, 활성화 시 효과 */
	.submenu_item:hover .submenu_link {
	font-weight: bold;
	color: green;
	}
	.submenu_link span {
	position: relative; 
	}
	/* 서브 메뉴 선택, 활성화 시 하단 라인 노출 효과  */
	.submenu_item:hover span:after {
	position: absolute;
	content: ''; /*빈값 넣어주기*/
	right: 0;
	bottom: -15px;
	left: 0;    
	border-bottom: 2px solid green;
	}

	#submenu1 {
	visibility: hidden;
	opacity: 0;
	position: absolute;
	transition: all 0.5s ease;
	left: 0;
	display: none;
	}

	ul li:hover > #submenu1,
	#submenu1:hover {
	visibility: visible;
	opacity: 1;
	display: block;
	}




	ul li:hover > #submenu2,
	#submenu2:hover {
	visibility: visible;
	opacity: 1;
	display: block;
	}





	/* search bar 관련 */

	.search-container {
		width: 300px;
	height: 35px;
		display: block;
	margin-bottom: 10px;
	}
	input#search-bar {
		margin: 0 auto;
	padding: 0;
		width: 100%;
		height: 45px;
		padding: 0 20px;
		font-size: 1rem;
	border-radius: 50px;
		border: #d6d6d6;
	box-shadow: 0 0 3px rgb(218, 207, 202);;
	background: rgb(255, 249, 247);
		outline: none;
	}
	input#search-bar:focus {
		border: 1px solid #f9844a;
		transition: 0.35s ease;
		color: #fd6500;
	}
	input#search-bar:focus::-webkit-input-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	input#search-bar:focus::-moz-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	input#search-bar:focus:-ms-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	.search-icon {
		position: relative;
		float: right;
		width: 20px;
		height: 20px;
		top: -35px;
		right: 15px;
	}


/*------------메인 요소 ------------------*/

.main-1 {
  padding-top: 200px;
  width: 100%; 
  height: 1000px; 
  margin-top: 1000px; 
  background: url(https://user-images.githubusercontent.com/102042383/179362661-6c4c06f4-09bd-4d2b-ace8-b0b35f4d0f94.png);
  background-size: cover;
  background-repeat: no-repeat;
  background-color: #ceedc6;
}

#main-circle {
  margin: 0 auto;
  width: 130px;
  padding: 20px;
  font-size: 30px;
  text-align: center;
  border: 1px solid black;
  border-radius: 50%;
  margin-bottom: 130px;
}

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.main-1-title {
  margin-bottom: 10px;
  text-align: center;
  font-size: 40px;
  font-family: 'GmarketSansLight';
}

#main-1-title {
  font-weight: bold;
  font-size: 100px;
  font-family: 'GmarketSansBold';
}

#main-1-title a{
  font-weight: bold;
  font-size: 100px;
  font-family: 'GmarketSansBold';
  color: #07aa07;
}

.main-2-title {
  margin-top: 30px;
  margin-bottom: 10px;
  text-align: center;
  font-size: 40px;
  font-family: 'GmarketSansLight';
}

.main-2-title a {
  text-decoration: none;
  font-weight: bolder;
  font-family: 'GmarketSansLight';
}


.container {
	 position: relative;
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 width: 100%;
	 min-height: 100vh;
}
 a {
	 text-decoration: none;
}



/* #Cursor
================================================== */
.cursor,
.cursor2,
.cursor3{
  position: fixed;
  border-radius: 50%; 
  transform: translateX(-50%) translateY(-50%);
  pointer-events: none;
  left: -100px;
  top: 50%
}
.cursor{
  background-color: rgba(255, 255, 255, 0.397);
  height: 0;
  width: 0;
  z-index: 99999;
}
.cursor2,.cursor3{
  height: 36px;
  width: 36px;
  z-index:99998;
  -webkit-transition:all 0.3s ease-out;
  transition:all 0.3s ease-out
}
.cursor2.hover,
.cursor3.hover{
  -webkit-transform:scale(2) translateX(-25%) translateY(-25%);
  transform:scale(2) translateX(-25%) translateY(-25%);
  border:none
}
.cursor2{
  border: 2px solid #fff;
  box-shadow: 0 0 22px rgba(255, 255, 255, 0.6);
}
.cursor2.hover{
  background: rgba(255,255,255,.1);
  box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);
}


/* #Slider
================================================== */

.section{
  font-family: 'GmarketSansBold';
  position: relative;
  width: 100%;
  display: block;
  overflow: hidden;
  height: 100vh;
  background-color: #212121;
}

/* Case Study Showcase
================================================== */

.case-study-wrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 10;
  width: auto;
  margin: 0;
  padding: 0;
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  list-style: none;
}
.case-study-wrapper .case-study-name a {
  position: relative;
  list-style: none;
  margin: 0;
  display: block;
  text-align: center;
  padding: 0;
  font-size: 28px;
  margin-top: 25px;
  margin-bottom: 25px;
  font-family: 'GmarketSansBold';
  line-height: 1.3;
  letter-spacing: 2px;
  color: #cdd4cf;
  opacity: 0.5;
  text-decoration: none;
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear; 
} 
.case-study-wrapper .case-study-name a:hover {
  text-decoration: none;
} 
.case-study-wrapper .case-study-name.active a {
  opacity: 1;
  color: rgb(255, 255, 255);
} 
.case-study-images {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  margin:0;
  z-index:2;
} 
.case-study-images li {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  overflow: hidden;
  list-style:none;
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear; 
} 
.case-study-images li .img-hero-background{
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  background-position:center center;
  background-repeat:no-repeat;
  top: 0;
  left: 0;
  overflow: hidden;
  list-style:none;
  opacity: 0;
  -webkit-transform: translateY(-30px);
  transform: translateY(-30px);
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear; 
}
.case-study-images li.show .img-hero-background {
  opacity: 1;
  -webkit-transform: translateY(0);
  transform: translateY(0);
} 
.case-study-images li .case-study-title{
  position: absolute;
  bottom: 30px;
  left: 30px;
  display: block;
  opacity: 0;
  color: #fff;
  z-index: 19;
  letter-spacing: 1px;
  font-size: 14px;
  font-family: 'GmarketSansBold';
  -webkit-writing-mode: vertical-lr;
  writing-mode: vertical-lr;
  font-weight: 400;
  line-height: 16px;
  color: #fff; 
  font-style: italic;
  -webkit-transform: translateX(-100%);
  transform: translateX(-100%);
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear; 
}
.case-study-images li.show .case-study-title {
  opacity: 1;
  -webkit-transform: translateX(0);
  transform: translateX(0);
} 
.case-study-images li .hero-number-back{
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  display: block;
  list-style:none;
  opacity: 0;
  font-size: 18vw;
  font-family: 'GmarketSansBold';
  font-weight: 900;
  line-height: 1;
  color: rgba(255, 255, 255, 0.26);
  z-index: 1;
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear; 
} 
.case-study-images li .hero-number{
  position: absolute;
  bottom: 40px;
  left: 50%;
  width: 40px;
  margin-left: -70px;
  display: block;
  letter-spacing: 2px;
  text-align: center;
  list-style:none;
  opacity: 0;
  font-size: 13px;
  font-family: 'GmarketSansBold';
  font-weight: 300;
  line-height: 1;
  color: #fff;
  z-index: 6;
  -webkit-transform: translateY(100%);
  transform: translateY(100%);
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear; 
} 
.case-study-images li .hero-number-fixed{
  position: absolute;
  bottom: 40px;
  left: 50%;
  margin-left: 30px;
  width: 40px;
  text-align: center;
  display: block;
  letter-spacing: 2px;
  list-style:none;
  font-family: 'GmarketSansBold';
  font-weight: 300;
  line-height: 1;
  color: #fff;
  z-index: 6;
}
.case-study-images li .hero-number-fixed:before{
  position: absolute;
  content: '';
  top: 50%;
  left: -60px;
  width: 60px;
  height: 1px;
  z-index: 1;
  background-color: rgba(255,255,255,.4);
}
.case-study-images li.show .hero-number {
  opacity: 1;
  -webkit-transform: translateY(0);
  transform: translateY(0);
} 
.case-study-images li.show .hero-number-back {
  opacity: 1;
} 
.dark-over-hero{
  position:absolute;
  width:100%;
  height:100%;
  top:0;
  left:0;
  z-index:5;
  background-color: #ffffff00;
  opacity: 0.2;
}
.case-study-images li:nth-child(1) .img-hero-background{
  background-image: url("https://user-images.githubusercontent.com/102042383/179389765-be0c3e84-6be6-4d2d-9008-4ddc92e28fc0.jpeg");
}
.case-study-images li:nth-child(2) .img-hero-background{
  background-image: url("https://www.hyundai.co.kr/image/upload/asset_library/MDA00000000000010443/a2e966d17bdb4389b2a293fa11694902.jpg");
}
.case-study-images li:nth-child(3) .img-hero-background{
  background-image: url("https://user-images.githubusercontent.com/102042383/179389794-7acdcca2-2eee-4aa8-9833-5ae1dc3fa73b.jpeg");
}
.case-study-images li:nth-child(4) .img-hero-background{
  background-image: url("https://www.noblesse.com/shop/data/m/editor_new/2021/09/25/b46e37a17b63b17f2.jpg");
}

.cont1{
  text-align:center;
  perspective:100px;
}
.upper{
  position:absolute;
  left:550px;
  width:350px;
  height:150px;
  border-radius:20px 20px 0px 0px;
  background:white;
}
.downer{
  position:absolute;
  top:150px;
  left:547.5px;
  width:355px;
  height:60px;
  border-radius:0px 0px 0px 0px;
  background: linear-gradient(rgb(240,240,240), white);
  transform-style:preserve-3d;
  transform:rotatex(3deg);
  perspective:100px;
}
.printer{
   position:absolute;
  top:213px;
  left:545px;
  width:362px;
  height:35px;
  background:rgb(30,30,30);
}
.printer::after{
  content:"";
  position:absolute;
  top:20px;
  left:40px;
  width:280px;
  height:15px;
  border-radius:10px 10px 0px 0px;
  background:rgb(50,50,50);
  
}
.printerin{
     position:absolute;
  top:248px;
  left:545px;
  width:362px;
  height:35px;
  border-radius:0px 0px 20px 20px;
  background:rgb(30,30,30);
  
}
.printerin::before{
  content:"";
  position:absolute;
  top:0px;
  left:40px;
  width:280px;
  height:15px;
  border-radius:0px 0px 10px 10px;
  background:rgb(50,50,50);
  
}
.rainbow2{
  position:absolute;
  top:-20px;
  left:157px;
  height:20px;
  width:50px;
 
  opacity:.7;
}
.lense{
  position:absolute;
  top:31px;
  left:671px;
  width:100px;
  height:100px;
  border-radius:50%;
  background:black;
  border:4px solid rgb(50,50,50);
  box-shadow:-10px 10px 30px rgb(50,50,50);
}
.lense::after{
  content:"";
  position:absolute;
  left:10px;
  top:25px;
  width:20px;
  height:20px;
  border-radius:50%;
  background:white;
  
}
.lense::before{
  content:"";
  position:absolute;
  left:20px;
  top:20px;
  width:50px;
  height:50px;
  border-radius:50%;
  background:white;
  opacity:.5;
}
.button{
  position:absolute;
  left:600px;
  top:90px;
  width:50px;
  height:50px;
  border-radius:50%;
  background:#FF0200;
  border:3px solid rgb(230,230,230);
  cursor:pointer;
  box-shadow:0px 0px 5px black;
   outline: none;
}
.button:focus{
  position:absolute;
  left:600px;
  top:90px;
  width:50px;
  height:50px;
  border-radius:50%;
  background:#C62828;
  border:3px solid rgb(230,230,230);
  cursor:pointer;
  box-shadow:0px 0px 5px black;
   outline: none;
}
.flash{
  position:absolute;
  left:800px;
  top:30px;
  width:70px;
  height:50px;
  background: repeating-linear-gradient(
  to right,
  rgb(255, 254, 211),
  rgb(253, 248, 169) 10px,
  #a9d4a9 10px,
  #a9d4a9 20px
);
  border:solid;
}
.nod{
  position:absolute;
  left:815px;
  top:96px;
  width:25px;
  height:25px;
  border-radius:50%;
  background:rgb(20,20,20);
  border:5px solid rgb(50,50,50);
}
.lable{
  position:absolute;
  left:570px;
  top:30px;
  width:90px;
  height:40px;
  background:rgb(30,30,30);
  border-radius:10px 10px 10px 10px;
  text-align:center;
}
.lable h3{
  position:absolute;
  top:10px;
  left:18px;
  color:white;
}
.rainbow1{
  opacity:.8;
  position:absolute;
  top:50px;
  left:153px;
  height:130px;
  width:48px;

}
.rainbow{
  position:absolute;
  top:-2px;
  left:155px;
  height:61px;
  width:48px;

}
#s1{
  position:absolute;
  top:-240px;
  left:60px;
  width:240px;
  height:270px;
  border:5px solid white;
  border-bottom:30px solid white;
  box-shadow:0px 0px 40px black;
  background: url('https://user-images.githubusercontent.com/102042383/179392903-c7ecd023-abe9-47bf-9718-7ff29a417038.png');
  background-repeat: no-repeat;
  background-size: contain;
  transition:.5s;
  transform-origin:top;
  
}
#b{
  position:absolute;
  top:0px;
  left:0px;
  width:230px;
  height:150px;
  transition:.5s;
  transform-origin:top;
}
.top{
  position:absolute;
  top:-10px;
  left:600px;
  background:rgb(40,40,40);
  width:250px;
  height:20px;
  border-radius:10px 10px 0px 0px;
}

@keyframes print{
  0%{
   top:-240px;
    background:rgb(0,0,0);
  }
  10%{
  top:-200px; 
    background:rgb(0,0,0);
  }
  20%{
  top:-150px; 
    background:rgb(0,0,0);
  }
  30%{
  top:-100px; 
    background:rgb(0,0,0);
  }
  40%{
  top:-50px; 
    background:rgb(0,0,0);
  }
  50%{
  top:-10px; background:rgb(0,0,0);
  }
   60%{
  top:0px; background:rgb(0,0,0);
  }
  100%{
    top:60px;background:rgb(0,0,0);
  }
}
@keyframes show{
  from{
    opacity:1;
  }
  to{ 
    opacity:0;
  }
}



.marquee {
	 -webkit-touch-callout: none;
	 -webkit-user-select: none;
	 -moz-user-select: none;
	 -ms-user-select: none;
	 user-select: none;
	 position: relative;
	 overflow: hidden;
	 --offset: 20vw;
	 --item-font-size: 15px;
	 --move-initial: calc(-25% + var(--offset));
	 --move-final: calc(-50% + var(--offset));
   margin-bottom: 150px;
}
 .marquee__inner {
	 width: fit-content;
	 display: flex;
	 position: relative;
	 transform: translate3d(var(--move-initial), 0, 0);
	 animation: marquee 9s linear infinite;
}
 .marquee span {
	 white-space: nowrap;
	 font-size: 4.9vw;
	 padding: 0 2vw;
   text-transform: uppercase; 
   font-family: 'GmarketSansLight';
  
}
 @keyframes marquee {
	 0% {
		 transform: translate3d(var(--move-initial), 0, 0);
	}
	 100% {
		 transform: translate3d(var(--move-final), 0, 0);
	}
}



.bingle-img {
  animation: rotate 10s linear infinite;
    transform-origin: 50% 50%;
}

@keyframes rotate {
  from {
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  to {
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

 *{ cursor: url('data:image/x-icon;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////v////5////+f////n////4D///+D////j////x////w///HwP//jwH//4gB/gAAAfwAAAP/AAAH/wAAD/8AAB//gAA//8AA///4A////4H////A////8H/9/////f////3////8P//////////////////////////////8='), auto; }


</style>
</head>
<body>
 
  <header id="navbar-header">
	<jsp:include page="../common/header.jsp" />
  </header>


<!-- partial:index.partial.html -->
<div class="main">
  <div class="box">
    
    <div class="left curtain" data-rate="-1">
      <h2>
        탐나지🍊 승객 여러분 <br>
        제주도에 오신 것을 환영합니다!
      </h2>
    </div>
    <div class="right curtain" data-rate="1">
      <h2>
        탐나지🍊 승객 여러분 <br>
        제주도에 오신 것을 환영합니다!
      </h2>
    </div>

    <div class="main-1" data-scroll-speed="12">
      <div id="main-circle" class="animate_1">about</div>
         <div data-aos="fade-up">
      <p class="main-1-title animate_2" id="main-1-title">TAMNA<a>JI</a></p>
      <p class="main-1-title animate_3">제주 공간 예약 플랫폼</p>
         </div>
      
      <div data-aos="fade-up">
        <div class="main-2-title" style="font-size: 18px;">
        숙박 스몰웨딩 파티룸 촬영 스튜디오를 한번에!<br>
        <a>365일 최저가</a>로 만나보는 제주도 스페이스 </div>
      </div>
      </div>

      <div id="main-3" style="background-color: rgb(252, 250, 223); height: 1200px; padding-top: 50px;">
        
        <div class="marquee">
          <div class="marquee__inner" aria-hidden="true">
            <span> 탐나도? </span>
            <span> 탐나지! </span>
            <span> 탐나도? </span>
            <span> 탐나지! </span>
            <span> 탐나도? </span>
            <span> 탐나지! </span>
            <span> 탐나도? </span>
            <span> 탐나지! </span>
          </div>
        </div>

        <div data-aos="fade-down"
        data-aos-easing="linear"
        data-aos-duration="1500">


        <div class="cont1">
          <div class="top"></div>
          <div class="printerin">
              <div id="s1">
                <div id="b"></div>
            </div>
            
          </div>
            <div class="printer"></div>
          
          <div class="upper">
            <div class="rainbow1"></div>
          </div>
          <div class="downer"> <br> 빨간 버튼을 클릭해서 사진을 찍어보세요!
            <div class="rainbow"></div>
          </div>
          <div class="lense"></div>
          <button class="button" onclick="myFunction()"></button>
          <div class="flash"></div>
          <div class="nod"></div>
          <div class="lable">
            <h3>탐나지</h3>
          </div>
        </div>
        </div>

      
        <div class="marquee" style="margin-top: 900px;">
          <div class="marquee__inner" aria-hidden="true">
            <span> we make a difference. </span>
            <span> we make a difference. </span>
            <span> we make a difference. </span>
            <span> we make a difference. </span>
          </div>
        </div>

      </div>
    

</div>

<div style="background-color: rgb(252, 250, 223); overflow: hidden; height: 100%;">
  <div class="section">
    <ul class="case-study-wrapper">
      <li class="case-study-name">                              
        <a  class="hover-target">JUST STAY</a>
      </li>
      <li class="case-study-name">                                          
        <a  class="hover-target">PARTY ROOM</a>
      </li>
      <li class="case-study-name">                                          
        <a class="hover-target">PHOTO STUDIO</a>
      </li>
      <li class="case-study-name">                                          
        <a class="hover-target">SMALL WEDDING</a>
      </li>
    </ul>
    <ul class="case-study-images">
      <li>
        <div class="img-hero-background"></div> 
        <div class="dark-over-hero"></div>  
        <div class="hero-number-back">01</div> 
        <div class="hero-number">01</div> 
        <div class="hero-number-fixed">04</div> 
      </li>
      <li>
        <div class="img-hero-background"></div> 
        <div class="hero-number-back">02</div> 
        <div class="hero-number">02</div>  
      </li>
      <li>
        <div class="img-hero-background"></div>
        <div class="hero-number-back">03</div>  
        <div class="hero-number">03</div> 
      </li>
      <li>
        <div class="img-hero-background"></div> 
        <div class="hero-number-back">04</div> 
        <div class="hero-number">04</div> 
      </li>
    </ul> 

    <div class='cursor' id="cursor"></div>
      <div class='cursor2' id="cursor2"></div>
      <div class='cursor3' id="cursor3"></div> 

  </div>
</div>


<div>



</div>

  
  
<!-- partial -->
 <script>
   window.addEventListener("scroll", function() {
  var target = document.querySelectorAll('.curtain');
  var i=0, len=target.length;
  for(i; i<len; i++){
    var pos = window.pageYOffset * target[i].dataset.rate;
    target[i].style.transform='translate('+pos+ 'px, 0px)'
  }
  
});
   </script>

  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script type="text/javascript">
 $(function(){



var vi = 3000;  // 하단에 메뉴 표시할 스크롤 위치값 지정
$(window).scroll(function(){
   var num = $(window).scrollTop();

           if( num > vi ){
                $("#navbar-header").fadeIn();
           }else{
                $("#navbar-header").fadeOut();
          }
 });



});
 </script>

<script>
  AOS.init();
</script>

<script>
(function($) { "use strict";
    
    //Page cursors
  
      document.getElementsByTagName("body")[0].addEventListener("mousemove", function(n) {
          t.style.left = n.clientX + "px", 
      t.style.top = n.clientY + "px", 
      e.style.left = n.clientX + "px", 
      e.style.top = n.clientY + "px", 
      i.style.left = n.clientX + "px", 
      i.style.top = n.clientY + "px"
      });
      var t = document.getElementById("cursor"),
          e = document.getElementById("cursor2"),
          i = document.getElementById("cursor3");
      function n(t) {
          e.classList.add("hover"), i.classList.add("hover")
      }
      function s(t) {
          e.classList.remove("hover"), i.classList.remove("hover")
      }
      s();
      for (var r = document.querySelectorAll(".hover-target"), a = r.length - 1; a >= 0; a--) {
          o(r[a])
      }
      function o(t) {
          t.addEventListener("mouseover", n), t.addEventListener("mouseout", s)
      }
    
    $(document).ready(function() {
      
      /* Hero Case study images */      
      
      $('.case-study-name:nth-child(1)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(1)').addClass("show");
        $('.case-study-name:nth-child(1)').addClass('active');
      })
      $('.case-study-name:nth-child(2)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(2)').addClass("show");
        $('.case-study-name:nth-child(2)').addClass('active');
      })
      $('.case-study-name:nth-child(3)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(3)').addClass("show");
        $('.case-study-name:nth-child(3)').addClass('active');
      })
      $('.case-study-name:nth-child(4)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(4)').addClass("show");
        $('.case-study-name:nth-child(4)').addClass('active');
      })
      $('.case-study-name:nth-child(1)').trigger('mouseenter')
            
    });
  
    
    
    
    })(jQuery); 

</script>

<script>
  $(function(){

  if (!$('.envelope').hasClass('open')){
    $('.envelope').click(function(){
      $(this).removeClass('new').addClass('open');
    });
  }
  
});
</script>

<script>
  const PRINT_AUDIO = new Audio("https://www.soundjay.com/mechanical/sounds/polaroid-camera-take-picture-02.mp3");

function myFunction() {
  document.getElementById("s1").style.animation= "print 4.5s";
  document.getElementById("b").style.animation= " show 7s 4.5s";
  document.getElementById("b").style.opacity="0";
  document.getElementById("s1").style.top="60px";
  PRINT_AUDIO.play();
}
</script>

<script src='https://cdn.jsdelivr.net/npm/locomotive-scroll@3.3.11/dist/locomotive-scroll.min.js'></script>

<script>
  (function () {
  var scroll = new LocomotiveScroll({
    el: document.querySelector("[main]"),
    smooth: true,
    smoothMobile: true,
    offset: ["10%", 100]
  });
})();
</script>


<script type="text/javascript">
  // <![CDATA[
  var colour="#58D3F7"; // in addition to "random" can be set to any valid colour eg "#0040FF" or "red"
  var sparkles=50;
  
  var x=ox=400;
  var y=oy=300;
  var swide=800;
  var shigh=600;
  var sleft=sdown=0;
  var tiny=new Array();
  var star=new Array();
  var starv=new Array();
  var starx=new Array();
  var stary=new Array();
  var tinyx=new Array();
  var tinyy=new Array();
  var tinyv=new Array();
  
  window.onload=function() { if (document.getElementById) {
    var i, rats, rlef, rdow;
    for (var i=0; i<sparkles; i++) {
      var rats=createDiv(3, 3);
      rats.style.visibility="hidden";
      rats.style.zIndex="999";
      document.body.appendChild(tiny[i]=rats);
      starv[i]=0;
      tinyv[i]=0;
      var rats=createDiv(5, 5);
      rats.style.backgroundColor="transparent";
      rats.style.visibility="hidden";
      rats.style.zIndex="999";
      var rlef=createDiv(1, 5);
      var rdow=createDiv(5, 1);
      rats.appendChild(rlef);
      rats.appendChild(rdow);
      rlef.style.top="2px";
      rlef.style.left="0px";
      rdow.style.top="0px";
      rdow.style.left="2px";
      document.body.appendChild(star[i]=rats);
    }
    set_width();
    sparkle();
  }}
  
  function sparkle() {
    var c;
    if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
      ox=x;
      oy=y;
      for (c=0; c<sparkles; c++) if (!starv[c]) {
        star[c].style.left=(starx[c]=x)+"px";
        star[c].style.top=(stary[c]=y+1)+"px";
        star[c].style.clip="rect(0px, 5px, 5px, 0px)";
        star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
        star[c].style.visibility="visible";
        starv[c]=50;
        break;
      }
    }
    for (c=0; c<sparkles; c++) {
      if (starv[c]) update_star(c);
      if (tinyv[c]) update_tiny(c);
    }
    setTimeout("sparkle()", 40);
  }
  
  function update_star(i) {
    if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
    if (starv[i]) {
      stary[i]+=1+Math.random()*3;
      starx[i]+=(i%5-2)/5;
      if (stary[i]<shigh+sdown) {
        star[i].style.top=stary[i]+"px";
        star[i].style.left=starx[i]+"px";
      }
      else {
        star[i].style.visibility="hidden";
        starv[i]=0;
        return;
      }
    }
    else {
      tinyv[i]=50;
      tiny[i].style.top=(tinyy[i]=stary[i])+"px";
      tiny[i].style.left=(tinyx[i]=starx[i])+"px";
      tiny[i].style.width="2px";
      tiny[i].style.height="2px";
      tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
      star[i].style.visibility="hidden";
      tiny[i].style.visibility="visible"
    }
  }
  
  function update_tiny(i) {
    if (--tinyv[i]==25) {
      tiny[i].style.width="1px";
      tiny[i].style.height="1px";
    }
    if (tinyv[i]) {
      tinyy[i]+=1+Math.random()*3;
      tinyx[i]+=(i%5-2)/5;
      if (tinyy[i]<shigh+sdown) {
        tiny[i].style.top=tinyy[i]+"px";
        tiny[i].style.left=tinyx[i]+"px";
      }
      else {
        tiny[i].style.visibility="hidden";
        tinyv[i]=0;
        return;
      }
    }
    else tiny[i].style.visibility="hidden";
  }
  
  document.onmousemove=mouse;
  function mouse(e) {
    if (e) {
      y=e.pageY;
      x=e.pageX;
    }
    else {
      set_scroll();
      y=event.y+sdown;
      x=event.x+sleft;
    }
  }
  
  window.onscroll=set_scroll;
  function set_scroll() {
    if (typeof(self.pageYOffset)=='number') {
      sdown=self.pageYOffset;
      sleft=self.pageXOffset;
    }
    else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
      sdown=document.body.scrollTop;
      sleft=document.body.scrollLeft;
    }
    else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
      sleft=document.documentElement.scrollLeft;
      sdown=document.documentElement.scrollTop;
    }
    else {
      sdown=0;
      sleft=0;
    }
  }
  
  window.onresize=set_width;
  function set_width() {
    var sw_min=999999;
    var sh_min=999999;
    if (document.documentElement && document.documentElement.clientWidth) {
      if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
      if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
    }
    if (typeof(self.innerWidth)=='number' && self.innerWidth) {
      if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
      if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
    }
    if (document.body.clientWidth) {
      if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
      if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
    }
    if (sw_min==999999 || sh_min==999999) {
      sw_min=800;
      sh_min=600;
    }
    swide=sw_min;
    shigh=sh_min;
  }
  
  function createDiv(height, width) {
    var div=document.createElement("div");
    div.style.position="absolute";
    div.style.height=height+"px";
    div.style.width=width+"px";
    div.style.overflow="hidden";
    return (div);
  }
  
  function newColour() {
    var c=new Array();
    c[0]=255;
    c[1]=Math.floor(Math.random()*256);
    c[2]=Math.floor(Math.random()*(256-c[1]/2));
    c.sort(function(){return (0.5 - Math.random());});
    return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
  }
  // ]]>
  </script>

</body>
</html>
