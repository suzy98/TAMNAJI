<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>스페이스 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<style>

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
    <jsp:include page="../common/adminMenu.jsp" />
    <h2 style="margin-top: 5%;">스페이스 관리</h2>
    <table style="margin-bottom: 20px;">
        <thead>
            <tr style=" background-color: rgb(209, 228, 212);">
                <th>공간번호</th>
                <th>유형</th>
                <th>판매자</th>
                <th>공간명</th>
                <th>주소</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="s" items="${list}">
                <tr>
                    <td>${s.spaceNo}</td>
                    <td>${s.categoryDetail}</td>
                    <td>${s.nickName}</td>
                    <td>${s.spaceTitle}</td>
                    <td>${s.address}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div id="adminSpaceSearch">
        <select name="keyword">
            <option value="유형">유형</option>
            <option value="주소">주소</option>
            <option value="공간명">공간명</option>
            <option value="판매자명">판매자명</option>
        </select>
        <input type="search" name="search" required>
        <button type="button">검색</button>
    </div>
    <!--페이징-->
    <div class="pagination">
        <div class="pagination-container">
            <div class="pagination-hover-overlay"></div>
            <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <a class="pagination-prev">
                        <span class="icon-pagination icon-pagination-prev">
                            <i class="icon material-icons">keyboard_arrow_left</i>
                        </span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a class="pagination-prev" href="adminSpaceSelect.sp?cpage=${ pi.currentPage - 1 }">
                        <span class="icon-pagination icon-pagination-prev">
                            <i class="icon material-icons">keyboard_arrow_left</i>
                        </span>
                    </a>
                </c:otherwise>
            </c:choose>
    
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:choose>
                    <c:when test="${ pi.currentPage eq p }">
                        <a class="pagination-page-number ">${ p }</a>
                    </c:when>
                    <c:otherwise>
                        <a class="pagination-page-number" href="adminSpaceSelect.sp?cpage=${ p }">${p}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
    
            <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                    <a class="pagination-next">
                        <span class="icon-pagination icon-pagination-next">
                            <i class="icon material-icons">keyboard_arrow_left</i>
                        </span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a class="pagination-next" href="adminSpaceSelect.sp?cpage=${ pi.currentPage + 1 }">
                        <span class="icon-pagination icon-pagination-next">
                            <i class="icon material-icons">keyboard_arrow_left</i>
                        </span>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <script>
        $(function(){
            $("#adminSpaceSearch>button").click(function(){
                $.ajax({
                    url: "adminSpaceSearch.sp",
                    data: {
                        keyword: $("#adminSpaceSearch>select").val(),
                        search: $("#adminSpaceSearch>input").val()
                    },
                    success: (response)=> {
                        let resultStr="";
                        for(const s of response){
                            resultStr+=
                                "<tr>"
                                    +"<td>"+ s.spaceNo+"</td>"
                                    +"<td>"+ s.categoryDetail+"</td>"
                                    +"<td>"+s.nickName+"</td>"
                                    +"<td>"+s.spaceTitle+"</td>"
                                    +"<td>"+s.address+"</td>"
                                +"</tr >";
                        }
                        $("tbody").html(resultStr);
                    },
                    error:()=>{
                        console.log("ajax통신 실패");
                    }
                });
            })
        })
    </script>
    <!--페이징-->
    <script src="resources/js/space/paging.js"></script>
</body>
</html>