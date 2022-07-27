<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	table {
		margin-left: 5%;
		text-align: center;
		margin-top: 50px;
		border-collapse: collapse;
	}
	th, td {
		border-bottom: 1px solid #444444;
		border-left: 1px solid #444444;
   	 	padding: 10px; 
	}
	
	th:first-child, td:first-child {
    	border-left: none;
  	}
  	
	#select {
		height: 28px;
		position: relative;
		margin-left: 280px;
	}
	
	table>tbody>tr:hover {
		 color: #fd6500;
		 background-color: black;
	}
  	
  	/* 페이징바 관련 */
	#w3-center {
		margin-left: 400px;
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
  
</style>
</head>
<body>
	<jsp:include page="../common/adminheader.jsp" />
	<jsp:include page="../common/adminMenu.jsp" />

	<div class="" id="" style="height:1300px; margin-top: 5%;">
		<div id="wrap">
			<form id="searchForm" action="selectMember.ad">
				
				<select id="select" name="condition">
					<option value="A">전체회원</option>
					<option value="S">판매자신청회원</option>
					<option value="B">블랙리스트 회원</option>
					<option value="X">탈퇴회원</option>
				</select>
				<button>조회</button>
			</form>
			
				<table id="memberList">
					
					<thead>
						<tr style="background-color: rgb(209, 228, 212);">
							<th>No</th>
							<th>닉네임</th>
							<th>회원아이디</th>
							<th>판매자신청여부</th>
							<th>은행명</th>
							<th>계좌번호</th>
							<th>블랙리스트여부</th>
							<th>탈퇴여부</th>
						</tr>
					</thead>
					<c:forEach var="m" items="${ list }">
					<tbody>
						<tr>
						
							<td id="mno">${ m.memberNo }</td>
							<td>${ m.nickname }</td>
							<td>${ m.memberId }</td>
							<td>${ m.sellerRequestYN }</td>
							<td>${ m.bankName }</td>
							<td>${ m.accountNumber }</td>
							<td>${ m.blacklistYN }</td>
							<td>${ m.status }</td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
			
				<br><br>
			
				<div class="w3-center" id="w3-center">
					<div class="w3-bar w3-border">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
							  <a class="w3-bar-item w3-button" href="">Previous</a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${ not empty condition }"> <!-- 검색조회용조건 -->
										<a class="w3-bar-item w3-button" href="selectMember.ad?cpage=${ pi.currentPage - 1 }&condition=${ condition }">Previous</a>
									</c:when>
									<c:otherwise>
										<a class="w3-bar-item w3-button" href="selectMember.ad?cpage=${ pi.currentPage - 1 }&condition=${ condition }">Previous</a>
									</c:otherwise>
								</c:choose>
								
								
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${ not empty condition }">
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">				  
								  <a class="w3-bar-item w3-button" href="selectMember.ad?cpage=${ p }&condition=${ condition }">${ p }</a>
								</c:forEach>
							</c:when>
						</c:choose>
						
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
							  <a class="w3-bar-item w3-button" href="">Next</a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${ not empty condition }">
										<a class="w3-bar-item w3-button" href="selectMember.ad?cpage=${ pi.currentPage + 1 }&condition=${ condition }">Next</a>
									</c:when>
									<c:otherwise>
										<a class="w3-bar-item w3-button" href="selectMember.ad?cpage=${ pi.currentPage + 1 }&condition=${ condition }">Next</a>
									</c:otherwise>
								</c:choose>
							  	
							</c:otherwise>
						</c:choose>
					</div>
			  </div>
		  	
		  	<script>
		  
		  	$(function() {
		        
		        $("#memberList>tbody>tr").click(function(){
		        	// console.log( $(this).children("#mno").text());
		        	location.href = "adminDetailView.ad?mno=" + $(this).children("#mno").text();
		        });
		      });
		  	</script>
		
		</div>
    </div>
</body>
</html>