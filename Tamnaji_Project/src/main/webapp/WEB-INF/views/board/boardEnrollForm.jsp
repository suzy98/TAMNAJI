<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*----------------------------------------------------------------------*/
/*글쓰기 관련 ----------*/
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
      
/*게시판 작성하기-----------------------------------------------*/
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

/*클릭 시 테두리*/
input:focus {outline: 2px solid rgb(151, 197, 145);}
textarea:focus {outline: 2px solid rgb(151, 197, 145);}

/*업로드 ----------------------------------------------*/
.file-upload input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
.file-upload input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
.file-upload label {
    display: inline-block;
    padding: 7px;
    color: rgb(0, 0, 0);
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #FFFFFF;
    cursor: pointer;
    border: 1px solid #EBEBEB;
    border-bottom-color: #E2E2E2;
    border-bottom-left-radius: none;
    border-radius: 5px;
}
/* named upload */
.file-upload .upload-name {
    display: inline-block;
    padding: .5em .75em;  /* label의 패딩값과 일치 */
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #F5F5F5;
    border: 1px solid #EBEBEB;
    border-bottom-color: #E2E2E2;
    border-radius: .25em;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
/* imaged preview */
.file-upload .upload-display {  /* 이미지가 표시될 지역 */
    margin-bottom: 5px;
}
@media(min-width: 768px) {
    .file-upload .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}
.file-upload .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}
.file-upload .upload-display img {  /* 추가될 이미지 */
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- 여기부터 컨텐츠 영역 ---------------------------->
	<div class="content-board" id="content">
		<div style="padding-top: 70px; padding-bottom: 200px; margin: 0 auto;">
			<form action="insert.bo" method="post" style="margin: 0 auto; width: 730px;" enctype="multipart/form-data">

            	<input type="hidden" name="boardWriter" value="${loginUser.memberNo}">

            	<fieldset>
                	<table style=" padding-left: 35px; padding-top: 20px;">
                    	<tr>
                        	<td><b>제목</b></td>
                        	<td>
                        		<input type="text" name="boardTitle" id="title" placeholder="제목을 입력하세요" required>
                        	</td>
                    	</tr>
                    	<tr>
                        	<td><b>내용</b></td>
                        	<td>
                        		<textarea name="boardContent" id="content-text" cols="52" rows="12" placeholder="내용을 입력하세요" required></textarea>
                        	</td>
                    	</tr>
                    	<tr>
                        	<td><b>첨부파일</b></td>
                        	<td>
                            	<div class="file-upload preview-image">
                                	<input type="text" class="upload-name" value="파일선택" disabled="disabled">
                                	<label for="input-file">업로드</label>
                                	<input type="file" id="input-file" class="upload-hidden" name="upfile">
                            	</div>
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
	
	
<script>
	  $(document).ready(function(){
	//$('#ex_filename').change(function() {
	//  var filename = $(this).val();
	//  $('.upload-name').val(filename);
	//});
	
	var fileTarget = $('.file-upload .upload-hidden');
	fileTarget.on('change', function(){  // 값이 변경되면
	   if(window.FileReader){  // modern browser
	        var filename = $(this)[0].files[0].name;
	   }
	   else {  // old IE
	        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	   }
	   // 추출한 파일명 삽입
	   $(this).siblings('.upload-name').val(filename);
	});
	});
	  
	//preview image
	var imgTarget = $('.preview-image .upload-hidden');
	imgTarget.on('change', function(){
	var parent = $(this).parent();
	parent.children('.upload-display').remove();
	if(window.FileReader){
	   
		//image 파일만
	   if (!$(this)[0].files[0].type.match(/image\//)) return;
	   var reader = new FileReader();
	   reader.onload = function(e){
	        var src = e.target.result;
	        parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	   }
	   reader.readAsDataURL($(this)[0].files[0]);
	}
	else {
	   $(this)[0].select();
	   $(this)[0].blur();
	   var imgSrc = document.selection.createRange().text;
	   parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
	   var img = $(this).siblings('.upload-display').find('img');
	   img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
	}
	});
</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>