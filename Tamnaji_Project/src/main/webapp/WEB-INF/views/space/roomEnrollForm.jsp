<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
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

*{
font-family: 'NanumSquareRound';
}

a{
text-decoration: none;
color: #3b3b3b;
}

select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}

/*----------------------------------------------------------------------*/
/*공통 컨텐츠 관련*/
.container {
margin-left: 100px;
}
#aside {
width: 300px;
height: 800px;
float: left;
}
#content {
margin-left: 50%;
width: 400px;
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

/*-----*/
textarea {
padding-top: 20px;
width: 280px;
height: 200px;
box-sizing: border-box;
background-color: #F2F2F2;
border-radius: 20px;
border: 1px solid #F2F2F2;
box-shadow: 0px 0px 2px rgb(226, 225, 224);
padding-left: 10px;
resize: none;
}
option {
font-family: 'S-CoreDream-3Light';
}
.input{
margin-bottom: 30px;
}
.text {
display: block;
font-size: 15px;
font-weight: bold;
color: rgb(41, 41, 41);
line-height: 21px;
word-break: keep-all;
margin-bottom: 10px;
}
.input-space {
width: 280px;
height: 40px;
box-sizing: border-box;
background-color: #F2F2F2;
border-radius: 20px;
border: 1px solid #F2F2F2;
box-shadow: 0px 0px 2px rgb(226, 225, 224);
padding-left: 10px;
}
button {
width: 100px;
height: 40px;
box-sizing: border-box;
background-color: #FD6500;
color: white;
border-radius: 20px;
border: 1px solid #F2F2F2;
box-shadow: 0px 0px 2px rgb(226, 225, 224);
}
button:hover {
cursor: pointer;
background-color: #FD4500;
}

.next-button {
margin-left: 85px;
background-color: #83cc7d;
color: white;
font-size: 17px;
border: none;
border-radius: 20px;
padding: 7px;
box-shadow: 0 0 10px #c3c3c367;
}

.next-button:hover {
cursor: pointer;
box-shadow: 0 0 20px #82818167;
background-color: #60be57;
}

#bye:hover{
background-color: #085219;
}
#bye {
width: 138px;
height: 40px;
box-sizing: border-box;
background-color: green;
color: white;
border-radius: 20px;
border: 1px solid #F2F2F2;
box-shadow: 0px 0px 2px rgb(226, 225, 224);
}
.underText {
margin-top: 5px;
font-size: 12px;
}
table {
border-spacing: 10px;
}
a{
text-decoration: none;
color: #3B3B3B;
}
select:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
input:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
textarea:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}

/*-----------------------------*/

.convi-group {
width: 300px;
}

.field-group{
display: inline-block;
}

.field-group input {
padding: 0;
height: initial;
width: initial;
margin-bottom: 0;
display: none;
}

.field-group label {
cursor: pointer;
text-align: center;
margin: 10px;
background-color: #F2F2F2;
padding: 5px;
display: inline-block;
border-radius: 10px;
}

.convi-group .field-group input:checked + label {
background-color: rgb(110, 185, 116);
color: white;
}

/*------ 파일 첨부 ----------*/
.wrap-custom-file {
position: relative;
display: inline-block;
width: 150px;
height: 150px;
margin-top: 7px;
margin-left: 65px;
margin-bottom: 20px;
text-align: center;
}

.wrap-custom-file-2 {
position: relative;
display: inline-block;
width: 120px;
height: 75px;
margin-top: 7px;
margin-left: 7px;
margin-right: 10px;
margin-bottom: 10px;
text-align: center;
}

