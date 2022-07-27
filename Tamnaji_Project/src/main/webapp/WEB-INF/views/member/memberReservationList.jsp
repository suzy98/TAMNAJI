<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<script
src="https://kit.fontawesome.com/77e29b57dd.js"
crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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

/*모달------------------------------------*/
.popup-wrap {
	 width: 100%;
	 height: 50%;
	 display: none;
	 position: absolute;
	 top: -40px;
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
    	<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">나의 예약내역🌴</p>
      
 <!-- 예약 박스 -->
 	<c:choose>
 		<c:when test="${ empty list }">
 			<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">예약내역이 존재하지 않습니다.</p>
 		</c:when>
 		<c:otherwise> 
 			<c:forEach var="r" items="${ list }">
 				<input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
			 		<div id="res-box" style="margin-top: 40px;">
			          <div style="display: inline-block; width: 400px; height: 200px;">
			          	<c:choose>
				          <c:when test="${ r.payStatus eq '결제완료' }">
				          		<span id="res">${ r.payStatus }</span>
				          		<span class="check-date">${ r.approveDate }</span>
				          </c:when>
				          <c:when test="${ r.payStatus eq null }">
				          		<span id="res">종료된 요청입니다.</span>
				          		<span class="check-date">${ r.approveDate }</span>
				          </c:when>
				          <c:otherwise>
				          		<span id="res">${ r.payStatus }</span>
				          		<span class="check-date">${ r.cancelDate }</span>
				          </c:otherwise>
				        </c:choose>
				          
				          <table width="400px" style="padding-top: 20px; padding-bottom: 5px;">
					         <tr>
					         	<td width="80px"><img src="${r.changeName}" width="70px"></td>
							    <td width="150px;">${ r.spaceTitle}</td> <!-- SPACE_DISCRIPTION -->
							    <td onclick="reservationDetail('${r.orderId}')">${ r.roomTitle }</td>
					         </tr>
					      </table>
					      <table id="checkin" width="350px">
					         <c:choose>
					         	<c:when test="${ r.payStatus eq '결제취소' and r.payStatus eq null }">
							         <tr>
							            <td colspan="2" style="font-size: 14px; padding-left: 10px;">🌴결제취소일</td>
							         </tr>
							         <tr height="40px">
						            	<td colspan="2" class="check-date" style="padding-left: 10px;">${ r.cancelDate }</td>
						             </tr>
					         	</c:when>
					         	<c:otherwise>
							         <tr>
								        <td style="font-size: 14px; padding-left: 10px;">🌴체크인</td>
								        <td style="font-size: 14px; padding-left: 15px;">🌴체크아웃</td>
							         </tr>
							         <tr height="40px">
							            <td class="check-date" style="padding-left: 10px;">${ r.checkInDate }</td>
							            <td class="check-date" style="padding-left: 15px;">${ r.checkOutDate } </td>
					        		 </tr>
					         	</c:otherwise>
					         </c:choose>
				          </table>
			          </div>
			          <div style="padding-top: 10px; width: 180px; float: right; height: 180px; ">
					      <c:choose>
						      <c:when test="${ r.payStatus eq null}">
					      			<!-- <button class="res-button" style="margin-top: 30px;">예약 상세</button><br> -->
						      </c:when>
						      <c:when test="${ r.payStatus eq '결제완료' }">
					      			<!-- <button class="res-button" style="margin-top: 25px;">예약 상세</button><br> -->
						      		<button class="review-button" onclick="reviewCreate('${r.orderId}');" value="${r.orderId}">후기 작성</button><!-- 호따옴표 문자열로 인식 ""표는 인수로 처리해버림 자스 -->
                      <button class="review-button" onclick="cancelReservation('${ r.price }','${r.orderId}', '${r.paymentMethod}', '${r.tid}');" value="${r.orderId}" style="margin-top: 60px;">예약 취소</button><!-- 호따옴표 문자열로 인식 ""표는 인수로 처리해버림 자스 -->
                  </c:when>
						      <c:when test="${ r.payStatus eq '결제취소' }">
					      			<!-- <button class="res-button" style="margin-top: 60px;">예약 상세</button><br> -->
						      </c:when>
						      <c:when test="${ r.payStatus eq '결제대기' }">
					      			<!-- <button class="res-button" style="margin-top: 60px;">예약 상세</button><br> -->
						      </c:when>
					      </c:choose>
				      </div>
			       </div>
 			</c:forEach>
 		
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
                        	href="MyReservationList.me?cpage=${ pi.currentPage - 1 }">
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
                            href="MyReservationList.me?cpage=${ p }">${ p }</a>
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
                        href="MyReservationList.me?cpage=${ pi.currentPage + 1 }" >
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
 	
 		<div class="popup-wrap">
		  <div class="popup-box">
			    <div class="cont">
			        <div class="stars">
				        <form id="gradeForm" action="reviewCreate.me" method="post">
					          <input class="star star-5" id="star-5-2" type="radio" name="grade2" value="5" />
					          <label class="star star-5" for="star-5-2"></label>
					          <input class="star star-4" id="star-4-2" type="radio" name="grade2" value="4" />
					          <label class="star star-4" for="star-4-2"></label>
					          <input class="star star-3" id="star-3-2" type="radio" name="grade2" value="3" />
					          <label class="star star-3" for="star-3-2"></label>
					          <input class="star star-2" id="star-2-2" type="radio" name="grade2" value="2" />
					          <label class="star star-2" for="star-2-2"></label>
					          <input class="star star-1" id="star-1-2" type="radio" name="grade2" value="1" />
					          <label class="star star-1" for="star-1-2"></label>
				          
					          <div class="rev-box">
					            <input type="hidden" name="orderId">
					            <textarea class="review" col="30" name="reviewContent" id="review"></textarea>     
					            <label class="review" for="review"><br>정성스러운 리뷰, 탐나지에게 큰 힘이 됩니다!</label>
					            <button id="review-submit" type="submit">작성하기</button>
					         </div>
				        </form>
			        </div>
			    </div>
		    	<a class="close-btn popup-close">x</a>
		  </div>
  				<div class="modal-layer"></div>
	    </div>

		<script>
		
		function reviewCreate(orderId){
			console.log(orderId);
			$('input[name=orderId]').val(orderId);
			modalUp(this);
		}

		function modalUp(e){
			$('.popup-wrap').fadeIn(500);
			$('.popup-box').removeClass('transform-out').addClass('transform-in');
		
		}
		
		$(document).ready(function() {		
			$('.popup-close').click(function(e) {
			$('.popup-wrap').fadeOut(500);
			$('.popup-box').removeClass('transform-in').addClass('transform-out');
			
			  e.preventDefault();
			}
		);

		});
		</script>
		
  </div>
</div> 

<script>

  function cancelReservation(price, orderId, paymentMethod, tid){

    var formLayout = document.createElement("form"); // 폼객체 생성
      formLayout.setAttribute("charset", "UTF-8");
      formLayout.setAttribute("method", "post"); //GET, POST

      if(paymentMethod == '카카오페이'){
      formLayout.setAttribute("action", '/tamnaji/reservation/kakaopay/delete');
      
      var idxLayout = document.createElement("input"); // input 객체 생성
      idxLayout.setAttribute("type", "text");
      idxLayout.setAttribute("name", "cancel_amount");
      idxLayout.setAttribute("value", price);
      formLayout.appendChild(idxLayout); // 폼에 추가 실시

      var nameLayout = document.createElement("input"); // input 객체 생성
      nameLayout.setAttribute("type", "text");
      nameLayout.setAttribute("name", "tid");
      nameLayout.setAttribute("value", tid);
      formLayout.appendChild(nameLayout); // 폼에 추가 실시

    
      } else {
      formLayout.setAttribute("action", '/tamnaji/reservation/deposit/cancel');

      var nameLayout = document.createElement("input"); // input 객체 생성
      nameLayout.setAttribute("type", "text");
      nameLayout.setAttribute("name", "orderId");
      nameLayout.setAttribute("value", orderId);
      formLayout.appendChild(nameLayout); // 폼에 추가 실시
      
      }
      document.body.appendChild(formLayout); //body에 폼 레이아웃 추가
      formLayout.submit(); //실행 및 제출 실시
      document.body.removeChild(formLayout); //body에서 폼 레이아웃 삭제  	
  }	


  function reservationDetail(orderId){

var formLayout = document.createElement("form"); // 폼객체 생성
  formLayout.setAttribute("charset", "UTF-8");
  formLayout.setAttribute("method", "get"); //GET, POST
  formLayout.setAttribute("action", '/tamnaji/reservation');

  var nameLayout = document.createElement("input"); // input 객체 생성
  nameLayout.setAttribute("type", "text");
  nameLayout.setAttribute("name", "orderId");
  nameLayout.setAttribute("value", orderId);
  formLayout.appendChild(nameLayout); // 폼에 추가 실시
  
  document.body.appendChild(formLayout); //body에 폼 레이아웃 추가
  formLayout.submit(); //실행 및 제출 실시
  document.body.removeChild(formLayout); //body에서 폼 레이아웃 삭제
  }
  </script>


<jsp:include page="../common/footer.jsp" />

</body>
</html>