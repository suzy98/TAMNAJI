<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
  <!--페이징-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
  <link rel="stylesheet" href="resources/css/space/paging.css">
<style>

.container {
  margin-left: 100px;
}

#aside {
  width: 300px;
  height: 500px;
  float: left;

}

#content {
  margin-left: 400px;
  width: 400px;
  height: 650px;  
  
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
  border: none;
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

}

li a:hover {
  color: green;
  font-weight: bold;
}

table {
  width: 1200px;
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
  margin-top: 20px;
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
.table-hover:hover {
  background-color: #FFFAF6;
  cursor: pointer;
}

.listup{
    cursor: pointer;
}

.pagination{
    display: flex;
    justify-content: start;
    margin-left: 800px;
    margin-top: 100px;
}
</style>
</head>
<body>
    <jsp:include page="../common/adminheader.jsp" />
	
    <div class="container" style=" padding-top: 70px;margin: 0 auto;"></div>
        <div class="content" id="aside" style=" background: white">
            <div class="side-menu"style="margin-left: 10px;">
            <div class="side-menubar">
            <p id="side-menubar-name">마이 탐나지😎</p>
            <ul id="side-menubar-list">
            	<li><span class="listup" id="back" onclick="javascript:history.go(-1);">이전으로 돌아가기</span></li>
                <li><span class="listup" onclick="adminReservationGets(1, 'NNNNY');">예약 내역 조회</span></li>
                <li><span class="listup" onclick="adminReservationGets(1, 'NNNNN');">예약 취소 내역 조회</span></li>
            </ul>
            </div>
        </div>
        </div>

        <div class="content-2" style=" height:800px;">
            <!-- 비동기식으로 테이블을 띄우거나, 디테일창을 띄우거나, 수정창을 띄우거나 할 것-->
            <div id="content"></div>

            <!-- 페이징바가 들어가는 섹션 -->
            <div class="pagination" id="w3-center" ></div>
        </div>
    </div>

    <script>

        $(function(){
            adminReservationGets(1, 'NNNNY');
            
            adminReservationGet();

        })

        ///// 리스트 전체 조회
        function adminReservationGets(cPage, nnn_payStatus_){
            var url = "adminReservations?cPage="+String(cPage)+"&payStatus="+nnn_payStatus_;
            var method_ = "get";
            getModules(url, method_, nnn_payStatus_);
        }
        
        // 예약내역 상세조회
        function adminReservationGet__(orderId){

            var formLayout = document.createElement("form"); // 폼객체 생성
                formLayout.setAttribute("charset", "UTF-8");
                formLayout.setAttribute("method", "get"); //GET, POST
                formLayout.setAttribute("action", 'adminReservation');

                var inputLayout = document.createElement("input"); // input 객체 생성
                inputLayout.setAttribute("type", "text");
                inputLayout.setAttribute("name", "orderId");
                inputLayout.setAttribute("value", orderId);
                formLayout.appendChild(inputLayout); // 폼에 추가 실시
            
                document.body.appendChild(formLayout); //body에 폼 레이아웃 추가
                formLayout.submit(); //실행 및 제출 실시
                document.body.removeChild(formLayout); //body에서 폼 레이아웃 삭제  	

        }

        /// get 모듈
        function getModules(url, method_, nnn_payStatus_){
            fetch(url
                , {method:method_}
            )
            .then(res => res.json())
            .then(res => {
                var addHtml = "";
                var addPiHtml = "";
                if(nnn_payStatus_ != ""){
                    addHtml += Gets_(nnn_payStatus_, res);
                    
                    addPiHtml += pagination(nnn_payStatus_, res.pi);
                    
                } else {
                    addHtml += Get_(res);
                }
                var content_ = document.getElementById('content');
                content_.innerHTML = addHtml;
                
                var page_ = document.getElementById('w3-center');
                page_.innerHTML =  addPiHtml;
            })
            .catch(err => {
            })
        }
        function Get_(res){
            var addHtml = "";
                if(res.payStatus == '결제취소'){
                    addHtml += '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;" id="table-title">예약 취소 내역 상세보기</p>';
                } else {
                    addHtml += '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;" id="table-title">예약 내역 상세보기</p>';
                }
            return addHtml;
        }


        function Gets_(nnn_payStatus_, res){
            var addHtml = "";
                if(nnn_payStatus_ == 'NNNNY'){
                    addHtml += theadSet("예약 내역 조회", nnn_payStatus_);
                } else {
                    addHtml += theadSet("예약 취소 내역 조회", nnn_payStatus_);
                }
                addHtml += tbodySet(res, nnn_payStatus_);
                addHtml +='  </tbody>'
                    +   '</table>';
            return addHtml;
        }

 function theadSet(title, nnn_payStatus_){
            
            var thead = '<p style="margin-top: 10px; margin-bottom: 40px; font-size: 25px;" id="table-title" value='+nnn_payStatus_+'>'+title+'</p>'
                        + '<table id="reservationList">'
                        + '<thead>'
                        +    '<tr>'
                        +       '<th>No</th>'
                        +       '<th style="width: 200px;">공간명</th>'
                        +       '<th style="width: 90px;">객실명</th>'
                        +       '<th style="width: 90px;">판매자</th>'
                        +       '<th style="width: 90px;">예약자</th>';
                        if(nnn_payStatus_ == 'NNNNY'){
                            thead +=    '<th style="width: 100px;">체크인날짜</th>'
                                +       '<th style="width: 100px;">체크아웃날짜</th>';
                        } else {
                            thead +=  '<th style="width: 100px;">취소날짜</th>';
                        }
                        thead += '<th style="width: 90px;">금액</th>'
                        +       '<th  style="width: 90px;">결제방식</th>'
                        +       '<th style="width: 90px;">결제상태</th>';
                        if(nnn_payStatus_ == 'NNNNY'){
                            thead +=  '<th style="width: 90px;">입금확인</th>';
                        }
                        thead +=   '</tr>'
                        +'</thead>'
                        +'<tbody>';
            return thead;
        }

        function tbodySet(res, nnn_payStatus_){
            var addHtml = "";
            if( res.pi.listCount.length == 0) {
                addHtml +=  '<tr class="table-hover">';
                    if(nnn_payStatus_ == 'NNNNY'){
                        addHtml += '  <td class="orderId" colspan="10">예약내역이 존재하지 않습니다.</td>';
                    } else if(nnn_payStatus_ == 'NNNNN'){
                        addHtml += '  <td class="orderId" colspan="9">예약취소내역이 존재하지 않습니다.</td>';
                    }
                    addHtml += '</tr>';
            } else {
                for(var r = 0; r < res.adminRList.length; r++){
                        addHtml +=          '<tr class="table-hover">'
                                    +       '  <td class="orderId">'+res.adminRList[r].orderId+'</td>'
                                    +       '  <td>'+res.adminRList[r].spaceTitle+'</td>'
                                    +       '  <td>'+res.adminRList[r].roomTitle+'</td>'
                                    +       '  <td>'+res.adminRList[r].sellerName+'</td>'
                                    +       '  <td>'+res.adminRList[r].reservationName+'</td>';
                                    if(nnn_payStatus_ == 'NNNNY'){
                                addHtml +=       '  <td>'+res.adminRList[r].checkInDate+'</td>'
                                        +           '  <td>'+res.adminRList[r].checkOutDate+'</td>';
                                    } else if(nnn_payStatus_ == 'NNNNN') {
                                addHtml +=      '  <td>'+res.adminRList[r].cancelDate+'</td>';
                                    }
                                addHtml +=  '  <td>'+res.adminRList[r].price+'원</td>'
                                    +       '  <td>'+res.adminRList[r].paymentMethod+'</td>'
                                    +       '  <td>'+res.adminRList[r].payStatus+'</td>';
                                    if(nnn_payStatus_ == 'NNNNY'){
                                addHtml +=    '<td><a href="reservation/deposit/put?orderId='+res.adminRList[r].orderId+'">'
                                        if(res.adminRList[r].payStatus == '결제대기'){
                                            addHtml += '입금확인';
                                        }
                                addHtml +=         '</a></td>';
                                    }
                                    +       '</tr>';
                };
            }
            return addHtml;
        }


        function pagination(nnn_payStatus_, pi){
            var nnn_payStatus__ = "'"+nnn_payStatus_+"'";
            
            var addPiHtml = '<div class="pagination-container">';
            if(pi.listCount != 0) {
                addPiHtml += '<span class="pagination-prev">';
                        if( pi.currentPage == 1 ) {
                            addPiHtml += '<span class="icon-pagination icon-pagination-prev">';
                        } else {
                            addPiHtml += '<span class="icon-pagination icon-pagination-prev" onclick="adminReservationGets('+ (pi.currentPage-1)+','+ nnn_payStatus__ +')'+'">';
                        } 
                addPiHtml += '<i class="icon material-icons">keyboard_arrow_left</i>'
                            + '</span>'
                            + '</span>';
            
                    for(var p = pi.startPage; p <= pi.endPage; p++) {  
                        if ( p == pi.currentPage){
                            addPiHtml += '<span class="pagination-page-number">'+p+'</span>';
                        } else {
                            addPiHtml += '<span class="pagination-page-number" onclick="adminReservationGets('+p+','+nnn_payStatus__+')">'+p+'</span>';
                        }
                    }
                addPiHtml += '<span class="pagination-next">';
                        if( pi.currentPage == pi.maxPage ){
                            addPiHtml +='<span class="icon-pagination icon-pagination-next">';
                        } else {
                            addPiHtml +='<span class="icon-pagination icon-pagination-next" onclick="adminReservationGets('+(pi.currentPage + 1)+','+nnn_payStatus__+')">';
                        }
                addPiHtml +=    '<i class="icon material-icons">keyboard_arrow_left</i>'
                                + '</span>'
                                + '</span>';
                }
                
                addPiHtml += '</div>';
                return addPiHtml;
        }



    ///////////////// tr 클릭 여부 확인
    function hasClass(elem, className) {
        return elem.classList.contains(className); } 

    function hasTag(elem, className) {
        return elem.classList.contains(className); } 

    function adminReservationGet(){
        document.addEventListener('click', 
            function(e) { 
                if(e.target.nodeName == 'TD'){
                //부모 태그 찾기
                var parentTrTag = e.target;
                //부모 태그 명이 TR이 나올때까지 자동순회
                for(;parentTrTag.nodeName != 'TR' ; parentTrTag=parentTrTag.parentElement);
                
                if (hasClass(parentTrTag, "table-hover")) {
                    var orderIdTag = e.target;
                    for(;orderIdTag.className != 'orderId' ; orderIdTag=orderIdTag.previousElementSibling);
                    adminReservationGet__(String(orderIdTag.innerText));
                }
            }
        }
        , false);
    }



    </script>
</body>
</html>