.wrap-custom-file input[type="file"],
.wrap-custom-file-2 input[type="file"]
{
position: absolute;
top: 0;
left: 0;
width: 2px;
height: 2px;
overflow: hidden;
opacity: 0;
}
.wrap-custom-file label,
.wrap-custom-file-2 label {
z-index: 1;
position: absolute;
left: 0;
top: 0;
bottom: 0;
right: 0;
width: 100%;
overflow: hidden;
padding: 0 0.5rem;
cursor: pointer;
background-color: #fff;
border: 1px solid rgb(242, 242, 242);
border-radius: 4px;
-webkit-transition: -webkit-transform 0.4s;
-moz-transition: -moz-transform 0.4s;
-ms-transition: -ms-transform 0.4s;
-o-transition: -o-transform 0.4s;
transition: transform 0.4s;
}
.wrap-custom-file label span
.wrap-custom-file-2 label span {
display: block;
margin-top: 2rem;
font-size: 1.4rem;
color: #777;
-webkit-transition: color 0.4s;
-moz-transition: color 0.4s;
-ms-transition: color 0.4s;
-o-transition: color 0.4s;
transition: color 0.4s;
}
.wrap-custom-file label .fa,
.wrap-custom-file-2 label .fa {
position: absolute;
bottom: 1rem;
left: 50%;
-webkit-transform: translatex(-50%);
-moz-transform: translatex(-50%);
-ms-transform: translatex(-50%);
-o-transform: translatex(-50%);
transform: translatex(-50%);
font-size: 1.5rem;
color: rgb(112, 180, 121);
-webkit-transition: color 0.4s;
-moz-transition: color 0.4s;
-ms-transition: color 0.4s;
-o-transition: color 0.4s;
transition: color 0.4s;
}
.wrap-custom-file label:hover
.wrap-custom-file-2 label:hover {
-webkit-transform: translateY(-1rem);
-moz-transform: translateY(-1rem);
-ms-transform: translateY(-1rem);
-o-transform: translateY(-1rem);
transform: translateY(-1rem);
}
.wrap-custom-file label:hover span, .wrap-custom-file label:hover .fa,
.wrap-custom-file-2 lbael:hover span, .wrap-custom-file-2 label:hover .fa {
color: #333;
}
.wrap-custom-file label.file-ok,
.wrap-custom-file-2 label.file-ok {
background-size: cover;
background-position: center;
}
.wrap-custom-file label.file-ok span
.wrap-custom-file-2 label.file-ok span {
position: absolute;
bottom: 0;
left: 0;
width: 100%;
padding: 0.3rem;
font-size: 1.1rem;
color: #000;
background-color: rgba(255, 255, 255, .7);
}
.wrap-custom-file label.file-ok .fa,
.wrap-custom-file-2 label.file-ok .fa {
display: none;
}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container" style=" padding-top: 170px;margin: 0 auto;">
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
        <div class="content-2" id="content">
            <form id="updateForm" action="roomInsert.sp" method="post" enctype="multipart/form-data">
                <input type="hidden" name="sno" value="${sno}">
                <div class="content-inner">
                    <div class="input">
                        <label class="text">객실 이름</label>
                        <input class="input-space" name="roomTitle" type="text" required><br>
                    </div>
                    <div class="input">
                        <label class="text">침대 종류</label>
                        <div class="convi-group">
                            <div class="field-group">
                                <input type="radio" name="bedType" id="bedType1" value="킹" checked><label for="bedType1">킹</label>
                                <input type="radio" name="bedType" id="bedType2" value="더블"><label for="bedType2">더블</label>
                                <input type="radio" name="bedType" id="bedType3" value="싱글"><label for="bedType3">싱글</label>
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <label class="text">침대 갯수</label>
                        <input class="input-space" name="bedCount" type="number" min="1" required>
                    </div>
                    <div class="input">
                        <label class="text">예약 가능 날짜</label>
                        <input type="text" id="check-in" class="checkin-box input-space" name="startDate" required>
                    </div>
                    <div class="input">
                        <label class="text">예약 종료 날짜</label>
                        <input type="text" id="check-out" class="checkin-box input-space" name="endDate"required>
                    </div>
                    <div class="input">
                        <label class="text">가격</label>
                        <input class="input-space" name="price" type="number" required>
                    </div>
                    <div class="input">
                        <label class="text">객실 이용 한도 인원</label>
                        <input class="input-space" name="peopleCount" type="number" required>
                    </div>
                    <div class="input">
                        <label class="text">객실 대표 사진 (메인 사진)</label>
                        <div class="wrap-custom-file">
                            <input type="file" name="roomFile" id="file1" accept=".gif, .jpg, .png" />
                            <label for="file1">
                                <span>대표 사진</span>
                                <i class="fa fa-plus-circle"></i>
                            </label>
                        </div>
                    </div>
                </div>
                <button type="submit">등록</button>
            </form>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script>
        $('input[type="file"]').each(function () {
            // Refs
            var $file = $(this),
                $label = $file.next('label'),
                $labelText = $label.find('span'),
                labelDefault = $labelText.text();

            // When a new file is selected
            $file.on('change', function (event) {
                var fileName = $file.val().split('\\').pop(),
                    tmppath = URL.createObjectURL(event.target.files[0]);
                //Check successfully selection
                if (fileName) {
                    $label
                        .addClass('file-ok')
                        .css('background-image', 'url(' + tmppath + ')');
                    $labelText.text(fileName);
                } else {
                    $label.removeClass('file-ok');
                    $labelText.text(labelDefault);
                }
            });
        });
    </script>
    <script>
        $(function () {
                var dateFormat = "yy-mm-dd",
                    from = $("#check-in")
                        .datepicker({
                            defaultDate: "+1w",
                            changeMonth: true,
                            numberOfMonths: 1,
                            dateFormat: 'yy-mm-dd', //Input Display Format 변경
                            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //달력의 요일 텍스트
                            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], //달력의 요일 Tooltip
                            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력의 월 부분 텍스트
                            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
                            , showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
                            , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시         
                            , yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                            , minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                        })
                        .on("change", function () {
                            to.datepicker("option", "minDate", getDate(this));
                        }),
                    to = $("#check-out").datepicker({
                        defaultDate: "+1w",
                        changeMonth: true,
                        numberOfMonths: 1,
                        dateFormat: 'yy-mm-dd',
                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //달력의 요일 텍스트
                        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], //달력의 요일 Tooltip
                        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력의 월 부분 텍스트
                        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
                        , showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
                        , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                        , yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                        , minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                    })
                        .on("change", function () {
                            from.datepicker("option", "maxDate", getDate(this));
                        });


                function getDate(element) {
                    var date;
                    try {
                        date = $.datepicker.parseDate(dateFormat, element.value);
                    } catch (error) {
                        date = null;
                    }
                    return date;
                }
                $("#check-in").datepicker('setDate', 'today');
                $("#check-out").datepicker('setDate', '+1D');
            });
    </script>
</body>
</html>