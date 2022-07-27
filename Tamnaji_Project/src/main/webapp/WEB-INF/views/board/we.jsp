<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
  <link rel='stylesheet' href='https://unpkg.com/swiper@5.2.0/css/swiper.min.css'>
  <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script
  src="https://kit.fontawesome.com/77e29b57dd.js"
  crossorigin="anonymous"
></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <title>위얼 탐나지</title>
  <style>

    	
/*드래그 컬러*/
::selection{color:black;background:#eef5eb;}
::-moz-selection{color:black;background:#eef5eb;}

/* 스크롤 바 */
::-webkit-scrollbar { width: 10px; }
::-webkit-scrollbar-track { background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0.0 );
 }
::-webkit-scrollbar-thumb { background-color: #ffdbc4; }
::-webkit-scrollbar-button { display: none; }

@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
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



/*----------------------------------------------------------------------*/
/*마이페이지 관련*/


.container {
  margin-left: 100px;
}

#aside {
  width: 300px;
  height: 800px;
  float: left;

}

#content {
  margin-left: 35%;
  width: 800px;
  height: 800px; 
   
  
}

#side-menubar-name {
  text-align: center;
  width: 220px;
  background: linear-gradient( to top, #cce7d44b 2%, #e0f8df );
  padding-top: 20px;
  padding-bottom: 30px;
  padding-left: 10px;
  padding-right: 10px;
  font-size: 25px;
  margin-left: 3px;

  border-radius: 50px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  
  
}

.side-menubar {
  width: 220px;
  margin-left: 35%;
  border-radius: 50px;
}

#side-menubar-list li {
  text-align: center;
  width: 220px;
  background-color: #cce7d44b;
  margin-left: 3px;
  font-size: 15px;
  list-style-type: none;
  padding-top: 15px;
  padding-bottom: 15px;

}


#side-menubar-list li:last-child {
  text-align: center;
  width: 220px;
  background-color: #cce7d44b;
  margin-left: 3px;
  font-size: 15px;
  list-style-type: none;
  padding-top: 15px;
  padding-bottom: 35px;
  border: none;
  border-bottom-left-radius: 50px;
  border-bottom-right-radius: 50px;

}

#side-menubar-list li:hover {
  background-color: #d1f0d0;
  font-weight: bold;
}

#side-menubar-list li:active {
  background-color: #d1f0d0;
  font-weight: bold;
}

#side-menubar-list li a:hover {
  color: #333;
}



        a{
            text-decoration: none;
            color: #3b3b3b;
        }


        select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}


/*-----------------------------------------------------*/
/* 예약내역 관련 -----*/

#res {
  width: 62px;
  padding: 5px;
  background-color: #fde4d8;
  color: #fd6500;
  font-weight: bold;
  font-size: 13px;
  border-radius: 10px;
  margin-bottom: 10px;
}

#res-date {
  font-size: 15px;
  font-weight: bold;
}

#res-box {
  width:670px; 
  box-sizing: border-box;
  border-radius: 10px;
  margin-top: 40px;
  padding-bottom: 28px;
  padding-top: 30px;
  padding-left: 45px;
  padding-right: 20px;
  border: 1px solid rgb(240, 240, 240); margin-top: 10px;
  box-shadow: 0 0px 3px #f0efef;
}

#res-box:hover {
  box-shadow: 0 0px 6px #dddddd;
}

#checkin {
  padding-top: 10px;
  background-color: #f8f8f8e3;
  border-radius: 10px;

}

.check-date {
  font-size: 13px;
  
}

.delete-button {
  width: 100px;
  margin: auto; display: block;
  padding: 15px;
  background-color: #fafafa;
  border: none;
  border-radius: 30px;
  box-shadow: 0 0px 3px #e1e1e1;
}

.res-button:hover {
  cursor: pointer;
  background-color: #4cc55c;
  color: white;
}

.review-button {
  background-color: #e3f2e5;
  width: 100px;
  margin: auto; display: block;
  padding: 15px;
  border: none;
  border-radius: 30px;
  box-shadow: 0 0px 3px #e1e1e1;
}

.review-button:hover {
  cursor: pointer;
  background-color: #4cc55c;
  color: white;
}

.delete-button:hover {
  cursor: pointer;
  background-color: #4cc55c;
  color: white;
}

