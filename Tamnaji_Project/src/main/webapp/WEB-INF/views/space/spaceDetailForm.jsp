<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script
  src="https://kit.fontawesome.com/77e29b57dd.js"
  crossorigin="anonymous"
  ></script>
  <!--지도-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bc3469fb0ee31e45bc0f8cc2302d60f"></script>
  
  <!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
  <title>스페이스 상세보기</title>
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

#login a {
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



/*----------------------------------------------------------------------*/
/*컨텐츠 관련*/



#aside {
  margin-left: 7%;
  width: 850px;
  height: 100%;
  display: inline-block;
  margin-bottom: 5%;
  margin-right: 5%;
}

.comment-content {
  margin-left: 8%;
  width: 850px;
  height: 100%;
  display: inline-block;
}

#comment-content {
  height: 500px;
}


#right-content {
  margin-left: 5%;
  width: 300px;
  height: 100%;
  display: inline-block;
  
}



        select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}


/*-------------------------------------------*/
.carousel{
    width: 850px;
    height: 60%;
    margin-top: 40px;
    margin-bottom: 40px;
    position: relative;
    overflow-x: hidden;

    display: flex;
    justify-content: flex-start;
    border-radius: 13px;
}

.carousel-inner{
    width: 700px;
    height: 80%;
    display: flex;
    transition: all ease .5s;
}

.carousel-item{
    flex: 1;
    height: 80%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.carousel-controls .prev{
    display: inline-block;
    height: 32px;
    width: 32px;
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    background-image: url('resources/images/space/prev.svg');
    background-position: center;
    background-size: auto 100%;
    background-repeat: no-repeat;
    cursor: pointer;
    opacity: .5;
}

.carousel-controls .next{
    display: inline-block;
    height: 32px;
    width: 32px;
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    background-image: url('resources/images/space/next copy.svg');
    background-position: center;
    background-size: auto 100%;
    background-repeat: no-repeat;
    cursor: pointer;
    opacity: .5;
}

.prev:hover, .next:hover{
    opacity: 1;
}

.carousel-indicators{
    position: absolute;
    bottom: 12px;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
}

.carousel-indicators span{
    display: inline-block;
    background-color: white;
    width: 30px;
    height: 4px;
    border-radius: 2px;
    opacity: .5;
    cursor: pointer;
    margin: 3px;
}

.carousel-indicators span.active{
    opacity: 1;
}


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


@media screen and (max-width: 1268px) {
   #right-box {
      display: none;
   }
}

#space-text {
  margin-top: 30px;
  margin-bottom: 15px;
  margin-left: 15px;
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
  margin-top: 10px;
}

#space-res button:hover {
  background-color: #0ba52f;
  cursor: pointer;
}


/*스페이스 선택 -----------------------------------------*/
.select-box {
    position: relative;
   float: left;
    display: block;
    width: 120px;
   padding-left: 1px;
   margin-left: 18px;
   margin-right: 14px;
   font-size: 14px;
   text-align: center;
   border-radius: 20px;

}

 .select-box__current {
    position: relative;
    cursor: pointer;
    outline: none;
   background-color: white;
   border: none;
   border-radius: 20px;
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
   background-color: white;
   box-shadow: 0px 0px 2px rgb(158, 158, 158);
   border: none;
   text-align: center;
   border-radius: 20px;
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
   background-color: white;
   border: none;
   border-radius: 20px;
}
 .select-box__option {
    display: block;
    padding: 7px;
   background-color: white;
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
    box-shadow: 0px 0px 2px rgb(158, 158, 158);
}

#help li {
    width: 120px;
    border: none;
    box-shadow: none;
    background: none;
    border-radius: 20px;
    padding-left: 0px;
    padding: 7px;
}

#help li:last-child {
    width: 120px;
    background: white;
    border: none;
    border-radius: 20px;
    padding-left: 0px;
    padding: 7px;
}



/*날짜 ---------------------------------*/

.check-box {
    display: inline;
    margin-left: 18px;
  }


.checkin-box {
      text-align: center;
      margin-left: 20px;
      margin-bottom: 20px;
      cursor: pointer;
      width: 120px;
      min-height: 40px;
      max-height: 300px;
      border-radius: 20px;
      background-color: white;
      box-shadow: 0px 0px 2px rgb(158, 158, 158);
      border: none;
  }



  .ui-datepicker-header.ui-widget-header.ui-helper-clearfix.ui-corner-all {
  background: white;
  border: none;
}


.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
  background: white;
  border: none;
}


