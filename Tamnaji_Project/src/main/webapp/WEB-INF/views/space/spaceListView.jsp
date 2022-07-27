<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>스페이스 목록</title>
<!--가격-->
<link rel="stylesheet" href="resources/css/space/price.css">
<!--날짜-->
<link rel="stylesheet" href="resources/css/space/date.css">
<!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<style>
/*----------------------------------------------------------------------*/
/*마이페이지 관련*/


.container {
    margin-left: 90px;
}

#aside {
    width: 353px;
    height: 800px;
    float: left;
}

#content {
    margin-left: 35%;
    width: 950px;
    height: 100%; 
}

#side-menubar-name {
    text-align: center;
    width: 353px;
    background-color: #f8e9df4b;
    padding-top: 30px;
    padding-bottom: 10px;
    padding-left: 10px;
    padding-right: 10px;
    font-size: 17px;
    margin-left: 3px;
    border-top: 1px solid rgb(232, 232, 232);
    border-left: 1px solid rgb(232, 232, 232);
    border-right: 1px solid rgb(232, 232, 232);
    border-radius: 50px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}

.side-menubar {
    width: 353px;
    margin-left: 20%;
    border-radius: 50px;
}

#side-menubar-list li {
    text-align: center;
    width: 353px;
    background-color: #f8e9df4b;
    margin-left: 3px;
    font-size: 15px;
    list-style-type: none;
    padding-top: 15px;
    padding-bottom: 15px;
    border: none;
    border-left: 1px solid rgb(232, 232, 232);
    border-right: 1px solid rgb(232, 232, 232);
}

#side-menubar-list li:last-child {
    text-align: center;
    width: 353px;
    background-color: #f8e9df4b;
    margin-left: 3px;
    font-size: 15px;
    list-style-type: none;
    padding-top: 15px;
    padding-bottom: 25px;
    border: none;
    border-bottom-left-radius: 50px;
    border-bottom-right-radius: 50px;
    border-left: 1px solid rgb(232, 232, 232);
    border-right: 1px solid rgb(232, 232, 232);
    border-bottom:  1px solid rgb(232, 232, 232);
}

li a:hover {
    color: #fa8f48;
    font-weight: bold;
}

a{
    text-decoration: none;
    color: #3b3b3b;
}

