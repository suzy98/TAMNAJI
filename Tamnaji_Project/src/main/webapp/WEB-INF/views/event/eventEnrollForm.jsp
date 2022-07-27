<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
</head>
<body>
    <form action="insertEvent.ev" enctype="multipart/form-data" method="post">
        이벤트명: <input type="text" name="eventTitle" id=""><br>
        이벤트내용: <textarea name="eventContent" id="" cols="30" rows="10"></textarea><br>
        이벤트 시작일: <input type="date" name="startDate" id=""><br>
        이벤트 종료일: <input type="date" name="endDate" id=""><br>
        첨부파일: <input type="file" name="upfile" id="upfile"><br>
        <button type="reset">취소</button>
        <button type="submit">등록</button>
    </form>
</body>
</html>