.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight {
  background: #f8ceaf;
}

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active {
  background: #fd6500;
  color: white;
  cursor: pointer;
}

#date-picker-dates {
    background: #fdab6c;
    padding: 10px;
    margin-bottom: 30px;
    user-select: none;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
  }
  .date-picker-date {
    position: relative;
    display: inline-block;
    background: rgb(253, 165, 105);
    padding: 10px 15px;
    padding-right: 50px;
    margin: 10px;
    cursor: pointer;
    box-shadow: 0 0 20px 0 rgba(232, 232, 232, 0.15), 3px 3px 5px 0 rgba(220, 220, 220, 0.06);
    transition: none;
  }
  .date-picker-date:hover, .date-picker-date.active {
    box-shadow: 0 0 25px 0 rgba(250, 216, 209, 0.2), 3px 3px 5px 0 rgba(252, 171, 147, 0.15);
  }
  .date-picker-date.active {
    font-weight: bold;
  }
  .date-picker-date:after {
    position: absolute;
    display: block;
    height: 24px;
    width: 24px;
    top: 10px;
    right: 10px;
    background: url(https://image.freepik.com/free-icon/calendar-icon-in-black_318-9776.jpg&#34;
    );
    background-repeat: no-repeat;
    background-size: 24px;
  }



/*인원 수 선택----------*/

.select-box-2 {
  position: relative;
   float: left;
    display: block;
    width: 120px;
   padding-left: 1px;
   margin-right: 5px;
   font-size: 14px;
   text-align: center;
   border-radius: 20px;

}


.select-box-2 ul li {
    background-color: none;
}
.select-box__current-2 {
    position: relative;
    cursor: pointer;
    outline: none;
   background-color: white;
   border: none;
   border-radius: 20px;
}
 .select-box__current-2:focus + .select-box__list-2 {
    opacity: 1;
    animation-name: none;
}
 .select-box__current-2:focus + .select-box__list-2 .select-box__option-2 {
    cursor: pointer;
}
 .select-box__current-2:focus .select-box__icon-2 {
    transform: translateY(-50%) rotate(180deg);
}
 .select-box__icon-2 {
    position: absolute;
    top: 50%;
    right: 15px;
    transform: translateY(-50%);
    width: 10px;
    opacity: 0.3;
    transition: 0.2s ease;
}
 .select-box__value-2 {
    display: flex;
     border-radius: 50px;

}
 .select-box__input-2 {
    display: none;
}
 .select-box__input-2:checked + .select-box__input-text-2 {
    display: block;
}
 .select-box__input-text-2 {
    display: none;
    width: 100%;
    margin: 0;
    padding: 11px;
   padding-left: 1px;
   background-color: white;
   box-shadow: 0px 0px 2px rgb(158, 158, 158);
   border: none;
   text-align: center;
   border-radius: 20px;
}
 .select-box__list-2 {
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
   background-color: white;
   border: none;
   border-radius: 20px;
}
 .select-box__option-2 {
    display: block;
    padding: 7px;
   background-color: white;
}
 .select-box__option-2:hover, .select-box__option-2:focus {
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

#plz {
    margin-top: 10px;
    background-color: white;
    box-shadow: 0 0 2px #c5c5c5;
}

#plz li {
    width: 120px;
    border: none;
    box-shadow: none;
    background: none;
    border-radius: 20px;
    padding-left: 0px;
    padding: 7px;
}

#plz li:last-child {
    width: 120px;
    background: white;
    border: none;
    border-radius: 20px;
    padding-left: 0px;
    padding: 7px;
}

/*공간 상세보기 ------------------------------*/
#space-view-header {
  padding-bottom: 30px;
  border-bottom: 1px solid rgb(235, 235, 235);
}

#space-view-title {
  font-size: 30px;
}

#space-view-detail {
  margin-top: 5px;
  font-size: 13px;
  color: gray;
}

#space-description {
  width: 770px;
  font-size: 14px;
  line-height: 25px;
  word-break: keep-all;
  padding-top: 60px;
  padding-bottom: 50px;
}

#space-information, #space-checkin {
  border-top: 1px solid  rgb(235, 235, 235);
  padding-bottom: 40px;
}

#space-info-title, #comment-content-title, #space-map-title, #checkin-title {
  margin-top: 50px;
  margin-bottom: 50px;
  font-size: 20px;
}

#checkin-detail {
    line-height: 30px;
    padding-bottom: 30px;
    font-size: 12px;
    color: gray;
}

#checkin-table {
  border-collapse: separate;
  border-spacing: 0 15px;

}

#checkin-table td {
    padding-right: 20px;
}

