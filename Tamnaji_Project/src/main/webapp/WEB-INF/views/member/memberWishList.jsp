<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!--페이징-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
  <link rel="stylesheet" href="resources/css/space/paging.css">
<style>
/*----------------------------------------------------------------------*/
/*마이페이지 관련*/
.container {
  margin-left: 100px;
}
#aside {
  width: 300px;
  height: 800px;
  float: left;
}
#content {
  margin-left: 35%;
  width: 800px;
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
  border-top: 1px solid rgb(232, 232, 232);
  border-left: 1px solid rgb(232, 232, 232);
  border-right: 1px solid rgb(232, 232, 232);
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
  border-left: 1px solid rgb(232, 232, 232);
  border-right: 1px solid rgb(232, 232, 232);
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
  border-left: 1px solid rgb(232, 232, 232);
  border-right: 1px solid rgb(232, 232, 232);
  border-bottom:  1px solid rgb(232, 232, 232);
}
li a:hover {
  color: green;
  font-weight: bold;
}
a{
 text-decoration: none;
 color: #3B3B3B;
}
 select:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
 input:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
 textarea:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
/*----찜한공간 -------------------------------------------*/
.wish-list {
  width: 100%;
  max-width: 830px;
  display: flex;
  /* justify-content: space-between; */
  margin: auto;
  margin-top: 35px;
  flex-wrap: wrap;
  column-gap: 20px;
}
.wish-list li.card {
  cursor: pointer;
  width: calc(50% - 13px);
  border: 1px solid #EBEFF6;
  border-radius: 7px;
  overflow: hidden;
  transition: all 0.3s;
  margin-bottom: 47px;
}
.wish-list li.card:hover {
  box-shadow: 0 8px 8px #E9EBEC;
  transform: translateY(-8px);
}
.wish .room-img-wrap {
  display: flex;
  width: 100%;
  height: 239px;
}
.wish .room-img-wrap img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}
.wish .room-info-wrap {
  padding: 13px 22px;
  padding-bottom: 0;
  position: relative;
  box-sizing: border-box;
}
.wish .room-info-wrap .heart {
  position: absolute;
  right: 22px;
  top: 30px;
  cursor: pointer;
}
.wish .room-info-wrap .heart img {
  width: 15px;
  float: right;
}
.wish .room-info{
  color: #000000;
  font-size: 13px;
}
.wish .room-info .room-tit {
  font-size: 15px;
  margin-top: 13px;
  margin-bottom: 8px;
  font-weight: 500;
  overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  text-overflow: ellipsis;
}
.room-tit:hover {
  color: #000000;
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

.pagination-page-number:hover {
    color: green;
}

.pagination-page-number.active {
    color: green;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- 여기부터 컨텐츠 영역 ---------------------------->
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
  <div class="content-2" id="content" style="height:850px;">
    <p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">내가 찜한 공간🌴</p>
    <ul class="wish-list" id="wish-list"></ul>
    <div class="pagination" id="w3-center" ></div>
  </div>
</div>
<script>
    $(function(){
      wishList(1);
      wishListDelete();
    })

     /////////// 찜하기 목록 조회
    function wishList(cPage){
      var url = "wishList?mNo=${loginUser.memberNo}&cPage="+String(cPage);
      fetch(url
      , {
        method:'get'
      })
      .then(res => res.json())
      .then(res => {
          var wList = document.getElementById('wish-list');
          var addHtml = "";
          console.log(res.sList.length);
          if(res.sList.length == 0){
            addHtml = '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">찜한공간이 없습니다.</p>'
          } else {
                for(var i = 0; i < res.sList.length; i++){
                  addHtml +=   '<li class="card wish-card wish-15177" style=" width: 250px; height: 300px;">'
                          +       '<a href="space?sno='+ res.sList[i].spaceNo +'">'
                        +          '<div class="room-img-wrap">'
                          +             ' <img src="'+ res.sList[i].changeName +'" style="width: 100%; height:200px;">'
                          +        '<div class="room-info-wrap" style="margin-top:20px;" >'
                          +           '<div class="room-info" style="text-align: center;">'
                          +              '<a class="room-tit">'+ res.sList[i].spaceTitle +'</a>'
                          +            '</div>'
                          +       '</a>'
                          +             '<div class="heart-touch heart wish-delete" style="margin-top: 20px;">'
                          +               '<img class="heart-touch-img" id="heart-touch-img-'+res.sList[i].spaceNo+'" src="https://d4x5yybe1iyrp.cloudfront.net/public/assets/images/icons/heart-icon.svg" style="float: right; margin-right: 10px;">'
                          +             '</div>'
                          +         '</div>'
                          +   '</li>';
            }
          }
          wList.innerHTML = addHtml;
          var page_ = document.getElementById('w3-center');
          console.log(res.pi);
          if(res.pi.listCount != 0){
              page_.innerHTML = pagination(res.pi);
        }
      })
    .catch(() => {
      })
    }
    ///////////////// 하트 이미지 클릭 여부
    function hasClass(elem, className) {
      return elem.classList.contains(className); }
    function wishListDelete(){
      document.addEventListener('click',
          function(e) {
            if (hasClass(e.target, 'heart-touch-img')) {
                delete_(e.target.id.substr(16));
                console.log("찜하기 목록 삭제에 성공했습니다.");
            }
          },
          false);
    }
    ///////////////// 찜하기 삭제 -> 모듈용 함수까지 적용
    function delete_(spaceNo){
      var memberNo = "${loginUser.memberNo}";
      var body = {
        'spaceNo' : parseInt(spaceNo)
        , 'memberNo' : parseInt(memberNo)
      }
      var host = "wishList";
      var method = 'delete';
      wishModule(host, method, body);
    }
///////////////////// 찜하기 추가 -> 모듈용 함수까지 적용
    function create_(spaceNo){
      var memberNo = "${loginUser.memberNo}";
      var body = {
        'spaceNo' : parseInt(spaceNo)
        , 'memberNo' : parseInt(memberNo)
      }
      var host = "wishList";
      var method = 'post';
      wishModule(host, method, body);
    }
  /////////////////// 찜하기 공통 모듈 함수
    function wishModule(host_, method_, body_){
      console.log(method_);
      fetch(
        host_
        , {
          method : method_
          , body : JSON.stringify(body_)
          , headers : {'Content-Type' : "application/json" }
        }
      )
      .then(res => res.json())
      .then(res => {
          if(res =='NNNNY'){
            console.log("기능 적용 성공");
          }else{
            console.log("기존에 있었던 데이터 입니다.");
          }
          wishList(1);
      })
      .catch(err => {
        console.log("찜한 공간 통신 실패");
      })
    }
    
function pagination(pi){

      var addPiHtml = '<div class="pagination-container">';
      if(pi.listCount != 0) {
          addPiHtml += '<span class="pagination-prev">';
                    if( pi.currentPage == 1 ) {
                      addPiHtml += '<span class="icon-pagination icon-pagination-prev">';
                    } else {
                      addPiHtml += '<span class="icon-pagination icon-pagination-prev" onclick="pageMove('+ (pi.currentPage-1) +')'+'">';
                    } 
          addPiHtml += '<i class="icon material-icons">keyboard_arrow_left</i>'
                      + '</span>'
                      + '</span>';
        
                for(var p = pi.startPage; p <= pi.endPage; p++) {  
                    if ( p == pi.currentPage){
                      addPiHtml += '<span class="pagination-page-number">'+p+'</span>';
                    } else {
                      addPiHtml += '<span class="pagination-page-number" onclick="pageMove('+p+')">'+p+'</span>';
                    }
                }
          addPiHtml += '<span class="pagination-next">';
                  if( pi.currentPage == pi.maxPage ){
                      addPiHtml +='<span class="icon-pagination icon-pagination-next">';
                    } else {
                      addPiHtml +='<span class="icon-pagination icon-pagination-next" onclick="pageMove('+(pi.currentPage + 1)+')">';
                    }
          addPiHtml +=    '<i class="icon material-icons">keyboard_arrow_left</i>'
                          + '</span>'
                          + '</span>';
          }
          
          addPiHtml += '</div>';
          return addPiHtml;

      }

	    function pageMove(cPage){
	      wishList(cPage);
	    }
    
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>