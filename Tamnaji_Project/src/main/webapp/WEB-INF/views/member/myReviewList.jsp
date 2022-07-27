<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
src="https://kit.fontawesome.com/77e29b57dd.js"
crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<!--페이징-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/space/paging.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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


/*-----------------------------------------------------*/
/* 예약내역 관련 -----*/

#res {
  width: 62px;
  padding: 5px;
  background-color: #fde4d8;
  color: #fd6500;
  font-weight: bold;
  font-size: 13px;
  border-radius: 10px;
  margin-bottom: 10px;
}

#res-date {
  font-size: 15px;
  font-weight: bold;
}

#res-box {
  width:670px; 
  box-sizing: border-box;
  border-radius: 10px;
  margin-top: 40px;
  padding-bottom: 28px;
  padding-top: 30px;
  padding-left: 45px;
  padding-right: 20px;
  border: 1px solid rgb(240, 240, 240); margin-top: 10px;
  box-shadow: 0 0px 3px #f0efef;
}

#res-box:hover {
  box-shadow: 0 0px 6px #dddddd;
}

#checkin {
  padding-top: 10px;
  background-color: #f8f8f8e3;
  border-radius: 10px;

}

.check-date {
  font-size: 13px;
  
}

.delete-button {
  width: 100px;
  margin: auto; display: block;
  padding: 15px;
  background-color: #fafafa;
  border: none;
  border-radius: 30px;
  box-shadow: 0 0px 3px #e1e1e1;
}

.res-button:hover {
  cursor: pointer;
  background-color: #4cc55c;
  color: white;
}

.review-button {
  background-color: #e3f2e5;
  width: 100px;
  margin: auto; display: block;
  padding: 15px;
  border: none;
  border-radius: 30px;
  box-shadow: 0 0px 3px #e1e1e1;
}

.review-button:hover {
  cursor: pointer;
  background-color: #4cc55c;
  color: white;
}

.delete-button:hover {
  cursor: pointer;
  background-color: #4cc55c;
  color: white;
}

/*모달------------------------------------*/
.popup-wrap, .popup-wrap-2 {
	 width: 100%;
	 height: 100%;
	 display: none;
     position: fixed;
	 top: 0px;
	 left: 0px;
     background:rgba(0, 0, 0, 0.5);
     overflow: hidden;
}
 .popup-box, .popup-box-2 {
	 width: 550px;
	 padding: 70px;
	 transform: translate(-50%, -50%) scale(0.5);
	 position: absolute;
	 top: 50%;
	 left: 50%;
	 box-shadow: 0px 0px 3px rgba(150, 149, 149, 0.5);
	 border-radius: 20px;
	 background: rgb(253, 255, 252);
	 text-align: center;
}

 .popup-box .close-btn, .popup-box-2 .close-btn {
	 width: 35px;
	 height: 35px;
	 display: inline-block;
	 position: absolute;
	 top: 15px;
	 right: 15px;
	 -webkit-transition: all ease 0.5s;
	 transition: all ease 0.5s;
	 border-radius: 1000px;
	 background: #94c98f;
     box-shadow: 0px 0px 3px rgba(150, 149, 149, 0.5);
	 font-weight: bold;
     font-size: 22px;
	 text-decoration: none;
	 color: #fff;
	 line-height: 150%;
}
 .popup-box .close-btn:hover {
	 -webkit-transform: rotate(180deg);
	 transform: rotate(180deg);
}

.popup-box-2 .close-btn:hover {
	 -webkit-transform: rotate(180deg);
	 transform: rotate(180deg);
}

 .transform-in, .transform-out {
	 display: block;
	 -webkit-transition: all ease 0.5s;
	 transition: all ease 0.5s;
}
 .transform-in {
	 -webkit-transform: translate(-50%, -50%) scale(1);
	 transform: translate(-50%, -50%) scale(1);
}
 .transform-out {
	 -webkit-transform: translate(-50%, -50%) scale(0.5);
	 transform: translate(-50%, -50%) scale(0.5);
}


