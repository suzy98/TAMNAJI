<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
  margin-left: 50%;
  width: 400px;
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
  border: none;
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

}

li a:hover {
  color: green;
  font-weight: bold;
}

.content-inner {
  padding-bottom: 500px;
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

.input-email-2, .input-userId, .input-password, .input-name, .input-gender, .input-email {
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
 width: 138px;
 height: 40px;
 box-sizing: border-box;
 background-color: #fd6500;
 color: white;
 border-radius: 20px;
 border: 1px solid #F2F2F2;
 box-shadow: 0px 0px 2px rgb(226, 225, 224);
}

button:hover {
 cursor: pointer;
 background-color: #fd4500;
}

select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}

#checkCode {
 font-size: 12px;
}

#Hostchange {
 margin:auto;
 margin-left: 80px;
 display:block;       	
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
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />


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
	    	<li><a href="">호스트 공간 등록</a></li>
	        <li><a href="hostSelect.me">호스트 공간 조회</a></li>
	        <li><a href="hostReservation.me">호스트 예약 내역</a></li>
	        <!-- <li><a href="">호스트 수익정산현황</a></li> -->
	    </c:if>
      </ul>
      </div>
    </div>
  </div>
  
  <div class="content" id="content" style=" height:1300px;">
  	<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">호스트 전환🌴</p>
  	
  	<form id="updateBank" name="updateBank" action="hostRequest.me" method="post">
  	  <input type="hidden" name="memberId" value="${ loginUser.memberId }">   
	    <div class="content-inner" style="height: 800px;">
	      	<br><br>
	        <div class="input">
	            <label class="text">은행명</label> 
	            <select class="input-password" name="bankName" required>
	            	<option value="">선택안함</option>
	            	<option value="KB">국민은행</option>
	            	<option value="SH">신한은행</option>
	            	<option value="WO">우리은행</option>
	            	<option value="IB">기업은행</option>
	            	<option value="NH">농협</option>
	            	<option value="KK">카카오뱅크</option>
	            </select>   
	            
	            <br><br><br>
	        		                
		        <div class="input">
		            <label class="text">계좌번호</label> 
		            <input class="input-password" id="pswd1-new" name="accountNumber" type="text" maxlength="20" placeholder="계좌번호 입력 ('-'제외)" required pattern="[^a-zA-Z가-힣ㄱ-ㅎ ㅏ-ㅣ/\s/g]+">	            
		        </div>
		        
		      	<button id="Hostchange" type="submit">호스트 전환 신청</button>
	       </div>
	   </div>	
   </form>
  
  </div> 
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>