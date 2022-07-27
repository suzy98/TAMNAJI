<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공간 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<style>
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
/*공통 관련*/

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

/*--------------------------------*/

.main-container {
    height: 50vh;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.main-container h2 {
    margin-bottom: 50px;
    color: #80c08e;
    font-size: 30px;
    font-weight: 400;
}

.radio-buttons {
    width: 100%;
    margin: 0 auto;
    text-align: center;
}

.custom-radio input {
    display: none;
}

.radio-btn {
    margin: 15px;
    margin-bottom: 15px;
    width: 120px;
    height: 150px;
    border: 3px solid transparent;
    display: inline-block;
    border-radius: 10px;
    position: relative;
    text-align: center;
    box-shadow: 0 0 20px #c3c3c367;
    cursor: pointer;
}

.radio-btn > i {
    color: #ffffff;
    background-color: #80c08e;
    font-size: 20px;
    position: absolute;
    top: -15px;
    left: 50%;
    transform: translateX(-50%) scale(4);
    border-radius: 50px;
    padding: 3px;
    transition: 0.2s;
    pointer-events: none;
    opacity: 0;
}

.radio-btn .hobbies-icon {
    width: 80px;
    height: 80px;
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.radio-btn .hobbies-icon i {
    color: #80c08e;
    line-height: 80px;
    font-size: 60px;
    margin-bottom: 10px;
}

.radio-btn .hobbies-icon h3 {
    color: #80c08e;
    font-size: 13px;
    font-weight: 400;
    text-transform: uppercase;
}

.custom-radio input:checked + .radio-btn {
    border: 3px solid #80c08e;
}

.custom-radio input:checked + .radio-btn > i {
    opacity: 1;
    transform: translateX(-50%) scale(1);
}

.confirm {
    width: 100px;
    height: 40px;
    margin-top: 50px;
    background-color: #83cc7d;
    color: white;
    font-size: 17px;
    border: none;
    border-radius: 20px;
    box-shadow: 0 0 10px #c3c3c367;
}

.confirm:hover {
    cursor: pointer;
    box-shadow: 0 0 20px #82818167;
    background-color: #60be57;
}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container" style="margin: 0 auto;">
        <div class="content" id="aside" style=" background: white">
            <div class="side-menu" style="margin-left: 10px;">
                <div class="side-menubar">
                    <p id="side-menubar-name">마이 탐나지😎</p>
                    <ul id="side-menubar-list">
			        <li><a href="myPage.me">나의 정보 수정</a></li>
			        <li><a href="myPwd.me">나의 비밀번호 변경</a></li>
			        <li><a href="MyReservationList.me">나의 예약 내역</a></li>
			        <li><a href="/tamnaji/wishListForm">내가 찜한 공간</a></li>
			        <li><a href="myReviewListView.me">나의 리뷰 내역</a></li>
			        <c:choose>
			        	<c:when test="${ loginUser.sellerYN eq 'N' and loginUser.status eq 'N' }">
			        		<li><a href="HostRequestView.me">호스트 전환 요청</a></li>
			        	</c:when>
			        </c:choose>
				    <c:if test="${ loginUser.sellerYN eq 'Y' and loginUser.status eq 'N'}">
				      <li><a href="spaceEnrollForm.sp">호스트 공간 등록</a></li>
			          <li><a href="hostSpaceList.sp?cpage=1">호스트 공간 조회</a></li>
				      <!--<li><a href="hostSelect.me?cpage=1">호스트 객실 조회</a></li>-->
			          <li><a href="hostSelect.me">호스트 객실 조회</a></li> <!-- 이게 기능은 같고 호스트 객실조회로 이름만 바뀜--> 
				      <li><a href="hostReservation.me">호스트 예약 내역</a></li>
				      <!-- <li><a href="">호스트 수익정산현황</a></li> -->
				    </c:if>
			     	</ul>
                </div>
            </div>
        </div>
        <form action="spaceEnrollForm2.sp">
            <div class="content-2" id="content">
                <div class="main-container" style="margin-top: 210px;">
                    <h2>공간 유형을 선택해주세요</h2>
                    <div class="radio-buttons">
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="1" checked />
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-mosque"></i>
                                    <h3>리조트</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="2"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-home"></i>
                                    <h3>게스트 하우스</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="3"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-store"></i>
                                    <h3>콘도</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="4"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-building"></i>
                                    <h3>호스텔</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="5"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-campground"></i>
                                    <h3>펜션</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="6"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-city"></i>
                                    <h3>아파트</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="7"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-hotel"></i>
                                    <h3>호텔</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="8"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-glass-martini-alt"></i>
                                    <h3>파티룸</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="9"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-camera-retro"></i>
                                    <h3>촬영 스튜디오</h3>
                                </div>
                            </span>
                        </label>
        
                        <label class="custom-radio">
                            <input type="radio" name="spType" value="10"/>
                            <span class="radio-btn"><i class="las la-check"></i>
                                <div class="hobbies-icon">
                                    <i class="las la-birthday-cake"></i>
                                    <h3>스몰웨딩</h3>
                                </div>
                            </span>
                        </label>
                        <div><button type="submit" class="confirm">선택 완료</button></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>