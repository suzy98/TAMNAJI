<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--제이쿼리-->
<!--명석이가 넣었는데 불만있는 사람 알려주세요-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--밑에 2개는 달력쓰려고 넣은거니까 이것도 불만있으면 알려주세요-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://kit.fontawesome.com/77e29b57dd.js" crossorigin="anonymous"></script>
<!-- 웹소켓 -->
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>

	/*드래그 컬러*/
	::selection{color:black;background:#eef5eb;}
	::-moz-selection{color:black;background:#eef5eb;}

	/* 스크롤 바 */
	::-webkit-scrollbar { width: 7px; }
	::-webkit-scrollbar-track {
		background-color: rgba(216, 230, 216, 0.5);
	}
	::-webkit-scrollbar-thumb { background-color: #69ca69; }
	::-webkit-scrollbar-button { display: none; }


	@font-face {
	font-family: 'NanumSquareRound';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
	font-weight: normal;
	font-style: normal;
	}



	body{
	position: relative;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	}


	/* 만들어놓고 필요한 곳에서 쓸 수 있다 */
	:root {
	--text-color: black;
	--background-color: #f8ded2;
	--accent-color: #ff4d00;
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


	.navbar {
	width: 100%;
	justify-content: space-around;
	align-items: center;
	background-color: white;
	padding-left: 20px;
	padding-right: 20px;
	border-bottom: 1px solid #ddd;
	height: 70px;
	position: fixed;
	display: flex;
	z-index: 1000;
	}

	.navbar-logo img {
	width: 200px;
	}

	.navbar-logo i {
	color: var(--accent-color);
	}

	/* menu */

	.navbar-menu {
	display: flex;
	padding-left: 0;
	list-style: none;
	background-color: white;
	}

	.navbar-menu li {
	padding: 12px;
	font-size: 15px;
	}

	@media screen and (max-width: 1268px) {
	.navbar-menu {
		display: none;
	}
	}


	/* icon */
	.navbar-icon {
	justify-content: flex-end;
	display: flex;
	list-style: none;
	padding-left: 0px;
	color: var(--text-color);
	}

	.navbar-icon li {
	font-size: larger;
	padding: 12px;
	padding-top: 7px;
	}


	.navbar-icon li a {
	font-size: 13px;
	}

	.navbar-icon li a:hover {

	color: #fd6500;
	cursor: pointer;
	}

	.navbar-more {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 24px;
	color: var(--accent-color);
	}

	#search {
	width: 150px;
	border: 1px solid white;

	}

	#login a, #logout a {
	padding: 7px;
	box-sizing: border-box;
	margin-left: 2px;
	border: 1px solid #fd6500;
	border-radius: 30px;
	color: white;
	background: #fd6500;
	}



	#space-menu {
	margin-left: -50px;
	}

	.menu_item {
	display: inline-block; /*가로로 배치되게*/
	}

	.menu_link {
	display: block; /*menu_link와 menu_item이 동일한 사이즈 갖게*/

	font-size:15px;
	line-height: 24px;
	font-weight: bold;
	color: #444;
	}


	.menu_item.active .menu_link {
	color: black; /* 메인 메뉴 선택, 활성화 효과 */
	}

	.menu_item:hover .menu_link {
	color: #fd6500;
	}

	/*메인메뉴에 active가 있을 경우에 서브메뉴 노출*/
	.menu_item.active .submenu {
	display: block; /* 메인 메뉴 활성화 시 서브 메뉴 노출 처리 */
	}


	/*서브메뉴*/
	.submenu {
	margin-top: 12px;
	padding-bottom: 25px;
	display: none; 
	position: absolute;
	left: 0;
	width: 100%;
	height: 50px;
	min-width: 700px;
	border-bottom: 1px solid #ddd;
	background-color: white;
	}

	#submenu1 {
	padding-left: 26%;
	}

	#submenu2 {
	padding-left: 26%;
	}

	.submenu_item {
	display: inline-block;
	}
	.submenu_link {

	display: block;
	padding: 5px 5px;
	font-size: 14px;
	line-height: 20px;
	color: #333;
	}
	/* 서브 메뉴 선택, 활성화 시 효과 */
	.submenu_item:hover .submenu_link {
	font-weight: bold;
	color: green;
	}
	.submenu_link span {
	position: relative; 
	}
	/* 서브 메뉴 선택, 활성화 시 하단 라인 노출 효과  */
	.submenu_item:hover span:after {
	position: absolute;
	content: ''; /*빈값 넣어주기*/
	right: 0;
	bottom: -15px;
	left: 0;    
	border-bottom: 2px solid green;
	}

	#submenu1 {
	visibility: hidden;
	opacity: 0;
	position: absolute;
	transition: all 0.5s ease;
	left: 0;
	display: none;
	}

	ul li:hover > #submenu1,
	#submenu1:hover {
	visibility: visible;
	opacity: 1;
	display: block;
	}




	ul li:hover > #submenu2,
	#submenu2:hover {
	visibility: visible;
	opacity: 1;
	display: block;
	}





	/* search bar 관련 */

	.search-container {
		width: 300px;
	height: 35px;
		display: block;
	margin-bottom: 10px;
	}
	input#search-bar {
		margin: 0 auto;
	padding: 0;
		width: 100%;
		height: 45px;
		padding: 0 20px;
		font-size: 1rem;
	border-radius: 50px;
		border: #d6d6d6;
	box-shadow: 0 0 3px rgb(218, 207, 202);;
	background: rgb(255, 249, 247);
		outline: none;
	}
	input#search-bar:focus {
		border: 1px solid #f9844a;
		transition: 0.35s ease;
		color: #fd6500;
	}
	input#search-bar:focus::-webkit-input-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	input#search-bar:focus::-moz-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	input#search-bar:focus:-ms-placeholder {
		transition: opacity 0.45s ease;
		opacity: 0;
	}
	.search-icon {
		position: relative;
		float: right;
		width: 20px;
		height: 20px;
		top: -35px;
		right: 15px;
	}