.space-info-table {
  border-collapse: separate;
  border-spacing: 0 20px;
  margin-right: 100px;
  display: inline-block;
}

#info-image {
  width: 25px;
  margin-right: 10px;
}

#space-map {
  border-top: 1px solid  rgb(235, 235, 235);
}



/*--------------------*/

.card-more {
  margin-left: 20px;
  font-size: 23px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  text-align: center;
}

.sum-favorite {
  font-size: 13px;
}
.card-favorite .fa-heart {
  color: #B5B5B5;
  transition: all 0.3s ease;
}

.card-favorite .fa-heart.loved {
  color: #F14137;
}

.fa-heart2{
  color: #F14137;
}

.scale-animation {
  transform: scale(1.3);
}

.card-favorite .fa-heart:hover {
  color: #F14137;
}

.card-favorite .sum-favorite {
  color: #555555;
}

.card-rating {
  color: #B5B5B5;
}

.card-rating .rated {
  color: #FFD700;
}


/*-------------*/



#comment-table {
  width: 500px;
  border-collapse: separate;
  border-spacing: 0 5px;
  box-shadow: 0 0 5px #ddd;
  border-radius: 15px;
  padding-top: 10px;
  padding-left: 16px;
  padding-bottom: 10px;
  margin-bottom: 20px;
}



#c-profile {
  width: 55px;
}

#c-pic {
    width: 40px;
    height: 40px;
    border-radius: 50px;
}

#c-nickname {
  width: 100px;
  font-size: 13px;
  font-weight: 600;
}

#c-date {
  width: 200px;
  color: gray;
  font-size: 12px;
}

#comment-rating {
  font-size: 9px;
  width: 190px;
}

#c-detail {
  font-size: 13px;
}


/*룸 카드 ---------*/

#room-card {
  margin-top: 20px;
  padding-top: 80px;
  padding-bottom: 60px;  
  border-top: 1px solid  rgb(235, 235, 235);
}

#room-card-table:hover {
  box-shadow: 0 0 3px rgb(208, 207, 207);
}

#room-card-table:focus {
  box-shadow: 0 0 3px rgb(205, 224, 204);
}

#room-card-table {
  border: 1px solid  rgb(235, 235, 235);
  border-radius: 10px;
  width: 850px;
  border-spacing: 0px;
  margin-bottom: 50px;
}

#room-card-table img {
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  display: block;
}

#room-card-title {
  font-size: 20px;
  height: 40px; 
  padding-top: 15px; 
  padding-bottom: 10px;
}

#room-card-price {
  font-size: 20px;
  font-weight: 700;
  float: right; 
  margin-top: 20px; 
  margin-right: 20px; 
  margin-bottom: 10px;
}

.room-card-detail {
  font-size: 11px;
  color: gray;
}

.tag-section {
  margin-top: 30px;
  margin-bottom: 10px;
}

.hash-tag {
  background-color: #dff5da;
  border-radius: 50px;
  padding: 9px;
  margin-right: 8px;
  font-size: 12px;
}

.pagination-page-number:hover {
    color: green;
}

.pagination-page-number.active {
    color: green;
}
</style>
</head>
<body>
  <jsp:include page="../common/header.jsp" />

<!-- 여기부터 컨텐츠 영역 ---------------------------->

<div class="container" style=" padding-top: 5%; margin: 0 auto; height: 100%;">
  <div style="margin: 0 auto; padding-left: 7%; float: left;">
    <div class="carousel">
      <div class="carousel-inner">
          <c:forEach var="sa" items="${saList}" varStatus="status">
          <div id="image-${status.count}" class="carousel-item">
              <img src="${sa.changeName}" style="width: 850px; height:500px; background-size: cover;">
          </div>
        </c:forEach>
      </div>
      <div class="carousel-controls">
          <span class="prev"></span>
          <span class="next"></span>
      </div>
      <div class="carousel-indicators"></div>
   </div>
</div>