/*모달------------------------------------*/
.popup-wrap, .popup-wrap-2 {
	 width: 100%;
	 height: 100%;
	 display: none;
     position: fixed;
	 top: 0px;
	 left: 0px;
     background:rgba(0, 0, 0, 0.5);
     overflow: hidden;
}
 .popup-box, .popup-box-2 {
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

 .popup-box .close-btn, .popup-box-2 .close-btn {
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

.popup-box-2 .close-btn:hover {
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


/*--- 삭제 --- */
.delete-title {
    color: #333;
    font-size: 20px;
}

.delete-title strong {
    color: #fd6500;
}

#delete-button-inner {

    margin-top: 30px;
    padding: 20px;
    background-color: rgb(237, 237, 237);
    border: none;
    border-radius: 50px;
}

#delete-button-inner:hover {
    background-color: #b9e4b5;
    cursor: pointer;
}




/*별점-----------------------------*/

.cont, .cont-2{
  width: 93%;
  max-width: 400px;
  text-align: center;
  margin: 4% auto;
  padding: 30px 0;
  color: #EEE;
  border-radius: 5px;
  overflow: hidden;
}


div.title{
  font-size: 2em;
}


div.stars{
  width: 270px;
  display: inline-block;
  margin-top: 20px;
}

input.star{
  display: none;
}

label.star {
  float: right;
  margin-left: 5px;
  padding: 10px;
  font-size: 25px;
  color: rgb(186, 186, 186);
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  font-family: "Font Awesome 5 Free";
  color: #FD4;
  transition: all .25s;
  font-weight: 900;
}


input.star-5:checked ~ label.star:before {
  color:rgb(255, 223, 119);
  text-shadow: 0 0 2px rgb(240, 155, 64);
}

input.star-1:checked ~ label.star:before {
  color: rgba(255, 211, 34, 0.466);
}

label.star:hover{
  transform: rotate(-15deg) scale(1.3);
}

label.star:before{
  content: '\f005';
  font-family: "Font Awesome 5 Free";
  font-weight: 900;
}

.rev-box{
  overflow: hidden;
  height: 0;
  width: 100%;
  transition: all .25s;
}

textarea.review{
  border: 1px solid rgb(218, 218, 218);
  border-radius: 10px;
  width: 100%;
  max-width: 100%;
  height: 100px;
  padding: 10px;
  box-sizing: border-box;
  color: rgb(87, 87, 87);
}

textarea.review:focus {
    outline: none;
    box-shadow: 0 0 5px rgb(143, 196, 141);
}

label.review{
  display: block;
  transition:opacity .25s;
  color: #858484;
  font-size: 12px;
}



input.star:checked ~ .rev-box{
  height: 125px;
  overflow: visible;
}

#review-submit {
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



/* 아코디언 ---------------------------------*/


.question {
  font-size: 20px;
  color: #5c5c5c;
  line-height: 1.5;
  padding: 20px;
  margin-bottom: 0;
}
.material-icons.drop {
  padding: 20px;
  font-size: 2rem;
  color: #8fc7ab;
  transition: transform 0.5s ease-in-out;
}
.answer {
  font-size: 16px;
  color: #5c5c5c;
  padding: 30px;
  overflow: hidden;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  background-color: #fcfcfc;
  line-height: 28px;
}
.accordion {
  color: #444;
  cursor: pointer;
  margin-bottom: 20px;
  text-align: left;
  box-shadow: 0 0 2px #a0bba7;
  border-radius: 20px;
  outline: none;
  transition: 0.4s;
}

@media only screen and (max-width: 768px) {
  .accordion {
    margin-bottom: 16px;
  }
}
.question-wrapper {
  display: flex;
  justify-content: space-between;
  align-items: center;
  transition: background-color 0.25s ease-in-out;
}
.answer-wrapper {
  display: none;
}
.icon-expend {
  transform: rotateX(180deg);
  transition: transform 0.75s ease-in-out;
}
.active,


.active p,
.accordion:hover .question-wrapper p {
  color: #3d3d3d;
}

.accordion:hover {
  background-color: #eef7f1;
}



.swiper-container {
  height: 400px;
  width: 100%;
  padding-bottom: 85px;
}

.swiper-wrapper {
  width: 73.8%;
  will-change: transform;
}
@media (min-width: 630px) {
  .swiper-wrapper {
    width: 100%;
  }
}

.swiper-slide {
  width: 100%;
  background-color: white;
  overflow: hidden;
}
.swiper-slide.swiper-slide-active .slide-image, .swiper-slide.swiper-slide-duplicate-active .slide-image {
  transform: scale3d(1, 1, 1);
}
@media (min-width: 630px) {
  .swiper-slide {
    width: 50%;
  }
}
@media (min-width: 768px) {
  .swiper-slide {
    width: 33.333333%;
  }
  .swiper-slide.swiper-slide-next .slide-image, .swiper-slide.swiper-slide-prev .slide-image, .swiper-slide.swiper-slide-duplicate-next .slide-image, .swiper-slide.swiper-slide-duplicate-prev .slide-image {
    transform: scale3d(1, 1, 1);
  }
}
@media (min-width: 1024px) {
  .swiper-slide {
    width: 25%;
  }
}

.swiper-pagination {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 85px;
}
.swiper-pagination.swiper-pagination {
  bottom: 0;
}

.swiper-pagination-bullet {
  background: rgb(160, 218, 160);
  width: 22px;
  height: 4px;
  border-radius: 0;
  transition: opacity 1s ease;
}
.swiper-pagination-bullet.swiper-pagination-bullet.swiper-pagination-bullet {
  margin: 0;
}
@media (min-width: 768px) {
  .swiper-pagination-bullet {
    width: 40px;
  }
}

.slide-image {
  height: 100%;
  width: 100%;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  transform: scale3d(1.3, 1.3, 1);
  backface-visibility: hidden;
  will-change: transform;
  transition: transform 1400ms ease;
}

.slide-content {
  padding: 0 2.2rem;
  display: flex;
  flex-direction: column;
  height: 100%;
}
.slide-content h4 {
  font-size: 25px;
  font-weight: 400;
  margin: 0 0 1rem;
  padding-top: 2.8rem;
  flex-grow: 0;
}
.slide-content p {
  display: flex;
  line-height: 1.8;
  margin-top: 0;
  font-size: 14px;
  flex-grow: 1;
}
.slide-content footer {
  display: flex;
  justify-content: space-between;
  width: 100%;
  padding-bottom: 2.8rem;
  font-size: 14px;
  color: #c2c0e0;
}
.slide-content a {
  color: rgb(168, 224, 154);
  font-size: 12px;
  font-weight: 700;
  text-decoration: none;
  border-bottom: 3px solid currentColor;
  padding-bottom: 3px;
}



  </style>

  <body>

<jsp:include page="../common/header.jsp" />

    <!-- 여기부터 컨텐츠 영역 ---------------------------->

<div class="container" style=" padding-top: 170px;margin: 0 auto;">
  <div class="content" id="aside" style=" background: white">    
    
    <div class="side-menu"style="margin-left: 10px;">
      <div class="side-menubar">
      <p id="side-menubar-name">👩🏻‍💻 고객센터 👩🏻‍💻</p>
      <ul id="side-menubar-list">
        <li><a href="list.no">공지사항</a></li>
        <li><a href="list.faq">자주 묻는 질문</a></li>
        <li><a href="list.tam">What is TAMNAJI?</a></li>
      </ul>
      </div>
    </div>
  </div>

  <div class="content-2" id="content" style=" height:1300px;">
    <p style="margin-top: 10px; margin-bottom: 100px; font-size: 25px;">We are tamnaji!</p>
    <p style="margin-bottom: 20px; text-align: center; color: rgb(179, 179, 179);">사진에 마우스를 대고 스크롤을 해보세요 :)</p>
    
  <section>
    <!-- partial:index.partial.html -->