/*--- 삭제 --- */
.delete-title {
    color: #333;
    font-size: 20px;
}

.delete-title strong {
    color: #fd6500;
}

#delete-button-inner {

    margin-top: 30px;
    padding: 20px;
    background-color: rgb(237, 237, 237);
    border: none;
    border-radius: 50px;
}

#delete-button-inner:hover {
    background-color: #b9e4b5;
    cursor: pointer;
}


/*별점-----------------------------*/

.cont, .cont-2{
  width: 93%;
  max-width: 400px;
  text-align: center;
  margin: 4% auto;
  padding: 30px 0;
  color: #EEE;
  border-radius: 5px;
  overflow: hidden;
}


div.title{
  font-size: 2em;
}


div.stars{
  width: 270px;
  display: inline-block;
  margin-top: 20px;
}

input.star{
  display: none;
}

label.star {
  float: right;
  margin-left: 5px;
  padding: 10px;
  font-size: 25px;
  color: rgb(186, 186, 186);
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  font-family: "Font Awesome 5 Free";
  color: #FD4;
  transition: all .25s;
  font-weight: 900;
}


input.star-5:checked ~ label.star:before {
  color:rgb(255, 223, 119);
  text-shadow: 0 0 2px rgb(240, 155, 64);
}

input.star-1:checked ~ label.star:before {
  color: rgba(255, 211, 34, 0.466);
}

label.star:hover{
  transform: rotate(-15deg) scale(1.3);
}

label.star:before{
  content: '\f005';
  font-family: "Font Awesome 5 Free";
  font-weight: 900;
}

.rev-box{
  overflow: hidden;
  height: 0;
  width: 100%;
  transition: all .25s;
}

textarea.review{
  border: 1px solid rgb(218, 218, 218);
  border-radius: 10px;
  width: 100%;
  max-width: 100%;
  height: 100px;
  padding: 10px;
  box-sizing: border-box;
  color: rgb(87, 87, 87);
}

textarea.review:focus {
    outline: none;
    box-shadow: 0 0 5px rgb(143, 196, 141);
}

label.review{
  display: block;
  transition:opacity .25s;
  color: #858484;
  font-size: 12px;
}



input.star:checked ~ .rev-box{
  height: 125px;
  overflow: visible;
}

#review-submit {
    margin-top: 50px;
    margin-bottom: 30px;
    width: 90px;
    padding: 15px;
    background-color: #76bb70;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 50px;
}

/* 사이드바 메뉴바 관련 디자인 */
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
 
 /* 페이징바 관련 */
#w3-center {
	
	margin-right: 120px;

}

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

	<div class="content-2" id="content" style=" height:600px;">
	</div>  
	<div class="pagination" id="w3-center" >
	</div>
      
	<!-- 모달 -->
	<!-- 
	<div class="popup-wrap">
  		<div class="popup-box">
    		<div class="cont">
        		<div class="stars">
				        <form action="">
				          <input class="star star-5" id="star-5-2" type="radio" name="star"/>
				          <label class="star star-5" for="star-5-2"></label>
				          <input class="star star-4" id="star-4-2" type="radio" name="star"/>
				          <label class="star star-4" for="star-4-2"></label>
				          <input class="star star-3" id="star-3-2" type="radio" name="star"/>
				          <label class="star star-3" for="star-3-2"></label>
				          <input class="star star-2" id="star-2-2" type="radio" name="star"/>
				          <label class="star star-2" for="star-2-2"></label>
				          <input class="star star-1" id="star-1-2" type="radio" name="star"/>
				          <label class="star star-1" for="star-1-2"></label>
          
					          <div class="rev-box">
					            <textarea class="review" col="30" name="review"></textarea>
					            <label class="review" for="review"><br>정성스러운 리뷰, 탐나지에게 큰 힘이 됩니다!</label>
					            <button id="review-submit">작성하기</button>
        					</div>
        				</form>
        		</div>
        	</div>
    		<a class="close-btn popup-close">x</a>
  		</div>
  		<div class="modal-layer"></div>
	</div>
	 -->	
