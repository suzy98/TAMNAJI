<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br clear="both">
    <p>${e.eventTitle}</p>
    <p>${e.eventContent}</p>
    <p>${e.startDate}</p>
    <p>${e.endDate}</p>
    <img src="${e.changeName}" width="900">
    <br>
    <button type="button" onclick="history.back();">목록으로</button>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>