<div style="float: right; margin-top: 2.5%; margin-right: 7%; justify-content: space-between;">

  <form action="reservationForm" method="get">
     <input type="hidden" name="mNo" value="${loginUser.memberNo}">
    <div id="right-box">
      
      <div id="space-text">
        <span id="space-price">
          ₩<b id="price">${room.price * body.stayPeriod} </b>원
        </span> &nbsp; / 1박 가격
      </div>


      <div id="space-res">
      	<c:choose>
      		<c:when test="${empty loginUser}">
      			<button disabled>로그인 후 이용해주세요!</button>
      		</c:when>
      		<c:otherwise>
	        	<button type="submit">예약하기</button>
      		</c:otherwise>
      	</c:choose>
      	
      </div>
      
      <div class="check-box">
        <input type="text" id="check-in" name="checkInDate" class="checkin-box" style="margin: 0;" value="체크인날짜">
        <input type="text" id="check-out" name="checkOutDate" class="checkin-box" style="margin-left: 10px;" value="체크아웃날짜">
      </div>


      <div class="select-box">
        <div class="select-box__current" tabindex="1" name="SelectOption">
            
        </div>
        <ul class="select-box__list" id="help">
  
        </ul>
      </div>

      <div class="select-box-2">
        <div class="select-box__current-2" tabindex="1" name="peopleCount">
        </div>
        <ul class="select-box__list-2" id="plz">
            
        </ul>
      </div>

    </div>
  </form>

