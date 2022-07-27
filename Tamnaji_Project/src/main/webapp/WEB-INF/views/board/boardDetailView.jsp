<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
/*----------------------------------------------------------------------*/
/*디테일뷰 관련*/
#aside {
	width: 200px;
	height: 100%;
	float: left;
}

#content {
	margin-left: 35%;
	width: 900px;
	height: 100%;
	margin-bottom: 50px;
}

.side-menubar {
	width: 220px;
	margin-left: 40%;
	border-radius: 50px;
}

select:focus {
	outline: 1px solid #39A652;
	box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);
}

input:focus {
	outline: 1px solid #39A652;
	box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);
}

textarea:focus {
	outline: 1px solid #39A652;
	box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);
}

/*------  -------*/
.air {
	z-index: 100;
	animation: a 10s linear infinite alternate;
	position: absolute;
	pointer-events: none;
}

@
keyframes a { 0%{
	transform: translate(80px, 70px);
}

20
%
{
transform
:
translate(
90px
,
150px
);
}
40
%
{
transform
:
translate(
100px
,
350px
);
}
60
%
{
transform
:
translate(
200px
,
350px
);
}
80
%
{
transform
:
translate(
230px
,
150px
);
}
100
%
{
transform
:
translate(
230px
,
100px
);
}
}
/*커뮤니티 상세 보기 관련 --------------------------------*/
#table-1 {
	width: 880px;
	background-color: rgb(239, 251, 232);
	padding: 20px;
	padding-top: 30px;
	padding-left: 30px;
	border-top-left-radius: 50px;
	border-top-right-radius: 50px;
	margin: 0 auto;
}

#table-2 {
	width: 880px;
	background-color: rgb(217, 242, 205);
	padding: 20px;
	padding-left: 85px;
	padding-right: 100px;
	border-spacing: 0 10px;
	margin: 0 auto;
}

#table-3 {
	width: 880px;
	background-color: rgb(217, 242, 205);
	padding: 20px;
	padding-left: 50px;
	padding-right: 60px;
	padding-bottom: 50px;
	border-bottom-left-radius: 50px;
	border-bottom-right-radius: 50px;
	margin: 0 auto;
	text-align: center;
}

#header {
	width: 300px;
	height: 40px;
	font-size: 24px;
	font-weight: bold;
	padding-bottom: 20px;
}

#profile-pic {
	width: 40px;
	height: 40px;
	border-radius: 50px;
}

#profile-pic2 {
	width: 40px;
	height: 40px;
	border-radius: 50px;
}

#nickname {
	height: 2px;
	font-size: 15px;
	padding-left: 5px;
}

#date {
	font-size: 11px;
	color: gray;
	padding-left: 7px;
}

#detail {
	padding-top: 50px;
	padding-bottom: 50px;
	height: 100%;
	border-top: 1px solid green;
}

#button-2 {
	margin: 0 auto;
	text-align: center;
	padding-bottom: 50px;
}

#c-write-button {
	margin-top: 30px;
	margin-right: 10px;
	width: 100px;
	height: 50px;
	font-size: 15px;
	background-color: rgb(197, 231, 197);
	box-shadow: #ABD094 0px 1px 6px;
	border: none;
	border-radius: 50px;
}

#c-write-button-2 {
	margin-top: 30px;
	margin-right: 10px;
	width: 100px;
	height: 50px;
	font-size: 15px;
	background-color: rgb(220, 220, 220);
	border: none;
	box-shadow: #BFC0BF 0px 1px 6px;
	border-radius: 50px;
}

#c-write-button-3 {
	margin-top: 30px;
	width: 100px;
	height: 50px;
	font-size: 15px;
	background-color: rgb(137, 207, 146);
	border: none;
	box-shadow: #BFC0BF 0px 1px 6px;
	border-radius: 50px;
}

#c-write-button:hover {
	cursor: pointer;
	background-color: #80ca6a;
	color: white;
}

#c-write-button-2:hover {
	cursor: pointer;
	background-color: rgb(163, 162, 162);
}

#c-write-button-3:hover {
	cursor: pointer;
	background-color: #80ca6a;
	color: white;
}

#c-pic {
	width: 40px;
	height: 40px;
	border-radius: 50px;
	box-shadow: #ABD094 0px 1px 10px;
}

#c-detail {
	box-shadow: #ABD094 0px 1px 10px;
}