</div>

		<script>
		
		$(document).on('click', '.review-button', function(e) {
			$('.popup-wrap').fadeIn(500);
			$('.popup-box').removeClass('transform-out').addClass('transform-in');
		  	e.preventDefault();
		});
		
		$(document).ready(function() {		
			$('.popup-close').click(function(e) {
				$('.popup-wrap').fadeOut(500);
				$('.popup-box').removeClass('transform-in').addClass('transform-out');
				
			  	e.preventDefault();
			});
		});
		
			
		$(document).on('click', '.delete-button', function(e) {
			$('.popup-wrap-2').fadeIn(500);
			$('.popup-box-2').removeClass('transform-in').addClass('transform-out');
			
		  	e.preventDefault();
		});
     		
		$(document).ready(function() {		
			$('.popup-close-2').click(function(e) {
				$('.popup-wrap-2').fadeOut(500);
				$('.popup-box-2').removeClass('transform-in').addClass('transform-out');
			
		  		e.preventDefault();
			});
		});
	   </script>
		
		<script>
		
		$(function() {
      
      		selectReviewList(1);
		});

	    function star(){
	          return '<i class="fa fa-star rated"></i>';
	    }

        function emptyStar(){
          return '<i class="fa fa-star"></i>';
        }

		function selectReviewList(cpage) {
					
			$.ajax({
				url : "myReviewList.me?cpage="+cpage,
        
				success : function(result2) {
					
					  console.log(result2);
			          var result = result2.list;
						
			          var resultStr = "";
			          var resultStr1 = "";
			          var addHtml = '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">나의 리뷰 내역🌴</p>'
          								 
		          if(result.length == 0) {
		          	var addHtml = '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">나의 리뷰 내역🌴</p>'
		          									
		          		+ '<br>'
		          		+ '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;">리뷰 내역이 존재하지않습니다.</p>';
		          		 
		          						
		          }else{
		        	  for(var i = 0; i < result.length;  i++) {
            addHtml += '<div id="res-box" style="margin-top: 40px;">'
                  + '     <div style="display: inline-block; width: 400px; height: 150px;">'    
                  + '              <table width="400px" style="padding-bottom: 5px;">'
                  + '                   <tr>'
                   + '                      <td width="80px" height="70px"><img src="'+result[i].changeName+'" width="70px" height="40px"></td>'
                  + '                   	<td>'+result[i].spaceTitle+'</td>'
                  + '                  </tr>'
                  + '			   </table>'
                  
                  + '			   <table id="checkin" width="370px">'
                  + '     			   <tr>'
                  + '             			<td style="font-size: 14px; padding-left: 10px; width: 120px;">'
                  + '             				<div class="card-rating" id="comment-rating">';
                                                switch( result[i].grade) {
                                                  case 1 : addHtml += star(); break;
                                                  case 2 : addHtml += star()+ star(); break;
                                                  case 3 : addHtml += star()+star()+star(); break;
                                                  case 4 : addHtml += star()+star()+star()+star(); break;
                                                  case 5 : addHtml += star()+star()+star()+star()+star(); break;
                                                  };
        addHtml +=                        '</div>'
                 +                      '</td>'
                 + '    <td style="font-size: 14px;">'
                 +          					result[i].createDate
                 + '    </td>'
                 + '   				 </tr>'
                 + ' 				<tr height="40px">'
                 + '         	 		<td class="check-date" style="padding-left: 10px;" colspan="2">'
                 + 							          result[i].reviewContent + '</td>'
                 + '				</tr>'
                 + '</table>'
                 + '   	  </div>'
                 
                 + '  			 <div style="padding-top: 25px; width: 180px; float: right; height: 200px; ">'
                 + '  			 <input type="hidden" name="roomNo" value="'+ result[i].reviewNo  +'">'
                 + " 				<button id='qwer' class='delete-button' value="+ result[i].reviewNo +" style='margin-top: 30px;'>삭제하기</button><br>"
                 + '   			 </div>'
                 + '  </div>'
                 
				 + '  <div class="popup-wrap-2">'
				 + '    <div class="popup-box-2">'
				 + '    <div class="cont-2">'
				 + '      <div class="delete-title" style="margin-top: 20px;">'
				 + '           <strong>삭제 후 복구가 불가능합니다.</strong><br><br>'
				 + '           		정말 삭제하시겠어요?<br>'
				 + '         <input type="hidden" name="orderId" value="${ r.orderId }">'
				 + '           <button id="delete-button-inner" class="delete-button" onclick="deleteReview()">삭제하기</button>'
				 + '          </div>'
				 + '   </div>'
				 + '     <a class="close-btn popup-close-2">x</a>'
				 + '	   </div>'
				 + '  </div>';
       			
					}
		          }
					$("#content").html(addHtml);
					
					addPiHtml = pazination(result2.pi);
					
					$('#w3-center').html(addPiHtml);
					
				},
				error : function() {
					console.log("리뷰리스트 조회용 ajax 통신 실패!");
				}	
			});
		  }
		  
		
			var rno;
			 $(document).on("click", ".delete-button", function () {
				 //console.log($(this).siblings("input[name=roomNo]").val());
				 rno = $(this).siblings("input[name=roomNo]").val();
				 
				 $('.popup-close-2').click(function(e) {
				 $('.popup-wrap-2').fadeOut(500);
				 $('.popup-box-2').removeClass('transform-in').addClass('transform-out');
		
				  	e.preventDefault();
				});
				 console.log(rno);
				 
			 });
			 
			
			 function deleteReview(){
				 
				 $.ajax({
						url : "reviewDelete.me",
						data : {roomNo : rno },
						success : function(result) {
							if(result == 1){
								
								console.log("삭제성공");
								selectReviewList(1); // 호출을 해야지 AJAX 적용이됨
								
								
							} else{
								console.log("삭제실패");
							}
											
						},
						error : function() {
							console.log("ajax 리뷰 삭제 통신 실패!");
						}
					}); 
			 }
		
			 function pazination(pi){

		            var addPiHtml = '<div class="pagination-container">';
		            if(pi.listCount != 0) {
		                addPiHtml += '<span class="pagination-prev">';
		                        if( pi.currentPage == 1 ) {
		                            addPiHtml += '<span class="icon-pagination icon-pagination-prev">';
		                        } else {
		                            addPiHtml += '<span class="icon-pagination icon-pagination-prev" onclick="selectReviewList('+ (pi.currentPage-1) +')'+'">';
		                        } 
		                addPiHtml += '<i class="icon material-icons">keyboard_arrow_left</i>'
		                            + '</span>'
		                            + '</span>';
		            
		                    for(var p = pi.startPage; p <= pi.endPage; p++) {  
		                        if ( p == pi.currentPage){
		                            addPiHtml += '<span class="pagination-page-number">'+p+'</span>';
		                        } else {
		                            addPiHtml += '<span class="pagination-page-number" onclick="selectReviewList('+p+')">'+p+'</span>';
		                        }
		                    }
		                addPiHtml += '<span class="pagination-next">';
		                        if( pi.currentPage == pi.maxPage ){
		                            addPiHtml +='<span class="icon-pagination icon-pagination-next">';
		                        } else {
		                            addPiHtml +='<span class="icon-pagination icon-pagination-next" onclick="selectReviewList('+(pi.currentPage + 1)+')">';
		                        }
		                addPiHtml +=    '<i class="icon material-icons">keyboard_arrow_left</i>'
		                                + '</span>'
		                                + '</span>';
		                }
		                
		                addPiHtml += '</div>';
		                return addPiHtml;
		        }

		</script>
		
		

<jsp:include page="../common/footer.jsp" />


</body>
</html>


