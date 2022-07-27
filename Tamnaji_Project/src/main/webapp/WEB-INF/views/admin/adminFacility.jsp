<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>편의시설 관리</title>
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

    table {  padding: 10px; border-radius: 20px;}

    #table-1 {border-spacing: 30px; border: 1px solid rgb(228, 236, 231);}

	a {
	text-decoration: none;
	color: black;
	}

    button {
        background-color: rgb(129, 192, 129);
        color: white;
        border: none;
        padding: 5px;
        width: 100%;
        
    }

    #make {
        width: 80px;
    }

    button:hover {
        background-color: rgb(82, 160, 82);
    }


</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/adminMenu.jsp" />
    <div style="display: grid; grid-template-columns: auto auto;">
        <div id="facilitySelect" style="border-radius: 20px; background-color:rgb(245, 252, 244); width: 200px; text-align: center; padding: 10px; margin-left: 10px;">
            <h2>현재 편의시설</h2>
            <c:forEach var="sc" items="${scList}">
                <dl>
                    <dt>${sc.categoryDetail}</dt>
                    <c:forEach var="e" items="${list}">
                        <c:if test="${e.categoryDetail eq sc.categoryDetail}">
                            <dd><img src="${e.changeName}" width="20">${e.facilityName}</dd>
                        </c:if>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
        <div>
            <form action="adminFacilityCreate.sp" method="post" enctype="multipart/form-data">
                <table id="table-1">
                    <tr>
                        <td>신규 편의시설 생성</td>
                        <td>
                            <select name="categoryDetail" id="categoryDetail">
                            <c:forEach var="sc" items="${scList}">
                                <option value="${sc.categoryDetail}">${sc.categoryDetail}</option>
                            </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>아이콘 등록</td>
                        <td>
                            <input type="file" name="file">
                        </td>
                    </tr>
                    <tr>
                        <td>편의 시설명</td>
                        <td>
                            <input type="text" placeholder="내용을 입력해 주세요" name="facilityName" required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button id="make" type="submit">생성</button></td>
                    </tr>
                </table>
            </form>
            <div>
                <table id="facilityControl" style="margin-top: 20px; width: 490px;">
                    <thead>
                        <tr style="background-color: rgb(209, 228, 212);">
                            <th style="	padding: 5px; border: 1px solid #99c2a3;">카테고리명</th>
                            <th style="	padding: 5px; border: 1px solid #99c2a3;">편의시설명</th>
                            <th style="	padding: 5px; border: 1px solid #99c2a3;" colspan="2">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${list}">
                            <tr>
                                <td style="display: none;">${e.sfNo}</td>
                                <td style="	padding: 5px; border: 1px solid #99c2a3;">${e.categoryDetail}</td>
                                <td style="	padding: 5px; border: 1px solid #99c2a3;"><img src="${e.changeName}" width="20">${e.facilityName}</td>
                                <td style="	padding: 5px; border: 1px solid #99c2a3;"><button type="button" class="facilityUpdate">수정</button></td>
                                <td style="	padding: 5px; border: 1px solid #99c2a3;"><button type="button" class="facilityDelete">삭제</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <form action="adminFacilityUpdate.sp">
                    <div id="facilityUpdate" style="display:none;">
                        <table>
                            <tr>
                                <td>카테고리명</td>
                                <td>
                                    <select name="categoryDetail">
                                        <c:forEach var="sc" items="${scList}">
                                            <option value="${sc.categoryDetail}">${sc.categoryDetail}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>편의시설명</td>
                                <td><input type="text" name="facilityName" id="facilityName" value=""></td>
                            </tr>
                        </table>
                        <input type="hidden" name="sfNo" value="">
                        <button type="button">취소</button>
                        <button type="submit">수정</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            //편의시설 삭제
            $(".facilityDelete").on('click', function () {
                if (!confirm("카테고리를 삭제합니다.")) {

                } else {
                    location.href="adminFacilityDelete.sp?sfNo="+ $(this).parent().parent().children().eq(0).text();
                }
            })

            //편의시설 수정
            $('.facilityUpdate').on('click', function () {
                $("#facilityUpdate").css("display", "block");
                $("#facilityName").val($(this).parent().parent().children().eq(2).text());
                $("#facilityUpdate>input[type=hidden]").val($(this).parent().parent().children().eq(0).text());
            });
            $("#facilityUpdate>button").click(function () {
                $("#facilityUpdate").css("display", "none");
            })
        })
    </script>
</body>
</html>