<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공간 수정</title>
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
                        <li><a href="hostSelect.me?cpage=1">호스트 객실 조회</a></li>
                        <li><a href="hostReservaon.me">호스트 예약 내역</a></li>
                        <li><a href="">호스트 수익정산현황</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="content-2" id="content">
        <form id="updateForm" action="spaceUpdate.sp" enctype="multipart/form-data" method="post">
            <input type="hidden" name="memberNo" value="${loginUser.memberNo}">
            <input type="hidden" name="spType" value="${space.spType}">
            <input type="hidden" name="spaceNo" value="${space.spaceNo}">
            <div class="content-inner">
                <div class="input">
                    <label class="text">공간명</label>
                    <input class="input-space" name="spaceTitle" type="text" value="${space.spaceTitle}" required><br>
                </div>
    
                <div class="input">
                    <label class="text">공간 한 줄 소개</label>
                    <input class="input-space" name="spaceSubTitle" type="text" placeholder="멋지게 한 줄로 설명부탁드려요:)"
                        value="${space.spaceSubTitle}" required><br>
                </div>
    
                <div class="input">
                    <label class="text">공간 설명</label>
                    <textarea id="introduce" name="spaceDescription"
                        placeholder="ex) 특징, 위치 등 자유롭게 설명해주세요">${space.spaceDescription}</textarea>
                </div>
    
                <div class="input">
                    <label class="text">주소</label>
                    <input class="input-space" name="address" type="text" value="${space.address}" required><br>
                </div>
    
                <div class="input">
                    <label class="text">연락처</label>
                    <input class="input-space" name="phone" type="text" value="${space.phone}" required><br>
                </div>
    
                <div class="input">
                    <label class="text">편의 시설</label>
                    <div class="convi-group">
                        <c:forEach var="sf" items="${sfList}">
                            <div class="field-group">
                                <input type="checkbox" id="sf${sf.sfNo}" name="facilityName" value="${sf.sfNo}">
                                <label for="sf${sf.sfNo}">${sf.facilityName}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
    
                <div class="input">
                    <label class="text">해시태그</label>
                    <input class="input-space" name="hashtag" placeholder="여러 개 입력시 #으로 구분해주세요"
                        value="${space.hashtag}" style="margin-bottom: 30px;">
                </div>
                
                
                <div class="input">
                    <label class="text">공간 대표 사진 (메인 사진)</label>
                    <div class="wrap-custom-file">
                        <input type="file" name="file" id="file1" accept=".gif, .jpg, .png" />
                        <c:choose>
                            <c:when test="${saList[0].step eq 1}">
                                <label for="file1" class="file-ok" style="background-image:url('${saList[0].changeName}');">
                                    <span>대표 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label for="file1">
                                    <span>대표 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
    
                <div class="input">
                    <label class="text">공간 상세 사진</label>
                    <div class="wrap-custom-file-2">
                        <input type="file" name="file" id="file2" accept=".gif, .jpg, .png" />
                        <c:choose>
                            <c:when test="${empty saList[1]}">
                                <label for="file2">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label for="file2" class="file-ok" style="background-image:url('${saList[1].changeName}');">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="wrap-custom-file-2">
                        <input type="file" name="file" id="file3" accept=".gif, .jpg, .png" />
                        <c:choose>
                            <c:when test="${empty saList[2]}">
                                <label for="file3">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label for="file3" class="file-ok" style="background-image:url('${saList[2].changeName}');">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="wrap-custom-file-2">
                        <input type="file" name="file" id="file4" accept=".gif, .jpg, .png" />
                        <c:choose>
                            <c:when test="${empty saList[3]}">
                                <label for="file4">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label for="file4" class="file-ok" style="background-image:url('${saList[3].changeName}');">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="wrap-custom-file-2">
                        <input type="file" name="file" id="file5" accept=".gif, .jpg, .png" />
                        <c:choose>
                            <c:when test="${empty saList[4]}">
                                <label for="file5">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label for="file5" class="file-ok" style="background-image:url('${saList[4].changeName}');">
                                    <span>상세 사진</span>
                                    <i class="fa fa-plus-circle"></i>
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <button class="next-button" type="submit">작성 완료</button>
            </div>
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
</body>
</html>