</div>


  <div class="content" id="aside">    
    <div id="space-view-header">
    <table>
      <tr>
        <td width="780px">
          <p id="space-view-title">${s.spaceTitle}</p>
        </td>

        <td rowspan="2">
          <div class="card-more">
            <div class="card-favorite">
              <c:choose>
                <c:when test="${wishYN eq 0}">
                    <i id="heartChk" class="fa fa-heart" onclick="likeOnOff('${s.spaceNo}')"></i>
                </c:when>
                <c:otherwise>
                    <i id="heartChk" class="fa fa-heart" style="color:#F14137" onclick="likeOnOff('${s.spaceNo}')"></i>
                </c:otherwise>    
            </c:choose>
            <p class="sum-favorite" id="like-btn">찜하기</p>
            </div>
          </div>
      </td>
      </tr>
      <tr>
        <td><p id="space-view-detail">${s.spaceSubTitle}</p></td>
      </tr>
    </table>

    <div class="tag-section">
      <c:forEach var="h" items="${hashTags}" varStatus="status">
        <a class="hash-tag">#${h}</a>
      </c:forEach>
      </div>

    </div>

    <div id="space-description">
      <p>${s.spaceDescription}</p>
   </div>

   <div id="room-card">
      
   </div>

   <script>

      $(function(){
         
         // 객실 조회
         $.ajax({
             url : "selectRoomList.ro",
             data : {spaceNo : "${s.spaceNo}"},
             success : function(result) {
                
                var resultStr = "";
                var forRoomTitle = "";
            var forSelect = "";

                for(var i = 0; i < result.length; i++) {
                  resultStr += "<table id='room-card-table'>"
                        +   "<tr>"
                        +      "<td width='280px' rowspan='4' style='border-collapse: collapse; margin: 0px; padding: 0px; border: none;'>"
                        +         "<div style='height: 100%;'> "
                        +            "<img width='250px' height='165px;' src='"+ result[i].changeName +"'>"
                        +        "</div>" 
                        +     "<td id='room-card-title' style='height: 40px; padding-top: 15px; padding-bottom: 10px;'>" + result[i].roomTitle + "</td>" 
                        +   "</tr>" 
                        +   "<tr>" 
                        +      "<td class='room-card-detail' style='height: 25px;'>" 
                        +         "<i class='fa fa-bed' aria-hidden='true'></i> &nbsp; &nbsp;" + result[i].bedType + result[i].bedCount + "개"
                        +      "</td>" 
                        +   "</tr>"
                        +   "<tr>"
                        +      "<td class='room-card-detail'>"
                        +         "<i class='fa fa-child' aria-hidden='true'></i>"
                        +         "<i class='fa fa-child' aria-hidden='true'></i> &nbsp; 최대 " + result[i].peopleCount + "명"
                        +     "</td>"
                        +   "</tr>"
                        +   "<tr>"
                        +      "<td id='room-card-price'>\\" + result[i].price + "</td>"
                        +   "</tr>"
                        + "</table>";
                        
              forSelect += "<div class='select-box__value'>";
                if(i==0){
                  forSelect +=    "<input class='select-box__input' type='radio' id='" + i + "' value='" + result[i].roomNo + "' name='roNo' checked='checked'(i+1)/>";
                  } else{
                  forSelect +=    "<input class='select-box__input' type='radio' id='" + i + "' value='" + result[i].roomNo + "' name='roNo'  />";
                  }
                  forSelect +=    "<p class='select-box__input-text' style='padding-left: 1px; '>" + result[i].roomTitle + "</p>"
                        +    "<img class='select-box__icon' src='http://cdn.onlinewebfonts.com/svg/img_295694.svg' alt='Arrow Icon' aria-hidden='true' />"
                        +  "</div>";

              forRoomTitle += "<li>"
                           +    "<label class='select-box__option' for='" + i + "' aria-hidden='aria-hidden' onclick='ajaxLoadRoomInfo("+ result[i].roomNo +")'>" + result[i].roomTitle + "</label>"
                           +  "</li>";
            } 
            
                $("#room-card").html(resultStr);

            $(".select-box__current").html(forSelect);
            $("#help").html(forRoomTitle);
            
            ajaxLoadRoomInfo(result[0].roomNo);
             },
             error : function() {
                console.log("객실조회 ajax 통신 실패!");
             }
          });
      });

    function ajaxLoadRoomInfo(roomNo){

      var forSelect = "";
      var forPeopleCount = "";
      var forPrice = "";

      //console.log("roomNo : " + roomNo);

      $.ajax({
             url : "loadRoomInfo.ro",
             data : {roomNo : roomNo},
             success : function(result) {
                console.log(result);
            for(var i = 1 ; i <= result.peopleCount ; i++ ){
              forSelect += "<div class='select-box__value-2'>";
                if(i==1){

                  forSelect +=   "<input class='select-box__input-2' type='radio' id='h"+i+"' value='" + i + "' name='peopleCount' checked='checked' />";
                } else {
                  forSelect +=   "<input class='select-box__input-2' type='radio' id='h"+i+"' value='" + i + "' name='peopleCount'/>";

                }
                      forSelect  +=   "<p class='select-box__input-text-2' style='padding-left: 1px;'>" + i + "명</p>"
                        +  "</div>";

              forPeopleCount += "<li>"
                             +    "<label class='select-box__option-2' for='h"+i+"' aria-hidden='aria-hidden'>" + i + "명</label>"
                             +  "</li>";
              
              }
              
              forSelect+=  "<img class='select-box__icon-2' src='http://cdn.onlinewebfonts.com/svg/img_295694.svg' alt='Arrow Icon' aria-hidden='true' />";
            
            forPrice += "<span id='space-price'>₩"+"<b id='price'>"+result.price+"</b>원</span>&nbsp; / 1박 가격";
            

            $(".select-box__current-2").html(forSelect);
            $(".select-box__list-2").html(forPeopleCount);
            $("#space-text").html(forPrice);

            setDate(result);
            setReservedDate(result);
             },
             error : function() {
                console.log("객실정보조회 ajax 통신 실패!");
             }
          });

    }
   </script>

   <div id="space-information">
      <p id=space-info-title>공간 시설</p>
      <c:forEach var="sf" items="${sfList}" varStatus="status">
        <table class="space-info-table">
          <tr>
            <td><img id="info-image" src="${sf.changeName}"></td>
            <td>${sf.facilityName}</td>
          </tr>
        </table>
      </c:forEach>
   </div>

   <div id="space-checkin">
       <p id="checkin-title">이용 정보</p>
        <table id="checkin-table">
            <tr>
                <td><img width="25px" src="resources/images/space/checkin.png"></td>
                <td>체크인</td>
                <td>15:00</td>
            </tr>
            <tr>
                <td><img width="25px" src="resources/images/space/checkout.png"></td>
                <td>체크아웃</td>
                <td>12:00</td>
            </tr>
        </table>
        <p id="checkin-detail">
        레이트 체크아웃 여부는 판매자에게 따로 문의해주세요!
        </p>
   </div>

   <div id="space-map">
   <p id="space-map-title">공간 위치</p>
      <div id="map" style="width:840px;height:400px;"></div>
   <p>${s.address}</p>
   </div>

  </div>  

  <div class="comment-content" style="  border-top: 1px solid  rgb(235, 235, 235); margin-top: 20px; margin-bottom: 10px;">
    <p id="comment-content-title" style="float: left;"></p>
  </div>

  <div class="comment-content" id="comment-content">
  </div>

  <div class="pagination" id="w3-center" >
   <div class="pagination-container">
                <div class="pagination-hover-overlay"></div>
  </div>
  </div>