/*********** 채팅폼 스타일 ***********/
#chatTable,#chatTable>tr,#chatTable>td{
  border: 1px solid;
}




/* #Cursor
================================================== */
.cursor,
.cursor2,
.cursor3{
  position: fixed;
  border-radius: 50%; 
  transform: translateX(-50%) translateY(-50%);
  pointer-events: none;
  left: -100px;
  top: 50%
}
.cursor{
  background-color: rgba(255, 255, 255, 0.397);
  height: 0;
  width: 0;
  z-index: 99999;
}
.cursor2,.cursor3{
  height: 36px;
  width: 36px;
  z-index:99998;
  -webkit-transition:all 0.3s ease-out;
  transition:all 0.3s ease-out
}
.cursor2.hover,
.cursor3.hover{
  -webkit-transform:scale(2) translateX(-25%) translateY(-25%);
  transform:scale(2) translateX(-25%) translateY(-25%);
  border:none
}
.cursor2{
  border: 2px solid #fff;
  box-shadow: 0 0 22px rgba(255, 255, 255, 0.6);
}
.cursor2.hover{
  background: rgba(255,255,255,.1);
  box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);
}


 *{ cursor: url('data:image/x-icon;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////v////5////+f////n////4D///+D////j////x////w///HwP//jwH//4gB/gAAAfwAAAP/AAAH/wAAD/8AAB//gAA//8AA///4A////4H////A////8H/9/////f////3////8P//////////////////////////////8='), auto; }



