<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*----------------------------------------------------------------------*/
/*마이페이지 관련 ---- 항상 복붙 */


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

.bye:hover{
 background-color: #085219;
}

.bye {
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

.error_next_box {
 font-size: 12px;
 margin-top:5px;
 margin-bottom: 30px;
     
}

#errorboxNickName{ 
 font-size: 12px;
 margin-top:18px; /* 추가 */
}


#checkCode {
 font-size: 12px;
}
        
/* Modal 창 */
        
button {
 top:50%; left:50%;
 width:138px; 
 height:40px; 
 margin-top:-15px; 
 line-height:15px; 
 cursor:pointer;
}

/* 건들지마세요 */
.modal { 
 position:absolute; 
 width:100%; height:100%;
 background: rgba(0,0,0,0.8); 
 top:0; left:0; 
 display:none;
}

.modal_content{
 width:400px; height:300px;
 background:#fff; 
 border-radius:10px;
 position:relative; 
 top:50%; left:50%;
 margin-top:-600px; 
 margin-left:-200px;
 text-align:center;
 box-sizing:border-box; 
 padding:74px 0;
 line-height:23px; 
 cursor:pointer;
}
/* 건들지마세요 */
      
#memberPwd {
 width: 200px;
 height: 28px;
 border: 1px solid;
 border-radius: 3px;
 margin-bottom: 25px;
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
     <form id="updateForm" action="updateMember.me" method="post" enctype="multipart/form-data"> <!-- 프로필 사진 수정할 수 있게 enctype 추가 -->
       <div class="profile">
         <div class="circle">
	      <c:choose>
              <c:when test="${ not empty loginUser.changeName }"> <!-- 현재 로그인한 유저의 프로필사진이 있을경우 -->
                <img class="profile-pic" src="${ loginUser.changeName }"> <!-- 프로필 사진수정명 동적뿌리기 -->
              </c:when>
              <c:otherwise><!--  -->
                <img class="profile-pic" src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg">
              </c:otherwise>
		    </c:choose>
	     </div>
	      <div class="p-image">
	        <i class="fa fa-camera upload-button"></i>        
	        <input class="file-upload" id="uploadfile" type="file" accept="image/*" name="reupfile" />
	      </div> 
	    </div>
						
	    <div class="content-inner" style="height: 800px;">
	      <br><br><br><br><br><br><br>
	      <br><br><br><br><br>
	
	          <div class="input"> <!-- value에 값 뿌리기 -->
              <label class="text">닉네임</label>
              <input class="input-name" id="name" name="nickname" placeholder="별명 (2~15자)" value="${ loginUser.nickname }" required> <!-- 넘길 key값 -->
              <div class="error_next_box" id="errorboxNickName"></div>
	        </div>
	
	          <div class="input">
                <label class="text">이메일</label> 
                <input class="input-userId" id="id" name="memberId" value="${ loginUser.memberId }" type="email" placeholder="이메일" maxlength="12" required readonly>
                <div class="error_next_box"></div>
	        </div>
	        
	        <div class="input">
              <label class="text">휴대폰번호</label> 
              <input class="input-userId" id="id" name="phone" value="${ loginUser.phone }" type="text" placeholder="'-'없이  입력해주세요." maxlength="11" required pattern="[^a-zA-Z가-힣ㄱ-ㅎ ㅏ-ㅣ/\s/g]+">
              <div class="error_next_box"></div>
	        </div>
	
	      <div class="input">
	          <label class="text">성별</label>
		      <select id="gender" class="input-gender" name="gender" required>
		         <option value="X">성별</option>
		         <option value="M">남</option>
		         <option value="F">여</option>
		      </select>
	          <div class="error_next_box"></div>
	      </div>
	
	      <div class="input">
	        <label class="text">자기소개</label>
	        <textarea name="introduce" id="introduce" placeholder="자기소개 입력부탁드립니다." >${ loginUser.introduce }</textarea>
        </div>

            <button type="submit" id="revise">수정하기</button>
            <button type="button" class="bye">탈퇴하기</button>
          </div>
        </div>

  	</form>
  </div>

  
          <div class="modal">
            <div class="modal_content">
                  <form id="exitForm" action="delete.me" method="post">
                      <div class="modal-body">
                        <div align="center">
                        <span style="color : blue">${ loginUser.nickname }</span>님
				                              정말로 탈퇴하실건가요?<br>
				                              다시 한번 신중히 부탁드려요..
                        </div>
                        <br>      
                          <label for="memberPwd">비밀번호 :</label>
                              <input type="password" placeholder="비밀번호를 입력해주세요." id="memberPwd" name="memberPwd"><br>
                              <span class="error_next_box" id="errorbox"></span>
                              <input type="hidden" name="memberId" value="${ loginUser.memberId }">
                        
                        <div align="center">
                          <c:if test="${ not empty loginUser }"><br>
                              <button type="submit" class="bye" id="exit" disabled>탈퇴하기</button>
                          </c:if>
                              <button type="button" id="cancel">취소하기</button>
                        </div>
                      </div>        
                  </form>         
            </div>
          </div>


