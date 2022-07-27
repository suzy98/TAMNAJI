<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 웹소켓 -->
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>


	
	#chatTable{
		height: 200px;
		width: 800px;

	}

	button {
        background-color: rgb(129, 192, 129);
        color: white;
        border: none;
        padding: 5px;
        
    }

    button:hover {
        background-color: rgb(82, 160, 82);
    }


    th, td {
		border: 1px solid #99c2a3;
   	 	padding: 10px; 
	}
	
</style>
</head>
<body>
<jsp:include page="../common/adminheader.jsp" />
	<div id="forAdminMenu" style="margin-top: 5%;">
		<jsp:include page="../common/adminMenu.jsp" />
	</div>
	
	<div id="forAdminFunction">
	<!-- 관리자에게 문의하기(회원) 채팅창-->
		<table id="chatTable">
			<thead>
					<th style="width: 200px;">
						문의회원리스트
					</th>
					<th colspan="2">
						문의 응답창
					</th>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2">
						<ul id="chview">
							<!-- 채팅방 리스트가 보여질 공간 -->
						</ul>
					</td>
					<td colspan="2">
						<div id="content_2" style="height: 400px; overflow: auto;">
							<!-- 채팅내역이 보여질 공간 -->
							채팅내역
						</div>
					</td>
				</tr>
				<tr>
					<td height="50px">
						<textarea id="message" id="" cols="30" rows="10" style="resize: none; height:50px; width:100%"></textarea>
					</td>
					<td>
						<button id="sendBtn" style="height:100%; width:100%">전송</button>
					</td>
				</tr>	
			</tbody>
		</table>
	</div>
	
	<script>
		//console.log("로그인아이디 : " + "${loginUser.memberId}");
		var adminId = "${loginUser.memberId}";
		var roomNo;
		
		$(function(){
			setInterval(test1(),1000);
		});
		
		function test1(){
			
			$.ajax({ // 채팅방보여주는 ajax
				url : "listview.ch",
				data : {memberId : adminId}, // userId키값에 로그인한 userId담기
				type : "post",
				success : function(result){
					console.log(result);
					var resultStr = "";
					
					//console.log(result);
		
					for(var i in result){ // result가 순차적으로 i만큼 반복
						//console.log(result[i].chatRoomNo);
								resultStr += "<li>" 
										  + "<input type='hidden' value='" + result[i].chatRoomNo + "'>"
										  + "<input type='text' value='" + result[i].senderId + "'>";
										  // input hidden 으로 result에 담긴값 i만큼반복하면서 result에 담겨져있는 chatRoomNo정보 뽑아오기
										  // 이유는 이따가 chatRoomNo 기준으로 안에있는 채팅내역등 여러가지 정보를 뽑기위해 히든으로 미리 작성
								resultStr += "</li>";
								//console.log(result[i]);
					}
					$("#chview").append(resultStr);
					// #chview에 결과값 작성
				},
				error : function(){
					console.log("통신실패");
				}
			});
		};
		
		$(document).on("click", '#chview li', function(){ // 채팅방목록들중 클릭 시 채팅내역보여주는 함수(ajax)
			// 첫번쨰에 이벤트선언을 했기때문에 첫번쨰대상으로 다시 이벤트를 걸수없다 
			// 동적으로 생성된 대상으로 다시 이벤트를 걸려면 document 자체에 적용
				roomNo = $(this).find("input[type=hidden]").val();
		
				sendMessage("ENTER_CHAT");		
		
				//console.log("채팅방 목록 클릭 : " + $(this).find("input[type=hidden]").val());
				
				$.ajax({
				url : "listdetail.ch",
				type : "post",
				data : { chatRoomNo : $(this).find("input[type=hidden]").val() },
				// chatRoomNo에 지금 이벤트가걸린 input[type=hidden]을 찾아서 밸류값을 넣겠다.
				success : function(result){
					
					//console.log(result[0].content);
					
					$("#content_2").html("");
					// 비워주는역할 전에 있는 채팅내역 목록들을 지워줌
					var resultStr = "";
					
					for(var i in result){ // 반복문으로 result에 담긴 내용물만 i인덱스만큼 뽑기
						if(result[i].senderId == adminId){
	 						
							resultStr += 
								
									  "<p class='meid' align='right'>"+ result[i].nickname + " : " + result[i].content + "</p>" 
								
	 					}else{
	 						
							resultStr += 
								
								  "<p class='meid'>"+ result[i].nickname + " : " + result[i].content + "</p>" 
							
	 					} 
					}
					$("#content_2").append(resultStr);
					
					
					//console.log($(".meid").text());
					//console.log(me);
					// $("#content_2").append(JSON.stringify(result));
					// JSON.stringify() JSON을 객체화시켜서 출력해주는 메소드
					// JSON.stringify() 없이 그냥 쓰면 object ojbect 발생
				},
				error : function(){
					console.log("통신실패");
				}
			});
		});
		
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
				$("#message").val('');
			  }
		});
		
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		console.log(sock);
		
		var nickname = "${loginUser.nickname}";
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = msg.data;
			var dataList = data.split(":");
			
			if(dataList[0] == nickname){
				$('#content_2').append("<div style='line-height:30px; align='right'>" + data + "</div>");
			}else{
				$('#content_2').append("<div>" + data + "</div>");
			}
			// 스크롤바 맨 밑으로
			$('#content_2').scrollTop($('#content_2')[0].scrollHeight);
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#content_2").append("onClose 연결 끊김");
		}
		
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
			
			//sock.send($("#message").val());
			//console.log("RoomNo : " + roomNo);
			const data = {
					"chatRoomNo" : roomNo,
					"content" : msg,
					"senderId" : adminId,
					"nickname" : "${ loginUser.nickname }"
			};
			
	      	console.log(data);
	        let ajsonData = JSON.stringify(data);
	        console.log("ajsonData" + ajsonData);
	        sock.send(ajsonData);
	        
		}
		
	</script>
</body>
</html>