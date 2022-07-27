<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<style>

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
 width: 280px;
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
 margin-top:18px; <!-- 추가 -->
}


#checkCode {
 font-size: 12px;
}
        
<!-- Modal 창 -->
        
button { 
 position:absolute; 
 top:50%; left:50%;
 width:120px; 
 height:30px; 
 margin-top:-15px; 
 margin-left:-60px;
 line-height:15px; 
 cursor:pointer;
}
        
.modal { 
 position:absolute; 
 width:100%; height:220%; 
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
		
#memberPwd {
 width: 200px;
 height: 28px;
 border: 1px solid;
 border-radius: 3px;
 margin-bottom: 25px;
}

</style>
</head>
<body>
  <jsp:include page="../common/adminheader.jsp" />
	<jsp:include page="../common/adminMenu.jsp" />
	
	
	<div class="content" id="content" style=" height:1300px;">
  	<form id="updateForm" action="acceptRequest.ad" method="post"> <!-- 프로필 사진 수정할 수 있게 enctype 추가 -->
	    <input type="hidden" name="mno" value="${ m.memberNo }" />
	    <div class="profile">
	      <div class="circle">
        
	      <c:choose>
		      <c:when test="${ not empty m.changeName }"> <!-- 현재 로그인한 유저의 프로필사진이 있을경우 -->
		      	 <img class="profile-pic" src="${ m.changeName }"> <!-- 프로필 사진수정명 동적뿌리기 -->
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
	
	      	<div class="input">
	        <label class="text">닉네임</label>
	        <input class="input-name" id="name" name="nickname" placeholder="별명 (2~15자)" value="${ m.nickname }" readonly>
	        </div>
	
	      	<div class="input">
	        <label class="text">회원아이디</label> 
	        <input class="input-userId" id="id" name="memberId" value="${ m.memberId }" type="email" placeholder="이메일" maxlength="12" readonly>
	        </div>
	        
	        <div class="input">
	        <label class="text">은행명</label> 
	        <input class="input-userId" value="${ m.bankName }" type="email" placeholder="이메일" maxlength="12"style="text-align: center;" readonly>
	        </div>
	        
	        <label class="text">계좌번호</label> 
	        <div class="input">
	        <input class="input-userId" id="id" name="accountNumber" value="${ m.accountNumber }" type="text" style="text-align: center;" readonly>	        
	        </div>
			
	      <button type="submit" class="bye" id="acceptRequest">판매자 승인하기</button>
	    </div>
  	</form>
  </div>
  
  <script>
  	$("#acceptRequest").click(function() {
  		
  		$("#accepRequest").submit();
  	});
  
  
  </script>
	

</body>
</html>