<script>

   
$(function() {
   
   // 현재 loginUser 의 gender 필드의 값과 대조 "F" / "M"
   // EL 표기법 특성상 없는 값일 경우는 그냥 공백이기 때문에
   if("${ loginUser.gender }" != "") { // 성별 정보가 있을 경우
      
      $("#gender").val("${ loginUser.gender }").prop("selected", true);
   }
});

$(document).ready(function() {
      
     var readURL = function(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();

             reader.onload = function(e) {
                 $('.profile-pic').attr('src', e.target.result);
             }
             reader.readAsDataURL(input.files[0]);
         }
     }
     
     $(".upload-button").on('click', function() {
           $(".file-upload").click();
     });

     $(".file-upload").on('change', function(){
         readURL(this);
     });
   });
   
$(function() {
   
   // 현재 loginUser 의 gender 필드의 값과 대조 "F" / "M"
   // EL 표기법 특성상 없는 값일 경우는 그냥 공백이기 때문에
   if("${ loginUser.gender }" != "") { // 성별 정보가 있을 경우
      
      $("#gender").val("${ loginUser.gender }").prop("selected", true);
   }
});

$(function() { // 모달창 띄우는 제이쿼리
   
     $(".bye").click(function(){
       $(".modal").fadeIn();
     });
   
     $("#cancel").click(function(){
        if($('#cancel').val() != 'null') {
           $(".modal").fadeOut();
           $('#exitForm').each(function() { // 비밀번호 초기화
             this.reset(); 
           });
           $("#errorbox").hide(); // 숨기기
          }
     });
});

$(function() {// 닉네임 중복확인 ajax
   
   
   var $IdInput = $("#updateForm input[name=nickname]") // 제이쿼리에서 변수명에 값을 담으려면 관례상 $ 사용
   
   $IdInput.keyup(function() {
      
      console.log($IdInput.val());
      
      if($IdInput.val().length >= 1) {
         $.ajax({
            url : "nameCheck.me",
            data : {nickname : $IdInput.val()},
            success : function(result) {
               
               if(result == "N") { // 사용 불가능
                  $("#errorboxNickName").show();
                  $("#errorboxNickName").css("color", "red").text("동일한 닉네임이 존재합니다.");
                  $('#revise').attr("disabled", true);
               }
               else { // 사용 가능
                  $("#errorboxNickName").show();
                  $("#errorboxNickName").css("color", "green").text("사용가능합니다!");
                  $('#revise').attr("disabled", false);
               }
            },
            error : function() {
               console.log("닉네임 중복 체크용 ajax 통신 실패!");
            }
         });
      }
      else {
         $("#errorboxNickName").hide(); // 숨기기
      }
   });
});


$(function() { // 비밀번호가 맞을 경우에 disabled -> abled 활성화
   
   // 비밀번호를 입력하는 input 요소 객체 자체를 변수에 담아두기
   var $IdInput = $("#exitForm input[name=memberId]")
   var $PwdInput = $("#exitForm input[name=memberPwd]") // 제이쿼리에서 변수명에 값을 담으려면 관례상 $ 사용
   
   $PwdInput.keyup(function() {
      
      console.log($PwdInput.val());
      
      // 우선 최소 5글자 이상으로 입력되어야지만 ajax 를 요청할 수 있게끔 막아주기
      if($PwdInput.val().length >= 5) {
         $.ajax({
            url : "PwdCheck.me",
            data : {checkId : $IdInput.val(),
                  checkPwd : $PwdInput.val()},
            success : function(result) {
               
               if(result == "NNNNN") { // 사용 불가능
                  $("#errorbox").show();
                  $("#errorbox").css("color", "red").text("기존비밀번호와 일치하지 않습니다. 다시 입력해 주세요.");
                  $("#exit").attr("disabled", true); // 탈퇴활성화
               }
               else { // 사용 가능
                  $("#errorbox").show();
                  $("#errorbox").css("color", "green").text("비밀번호가 일치합니다!");
                  $("#exit").attr("disabled", false); // 탈퇴활성화
               }
            },
            error : function() {
               console.log("비밀번호 중복 체크용 ajax 통신 실패!");
            }
         });
      }
      else {// 5글자 미만일때 => 수정하기버튼 비활성, 메세지 숨기기
         $("#errorbox").hide(); // 숨기기
         $("#exit").attr("disabled", true);
      }
   });
});

</script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>