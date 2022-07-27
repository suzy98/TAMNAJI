<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

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

.res-button {
  width: 120px;
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

/*모달------------------------------------*/
.popup-wrap {
	 width: 100%;
	 height: 100%;
	 display: none;
	 position: absolute;
	 top: 0px;
	 left: 0px;
   background:rgba(0, 0, 0, 0.5);
}
 .popup-box {
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

#popup-header {
    padding-top: 50px;
    font-size: 20px;
}

 .popup-box .close-btn {
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


/*별점-----------------------------*/

.cont{
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

/* 페이징바 관련 */
#w3-center {
	margin-right: 130px;

}
 
</style>
</head>
<body>


<jsp:include page="../common/header.jsp" />


<!-- 여기부터 컨텐츠 영역 ---------------------------->
<div class="container" style=" padding-top: 170px;margin: 0 auto;">
  <div class="content" id="aside" style=" background: white">    
    <div class="side-menu"style="margin-left: 10px;">
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

  <div class="content-2" id="content" style= "height:1300px;">
    	<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">호스트 객실 조회🌴</p>
   		<input type="hidden" name="memberNo" value="${ loginUser.memberNo}">
   		
 <!-- 예약 박스 -->
 	<c:choose>
 		<c:when test="${ empty list }">
 			<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">등록된 객실이 존재하지 않습니다.</p>
 		</c:when>
 		
 		<c:otherwise> 
 			<c:forEach var="r" items="${ list }">

			 		<div id="res-box" style="margin-top: 40px;">
			          <div style="display: inline-block; width: 400px; height: 200px;">
			          
				          		<span id="res">${ r.spaceTitle }</span>
				          		<!-- <span id="res">${ r.spaceDescription }</span> -->
				          		<span class="check-date">${ r.bedType }</span>

				          <table width="400px" style="padding-top: 20px; padding-bottom: 5px;">
					         <tr>
					         	<td width="70px"><img src="${r.changeName}" width="80px" height="80px"></td>
							    <td style="width: 80px;">${ r.roomTitle }</td>
					         </tr>
					      </table>
					      
					      <table id="checkin" width="350px">   
					         	<tr>
						            <td style="font-size: 14px; padding-left: 10px;">🌴 시작날짜</td>
						            <td style="font-size: 14px; padding-left: 15px;">🌴 종료날짜</td>
						        </tr>
						        <tr height="40px">
						            <td class="check-date" style="padding-left: 10px;">${ r.startDate }</td>
						            <td class="check-date" style="padding-left: 15px;">${ r.endDate } </td>
			        		 	</tr>
				          </table>
			          </div>
			          <div style="padding-top: 50px; width: 180px; float: right; height: 200px;">
				          <!-- <button class="res-button" style="margin-top: 20px;">공간 상세보기</button><br>-->
			          </div>
			       </div>
 			</c:forEach>
       
       <br>
       
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
                        <a  class="pagination-prev" 
                        	href="hostSelect.me?cpage=${ pi.currentPage - 1 }">
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
                            <a class="pagination-page-number" 
                            href="hostSelect.me?cpage=${ p }">${ p }</a>
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
                        <a class="pagination-next" 
                        href="hostSelect.me?cpage=${ pi.currentPage + 1 }" >
                            <span class="icon-pagination icon-pagination-next">
                                <i class="icon material-icons">keyboard_arrow_left</i>
                            </span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        </c:otherwise>
 	</c:choose>
	
  </div>
</div> 

<jsp:include page="../common/footer.jsp" />

</body>
</html>