#c-nickname {
	width: 200px;
	font-size: 15px;
	font-weight: 600;
	display: block;
	margin-top: 2px;
	margin-bottom: 5px;
}

#c-nickname>span {
	font-size: 12px;
	font-weight: 400;
	color: gray;
}

#c-detail {
	background-color: white;
	border-radius: 20px;
	padding: 5px;
	padding-bottom: 10px;
	padding-left: 15px;
}

#comment-text {
	padding: 15px;
	width: 605px;
	vertical-align: middle;
	border: none;
	background-color: rgb(255, 255, 255);
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
	box-shadow: #ABD094 0px 1px 10px;
}

#comment-text:hover {
	outline: 1px solid #65B134;
	box-shadow: #65B135 0px 1px 18px;
}

#comment-text:focus {
	outline: 1px solid #65B134;
	box-shadow: #65B135 0px 1px 18px;
}

#comment-button {
	width: 95px;
	height: 60px;
	font-size: 15px;
	font-weight: 500;
	color: white;
	vertical-align: middle;
	border: none;
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: rgb(53, 194, 53);
	box-shadow: #ABD094 0px 1px 10px;
}

#comment-button:hover {
	cursor: pointer;
	background-color: #047E2B;
}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<!-- 여기부터 컨텐츠 영역 ---------------------------->

	<div class="container" style="padding-top: 170px; margin: 0 auto;">
		<div class="content" id="aside" style="background: white">
			<div class="side-menu" style="margin-left: 10px;">
				<div class="side-menubar">
					<img src="resources/images/jeju-sea.gif"
						style="width: 350px; border-radius: 270px; border: 15px solid rgb(235, 235, 235);">
				</div>
			</div>
		</div>

		<div class="content-2" id="content" style="height: auto;">
			<table id="table-1">
				<tr>
					<td colspan="2" id="header">${ b.boardTitle }</td>
				</tr>
				<tr>
					<td id="profile-pic" rowspan="2"><img id="profile-pic2"
						src="resources/images/orange.PNG"></td>
					<td id="nickname">${ b.nickname }</td>
				</tr>
				<tr>
					<td id="date">${ b.createDate }</td>
				</tr>
				<tr>
					<th>파일</th>
					<td>
						<c:choose>
							<c:when test="${ empty ba.originName }">
								첨부파일이 없습니다.
							</c:when>
							<c:otherwise>
								<a href="${ ba.changeName }" download="${ ba.originName }">${ ba.originName }</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td style="height: 10px;"></td>
				</tr>
				
				<tr style="z-index: 1000;">
					<td colspan="2" id="detail">
						<div align="center">
							<img style="width:500px; height: 500px;" src="${ba.changeName}">
						</div>
						<br>
						${ b.boardContent }
					</td>
				</tr>

			</table>
			
			<div>
				

				<table id="table-2">
					<tbody>
						
					</tbody>
				</table>
				<table id="table-3">
					<tr>
						<c:choose>
							<c:when test="${ empty loginUser }">

								<td style="width: 50px; height: 40px;">
									<img id="c-pic" src="resources/images/jeju-sea.gif">
								</td>
								<td>
									<textarea id="comment-text" style="resize:none;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.</textarea>
									<button id="comment-button" disabled>등록하기</button>
								</td>

							</c:when>

							<c:otherwise>

								<td style="width: 50px; height: 40px;">
									<img id="c-pic" src="resources/images/orange.PNG">
								</td>

								<td>
									<textarea id="comment-text" style="resize:none;" placeholder="비방성 댓글은 무통보 삭제됩니다. 서로를 존중하는 탐나지 커뮤니티를 만들어요! 😊 "></textarea>
									<button id="comment-button" onclick="addReply();">등록하기</button>
								</td>
								
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</div>
			
			

			<!-- 글 수정, 삭제하기-->
			<div id="button-2">
			<c:if test="${ (not empty loginUser) and (b.boardWriter eq loginUser.memberNo) }">

					
					<button id="c-write-button-2" onclick="postFormSubmit(2);">삭제하기</button>
					<button id="c-write-button-3" onclick="location.href='list.bo'">목록보기</button>
					
					<form id="postForm" action="" method="post">
						<input type="hidden" name="bno" value="${ b.boardNo }">
					</form>
					<script>
						function postFormSubmit(num) {
							
							if(num == 1) { // 수정 요청으로 action 속성값 바꾸기
								
								$("#postForm").attr("action", "updateForm.bo").submit();
							}
							else { // 삭제 요청으로 action 속성값 바꾸기
								$("#postForm").attr("action", "delete.bo").submit();
							}
						};
					</script>
				</c:if>

			</div>
		</div>

	</div>

	<script>
    	$(function() {
    		
    		selectReplyList();
    	});
    	
    	function addReply() {
    		
    		// 댓글 작성
			
    		// 댓글 내용이 있는지 먼저 조건검사 후에 요청
    		// => required 속성은 form 태그 내부에서만 유효하기 때문
    		if($("#comment-text").val().trim().length != 0) {
    			// 입력한 내용물 기준으로 공백 제거 후에도 문자열의 길이가 0이 아니라면 => 유효한 내용물이 있다고 간주
    			
        		$.ajax({
        			url : "rinsert.bo",
        			data : {
        				
        				boardNo : ${ b.boardNo },
        				memberNo : "${ loginUser.memberNo }",
        				replyContent : $("#comment-text").val()
        			},
        			success : function(result) {
        				
        				if(result == "success") {
        					selectReplyList();
        					$("#comment-text").val("");
        				}
        				else {
        					
        					// alertify.alert("댓글 작성 실패", "댓글 등록에 실패했습니다.");
							swal('', '댓글 등록에 실패했습니다.', "failed");
        				}
        			},
        			error : function() {
        				console.log("댓글 작성용 ajax 통신 실패!");
        			}
        		});
    		}
    		else {
    			// alertify.alert("댓글 작성 실패", "댓글 작성 후 등록 요청해주세요.");
    			swal('', '댓글 등록에 실패했습니다.', "failed");
    		}
    		
    	}
    	
    	function selectReplyList() {
    		
    		// 해당 게시글에 딸린 댓글리스트 조회
    		$.ajax({
    			url : "rlist.bo",
    			data : {bno : ${ b.boardNo }},
    			success : function(result) {
    				
    				
    				// 반복문
    				var resultStr = "";
    				
    				for(var i = 0; i < result.length; i++) {
    					
    				//console.log(result[i].memberNo);
    				//console.log("replyNo : " + result[i].replyNo);
    				
    					resultStr += "<tr>"
    							   + "<th name='replyNo' style='display:none'>" + result[i].replyNo + "</th>"
    							   + "</tr>"
    							   + 		"<tr> <td style=' background-color: white;  border-bottom-left-radius: 50px; border-top-left-radius: 50px; width: 450px; height: 50px; padding-left: 30px; ' >" + result[i].replyContent + "</td>"
    							   + 		"<td style='background-color: white; width: 110px; font-size: 14px;'>" + result[i].nickname + "</td>"
    							   +		"<td style='background-color: white;  border-bottom-right-radius: 50px; border-top-right-radius: 50px; font-size: 11px; color: gray;'>" + result[i].createDate + "</td>";

    		   						resultStr += "<td style='margin-left: 5px; padding-left: 5px;'>";
    		   			
    		   			var memNo = "${loginUser.memberNo}";
    		   			
		   				if(memNo == result[i].memberNo){
		   					resultStr += "<img onclick='deleteReply("+result[i].replyNo+")' src='https://user-images.githubusercontent.com/102042383/179745486-3dbd2fc1-ff47-45fe-bd5d-b639e63e1463.png' style='cursor: pointer; width: 15px; height: 15px;'>";
								//"<button onclick='rdelete.bo'  style='cursor: pointer; width: 20px; height: 20px;'>X</button>"
		   				}
		   				resultStr += "</td></tr>";
    				} 
    				
    				$("#table-2>tbody").html(resultStr);
    				$("#rcount").text(result.length);
    			},
    			error : function() {
    				console.log("댓글리스트 조회용 ajax 통신 실패!");
    			}
    		});
    	}
    	
		function deleteReply(replyNo) {
    		
			//console.log(replyNo);
			
    		// 해당 게시글에 딸린 댓글리스트 조회
    		$.ajax({
    			url : "rdelete.bo",
    			data : {replyNo:replyNo},
    			success : function(result) {
    				if(result == "success") {
    					selectReplyList();
    				}
    				else {
    					
    					alertify.alert("댓글 삭제 실패", "댓글 삭제를 실패하였습니다.");
    				}
    			},
    			error : function() {
    				console.log("댓글삭제 ajax 통신 실패!");
    			}
    		});
    	}
          
    </script>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>