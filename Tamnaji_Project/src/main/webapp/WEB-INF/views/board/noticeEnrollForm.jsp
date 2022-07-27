<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*글쓰기 관련 ------------------------------*/
#content {
	padding-top: 150px;
	margin: 0 auto;
	width: 1100px;
	height: 100%;
}
a{
	text-decoration: none;
	color: #3B3B3B;
}
select:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
input:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}
textarea:focus {outline: 1px solid #39A652; box-shadow: 0 0 2px 2px rgba(166, 208, 169, 0.7);}      
     
/*게시판 작성하기 ------------------------------*/
fieldset {
	background-color: rgb(233, 247, 223);
    border-radius: 50px;
    padding: 20px;
    padding-right: 50px;
    color:rgb(94, 87, 90);
    border: none;
}
legend {
    color: rgb(70, 70, 70);
}
#title {
    background-color: rgb(253, 253, 253);
    border-radius: 5px;
    border: none;
    box-shadow: #BFE9A5 0px 1px 10px;
    padding: 10px;
    width: 550px; 
	margin-top:10px; 
	margin-bottom: 10px;
}
#content-text {
    background-color: rgb(253, 253, 253);
    border-radius: 5px;
    border: none;
    box-shadow: #BFE9A5 0px 1px 10px;
    padding: 10px;
    resize:none; 
    width: 550px; 
    margin-bottom: 10px;
}
#submit {
    width: 100px;
    height: 40px;
    margin-top: 40%;
    margin-left: 280%;
    background-color: white;
    border-radius: 20px;
    border: none;
    box-shadow: #BFE9A5 0px 1px 10px;
}
#submit:hover {
    background-color: #1DB306;
    color: white;
    cursor: pointer;
}
input #fileselect {
    background-color: white;
    border: none;
}
td>b {
    font-size: 15px;
}

/*클릭 시 테두리 ------------------------------*/
input:focus {outline: 2px solid rgb(151, 197, 145);}
textarea:focus {outline: 2px solid rgb(151, 197, 145);}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="content-notice" id="content">
    	<div style="padding-top: 70px; padding-bottom: 200px; margin: 0 auto;">
        	<form action="insert.no" style="margin: 0 auto; width: 730px;">

            	<input type="hidden" name="noticeWriter" value="${loginUser.memberNo}">
            	<fieldset>
                	<table style=" padding-left: 35px; padding-top: 20px;">
                    	<tr>
                        	<td><b>제목</b></td>
                        	<td>
                        		<input type="text" name="noticeTitle" id="title" placeholder="제목을 입력하세요" required>
                        	</td>
                    	</tr>
                    	<tr>
                        	<td><b>내용</b></td>
                        	<td>
                        		<textarea name="noticeContent" id="content-text" cols="52" rows="12" placeholder="내용을 입력하세요" required></textarea>
                        	</td>
                    	</tr>
                    	<tr>
                        	<td><input type="submit" value="작성하기" id="submit"></td>
                    	</tr>
                	</table>
                	<br>
            	</fieldset>
			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>