select:focus {outline: 1px solid #fa8f48; box-shadow: 0 0 2px 2px rgba(250, 147, 87, 0.7);}
input:focus {outline: 1px solid #fa8f48; box-shadow: 0 0 2px 2px rgba(250, 147, 87, 0.7);}
textarea:focus {outline: 1px solid #fa8f48; box-shadow: 0 0 2px 2px rgbargba(250, 147, 87, 0.7);}

/*----찜한공간 -------------------------------------------*/
.wish-list {
    width: 100%;
    max-width: 830px;
    display: flex;
    justify-content: space-between;
    margin: auto;
    margin-top: 35px;
    flex-wrap: wrap;  
}
.wish-list li.card {
    cursor: pointer;
    width: calc(50% - 13px);
    border: 1px solid #EBEFF6;
    border-radius: 7px;
    overflow: hidden;
    transition: all 0.3s;
    margin-bottom: 47px;
}
.wish-list li.card:hover {
    box-shadow: 0 8px 8px #E9EBEC;
    transform: translateY(-8px);
}
.wish .room-img-wrap {
    display: flex;
    width: 100%;
    height: 239px;
}
.wish .room-img-wrap img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}
.wish .room-info-wrap {
    padding: 13px 22px;
    padding-bottom: 0;
    position: relative;
    box-sizing: border-box;
}
.wish .room-info-wrap .heart {
    position: absolute;
    right: 22px;
    top: 30px;
    cursor: pointer;

}
.wish .room-info-wrap .heart img {
    width: 15px;
    float: right;
}
.wish .room-info{
    color: #000000;
    font-size: 13px;
}
.wish .room-info .room-tit {
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

.room-tit:hover {
    color: #000000;
}

/*------- 공간선택 관련 --------- */
.options {
    text-align: center;
    cursor: pointer;
    width: 140px;
    min-height: 40px;
    max-height: 300px;
    border-radius: 15px;
    background-color: white;
    box-shadow: 0px 0px 2px #c5c5c5;
    transition: all 300ms;
    float: left;
    margin-left: 27px;
}

.options.opened {
    overflow-y: scroll;
    text-align: center;
}

.option {
    width: 100%;
    height: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 15px;
    transition: all 300ms;
    text-align: center;
    margin: 0 auto;
}

.option:nth-child(1) {
    border-radius: 15px;
}

.option:hover {
    background-color: rgb(247, 126, 70);
    color: white;
}


.option2 {
    width: 100%;
    height: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 15px;
    transition: all 300ms;
    text-align: center;
    margin: 0 auto;
}

.option2:nth-child(1) {
    border-radius: 15px;
}

.option2:hover {
    background-color: rgb(247, 126, 70);
    color: white;
}

.space-box {
    display: inline;
}


.check-box {
    display: inline;
}

.checkin-box {
    text-align: center;
    margin-left: 10px;
    cursor: pointer;
    width: 140px;
    min-height: 40px;
    max-height: 300px;
    border-radius: 15px;
    background-color: white;
    box-shadow: 0px 0px 2px #c5c5c5;
    border: none;
    justify-content: space-between;
}

#filter-button {
    margin-left: 10px;
    padding: 10px;
    background-color: #fd6500;
    color: white;
    border-radius: 50px;
    border: none;
}

.space-list {
    width: 100%;
    max-width: 900px;

    display: flex;
    justify-content: flex-start;
    margin: auto;
    margin-top: 35px;
    flex-wrap: wrap;
}

.card {
    width: 260px; height: 400px;
    margin-right:40px;
}

.card:hover {
    cursor: pointer;
}

.space-list li.card {
    cursor: pointer;
    width: calc(50% - 13px);
    border: 1px solid #EBEFF6;
    border-radius: 7px;
    overflow: hidden;
    transition: all 0.3s;
    margin-bottom: 47px;
}
.space-list li.card:hover {
    box-shadow: 0 8px 8px #E9EBEC;
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
    margin-bottom: 7px;
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

.card-favorite .fa-heart {
    color: #B5B5B5;
    transition: all 0.3s ease;
}

.card-favorite .fa-heart.loved {
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
/*스페이스 선택 -----------------------------------------*/

 .select-box {
	 position: relative;
     float: left;
     margin-left: 28px;
	 display: block;
	 width: 142px;
     font-size: 14px;

}

 .select-box__current {
	 position: relative;
	 box-shadow: 0 15px 30px -10px rgba(0, 0, 0, 0.1);
	 cursor: pointer;
	 outline: none;
     border-radius: 50px;
     box-shadow: 0px 0px 2px #c5c5c5;
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
	 width: 20px;
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
	 background-color: #fff;
     border-radius: 50px;
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
	 box-shadow: 0 15px 30px -10px rgba(240, 9, 9, 0.1);
     box-shadow: 0px 0px 2px #c5c5c5;
     border-radius: 20px;
}
 .select-box__option {
	 display: block;
	 padding: 15px;
	 background-color: #fff;
     border-radius: 20px;
}
 .select-box__option:hover, .select-box__option:focus {
	 background-color: #fd6500;
     color: white;
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
    background-color: white;
    box-shadow: 0 0 2px #c5c5c5;
}

#help li {
    width: 130px;
    border: none;
    box-shadow: none;
    background: none;
    border-radius: 10px;
    padding: 5px;
}

#help li:last-child {
    width: 130px;
    background: white;
    border: none;
    border-radius: 20px;
    padding: 5px;
}


/*인원 수 선택----------*/

.select-box-2 {
	 width: 142px;
     position: relative;
     float: right;
     margin-right: 27px;
     font-size: 14px;
}


.select-box-2 ul li {
    background-color: none;
}

 .select-box__current-2 {
	 position: relative;
	 cursor: pointer;
	 outline: none;
     border-radius: 50px;
     box-shadow: 0px 0px 2px #c5c5c5;
     text-align: center;
     margin: 0 auto;
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
	 width: 20px;
	 opacity: 0.3;
	 transition: 0.2s ease;
}
 .select-box__value-2 {
	 display: flex;
     border-radius: 20px;

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
	 background-color: #fff;
     border-radius: 50px;

}
 .select-box__list-2 {
	 position: absolute;
	 width: 100%;
	 padding: 0;
	 list-style: none;
	 opacity: 0;
	 animation-name: HideList2;
	 animation-duration: 0.5s;
	 animation-delay: 0.5s;
	 animation-fill-mode: forwards;
	 animation-timing-function: step-start;
     border: none;
     box-shadow: 0 0 2px gainsboro;
     border-radius: 20px;
}
 .select-box__option-2 {
	 display: block;
	 padding: 15px;
	 background-color: #fff;
     border-radius: 20px;
}
 .select-box__option-2:hover, .select-box__option-2:focus {

	 background-color: #fd6500;
     color: white;
     cursor: pointer;
}
 @keyframes HideList2 {
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
    width: 130px;
    border: none;
    box-shadow: none;
    background: none;
    border-radius: 10px;
    padding: 5px;
}

#plz li:last-child {
    width: 130px;
    background: white;
    border: none;
    border-radius: 20px;
    padding: 5px;
}
#formSubmit{
    padding: 7px;
    box-sizing: border-box;
    margin-left: 2px;
    border: 1px solid #fd6500;
    border-radius: 30px;
    color: white;
    background: #fd6500;
    cursor: pointer;
}
</style>
</head>
<body style="overflow-x: hidden">
<jsp:include page="../common/header.jsp" />

