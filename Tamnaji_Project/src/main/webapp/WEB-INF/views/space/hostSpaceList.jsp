<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
<!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<style>
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
  background-color: rgba(228, 105, 4, 0.111);
  padding-top: 20px;
  padding-bottom: 20px;
  padding-left: 10px;
  padding-right: 10px;
  font-size: 25px;
  margin-left: 3px;
  border-top: 1px solid rgb(232, 232, 232);
  border-left: 1px solid rgb(232, 232, 232);
  border-right: 1px solid rgb(232, 232, 232);
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
  border: none;
  border-left: 1px solid rgb(232, 232, 232);
  border-right: 1px solid rgb(232, 232, 232);


}

#side-menubar-list li:last-child {
  text-align: center;
  width: 220px;
  background-color: #cce7d44b;
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
  color: green;
  font-weight: bold;
}

a{
 text-decoration: none;
 color: #3b3b3b;
}

select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
#res {
  width: 62px;
  padding: 5px;
  background-color: #FDE4D8;
  color: #FD6500;
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
  border-radius: 0px;
  margin-top: 40px;
  padding-bottom: 28px;
  padding-top: 30px;
  padding-left: 45px;
  padding-right: 20px;
  border: 1px solid rgb(240, 240, 240); margin-top: 10px;
  box-shadow: 0 0px 3px #F0EFEF;
}
#checkin {
  padding-top: 10px;
  background-color: #f5f5f5e3;
}
.check-date {
  font-size: 13px; font-weight: bold;
}
.res-button {
  width: 130px;
  margin: auto; display: block;
  padding: 18px;
  background-color: #F0EFEF;
  border: none;
  border-radius: 50px;
}
.res-button:hover {
  cursor: pointer;
  background-color: #FF844B;
  color: white;
}

/* 사이드바 메뉴바 관련 디자인 */
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

#side-menubar-list li:focus {
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
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- 여기부터 컨텐츠 영역 ---------------------------->
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

    <div class="content-2" id="content" style="height:1300px;">
        <p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">호스트 공간 조회🌴</p>
        <input type="hidden" name="memberNo" value="${ loginUser.memberNo}">
        
        <!-- 예약 박스 -->
        <c:choose>
            <c:when test="">
                <p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">등록된 공간내역이 존재하지 않습니다.</p>
            </c:when>

            <c:otherwise>
                <c:forEach var="r" items="${ sList }">

                    <div id="res-box" style="margin-top: 40px;">
                        <div style="display: inline-block; width: 400px; height: 200px;">

                            <span id="res">${ r.spaceSubTitle }</span>
                            <br>
                            <span class="check-date">${ r.spaceTitle }</span>


                            <table width="400px" style="padding-top: 20px; padding-bottom: 5px;">
                                <tr>
                                    <td width="20%"><img src="${r.changeName}" width="80px"></td>                                  
                                    <td width="50%">${ r.address }</td>
                                </tr>
                            </table>
                            <span>${ r.spaceDescription }</span>
                            <!--
                            <table id="checkin" width="350px">
                                <tr>
                                    <td style="font-size: 14px; padding-left: 10px;">🌴 시작날짜</td>
                                    <td style="font-size: 14px; padding-left: 15px;">🌴 종료날짜</td>
                                </tr>
                                <tr height="40px">
                                    <td class="check-date" style="padding-left: 10px;">시작날짜</td>
                                    <td class="check-date" style="padding-left: 15px;">종료날짜</td>
                                </tr>
                            </table>
                            -->
                        </div>
                        <div style="width: 180px; float: right; height: 200px;">
                            <button type="button" class="res-button" style="margin-top: 40px;" onclick="location.href='space?sno=${r.spaceNo}';">공간 상세보기</button>
                            <button type="button" class="res-button" style="margin-top: 20px;" onclick="location.href='roomEnrollForm.sp?sno=${r.spaceNo}';">객실 등록하기</button>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <br>
        <!--페이징-->
        <div class="pagination">
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
                        <a class="pagination-prev" href="hostSpaceList.sp?cpage=${ pi.currentPage - 1 }">
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
                            <a class="pagination-page-number" href="hostSpaceList.sp?cpage=${ p }">${p}</a>
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
                        <a class="pagination-next" href="hostSpaceList.sp?cpage=${ pi.currentPage + 1 }">
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
<jsp:include page="../common/footer.jsp" />
<!--페이징-->
<script src="resources/js/space/paging.js"></script>
</body>
</html>