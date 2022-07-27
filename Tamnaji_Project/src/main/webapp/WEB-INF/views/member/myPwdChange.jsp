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

/* 프로필 사진 */

.profile {
  position: absolute;
  display: inline-block;
  margin-left: 40px;
}

.profile-pic {
    width: 200px;
    max-height: 200px;
    display: inline-block;
}

.file-upload {
    display: none;
}
.circle {
    border-radius: 100% !important;
    overflow: hidden;
    width: 200px;
    height: 200px;
    margin: auto;
}
img {
    max-width: 100%;
    height: auto;
}
.p-image {
  z-index: 99;
  position: absolute;
  left: 80%;
  top: 60%;
  color: #666666;
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.p-image:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.upload-button {
  font-size: 1.2em;
}

.upload-button:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
  color: #999;
}

.content-inner {
  padding-bottom: 500px;
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
 color: #3b3b3b;
}

select:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
input:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
textarea:focus {outline: 1px solid #39a652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}

#errorbox {
 font-size: 12px;
 margin-bottom:18px; <!-- margin-top:3px; 변경전 -->
}
#errorbox2 {
 font-size: 12px;
 margin-top:18px; <!-- 추가 -->
}
#errorbox3 {
 font-size: 12px;
 margin-top:18px; <!-- 추가 -->
} 


#checkCode {
 font-size: 12px;
}

#pwdchange {
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

  <div class="content" id="content" style=" height:1300px;">

  	<form id="updateForm" name="updateForm" action="updatePwd.me" method="post" enctype="multipart/form-data"> <!-- 프로필 사진 수정할 수 있게 enctype 추가 -->	    
	    <div class="content-inner" style="height: 800px;">
	      <br><br><br>      
	        <div class="input">
	            <label class="text">기존 비밀번호</label> <!-- 기존 비밀번호 동일할 경우 ajax이용해서  disabled 풀고 새 비번 update-->
	            <input class="input-password" id="pswd1" name="pwdCheck" type="password" placeholder="기존 비밀번호" maxlength="15" required><br><br>
	            <input type="hidden" name="memberId" value="${ loginUser.memberId }"> <!-- 히든으로 login.User넘김 -->
	            <div class="error_next_box" id="errorbox"></div>
	                
	        <div class="input">
	            <label class="text">새 비밀번호</label> <!-- remove disabled -->
	            <input class="input-password" id="pswd1-new" name="memberPwd" type="password" maxlength="15" placeholder="영문자(소문자), 숫자, 특수문자 8~15" required  disabled>
	            <div class="error_next_box" id="errorbox2"></div>
	            
	        </div>
	        <div class="input">
	            <label class="text">새 비밀번호 확인</label> <!-- remove disabled -->
	            <input class="input-password check" id="pswd2" type="password" placeholder="영문자(소문자), 숫자, 특수문자 8~15" maxlength="15"  required disabled>
	            <div class="error_next_box" id="errorbox3"></div>
	        </div>
	        
	      <button id="pwdchange" type="submit" onclick="return validate()" disabled>수정</button>
	    </div>
	  </div>	

   </form>
  </div>
</div>
<script>

$(function() { // 기존비밀번호 DB와 값 비교
	
	// 비밀번호를 입력하는 input 요소 객체 자체를 변수에 담아두기
	var $PwdInput = $("#updateForm input[name=pwdCheck]") // 제이쿼리에서 변수명에 값을 담으려면 관례상 $ 사용
	
	$PwdInput.keyup(function() {
		
		console.log($PwdInput.val());
		
		// 우선 최소 5글자 이상으로 입력되어야지만 ajax 를 요청할 수 있게끔 막아주기
		if($PwdInput.val().length >= 5) {
			$.ajax({
				url : "PwdCheck.me",
				data : {checkPwd : $PwdInput.val()},
				success : function(result) {
					
					if(result == "NNNNN") { // 사용 불가능
						$("#errorbox").show();
						$("#errorbox").css("color", "red").text("기존비밀번호와 일치하지 않습니다. 다시 입력해 주세요.");
						$("#pwdchange").attr("disabled", true);
						
						$("#pswd1-new").attr("disabled", true);
						$("#pswd2").attr("disabled", true);
					}
					else { // 사용 가능
						$("#errorbox").show();
						$("#errorbox").css("color", "green").text("비밀번호가 일치합니다!");
						$("#pwdchange").attr("disabled", false);
						$("#pswd1").keypress(function(e){
							   if(e.keyCode == 13)
							      return false;
						});
						$("#pswd1-new").attr("disabled", false);
						$("#pswd2").attr("disabled", false);
					}
				},
				error : function() {
					console.log("비밀번호 중복 체크용 ajax 통신 실패!");
				}
			});
		}
		else { // 5글자 미만일때 => 수정하기버튼 비활성, 메세지 숨기기
			$("#errorbox").hide(); // 숨기기
		}
	});
});

$(function() { // 새 비밀번호 유효성검사 & 기존비밀번호와 동일한지
	
	// input 사용자값 추출 변수담기
	var $userPwd1 = $('#pswd1');
	var $userPwd2 = $('#pswd1-new')
	
	$userPwd2.keyup(function() {
		
		console.log($userPwd2.val());
		
		if($userPwd2.val().length >= 5) { 
			
			var userPwd1 = $('#pswd1').val();
			var userPwd2 = $('#pswd1-new').val();
			
		    regExp = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/); // 대소문자 구분없이 검사
		    if(userPwd1 == userPwd2 || !regExp.test(userPwd2)) { // 기존비밀번호가 동일하거나 유효하지 않다면
		    	$("#errorbox2").show();
		 		$("#errorbox2").css("color", "red").text("기존과 동일한 비밀번호이거나 유효한 비밀번호가 아닙니다!");
		 		$('#pswd2').attr("disabled", true);
		 		$("#pwdchange").attr("disabled", true);
		    }
		    else { // 유효하다면!
		    	$("#errorbox2").show();
				$("#errorbox2").css("color", "green").text("사용가능한 비밀번호입니다!");
				$('#pswd2').attr("disabled", false);
				$("#pwdchange").attr("disabled", false);
		    }
		}
		else {
			$("#errorbox2").hide(); // 숨기기
		}
	});
});

$(function() { // 새비빌번호 & 새비밀번호 확인 동일여부검사
	
	// input 사용자값 추출 변수담기
	var $userPwd3 = $('#pswd2')
	
	$userPwd3.keyup(function() {
		
		console.log($userPwd3.val());
		
		if($userPwd3.val().length >= 5) {
			var userPwd2 = $('#pswd1-new').val();
			var userPwd3 = $('#pswd2').val();
			
			regExp = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/); // 대소문자 구분없이 검사
		    if(userPwd2	== userPwd3 && regExp.test(userPwd3)) { // 유효성 & 동일하거나
		    	 $("#errorbox3").show();
			     $("#errorbox3").css("color", "green").text("정확히 입력하셨습니다!");
			     $('#pswd1-new').prop('readonly', true);
			     $('#pswd2').prop('readonly', true);
			     $("#pwdchange").attr("disabled", false);
		    }
		    else { // 동일할 경우!
		    	$("#errorbox3").show();
				$("#errorbox3").css("color", "red").text("유효한 비밀번호가 아니거나 새 비밀번호와 동일하지 않아요!");
				
				$("#pwdchange").attr("disabled", true);
		      }
		   } 
		else {
			$("#errorbox3").hide(); // 숨기기
		}	
	});
});

</script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>