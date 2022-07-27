<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>카테고리 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

    table {border: none;}


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
<table></table>

</head>
<body>
<jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/adminMenu.jsp" />
    <div style="display: grid; grid-template-columns: auto auto; margin-top: 5%;">
        <div id="categorySelect" style="border-radius: 20px; background-color:rgb(245, 252, 244); width: 200px; text-align: center; padding: 10px; margin-left: 10px;">
            <h2 style="margin-bottom: 10px;">현재 카테고리</h2>
            <dl>
                <dt>숙박</dt>
                    <c:forEach var="e" items="${list}">
                        <c:if test="${e.categoryName eq '숙박'}">
                            <dd>${e.categoryDetail}</dd>
                        </c:if>
                    </c:forEach>
            </dl>
            <dl>
                <dt>공간</dt>
                    <c:forEach var="e" items="${list}">
                        <c:if test="${e.categoryName ne '숙박'}">
                            <dd>${e.categoryDetail}</dd>
                        </c:if>
                    </c:forEach>
            </dl>
        </div>
        <div>
            <form action="adminCategoryCreate.sp">
            <div style="display: flex; margin-bottom: 20px;" id="categoryCreate;">
                <div>신규카테고리 생성</div>
                <div>
                    <select name="categoryName" id="categoryName">
                        <option value="숙박">숙박</option>
                        <option value="공간">공간</option>
                    </select>
                </div>
                <div><input type="text" placeholder="내용을 입력해 주세요" name="categoryDetail" required></div>
                <div><button type="submit">생성</button></div>
            </div>
            </form>
            <div>
                <table id="categoryControl">
                    <thead>
                        <tr style=" background-color: rgb(209, 228, 212);">
                            <th>카테고리명</th>
                            <th>공간명</th>
                            <th colspan="2">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${list}">
                            <tr>
                                <td style="display: none;">${e.spType}</td>
                                <td>${e.categoryName}</td>
                                <td>${e.categoryDetail}</td>
                                <td><button type="button" class="categoryUpdate">수정</button></td>
                                <td><button type="button" class="categoryDelete">삭제</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <form action="adminCategoryUpdate.sp">
                <div id="categoryUpdate" style="display:none;">
                    <table>
                        <tr>
                            <td>카테고리명</td>
                            <td>
                                <select name="categoryName">
                                    <option value="숙박">숙박</option>
                                    <option value="공간">공간</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>공간명</td>
                            <td><input type="text" name="categoryDetail" id="categoryDetailName" value=""></td>
                        </tr>
                    </table>
                    <input type="hidden" name="spType" value="">
                    <button type="button">취소</button>
                    <button type="submit">수정</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            /*
            $("#categoryCreate button").click(()=>{
                $.ajax({
                    url: "adminCategoryCreate.sp",
                    data: {
                        categoryName: $("#categoryName").val(),
                        categoryDetail: $("#categoryCreate").find("input").val()
                    },
                    success: function (response) {
                        let resultStr = "";
                        if(response=='Y'){
                            resultStr="<tr><td>"+ $("#categoryName").val() +"</td><td>"+ $("#categoryCreate").find("input").val() 
                                +"</td><td><button>수정</button></td><td><button>삭제</button></td></tr>";
                        }
                        $("#categoryControl>tbody").append(resultStr);
                    },
                    error:()=>{
                        console.log('통신 실패');
                    }
                });
            })
            */

            //카테고리 삭제
            $(".categoryDelete").on('click',function(){
                if(!confirm("카테고리를 삭제합니다.")){

                }else{
                    $.ajax({
                        url: "adminCategoryDelete.sp",
                        data: {spType: $(this).parent().parent().children().eq(0).text()},
                        success:(response)=>{
                            if(response=='Y'){
                                alert("삭제 성공");
                                location.reload();
                            }
                        },
                        error:()=>{
                            console.log("ajax 통신 실패");
                        }
                    });
                }
            })
            
            //카테고리 수정
            $('.categoryUpdate').on('click',function(){
                /*
                $(this).parent().parent().children().eq(1).html(
                    '<select name="categoryName" id="categoryName">'
                        +'<option value="숙박">숙박</option>'
                        +'<option value="공간">공간</option>'
                    +'</select>'
                );
                $(this).parent().parent().children().eq(2).html(
                    '<input type="text" name="categoryDetail" required>'
                );
                $(this).parent().parent().children().eq(3).html(
                    '<button type="button" class="categoryUpdateBtn">수정</button>'
                );
                */
                $("#categoryUpdate").css("display","block");
                $("#categoryDetailName").val($(this).parent().parent().children().eq(2).text());
                $("#categoryUpdate>input[type=hidden]").val($(this).parent().parent().children().eq(0).text());
            });
            $("#categoryUpdate>button").click(function(){
                $("#categoryUpdate").css("display", "none");
            })
        })
    </script>
</body>
</html>