<!-- 여기부터 컨텐츠 영역 ---------------------------->

<div class="container" style=" padding-top: 170px; margin: 0 auto;">
    <div class="content" id="aside" style=" background: white">    
        <div class="side-menu"style="margin-left: 15%;">
            <div class="side-menubar">
                <form action="space.sp" id="searchForm">
                <p id="side-menubar-name">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            고객님, 어디로 갈까요? 🙂 <button type="submit" id="formSubmit">검색하기</button>
                        </c:when>
                        <c:otherwise>
                            ${loginUser.nickname}님, 어디로 갈까요?🙂 <button type="submit" id="formSubmit">검색하기</button>
                        </c:otherwise>
                    </c:choose>
                </p>
                <ul id="side-menubar-list">
                    <!--지도 선택-->
                    <li>
                        <div id="area_select_filter" style="width:315px; height:223px; margin: 0 auto; background-size: contain; background-image: url(resources/images/jeju-before.png);">
                        <svg version="1.1" width="315" height="223">
                        <!--제주시-->
                        <polygon points="93,45,69,29,122,23,145,38,136,21,168,18,172,33,176,27,183,37,188,40,187,48,189,56,192,65,193,75,183,83,179,89,168,93,161,96,153,99,149,102,138,92,134,91,129,93,125,89,124,85,120,79,121,74,120,67,119,62,118,57,115,52,109,54,104,53,105,49,107,48"
                        fill="url(#filter_area_off)" data-value="제주시" data-valueJeju="1" style="cursor: pointer;"></polygon>
                    
                        <!--제주시동부-->
                        <polygon points="179,29,186,34,190,39,190,47,192,55,194,62,197,70,196,76,191,81,185,86,181,91,173,94,166,97,177,95,186,91,192,90,201,84,208,84,212,77,217,76,222,72,226,71,232,74,238,72,243,68,249,67,254,64,260,64,266,59,274,58,280,50,308,48,315,33,310,22,290,27,282,34,278,30,266,31,260,26,255,2,250,1,235,2,236,9,237,18,224,20,218,15,219,7,210,4,212,6,205,5,200,5"
                        fill="url(#filter_area_off)" data-value="제주시동부" data-valueJeju="1" style="cursor: pointer;"></polygon>
                    
                        <!--제주시서부-->
                        <polygon points="99,51,102,50,103,54,107,56,113,55,115,61,117,72,118,81,121,86,121,90,125,92,127,95,134,93,137,95,143,100,139,101,135,99,131,102,127,101,123,104,118,102,113,103,109,108,106,113,101,114,96,114,92,113,84,113,81,115,76,115,72,116,69,120,65,120,58,126,56,129,52,132,46,135,42,136,43,141,37,139,28,136,23,137,19,137,16,140,13,142,3,134,10,131,-1,123,2,116,19,114,20,109,26,106,30,104,31,100,35,96,22,86,25,75,44,78,47,81,48,78,50,74,57,71,62,70,65,67,65,61,70,62,62,49,65,42,84,46,93,52,95,53,98,49"
                        fill="url(#filter_area_off)" data-value="제주시서부" data-valueJeju="1" style="cursor: pointer;"></polygon>
                    
                        <!--서귀포시-->
                        <polygon points="88,166,90,154,92,149,91,139,92,134,98,140,102,141,99,135,101,131,105,128,107,124,109,120,110,117,111,111,113,108,117,105,122,106,127,105,130,105,136,104,138,103,141,105,144,102,148,104,154,102,156,103,164,111,172,121,175,128,177,137,183,145,185,153,186,157,183,163,177,163,174,163,178,175,172,176,168,180,160,178,157,180,148,177,145,176,141,166,138,167,136,165,132,167,129,168,128,170,126,168,124,166,122,163,120,162,119,175,117,181,110,182,96,180,96,167,90,167"
                        fill="url(#filter_area_off)" data-value="서귀포시" data-valueJeju="2" style="cursor: pointer;"></polygon>
                    
                        <!--서귀포시동부-->
                        <polygon points="1158,99,162,99,167,101,172,99,177,97,183,95,192,94,200,88,209,88,212,82,217,79,224,74,231,76,239,76,244,70,251,70,256,67,262,67,265,63,270,62,278,60,283,53,290,57,299,60,303,67,314,75,313,87,301,85,288,86,288,92,289,97,281,99,275,106,274,111,274,119,266,122,264,125,267,131,265,143,257,151,249,150,242,152,233,142,229,143,233,162,227,164,222,166,207,162,204,151,198,157,197,153,193,152,191,155,189,158,187,150,184,143,180,136,178,131,176,123,174,119,166,108,157,99"
                        fill="url(#filter_area_off)" data-value="서귀포시동부" data-valueJeju="2" style="cursor: pointer;"></polygon>
                    
                        <!--서귀포시 서부-->
                        <polygon points="20,145,18,141,22,139,26,139,35,141,44,145,46,138,48,137,53,135,61,127,67,124,70,123,74,118,82,119,85,116,87,116,95,117,99,116,104,118,106,119,104,126,97,132,96,134,94,131,91,133,89,137,88,141,90,149,85,167,75,164,73,164,68,166,63,173,63,184,71,221,39,221,24,193,30,182,47,180,47,176,42,173,39,167,31,165,27,161,25,157,18,153,17,149,13,144"
                        fill="url(#filter_area_off)" data-value="서귀포시서부" data-valueJeju="2" style="cursor: pointer;"></polygon>
                        <defs>
                        <pattern id="filter_area_off" patternUnits = "userSpaceOnUse" x="0" y="0" width="315" height="223">
                            <image xlink:href="resources/images/jeju--before.png" width="315" height="223"/>
                        </pattern>
                        <pattern id="filter_area_on" patternUnits = "userSpaceOnUse" x="0" y="0" width="315" height="223">
                            <image xlink:href="https://user-images.githubusercontent.com/102042383/179701830-61fdab47-48df-440f-9873-af6d14ca5cac.png" width="315" height="223"/>
                        </pattern>
                        </defs>
                        </svg>
                        </div>
                        <input type="hidden" name="mapCheck" id="mapCheck">
                        <!--
                        <div>
                            <input type="checkbox" id="allCheck">
                            <label for="allCheck">전체선택</label>
                        </div>
                        <div id="placeName"></div>
                        -->
                    </li>
                    <!--가격 선택-->
                    <li>
                        <div class="middle" style="position: relative;">
                            <div class="multi-range-slider">
                                <!-- 진짜 슬라이더 -->
                                <input type="range" id="input-left" min="0" max="30000000" value="${map.minPrice}" name="minPrice"/>
                                <input type="range" id="input-right" min="0" max="30000000" value="${map.maxPrice}"  name="maxPrice" />
                                <!-- 커스텀 슬라이더 -->
                                <div class="slider">
                                    <div class="track"></div>
                                    <div class="range"></div>
                                    <div class="thumb left"></div>
                                    <div class="thumb right"></div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <span><label id="priceMin">${map.minPrice}</label>원</span>
                            <span><label>~</label></span>
                            <span><label id="priceMax">${map.maxPrice}</label>원</span>
                        </div>
                    </li>
                    <!--날짜 선택-->
                    <li>
                    <div class="check-box">
                        <input type="text" id="check-in" class="checkin-box" name="checkIn" value="${map.checkIn}" style="margin: 0;">
                        <input type="text" id="check-out" class="checkin-box" name="checkOut" value="${map.checkOut}" style="margin-left: 10px;">
                    </div>
                    </li>
                    <!--유형, 인원 선택-->
                    <li>
                        <div class="select-box">
                            <div class="select-box__current" tabindex="1">
                                <c:forEach var="sc" items="${sc}">
                                <div class="select-box__value">
                                    <input class="select-box__input" type="radio" id="${sc.spType}" value="${sc.categoryDetail}" name="category" checked="checked" />
                                    <p class="select-box__input-text" style="padding-left: 1px;">
                                        ${sc.categoryDetail}
                                    </p>
                                </div>
                                </c:forEach>
                                <img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon"
                                    aria-hidden="true" />
                            </div>
                            <ul class="select-box__list" id="help">
                                <c:forEach var="sc" items="${sc}">
                                    <li><label class="select-box__option" for="${sc.spType}" aria-hidden="aria-hidden">${sc.categoryDetail}</label></li>
                                </c:forEach>
                            </ul>
                        </div>
                    
                        <div class="select-box-2">
                            <div class="select-box__current-2" tabindex="1">
                                <div class="select-box__value-2"><input class="select-box__input-2" type="radio" id="h0" value="1"
                                        name="people" checked="checked" />
                                    <p class="select-box__input-text-2" style="padding-left: 1px;">1명</p>
                                </div>
                                <div class="select-box__value-2"><input class="select-box__input-2" type="radio" id="h1" value="2"
                                        name="people" />
                                    <p class="select-box__input-text-2">2명</p>
                                </div>
                                <div class="select-box__value-2"><input class="select-box__input-2" type="radio" id="h2" value="3"
                                        name="people" />
                                    <p class="select-box__input-text-2">3명</p>
                                </div>
                                <div class="select-box__value-2"><input class="select-box__input-2" type="radio" id="h3" value="4"
                                        name="people" />
                                    <p class="select-box__input-text-2">4명</p>
                                </div>
                                <div class="select-box__value-2"><input class="select-box__input-2" type="radio" id="h4" value="5"
                                        name="people" />
                                    <p class="select-box__input-text-2">5명</p>
                                </div>
                                <div class="select-box__value-2"><input class="select-box__input-2" type="radio" id="h5" value="6"
                                        name="people" />
                                    <p class="select-box__input-text-2">6명 이상</p>
                                </div>
                                <img class="select-box__icon-2" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg"
                                    alt="Arrow Icon" aria-hidden="true" />
                            </div>
                            <ul class="select-box__list-2" id="plz">
                                <li><label class="select-box__option-2" for="h0" aria-hidden="aria-hidden">1명</label></li>
                                <li><label class="select-box__option-2" for="h1" aria-hidden="aria-hidden">2명</label></li>
                                <li><label class="select-box__option-2" for="h2" aria-hidden="aria-hidden">3명</label></li>
                                <li><label class="select-box__option-2" for="h3" aria-hidden="aria-hidden">4명</label></li>
                                <li><label class="select-box__option-2" for="h4" aria-hidden="aria-hidden">5명</label></li>
                                <li><label class="select-box__option-2" for="h5" aria-hidden="aria-hidden">6명 이상</label></li>
                            </ul>
                        </div>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                <input type="hidden" name="categoryName" value="${map.categoryName}">
            </div>
        </div>
    </div>
    <!--공간 전체-->
    <div class="content-2" id="content">
        <p id="view" style="margin-top: 10px; margin-left: 20px; margin-bottom: 40px; font-size: 25px;">전체보기</p>
        <ul class="space-list">
            <c:forEach var="s" items="${space}">
            <!-- 반복 돌릴 때 열고닫는 태그 잘 맞춰서 쓰세요 -->
            <!-- 이 안에 div 로 온클릭 속성 걸지 마세요 -->
                <li class="card" style="width: 260px; height: 400px;">
                    <a href='space?sno=${s.spaceNo}'>
                        <div class="room-img-wrap">
                            <img src="${s.changeName}" style="width: 100%; height:200px;">
                        </div>
                        <div class="room-info-wrap" style="margin-top:20px;">
                            <div class="room-info" style="text-align: center;">
                                <p class="room-des">${s.spaceSubTitle}</p>
                                <p class="room-tit">${s.spaceTitle}</p>
                                <p class="room-price"><label>${s.price}</label>원</p>
                            </div>
                        </div>
                    </a>
                    <div class="card-more">
                        <div class="card-favorite">
                            <c:choose>
                            <c:when test="${s.likeCount eq 0}">
                                <i id="heartChk${s.spaceNo}" value="${s.spaceNo}" class="fa fa-heart" onclick="likeOnOff('${s.spaceNo}')"></i>
                            </c:when>
                            <c:when test="${s.myLikeListYN eq 0}">
                                <i id="heartChk${s.spaceNo}" value="${s.spaceNo}" class="fa fa-heart" onclick="likeOnOff('${s.spaceNo}')"></i>
                            </c:when>
                            <c:otherwise>
                                <i id="heartChk${s.spaceNo}" value="${s.spaceNo}" class="fa fa-heart" style="color:#F14137" onclick="likeOnOff('${s.spaceNo}')"></i>
                            </c:otherwise>    
                        </c:choose>
                            <span id="sum-favorite${s.spaceNo}" class="sum-favorite">${s.likeCount}</span>
                        </div>
                        <div class="card-rating">
                            <c:forEach begin="0" end="4" step="1" var="i">
                                <c:choose>
                                    <c:when test="${ i lt s.gradeAVG }">
                                        <i class="fa fa-star rated"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa fa-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                </li>                        
            </c:forEach>
        </ul>
    </div>

        <!--페이징-->
        <div class="pagination" style="margin-left:450px">
            <div class="pagination-container">
                <div class="pagination-hover-overlay"></div>
                <c:choose>
                    <c:when test="${ pi.currentPage eq 1 }">
                        <a class="pagination-prev">
                            <span class="icon-pagination icon-pagination-prev">
                                <i class="icon material-icons">keyboard_arrow_left</i>
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${empty category}">
                                <a class="pagination-prev"
                                    href="space.sp?cpage=${pi.currentPage-1}&categoryName=${map.categoryName}&minPrice=${map.minPrice}&maxPrice=${map.maxPrice}&checkIn=${map.checkIn}&checkOut=${map.checkOut}&people=${map.people}"></a>
                            </c:when>
                            <c:otherwise>
                                <a  class="pagination-prev" 
                        href="space.sp?cpage=${pi.currentPage-1}&categoryName=${map.categoryName}&minPrice=${map.minPrice}&maxPrice=${map.maxPrice}&checkIn=${map.checkIn}&checkOut=${map.checkOut}&category=${map.category}&people=${map.people}"></a>
                            </c:otherwise>
                        </c:choose>
                        
                            <span class="icon-pagination icon-pagination-prev">
                                <i class="icon material-icons">keyboard_arrow_left</i>
                            </span>
                        </a>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq p }">
                            <a class="pagination-page-number ">${ p }</a>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${empty category}">
                                    <a class="pagination-page-number"
                                        href="space.sp?cpage=${p}&categoryName=${map.categoryName}&minPrice=${map.minPrice}&maxPrice=${map.maxPrice}&checkIn=${map.checkIn}&checkOut=${map.checkOut}&people=${map.people}">${
                                        p }</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="pagination-page-number"
                                        href="space.sp?cpage=${p}&categoryName=${map.categoryName}&minPrice=${map.minPrice}&maxPrice=${map.maxPrice}&checkIn=${map.checkIn}&checkOut=${map.checkOut}&category=${map.category}&people=${map.people}">${
                                        p }</a>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <a class="pagination-next">
                            <span class="icon-pagination icon-pagination-next">
                                <i class="icon material-icons">keyboard_arrow_left</i>
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${empty category}">
                                <a class="pagination-next"
                                    href="space.sp?cpage=${pi.currentPage+1}&categoryName=${map.categoryName}&minPrice=${map.minPrice}&maxPrice=${map.maxPrice}&checkIn=${map.checkIn}&checkOut=${map.checkOut}&people=${map.people}">
                            </c:when>
                            <c:otherwise>
                                <a class="pagination-next"
                                    href="space.sp?cpage=${pi.currentPage+1}&categoryName=${map.categoryName}&minPrice=${map.minPrice}&maxPrice=${map.maxPrice}&checkIn=${map.checkIn}&checkOut=${map.checkOut}&category=${map.category}&people=${map.people}">
                            </c:otherwise>
                        </c:choose>
                            <span class="icon-pagination icon-pagination-next">
                                <i class="icon material-icons">keyboard_arrow_left</i>
                            </span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<br clear="both">