<div class="swiper-container">
  <div class="swiper-wrapper">
      <div class="swiper-slide">
          <div 
              class="slide-image" 
              style="background-image: url(https://user-images.githubusercontent.com/102042383/179156363-97210f8f-7bd2-4142-819b-0eb961eafe65.png)">
          </div>
      </div>
      <div class="swiper-slide">
          <div 
              class="slide-image" 
              style="background-image: url(https://user-images.githubusercontent.com/102042383/179156378-91f2a755-6948-4adc-9226-d8a082cd6eed.png)">
          </div>
      </div> 
      <div class="swiper-slide">
          <div 
              class="slide-image" 
              style="background-image: url(https://user-images.githubusercontent.com/102042383/179156356-57b2a5ee-7057-4670-b013-251cea3946b6.png)">
          </div>
      </div>
      <div class="swiper-slide">
          <article class="slide-content" style="background-color: #ecf5ec;">
              <h4 style="color: #fd6500;"> TAMNA<a style="border-bottom: none; font-size: 26px; color: #39a652; font-weight: 400;">JI</a></h4>
              <p>
                탐나지는 제주도 공간 예약 플랫폼입니다! <br>
                제주도에서 숙박 외에 파티룸, 스몰 웨딩 등 <br>
                핫한 공간들을 찾기가 <br> 조금 힘드셨던 분들을<br>
                위해 탄생됐어요! 😎
                 
              </p>
          </article>
      </div>
      <div class="swiper-slide">
          <div 
              class="slide-image" 
              style="background-image: url(https://user-images.githubusercontent.com/102042383/179155962-486e8eab-a39e-4fc0-a7e0-b0f70808a4ac.png)">
          </div>
      </div>
      <div class="swiper-slide">
          <div 
              class="slide-image" 
              style="background-image: url(https://user-images.githubusercontent.com/102042383/179337761-c9a03663-5e83-438d-ae96-21b8121f6c7c.png)">
          </div>
      </div>
      <div class="swiper-slide">
          <div 
              class="slide-image" 
              style="background-image: url(https://user-images.githubusercontent.com/102042383/179337768-5457a015-cb2b-4313-90ba-6714f74300ab.png)">
          </div>
      </div>
      <div class="swiper-slide">
          <article class="slide-content" style="background-color: #e5f2f8;">
             
              <p style="margin-top: 100px;">
                탐나지와 함께<br>
                멋진 제주도에서 <br>
                특별한 추억을 <br>
                만들어보세요 🌴
              </p>
          </article>
      </div>
    
  </div>

  <div class="swiper-pagination"></div>
</div>
   
  </section>
  
  
        </div>




  </div>






<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js'></script>
<script>
  new Swiper('.swiper-container', {
  slidesPerView: 'auto',
  initialSlide: 2,
  speed: 1000,
  spaceBetween: 32,
  loop: true,
  centeredSlides: true,
  roundLengths: true,
  mousewheel: true,
  grabCursor: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true } });
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>