</style>
</head>
<body>

	<!-- 1회성 알람문구 기능 -->
	<c:if test="${ not empty alertMsg }"> <!-- 알람메세지 내용이 있다면 -->
		<script>
			// script 태그 안에서는 스크립틀릿이 인식되었음
			// script 태그 안에서는 core 라이브러리 태그가 인식되지 않음 => 사용 불가

			Swal.fire({
				  text: '${ alertMsg }',
				  icon: 'success',
				  confirmButtonColor: '#80ca6a', // confrim 버튼 색깔 지정
   				  confirmButtonText: '확인'
				});
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

    <!-- container -->
    <nav class="navbar">

      <!-- logo -->
      <div class="navbar-logo">
       <a href="/tamnaji"><img src="resources/images/logo.png"></a>
      </div>

      <!-- menu -->
      <ul class="navbar-menu" id="space-menu">
        <li class="menu_item active"><a class="menu_link" href="space.sp?categoryName=숙박">스페이스</a>

          <!-- 서브 메뉴 -->
        <ul class="submenu" id="submenu1">

          <!-- 서브 메뉴 활성화 클래스 active 추가 -->
          <li class="submenu_item active"><a href="space.sp?categoryName=숙박" class="submenu_link"><span>숙박 공간</span></a></li>
          <li class="submenu_item"><a href="space.sp?categoryName=공간" class="submenu_link"><span>모임 공간</span></a></li>
        </ul>
      </li>
        <li class="menu_item"><a href="mbtiPage.sp" class="menu_link" id="event">이벤트</a>

          <!-- 서브 메뉴 -->
        <ul class="submenu" id="submenu2">
          <li class="submenu_item active"><a href="selectEventList.ev" class="submenu_link"><span>이달의 이벤트</span></a></li>
          <li class="submenu_item"><a href="mbtiPage.sp" class="submenu_link active"><span>내게 맞는 공간 찾기</span></a></li>
        </ul></li>
        <li class="menu_item"><a href="list.bo" class="menu_link">커뮤니티</a></li>
      </ul>
      <ul class="navbar-menu">
        <form class="search-container" action="searchSpace" mehtod="get">
          <input type="text" id="search-bar" name="keyword" placeholder="어떤 공간을 찾고 있나요?">
          <span><img onclick="search();" class="search-icon" src="resources/images/search-2.png"></span>
        </form>
      </ul>

	  <script>

		function search(){

			var keyword = $('input[name=keyword]').val();

			var formLayout = document.createElement("form"); // 폼객체 생성
				formLayout.setAttribute("charset", "UTF-8");
				formLayout.setAttribute("method", "get"); //GET, POST
				formLayout.setAttribute("action", 'searchSpace');

			var inputLayout = document.createElement("input"); // input 객체 생성
			inputLayout.setAttribute("type", "text");
			inputLayout.setAttribute("name", "keyword");
			inputLayout.setAttribute("value", keyword);
			formLayout.appendChild(inputLayout); // 폼에 추가 실시

			document.body.appendChild(formLayout); //body에 폼 레이아웃 추가
			formLayout.submit(); //실행 및 제출 실시
			document.body.removeChild(formLayout); //body에서 폼 레이아웃 삭제  	
			
		}	


	  </script>
      <!-- 오른쪽 메뉴 -->
      <ul class="navbar-icon">
		<c:if test="${loginUser.nickname eq '관리자'}">
	     	<li>
	     		<a href="adminPage.co">관리자페이지</a>
	    	</li>
        </c:if>
      	

        <li><a href="list.no">고객센터</a></li>
        <c:choose> 
	        <c:when test="${empty loginUser}">
		        <li>
		        	<a style="color: #fd4500; font-weight: bold;" href="loginForm.me">로그인</a>
		       	</li>
		        <div id="login-box">
		        	<li id="login">
		        		<a href="enrollForm.me">회원가입</a>
		        	</li>
		        </div>
	        </c:when>
	        <c:otherwise>
	        	 <li>
		        	<a style="color: #fd4500; font-weight: bold;" href="myPage.me">마이페이지</a>
		       	</li>
		       	 <div id="logout-box">
		        	<li id="logout">
		        		<a href="logout.me">로그아웃</a>
		        	</li>
		        </div>
	        </c:otherwise>
        </c:choose>
      </ul>
      <a class="navbar-more">
        <i class="fas fa-bars"></i>
      </a>
    </nav>
    <br><br><br>


    <div class='cursor' id="cursor"></div>
      <div class='cursor2' id="cursor2"></div>
      <div class='cursor3' id="cursor3"></div> 


	<c:choose>
        <c:when test="${loginUser.memberId ne 'admin@naver.com' && not empty loginUser}">
            <!-- 관리자에게 문의하기(회원) 아이콘-->
            <div id="chatIcon" style="z-index:20000; position: fixed; right: 10px; bottom: 10px;">
              <img id="openchat" src="https://user-images.githubusercontent.com/102042383/179803714-b16847ad-4f67-40fe-b9d5-3563837dff43.png" onclick="onChat();" style="z-index:20000; height: 70px; height: 70px; cursor: pointer;">
            </div>
            <!-- 관리자에게 문의하기(회원) 채팅창-->
            <div id="chatDiv" style="position: fixed; right: 10px; bottom: 10px; display: none; background-color: #E7F2E1; border-radius: 20px; z-index:20000;">
              <div id="chatwrap" style="border: none; width: 400px; height: 400px;" >
                <table id="chatTable" style="height: 100%; width: 100%; border: 1px solid green; border-radius: 20px;">
                  <tr align="center">
                    <td style="padding-top:10px;">
                      <b style="font-size: large; margin-bottom: 10px; color:gray;">문의하기</b>
                    </td>
                    <td style="padding-top:10px;">
                      <img src="https://user-images.githubusercontent.com/102042383/179745486-3dbd2fc1-ff47-45fe-bd5d-b639e63e1463.png" onclick="closeChat();" style="width: 20px; cursor: pointer;"  >
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      <div id="content_2" style="height: 300px; overflow: auto; margin-left: 10px;">
                      <!-- 채팅 내용 출력 영역-->
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <!-- 채팅 입력 영역 -->
                      <!--
                        <textarea id="message" style="width: 100%; height:100%; resize: none;" ></textarea>
                      -->
                      <input type="text" id="message" style="padding-left: 10px; margin-bottom: 5px; width: 100%; height:100%; border-bottom-left-radius: 20px; border-top-left-radius: 20px; border: none; box-shadow: 0 0 2px gray;">
                    </td>
                    <td>
                      <input type="button" id="sendBtn" style="margin-bottom: 5px; border-bottom-right-radius: 20px; border: none; box-shadow: 0 0 2px gray; background-color: #9BD19B; border-top-right-radius: 20px; width: 100%; height:100%;" value="전송">
                    </td>
                  </tr>
                </table>
              </div>
            </div>
        </c:when>
    </c:choose>
    
    

  <script>
	//console.log("${loginUser.memberId}");
	var memberId = "${loginUser.memberId}";
	
    const moreButton = document.querySelector(".navbar-more");
    const menu = document.querySelector(".navbar-menu");
    const icon = document.querySelector(".navbar-icon");
    moreButton.addEventListener("click", () => {
        menu.classList.toggle("active");
        icon.classList.toggle("active");
    });

 	// 아이콘 숨기기 & 채팅창 보이기
    function onChat() {
      $('#chatIcon').hide();
      $('#chatDiv').show();
    }

 	// 아이콘 보이기 & 채팅창 숨기기
    function closeChat() {
      $('#chatIcon').show();
      $('#chatDiv').hide();
    }

	var roomNo;
	
    $(document).on("click", '#openchat', function(){ // 문의하기 아이콘 클릭 시 채팅내역보여주는 함수(ajax)
    	console.log("문의하기아이콘클릭");
    	// 방번호 서치
			
    	// 없을시 방 개설
    	
    	if("${loginUser.memberId}" != 'admin@naver.com'){
	    	// 내역 조회
	    	$.ajax({
	    		url : "searchChatRoom.ch",
	    		type : "post",
	    		data : { 
	    			memberId : "${loginUser.memberId}"
	    		},
	    		// chatRoomNo에 지금 이벤트가걸린 input[type=hidden]을 찾아서 밸류값을 넣겠다.
	    		success : function(result){
	    			console.log(result);

	
	 				if(result.length != 0){
	 					// 채팅방이 개설되어 있으므로 채팅내역이 있다면 뿌려주기
	 					$("#content_2").html("");
	 					
		    			roomNo = result[0].chatRoomNo;
		    			console.log("rooooooomNo" + roomNo);
		    			sendMessage("ENTER_CHAT");
		    			
		    			sessionStorage.setItem("roomNo", roomNo); // 저장
		    			//sessionStorage.setItem("loginUser", ${loginUser.memberId}); // 저장
		    			
	 					selectChatContent(roomNo);
	 					
	 					
	 					//console.log(result[0].chatRoomNo); 
	 					//console.log("roomNo : " + roomNo); 
			
	 					
	 					
	 				} else{
	 					//console.log("${loginUser.memberId}");
	 					// 채팅방이 없으므로 채팅방을 insert하는 ajax
	 					$.ajax({
	 						url : "createChatRoom.ch",
	 						type : "post",
	 						data : {
	 							senderId : "${loginUser.memberId}"
	 						},
	 						success : function(){
	 							console.log("채팅방 생성 성공");
	 							
	 							$.ajax({
	 					    		url : "searchChatRoom.ch",
	 					    		type : "post",
	 					    		data : { 
	 					    			memberId : "${loginUser.memberId}"
	 					    		},
	 					    		// chatRoomNo에 지금 이벤트가걸린 input[type=hidden]을 찾아서 밸류값을 넣겠다.
	 					    		success : function(result){
	 					    			console.log(result);
	
	 					 				if(result.length != 0){
	 					 					$("#content_2").html("");
	 						    			roomNo = result[0].chatRoomNo;
	 						    			sendMessage("ENTER_CHAT");
	 						    			
	 						    			//console.log("roomNo : " + roomNo);
	 						    			
	 						    			
	 						    			
	 					 				}
	 					    		},
	 					    		error : function(){
	 					    			console.log("통신실패");
	 					    		}
	 					    	});
	 							
	 						},
	 						error : function(){
	 							console.log("채팅방 생성 실패");
	 						}
	 					});
	 				}
	 				
	 				
	    		},
	    		error : function(){
	    			console.log("통신실패");
	    		}
	    	});
	    } 
   	});
    
	// 채팅내역 가져오기
	function selectChatContent(roomNo) {
		
		$.ajax({
			url : "selectChatMessage.ch",
			data : {roomNo : roomNo},
			success : function(result) {
				
				var resultStr = "";
				// 비워주는역할 전에 있는 채팅내역 목록들을 지워줌
				$("#content_2").html("");
				
				for(var i in result){ // 반복문으로 result에 담긴 내용물만 i인덱스만큼 뽑기
					if(result[i].senderId == memberId){
 						
						resultStr += 
							
								  "<p class='meid' align='right'>"+ result[i].nickname + " : "+ result[i].content + "</p>" 
							
 					}else{
 						
						resultStr += 
							
							  "<p class='meid'>"+ result[i].nickname + " : " + result[i].content + "</p>" 
						
 					}
				}
				
				$("#content_2").append(resultStr);
				
			}, error : function() {
				console.log("채팅내역 불러오기 실패");
			}
		});
	}
 
    // 채팅 보내고 메시지 입력창 초기화
   	$("#sendBtn").click(function() {
   		sendMessage($("#message").val());
   		$('#message').val('')
   	});
    
    let sock = new SockJS("http://192.168.40.17:8888/tamnaji/chatting.do"); 
	//  SockJS객체를 생성하고, 그 객체가 메세지를 받고, 연결이 끊길 때 각각 어떤 함수를 호출할건지 세팅해주는 과정이다. 
	//	constructor의 매개변수에는 자신의 url(IP)과 Handler를 맵핑한 주소 적기
	//  핸들러로 보내주는 역할 
	
	$("#message").on("keyup",function(e){
		 if(e.key == "Enter"){
			sendMessage($("#message").val());
			$("#message").val("");
		  }
	});
	
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage(msg) {// 방번호, senderId, 메세지내용 JSON으로 묶어서 핸들러로보내기
		
		/* 1. jsp에서 sock.send로 json 형식 데이터 전송
		2. 핸들러 handleTextMessage메소드에서 전송된 json 데이터 chatMessage VO 클래스로 파싱
		3. 서비스단 insertChatMessage 메소드 호출해서 DB에 저장
		4. 전체 세션에게 메시지, 송신자ID 전송
		5. jsp에서 sock.onMessage로 받아서 송신/수신 구분해서 화면에 뿌려주기
		
		json으로 묶어서
		sock.send()로 보내고
		핸들러에서 chatMessage 객체로 파싱해서
		content만 뽑아내서 전체 세션한테 메시지 전송하고
		chatMessage 객체는 DB에 넣기
		*/
		//var senderId = "${loginUser.memberId}";
		
		//sock.send($("#message").val());
		//console.log("memberId : ${ loginUser.memberId }");
		//console.log("RoomNo : " + roomNo);
		const data = {
				"chatRoomNo" : roomNo,
				"content" : msg,
				"senderId" : "${ loginUser.memberId }",
				"nickname" : "${ loginUser.nickname }"
		};
		
      	console.log(data);
        let jsonData = JSON.stringify(data);
        console.log(jsonData);
        sock.send(jsonData);
	}
	var nickname = "${loginUser.nickname}";
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var dataList = data.split(":");
		
		if(dataList[0] == nickname){
			$('#content_2').append("<div align='right'>" + data + "</div>");
		}else{
			$('#content_2').append("<div>" + data + "</div>");
		}
		// 스크롤바 맨 밑으로
		$('#content_2').scrollTop($('#content_2')[0].scrollHeight);
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#content_2").append("연결 끊김");
	}
	
    </script>
    
    