<!--날짜 선택-->
<script src="resources/js/space/date.js"></script>
<!--인원 선택-->
<!--<script src="resources/js/space/people.js"></script>-->
<!--가격 선택-->
<script src="resources/js/space/price.js"></script>
<!--지도 선택-->
<script src="resources/js/space/map.js"></script>
<!--페이징-->
<script src="resources/js/space/paging.js"></script>
<script>
    
    //유형,인원 값 그대로 냅두기
    $("#category").val('${map.category}').prop('selected', true);
    $("#people").val('${map.people}').prop('selected',true);

    //가격 콤마 찍기
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
            var wishCount_ = res.wishCount;
            console.log(wishCount_);
            if(res.wishYN == 1){
            console.log("기존에 있었던 데이터 입니다.");
            delete_(sNo);
            var sty = 'heartChk'+String(sNo);
            var ele = document.getElementById(sty);
            ele.style.color = '#B5B5B5';

            var sty = '#sum-favorite'+String(sNo);
            $(sty).text(wishCount_-1);
            }else{
            console.log("없는 데이터입니다. 신규생성합니다.");
            create_(sNo);
            var sty = 'heartChk'+String(sNo);
            var ele = document.getElementById(sty);
            ele.style.color = '#F14137';
            var sty = '#sum-favorite'+String(sNo);
            $(sty).text(wishCount_+1);
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
<jsp:include page="../common/footer.jsp" />

</body>
</html>