</body>


  
<script>
  
  function setDate(result){
	  console.log("setDatePicker : " + result.endDate);
	  var dStartDate = result.startDate;
	  var dEndDate = result.endDate;
	  setDatePicker(dEndDate, dStartDate);
	
	  //console.log("s : " + dStartDate);
	  //console.log("d : " + dEndDate);
	}


	function setDatePicker(dEndDate, dStartDate){
    
    $(".ui-datepicker").remove();
    $("#check-out").removeClass('hasDatepicker').datepicker();
	  $("#check-in").removeClass('hasDatepicker').datepicker();

    $.datepicker.setDefaults({
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            yearSuffix: '년',
            dateFormat: 'yy-mm-dd',
            showMonthAfterYear:true,
            constrainInput: true
      });
    
              
    $("#check-in").datepicker('setDate',"today");
    $("#check-out").datepicker('setDate',"+1D");

    $('#check-in').datepicker("option", "minDate", 'today');
    $('#check-in').datepicker("option", "onClose", function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#check-out").datepicker( "option", "minDate", selectedDate )}
      );
    
    $('#check-out').datepicker("option", "maxDate", dEndDate);
    $('#check-out').datepicker("option", "onClose", function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#check-in").datepicker( "option", "maxDate", selectedDate )}
    
    );
  
	  };
	
	
	function setReservedDate(result){
	  //console.log("setReservedDate roomNo : "+result.roomNo);
	  $.ajax({
	    url : "getReservedDate.re",
	    data : {roomNo:result.roomNo},
	    success : function(result) {
	        var reservedDate = new Array();
	        
	        for(var i =0; i < result.length; i++){
	          //console.log("checkInDate : " + result[i].checkInDate);
	          //console.log("checkOutDate : " + result[i].checkOutDate);
	          
	          reservedDate[i] = [result[i].checkInDate, result[i].checkOutDate];
	          
	          console.log(reservedDate);
	        }
	        console.log("asdfasd: " + reservedDate);
	      },
	      error : function() {
	        console.log("예약된 날짜 조회 ajax 통신 실패!");
	      }
	    });
	}
	
	

  </script>



  <script>

        $(function(){

        reviewGets(1);
        })

        function reviewGets(cpage){

            var url = "review?sno=${s.spaceNo}&cpage="+cpage;
            //console.log(url);
                  
            fetch(
                    url
                    ,{
                      method:'get'
                    }
                  ).then(res => res.json())
                  .then(res => {

                    var reviewCount =  "후기 ( " + res.pi.listCount + " 개 )";
                    document.getElementById('comment-content-title').innerText = reviewCount;

                    var addHtml = reviewList(res);
                    var review_ = document.getElementById('comment-content');
                    review_.innerHTML = addHtml;

                    var addPiHtml = pazination(res.pi);
                    var reviewPi_ = document.getElementById('w3-center');
                    reviewPi_.innerHTML = addPiHtml;

                  })
                  .catch(err => {
                    //console.log(111);
                  })
        }
        function star(){
          return '<i class="fa fa-star rated"></i>';
        }

        function emptyStar(){
          return '<i class="fa fa-star"></i>';
        }

        function reviewList(res){

          var addHtml = "";
          var reviewObj = res.reList;

          for(var i = 0; i < reviewObj.length; i++){
                addHtml+='         <table id="comment-table">'
                        +'    <tr>'
                        +'    <td id="c-profile" rowspan="2"><img id="c-pic" src="'+reviewObj[i].changeName+'"></td>'
                        +'  <td id="c-nickname">'+reviewObj[i].nickname+'</td>'
                        +'  <td id="c-date">'+reviewObj[i].createDate+'</td>'
                        +'  <td>'
                        +'    <div class="card-rating" id="comment-rating">';
                        
                            switch(reviewObj[i].grade) {
                                  case 1 : addHtml += star()+ emptyStar()+ emptyStar()+ emptyStar()+ emptyStar(); break;
                                  case 2 : addHtml += star()+ star()+ emptyStar()+ emptyStar()+ emptyStar(); break;
                                  case 4 : addHtml += star()+star()+star()+emptyStar()+emptyStar(); break;
                                  case 5 : addHtml += star()+star()+star()+star()+emptyStar(); break;
                                  case 3 : addHtml += star()+star()+star()+star()+star(); break;
                                  };
                  addHtml+='</div>'
                        +'</td>'
                        +'</tr>'
                        +'<tr>'
                        +'<td id="c-detail" colspan="3">'+reviewObj[i].reviewContent+'</td>'
                        +'      </tr>'
                        +'</table>';
          }
          return addHtml;

        }

        function pazination(pi){

          var addPiHtml = '<div class="pagination-container">';
          if(pi.listCount != 0) {
              addPiHtml += '<span class="pagination-prev">';
                        if( pi.currentPage == 1 ) {
                          addPiHtml += '<span class="icon-pagination icon-pagination-prev">';
                        } else {
                          addPiHtml += '<span class="icon-pagination icon-pagination-prev" onclick="reviewGets('+ (pi.currentPage-1) +')'+'">';
                        } 
              addPiHtml += '<i class="icon material-icons">keyboard_arrow_left</i>'
                          + '</span>'
                          + '</span>';
            
                    for(var p = pi.startPage; p <= pi.endPage; p++) {  
                        if ( p == pi.currentPage){
                          addPiHtml += '<span class="pagination-page-number">'+p+'</span>';
                        } else {
                          addPiHtml += '<span class="pagination-page-number" onclick="reviewGets('+p+')">'+p+'</span>';
                        }
                    }
              addPiHtml += '<span class="pagination-next">';
                      if( pi.currentPage == pi.maxPage ){
                          addPiHtml +='<span class="icon-pagination icon-pagination-next">';
                        } else {
                          addPiHtml +='<span class="icon-pagination icon-pagination-next" onclick="reviewGets('+(pi.currentPage + 1)+')">';
                        }
              addPiHtml +=    '<i class="icon material-icons">keyboard_arrow_left</i>'
                              + '</span>'
                              + '</span>';
              }
              
              addPiHtml += '</div>';
              return addPiHtml;
        }

  </script>


  <script>
    
    // 찜하기
    function likeOnOff(sno){
      ifWishCheck(sno);
    }


    // 기존에 찜한 목록이 있는지 검사하는 함수
    function ifWishCheck(sNo){
      var memberNo = "${loginUser.memberNo}";
      var host_ = "wish?sNo="+sNo+"&mNo="+memberNo;
      var method_ = 'get';
        console.log(host_);
      fetch(
        host_
        , {
          method : method_
        }
      )
      .then(res => res.json())
      .then(res => {

          if(res.wishYN == 1){
            console.log("기존에 있었던 데이터 입니다.");
            delete_(sNo);
            var ele = document.getElementById('heartChk');
            ele.style.color = '#B5B5B5';
          }else{
            console.log("없는 데이터입니다. 신규생성합니다.");
            create_(sNo);
            var ele = document.getElementById('heartChk');
            ele.style.color = '#F14137';
          }
      })
      .catch(err => {
        console.log("찜한 공간 통신 실패");
      })
    }
    
    ///////////////// 찜하기 삭제 -> 모듈용 함수까지 적용
    function delete_(spaceNo){
      var memberNo = "${loginUser.memberNo}";
      var body = {
        'spaceNo' : parseInt(spaceNo)
        , 'memberNo' : parseInt(memberNo)
      }
      var host = "wishList";
      var method = 'delete';
      wishModule(host, method, body);
    }
    
    ///////////////////// 찜하기 추가 -> 모듈용 함수까지 적용
    function create_(spaceNo){
      var memberNo = "${loginUser.memberNo}";
      var body = {
        'spaceNo' : parseInt(spaceNo)
        , 'memberNo' : parseInt(memberNo)
      }
      var host = "wishList";
      var method = 'post';

      wishModule(host, method, body);
    }

   /////////////////// 찜하기 공통 모듈 함수
    function wishModule(host_, method_, body_){
      console.log(method_);
      fetch(
        host_
        , {
          method : method_
          , body : JSON.stringify(body_)
          , headers : {'Content-Type' : "application/json" }
        }
      )
      .then(res => res.json())
      .then(res => {
          if(res =='NNNNY'){
            console.log("기능 적용 성공");
          }else{
            console.log("기존에 있었던 데이터 입니다.");
          }
      })
      .catch(err => {
        console.log("찜한 공간 통신 실패");
      })
    }
  
  
  </script>






















  <script>
    var moreButton_2 = document.querySelector(".navbar-more");
    var menu_2 = document.querySelector(".navbar-menu");
    var icon_2 = document.querySelector(".navbar-icon");

    moreButton_2.addEventListener("click", () => {
      menu_2.classList.toggle("active");
      icon_2.classList.toggle("active");
    });
  </script>


    <script>
    var carousel = document.querySelector('.carousel');

    var carouselInner = document.querySelector('.carousel-inner');

    var prev = document.querySelector('.carousel-controls .prev');

    var next = document.querySelector('.carousel-controls .next');

    var slides =  document.querySelectorAll('.carousel-inner .carousel-item');

    var totalSlides = slides.length;

    var step = 100 / totalSlides;

    var activeSlide = 0;

    var activeIndicator = 0;

    var direction = -1;

    var jump = 1;

    var interval = 3000;

    var time;



    //Init carousel
    carouselInner.style.minWidth = (totalSlides * 100) + '%';
    loadIndicators();
    loop(true);


    //Carousel events

    next.addEventListener('click',()=>{
        
        slideToNext();
    });

    prev.addEventListener('click',()=>{
        slideToPrev();
    });

    carouselInner.addEventListener('transitionend',()=>{
        if(direction === -1){
            if(jump > 1){
                for(let i = 0; i < jump; i++){
                    activeSlide++;
                    carouselInner.append(carouselInner.firstElementChild);
                }
            }else{
                activeSlide++;
                carouselInner.append(carouselInner.firstElementChild);
            }
        }else if(direction === 1){
            if(jump > 1){
                for(let i = 0; i < jump; i++){
                    activeSlide--;
                    carouselInner.prepend(carouselInner.lastElementChild);
                }
            }else{
                activeSlide--;
                carouselInner.prepend(carouselInner.lastElementChild);
            }
        };

        carouselInner.style.transition = 'none';
        carouselInner.style.transform = 'translateX(0%)';
        setTimeout(()=>{
            jump = 1;
            carouselInner.style.transition = 'all ease-out 0.5s';
        });
        updateIndicators();
    });

    document.querySelectorAll('.carousel-indicators span').forEach(item=>{
        item.addEventListener('click', (e)=>{
            let slideTo = parseInt(e.target.dataset.slideTo);
            
            let indicators = document.querySelectorAll('.carousel-indicators span');

            indicators.forEach((item,index)=>{
                if(item.classList.contains('active')){
                    activeIndicator = index
                }
            })

            if(slideTo - activeIndicator > 1){
                jump = slideTo - activeIndicator;
                step = jump * step;
                slideToNext();
            }else if(slideTo - activeIndicator === 1){
                slideToNext();
            }else if(slideTo - activeIndicator < 0){

                if(Math.abs(slideTo - activeIndicator) > 1){
                    jump = Math.abs(slideTo - activeIndicator);
                    step = jump * step;
                    slideToPrev();
                }
                    slideToPrev();
            }
            step = 100 / totalSlides; 
        })
    });

    carousel.addEventListener('mouseover',()=>{
        loop(false);
    })

    carousel.addEventListener('mouseout',()=>{
        loop(true);
    })

    //Carousel functions

    function loadIndicators(){
        slides.forEach((slide,index)=>{
            if(index === 0){
                document.querySelector('.carousel-indicators').innerHTML +=
                '<span data-slide-to="'+index+' class="active"></span>';
            }else{
                document.querySelector('.carousel-indicators').innerHTML +=
                '<span data-slide-to="'+index+'"></span>';
            }
        }); 
    };


    function updateIndicators(){
        if(activeSlide > (totalSlides - 1)){
            activeSlide = 0;
        }else if(activeSlide < 0){
            activeSlide = (totalSlides - 1);
        }
        document.querySelector('.carousel-indicators span.active').classList.remove('active');
        document.querySelectorAll('.carousel-indicators span')[activeSlide].classList.add('active');
    };

    function slideToNext(){
        if(direction === 1){
            direction = -1;
            carouselInner.prepend(carouselInner.lastElementChild);
        };
        //console.log(carouselInner.style.transform)
        carousel.style.justifyContent = 'flex-start';
        carouselInner.style.transform = 'translateX(-'+step+'%)';
    };

    function slideToPrev(){
        if(direction === -1){
            direction = 1;
            carouselInner.append(carouselInner.firstElementChild);
        };
        carousel.style.justifyContent = 'flex-end'
        carouselInner.style.transform = 'translateX('+step+'%)';
    };

    function loop(status){
        if(status === true){
            time = setInterval(()=>{
                slideToNext();
            },interval);
        }else{
            clearInterval(time);
        }
    };
    </script>


    <script>
    $(window).scroll(function(){    
    $("#right-box").css("margin-top",Math.max(-50,0-$(this).scrollTop()));});
    </script>
   
    <!-- 지도 -->
   <script>
    console.log("${s.latitude}", "${s.longitude}");
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng("${s.latitude}", "${s.longitude}"), // 지도의 중심좌표
              level: 4, // 지도의 확대 레벨
              mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
          }; 

      // 지도를 생성한다 
      var map = new kakao.maps.Map(mapContainer, mapOption); 

      // 지도에 확대 축소 컨트롤을 생성한다
      var zoomControl = new kakao.maps.ZoomControl();

      // 지도의 우측에 확대 축소 컨트롤을 추가한다
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 지도에 마커를 생성하고 표시한다
      var marker = new kakao.maps.Marker({
          position: new kakao.maps.LatLng("${s.latitude}", "${s.longitude}"), // 마커의 좌표
          map: map // 마커를 표시할 지도 객체
      });
   </script>
	 
<jsp:include page="../common/footer.jsp" />

</html>