<script type="text/javascript">
  // <![CDATA[
  var colour="#58D3F7"; // in addition to "random" can be set to any valid colour eg "#0040FF" or "red"
  var sparkles=50;
  
  var x=ox=400;
  var y=oy=300;
  var swide=800;
  var shigh=600;
  var sleft=sdown=0;
  var tiny=new Array();
  var star=new Array();
  var starv=new Array();
  var starx=new Array();
  var stary=new Array();
  var tinyx=new Array();
  var tinyy=new Array();
  var tinyv=new Array();
  
  window.onload=function() { if (document.getElementById) {
    var i, rats, rlef, rdow;
    for (var i=0; i<sparkles; i++) {
      var rats=createDiv(3, 3);
      rats.style.visibility="hidden";
      rats.style.zIndex="999";
      document.body.appendChild(tiny[i]=rats);
      starv[i]=0;
      tinyv[i]=0;
      var rats=createDiv(5, 5);
      rats.style.backgroundColor="transparent";
      rats.style.visibility="hidden";
      rats.style.zIndex="999";
      var rlef=createDiv(1, 5);
      var rdow=createDiv(5, 1);
      rats.appendChild(rlef);
      rats.appendChild(rdow);
      rlef.style.top="2px";
      rlef.style.left="0px";
      rdow.style.top="0px";
      rdow.style.left="2px";
      document.body.appendChild(star[i]=rats);
    }
    set_width();
    sparkle();
  }}
  
  function sparkle() {
    var c;
    if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
      ox=x;
      oy=y;
      for (c=0; c<sparkles; c++) if (!starv[c]) {
        star[c].style.left=(starx[c]=x)+"px";
        star[c].style.top=(stary[c]=y+1)+"px";
        star[c].style.clip="rect(0px, 5px, 5px, 0px)";
        star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
        star[c].style.visibility="visible";
        starv[c]=50;
        break;
      }
    }
    for (c=0; c<sparkles; c++) {
      if (starv[c]) update_star(c);
      if (tinyv[c]) update_tiny(c);
    }
    setTimeout("sparkle()", 40);
  }
  
  function update_star(i) {
    if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
    if (starv[i]) {
      stary[i]+=1+Math.random()*3;
      starx[i]+=(i%5-2)/5;
      if (stary[i]<shigh+sdown) {
        star[i].style.top=stary[i]+"px";
        star[i].style.left=starx[i]+"px";
      }
      else {
        star[i].style.visibility="hidden";
        starv[i]=0;
        return;
      }
    }
    else {
      tinyv[i]=50;
      tiny[i].style.top=(tinyy[i]=stary[i])+"px";
      tiny[i].style.left=(tinyx[i]=starx[i])+"px";
      tiny[i].style.width="2px";
      tiny[i].style.height="2px";
      tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
      star[i].style.visibility="hidden";
      tiny[i].style.visibility="visible"
    }
  }
  
  function update_tiny(i) {
    if (--tinyv[i]==25) {
      tiny[i].style.width="1px";
      tiny[i].style.height="1px";
    }
    if (tinyv[i]) {
      tinyy[i]+=1+Math.random()*3;
      tinyx[i]+=(i%5-2)/5;
      if (tinyy[i]<shigh+sdown) {
        tiny[i].style.top=tinyy[i]+"px";
        tiny[i].style.left=tinyx[i]+"px";
      }
      else {
        tiny[i].style.visibility="hidden";
        tinyv[i]=0;
        return;
      }
    }
    else tiny[i].style.visibility="hidden";
  }
  
  document.onmousemove=mouse;
  function mouse(e) {
    if (e) {
      y=e.pageY;
      x=e.pageX;
    }
    else {
      set_scroll();
      y=event.y+sdown;
      x=event.x+sleft;
    }
  }
  
  window.onscroll=set_scroll;
  function set_scroll() {
    if (typeof(self.pageYOffset)=='number') {
      sdown=self.pageYOffset;
      sleft=self.pageXOffset;
    }
    else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
      sdown=document.body.scrollTop;
      sleft=document.body.scrollLeft;
    }
    else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
      sleft=document.documentElement.scrollLeft;
      sdown=document.documentElement.scrollTop;
    }
    else {
      sdown=0;
      sleft=0;
    }
  }
  
  window.onresize=set_width;
  function set_width() {
    var sw_min=999999;
    var sh_min=999999;
    if (document.documentElement && document.documentElement.clientWidth) {
      if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
      if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
    }
    if (typeof(self.innerWidth)=='number' && self.innerWidth) {
      if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
      if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
    }
    if (document.body.clientWidth) {
      if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
      if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
    }
    if (sw_min==999999 || sh_min==999999) {
      sw_min=800;
      sh_min=600;
    }
    swide=sw_min;
    shigh=sh_min;
  }
  
  function createDiv(height, width) {
    var div=document.createElement("div");
    div.style.position="absolute";
    div.style.height=height+"px";
    div.style.width=width+"px";
    div.style.overflow="hidden";
    return (div);
  }
  
  function newColour() {
    var c=new Array();
    c[0]=255;
    c[1]=Math.floor(Math.random()*256);
    c[2]=Math.floor(Math.random()*(256-c[1]/2));
    c.sort(function(){return (0.5 - Math.random());});
    return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
  }
  // ]]>
  </script>
  
  
