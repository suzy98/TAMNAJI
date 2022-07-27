<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>이벤트 관리자</title>
<style>


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
<jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/adminMenu.jsp" />
    <table style="margin-top: 5%;">
        <thead style=" background-color: rgb(209, 228, 212);">
            <th>번호</th>
            <th>이벤트명</th>
            <th>이벤트 시작일</th>
            <th>이벤트 종료일</th>
            <th>첨부파일명</th>
            <th>상태</th>
            <th>수정</th>
            <th>삭제</th>
        </thead>
        <tbody>
            <c:forEach var="e" items="${list}">
                <tr class="eventList">
                    <td class="eno">${e.eventNo}</td>
                    <td>${e.eventTitle}</td>
                    <td>${e.startDate}</td>
                    <td>${e.endDate}</td>
                    <td>${e.originName}</td>
                    <td>${e.post}</td>
                    <td><button onclick="updateEvent(this);">수정</button></td>
                    <td>
                        <button class="deleteEvent">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button style="margin-top: 10px; margin-left: 545px;" onclick="insertEvent();">추가</button>
    <script>
        //이벤트 추가 폼 화면으로 이동
        function insertEvent(){
            location.href="eventEnrollForm.ev";
        }
        //이벤트 수정 폼 화면으로 이동
        function updateEvent(element){
            location.href = "eventUpdateForm.ev?eventNo="+element.parentNode.parentNode.querySelector('.eno').innerText;
            //제이쿼리로 해도되는데 자바스크립트로만 해 보 고 싶 었 음
        }
        $(function(){
            //이벤트 삭제
            $('.deleteEvent').click(function(){
                if (!confirm("이벤트를 삭제하시겠습니까?")) {
                    alert("취소(아니오)를 누르셨습니다.");
                } else {
                    $.ajax({
                        url: "deleteEvent.ev",
                        data: {
                            eventNo: $(this).parent().parent().children().eq(0).text()
                        },
                        success: function (response) {
                            if (response > 0) {
                                alert('이벤트 삭제 성공');
                                location.href="eventList.ev";
                            } else {
                                alert('이벤트 삭제 실패');
                            }
                        },
                        error: function () {
                            console.log("ajax 통신 실패");
                        }
                    });
                }
            })
        })
            
    </script>
</body>
</html>