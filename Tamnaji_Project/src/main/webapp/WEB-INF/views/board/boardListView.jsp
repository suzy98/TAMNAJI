<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<style>
	#pagingArea {width:fit-content; margin:auto;}
</style>
</head>
<style>
/*----------------------------------------------------------------------*/
		/*리스트뷰 관련*/
		.container {
		  margin-left: 100px;
		}
		#aside {
		  width: 200px;
		  height: 800px;
		  float: left;
		}
		#content {
		  margin-left: 35%;
		  width: 900px;
		  height: 800px;
		}
		.side-menubar {
		  width: 220px;
		  margin-left: 40%;
		  border-radius: 50px;
		}
		        
		select:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        input:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        textarea:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
        
/*------ 자유게시판 관련 --------*/
table {
  width: 880px;
  border-collapse: collapse;
  line-height: 15px;
}
table td,th {
    border-top:1px solid rgb(217, 233, 207);
    border-bottom:1px solid rgb(217, 233, 207);
    border-collapse: collapse;
    text-align: center;
    padding: 10px;
}
th {
  background: rgb(217, 233, 207);
}
a{
    text-decoration: none;
    color: black;
}
a:hover {
  font-weight: bold;
}
#write-button {
  margin-bottom: 20px;
  margin-left: 812px;
  padding: 10px;
  font-size: 13px;
  background-color: #FAAA74;
  border: 1px solid rgb(245, 228, 224);
  border-radius: 5px;
}
#write-button:hover {
  background-color: #FD6500;
  color: white;
  cursor: pointer;
}
#table-hover:hover {
  background-color: #FFFAF6;
  cursor: pointer;
}
/*------ 날아보자 슝슝 막아놓은거 여기랑 밑에꺼 두개 막아놓음-------*/
    .air {
    z-index:100;
    animation:a 10s linear infinite alternate;
    position:absolute;
    pointer-events: none;}
    @keyframes a {
    0%{transform: translate(80px,70px);}
    20%{transform: translate(90px,150px);}
    40%{transform: translate(100px,350px);}
    60%{transform: translate(200px,350px);}
    80%{transform: translate(230px,150px);}
    100%{transform: translate(230px,100px);}
    }
</style>
<body>
	<jsp:include page="../common/header.jsp" />

<!-- 여기부터 컨텐츠 영역 ---------------------------->
<p class="air"><img src="https://images.vexels.com/media/users/3/145795/isolated/preview/05cd33059a006bf49006097af4ccba98-plane-in-flight-by-vexels.png" width="150"></p>

<div class="container" style=" padding-top: 170px;margin: 0 auto;">

  <div class="content" id="aside" style=" background: white">
    
    <div class="side-menu"style="margin-left: 10px;">
      <div class="side-menubar">
        <img src="resources/images/jeju-sea.gif" style="width: 350px; border-radius: 270px; border: 15px solid rgb(235, 235, 235);">
      </div>
    </div>
    
  </div>

  <div class="content-2" id="content" style=" height:650px;">
    <p style="margin-top: 10px; margin-bottom: 20px; font-size: 25px; display:block;">커뮤니티</p>
    <c:if test="${not empty loginUser }">
	    <div>
	      <button id="write-button" onclick="location.href='enrollForm.bo'" >작성하기</button>
	    </div>
    </c:if>
    <table id="boardList">
      <thead>
        <tr>
          <th>No</th>
          <th style="width: 380px;">제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
        
        <c:forEach var="b" items="${ list }">
          <tr id="table-hover">
                <td class="bno">${ b.boardNo }</td>
                <td>${ b.boardTitle }</td>
                <td>${ b.nickname }</td>
                <td>${ b.createDate }</td>
                <td>${ b.viewCount }</td>
          </tr>
        </c:forEach>
      
      </tbody>
    </table>

    <br><br>

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
                        <a  class="pagination-prev" 
                        href="list.bo?cpage=${ pi.currentPage - 1 }">
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
                            <a class="pagination-page-number" 
                            href="list.bo?cpage=${ p }"">${ p }</a>
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
                        <a class="pagination-next" 
                        href="list.bo?cpage=${ pi.currentPage + 1 }" >
                            <span class="icon-pagination icon-pagination-next">
                                <i class="icon material-icons">keyboard_arrow_left</i>
                            </span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    

		

  </div>

  <script>
    $(function() {
      
      $("#boardList>tbody>tr").click(function(){
        
        location.href = "detail.bo?bno=" + $(this).children(".bno").text();
      });
    });
  </script>
  
  <script src="resources/js/space/paging.js"></script>
  
            
            
</div>

	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>