<script>
(function($) { "use strict";
    
    //Page cursors
  
      document.getElementsByTagName("body")[0].addEventListener("mousemove", function(n) {
          t.style.left = n.clientX + "px", 
      t.style.top = n.clientY + "px", 
      e.style.left = n.clientX + "px", 
      e.style.top = n.clientY + "px", 
      i.style.left = n.clientX + "px", 
      i.style.top = n.clientY + "px"
      });
      var t = document.getElementById("cursor"),
          e = document.getElementById("cursor2"),
          i = document.getElementById("cursor3");
      function n(t) {
          e.classList.add("hover"), i.classList.add("hover")
      }
      function s(t) {
          e.classList.remove("hover"), i.classList.remove("hover")
      }
      s();
      for (var r = document.querySelectorAll(".hover-target"), a = r.length - 1; a >= 0; a--) {
          o(r[a])
      }
      function o(t) {
          t.addEventListener("mouseover", n), t.addEventListener("mouseout", s)
      }
    
    $(document).ready(function() {
      
      /* Hero Case study images */      
      
      $('.case-study-name:nth-child(1)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(1)').addClass("show");
        $('.case-study-name:nth-child(1)').addClass('active');
      })
      $('.case-study-name:nth-child(2)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(2)').addClass("show");
        $('.case-study-name:nth-child(2)').addClass('active');
      })
      $('.case-study-name:nth-child(3)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(3)').addClass("show");
        $('.case-study-name:nth-child(3)').addClass('active');
      })
      $('.case-study-name:nth-child(4)').on('mouseenter', function() {
        $('.case-study-name.active').removeClass('active');
        $('.case-study-images li.show').removeClass("show");
        $('.case-study-images li:nth-child(4)').addClass("show");
        $('.case-study-name:nth-child(4)').addClass('active');
      })
      $('.case-study-name:nth-child(1)').trigger('mouseenter')
            
    });
  
    
    
    
    })(jQuery); 

</script>

</body>
</html>

