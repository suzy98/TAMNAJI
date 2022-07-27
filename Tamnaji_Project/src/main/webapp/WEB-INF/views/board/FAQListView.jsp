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

  <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script
  src="https://kit.fontawesome.com/77e29b57dd.js"
  crossorigin="anonymous"
  ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<title>FAQ</title>
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
    <p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">자주 묻는 질문</p>
    
	<section class="py-60">
		<div class="text-control-1">
          <div class="faqs-section">
              <div class="faq accordion">
                  <div class="question-wrapper">
                      <div class="d-flex align-items-center">
                          <p class="question" title=""> [예약] 예약 변경은 어떻게 하나요? </p>
                      </div><i class="material-icons drop">expand_more</i>
                  </div>
                  <div class="answer-wrapper">
                      <p class="answer">
                        공간의 예약 변경은 변경되는 날짜에 대한 예약 가능 여부에 따라 달라질 수 있으므로<br>
                        예약 변경은 직접 할 수 없으며, 취소 후 재구매를 하셔야 합니다.</p>
                  </div>
              </div>
              <div class="faq accordion">
                  <div class="question-wrapper">
                      <div class="d-flex align-items-center">
                          <p class="question" title=""> [예약] 예약을 실수로 취소했는데, 다시 복구할 수 있나요?</p>
                      </div><i class="material-icons drop">expand_more</i>
                  </div>
                  <div class="answer-wrapper">
                      <p class="answer">
                        취소된 예약의 복구는 불가합니다. <br>

                        재예약을 원하시는 경우, 탐나지를 통해 재예약을 하시거나 호스트님과 협의 후 진행해주세요.
                      </p>
                  </div>
              </div>
              <div class="faq accordion">
                <div class="question-wrapper">
                    <div class="d-flex align-items-center">
                        <p class="question" title=""> [예약] 코로나로 인해 환불해야 하는데, 전액 환불이 가능한가요?</p>
                    </div><i class="material-icons drop">expand_more</i>
                </div>
                <div class="answer-wrapper">
                    <p class="answer">
                      현재 코로나로 인한 공간 예약 취소/환불 시 공간을 직접 관리하시는 <br>

                      호스트님께 문의해주셔야 하는 점 참고 부탁드립니다.
                    </p>
                </div>
                </div>
                <div class="faq accordion">
                  <div class="question-wrapper">
                      <div class="d-flex align-items-center">
                          <p class="question" title=""> [이용] 이용한 공간에 분실물을 두고 왔어요!</p>
                      </div><i class="material-icons drop">expand_more</i>
                  </div>
                  <div class="answer-wrapper">
                      <p class="answer">
                        공간을 관리하시는 호스트님께 직접 문의 부탁드립니다. <br>

                        호스트님과 연락이 안 되는 경우, 탐나지 일대일 채팅 문의로 남겨주시면 <br>
                        호스트님께 확인 안내 드리겠습니다.
                      </p>
                  </div>
              </div>
              
              <div class="faq accordion">
                <div class="question-wrapper">
                    <div class="d-flex align-items-center">
                        <p class="question" title=""> [이용] 이용 후기는 어떻게 작성하나요?</p>
                    </div><i class="material-icons drop">expand_more</i>
                </div>
                <div class="answer-wrapper">
                    <p class="answer">
                      마이페이지 -> 나의 예약내역 -> 후기 작성을 클릭하시면 작성이 가능합니다. <br>
                    </p>
                </div>
            </div>
            <div class="faq accordion">
              <div class="question-wrapper">
                  <div class="d-flex align-items-center">
                      <p class="question" title=""> [이용] 저도 호스트가 되고 싶어요!</p>
                  </div><i class="material-icons drop">expand_more</i>
              </div>
              <div class="answer-wrapper">
                  <p class="answer">
                    마이페이지 -> 호스트 등록 신청 을 이용하셔서 신청을 해주시면 <br>
                    심사를 거쳐 호스트로 등록을 해드리고 있습니다 :) <br>
                    나누고 싶은 공간이 있는 분이라면, 누구나 신청이 가능합니다.
                  </p>
              </div>
            </div>
          </div>
		</div>
	</section>
  </div>
  
  
</div>















<script>
  $(document).ready(function() {
$('.review-button').click(function(e) {
  $('.popup-wrap').fadeIn(500);
  $('.popup-box').removeClass('transform-out').addClass('transform-in');

  e.preventDefault();
});

$('.popup-close').click(function(e) {
  $('.popup-wrap').fadeOut(500);
  $('.popup-box').removeClass('transform-in').addClass('transform-out');

  e.preventDefault();
});
});
</script>


<script>
    $(document).ready(function() {
  $('.delete-button').click(function(e) {
    $('.popup-wrap-2').fadeIn(500);
    $('.popup-box-2').removeClass('transform-out').addClass('transform-in');
  
    e.preventDefault();
  });
  
  $('.popup-close-2').click(function(e) {
    $('.popup-wrap-2').fadeOut(500);
    $('.popup-box-2').removeClass('transform-in').addClass('transform-out');
  
    e.preventDefault();
  });
  });
  </script>
  

  <script>
    $(".question-wrapper").click( function () {
  var container = $(this).parents(".accordion");
  var answer = container.find(".answer-wrapper");
  var trigger = container.find(".material-icons.drop");
	var state = container.find(".question-wrapper");
  
  answer.animate({height: "toggle"}, 100);
  
  if (trigger.hasClass("icon-expend")) {
    trigger.removeClass("icon-expend");
		// state.removeClass("active");
  }
  else {
    trigger.addClass("icon-expend");
		// state.addClass("active");
  }
  
  if (container.hasClass("expanded")) {
    container.removeClass("expanded");
  }
  else {
    container.addClass("expanded");
  }
});
  </script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>