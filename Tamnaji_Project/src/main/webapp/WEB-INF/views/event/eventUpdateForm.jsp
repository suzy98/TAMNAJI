<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <form action="updateEvent.ev" enctype="multipart/form-data" method="post">
        <input type="hidden" name="eventNo" value="${ ev.eventNo }">
        <input type="hidden" name="fileDelete" value="0"><!--업로드 되어있는 파일 삭제-->
        이벤트명: <input type="text" name="eventTitle" value="${ev.eventTitle}"><br>
        이벤트내용: <textarea name="eventContent" id="" cols="30" rows="10">${ev.eventContent}</textarea><br>
        이벤트 시작일: <input type="date" name="startDate" value="${ev.startDate}"><br>
        이벤트 종료일: <input type="date" name="endDate" value="${ev.endDate}"><br>
        첨부파일: <input type="file" name="reUpfile"><br> 
        <c:if test="${ not empty ev.originName }">
            현재 업로드된 파일: ${ev.originName} 
            <button type="button" id="fileDelete">삭제</button>
            <input type="hidden" name="originName" value="${ ev.originName }"> <!-- 기존파일을 검사할용도 -->
            <input type="hidden" name="changeName" value="${ ev.changeName }"> <!-- 기존파일을 삭제할용도  -->
        </c:if>
        <br>
        <button type="button" onclick="history.back();">취소</button>
        <button type="submit">수정</button>
    </form>
    <script>
        $(function(){
            //업로드 되어있는 파일 삭제
            $("#fileDelete").click(function(){
                $("input[name=fileDelete]").attr("value", 1);
            })
        })
    </script>
</body>
</html>