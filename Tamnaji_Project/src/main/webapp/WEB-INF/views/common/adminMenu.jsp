<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- 페이징바 디자인 소스 -->
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


/* 폰트는 최상위 컴포넌트에 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'NanumSquareRound';
}


  body{
    position: relative;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.admin {
	background-color: rgb(229, 240, 224);
	padding: 30px;
	width: auto;
	height: auto;
	float: left;
	border-radius: 50px;
	text-align: center;
	margin-top: 5%;
	margin-left: 10%;
	margin-right: 10%;
	
}

.admin li {
	width: 220px;
	list-style: none;
	text-align: center;
	margin-left: 10px;
	margin-bottom: 10px;
	padding-bottom: 15px;
	font-size: 18px;


}

a {
	text-decoration: none;
}

#back {
	margin: 0 auto;
	text-align: center;
	background-color: rgb(201, 233, 198);
	border: none;
	border-radius: 50px;
	padding: 10px;
	margin-bottom: 40px;
	font-size: 20px;
}

#back:hover {
	cursor: pointer;
}
</style>

</head>
<body>
	<div class="admin">
	
	<!-- 1회성 알람문구 기능 -->
	<c:if test="${ not empty alertMsg }"> <!-- 알람메세지 내용이 있다면 -->
		<script>
			// script 태그 안에서는 스크립틀릿이 인식되었음
			// script 태그 안에서는 core 라이브러리 태그가 인식되지 않음 => 사용 불가
			alert("${ alertMsg }");
			// alertify.alert("알람", "${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<input id="back" value="이전으로 돌아가기" onclick="javascript:history.go(-1);">
		<ul>
			<li>
				<a href="adminSpaceSelect.sp">스페이스 조회</a>
			</li>
			<li>
				<a href="adminMemberManage.ad">회원 관리</a>
			</li>
			<li>
				<a href="adminReservationForm">예약 내역 관리</a>
			</li>
			<li>
				<a href="openChat.co">관리자 채팅</a>
			</li>
		</ul>
	</div>
</body>
</html>