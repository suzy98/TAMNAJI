<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>숙박</title>

    <!--명석이의 CSS-->
    <!--가격-->
    <link rel="stylesheet" href="resources/css/space/price.css">
    <!--별점-->
    <link rel="stylesheet" href="resources/css/space/star.css">
</head>

<body>
    <!--헤더-->
    <jsp:include page="../common/header.jsp" />
    <br>

    <!--숙소명 검색-->
    <label for="stay">숙소명</label>
    <input type="search" name="spaceTitle" id="stay" placeholder="숙소명">

    <!--체크인, 체크아웃-->
    <label for="startDate">체크인</label>
    <input type="text" id="startDate" name="startDate">
    <label for="endDate">체크아웃</label>
    <input type="text" id="endDate" name="endDate">

    <!--인원 수 -->
    <label for="peopleCount">인원</label>
    <input type="number" name="peopleCount" id="peopleCount" placeholder="인원" min="1">

    <!--검색 버튼-->
    <button onclick="stay();">검색</button>
    <br>
    <p>숙소명:${space.spaceTitle}</p>
    <p>인원:${space.peopleCount}</p>
    <p>체크인:${space.startDate}</p>
    <p>체크아웃:${space.endDate}</p>
    <p id="placeName"></p>
    <br>
    <!--지도-->
    <div id="area_select_filter" style="width:315px; height:223px; background:url(resources/images/space/bg_map_jeju.png) no-repeat;">
        <svg version="1.1" width="315" height="223">
            <!--제주시-->
            <polygon
                points="93,45,69,29,122,23,145,38,136,21,168,18,172,33,176,27,183,37,188,40,187,48,189,56,192,65,193,75,183,83,179,89,168,93,161,96,153,99,149,102,138,92,134,91,129,93,125,89,124,85,120,79,121,74,120,67,119,62,118,57,115,52,109,54,104,53,105,49,107,48"
                fill="url(#filter_area_off)" data-value="제주시" data-valueJeju="1" style="cursor: pointer;"></polygon>
            <!--제주시동부-->
            <polygon
                points="179,29,186,34,190,39,190,47,192,55,194,62,197,70,196,76,191,81,185,86,181,91,173,94,166,97,177,95,186,91,192,90,201,84,208,84,212,77,217,76,222,72,226,71,232,74,238,72,243,68,249,67,254,64,260,64,266,59,274,58,280,50,308,48,315,33,310,22,290,27,282,34,278,30,266,31,260,26,255,2,250,1,235,2,236,9,237,18,224,20,218,15,219,7,210,4,212,6,205,5,200,5"
                fill="url(#filter_area_off)" data-value="제주시 동부" data-valueJeju="2" style="cursor: pointer;"></polygon>
    
            <!--제주시서부-->
            <polygon
                points="99,51,102,50,103,54,107,56,113,55,115,61,117,72,118,81,121,86,121,90,125,92,127,95,134,93,137,95,143,100,139,101,135,99,131,102,127,101,123,104,118,102,113,103,109,108,106,113,101,114,96,114,92,113,84,113,81,115,76,115,72,116,69,120,65,120,58,126,56,129,52,132,46,135,42,136,43,141,37,139,28,136,23,137,19,137,16,140,13,142,3,134,10,131,-1,123,2,116,19,114,20,109,26,106,30,104,31,100,35,96,22,86,25,75,44,78,47,81,48,78,50,74,57,71,62,70,65,67,65,61,70,62,62,49,65,42,84,46,93,52,95,53,98,49"
                fill="url(#filter_area_off)" data-value="제주시 서부" data-valueJeju="3" style="cursor: pointer;"></polygon>
    
            <!--서귀포시-->
            <polygon
                points="88,166,90,154,92,149,91,139,92,134,98,140,102,141,99,135,101,131,105,128,107,124,109,120,110,117,111,111,113,108,117,105,122,106,127,105,130,105,136,104,138,103,141,105,144,102,148,104,154,102,156,103,164,111,172,121,175,128,177,137,183,145,185,153,186,157,183,163,177,163,174,163,178,175,172,176,168,180,160,178,157,180,148,177,145,176,141,166,138,167,136,165,132,167,129,168,128,170,126,168,124,166,122,163,120,162,119,175,117,181,110,182,96,180,96,167,90,167"
                fill="url(#filter_area_off)" data-value="서귀포시" data-valueJeju="4" style="cursor: pointer;"></polygon>
    
            <!--서귀포시동부-->
            <polygon
                points="1158,99,162,99,167,101,172,99,177,97,183,95,192,94,200,88,209,88,212,82,217,79,224,74,231,76,239,76,244,70,251,70,256,67,262,67,265,63,270,62,278,60,283,53,290,57,299,60,303,67,314,75,313,87,301,85,288,86,288,92,289,97,281,99,275,106,274,111,274,119,266,122,264,125,267,131,265,143,257,151,249,150,242,152,233,142,229,143,233,162,227,164,222,166,207,162,204,151,198,157,197,153,193,152,191,155,189,158,187,150,184,143,180,136,178,131,176,123,174,119,166,108,157,99"
                fill="url(#filter_area_off)" data-value="서귀포시 동부" data-valueJeju="5" style="cursor: pointer;"></polygon>
    
            <!--서귀포시 서부-->
            <polygon
                points="20,145,18,141,22,139,26,139,35,141,44,145,46,138,48,137,53,135,61,127,67,124,70,123,74,118,82,119,85,116,87,116,95,117,99,116,104,118,106,119,104,126,97,132,96,134,94,131,91,133,89,137,88,141,90,149,85,167,75,164,73,164,68,166,63,173,63,184,71,221,39,221,24,193,30,182,47,180,47,176,42,173,39,167,31,165,27,161,25,157,18,153,17,149,13,144"
                fill="url(#filter_area_off)" data-value="서귀포시 서부" data-valueJeju="6" style="cursor: pointer;"></polygon>
    
            <defs>
                <pattern id="filter_area_off" patternUnits="userSpaceOnUse" x="0" y="0" width="315" height="223">
                    <image xlink:href="resources/images/space/bg_map_jeju.png" width="315" height="223"></image>
                </pattern>
                <pattern id="filter_area_on" patternUnits="userSpaceOnUse" x="0" y="0" width="315" height="223">
                    <image xlink:href="resources/images/space/bg_map_jeju1.png" width="315" height="223"></image>
                </pattern>
            </defs>
        </svg>
    </div>
    <div>
        <label for="allCheck">전체선택</label>
        <input type="checkbox" name="" id="allCheck">
    </div>
    <div>
        <button onclick="mapCheck();">확인</button>
    </div>

    <!--가격-->
    <div class="middle" style="margin-top: 50px;">
        <div class="multi-range-slider">
            <!-- 진짜 슬라이더 -->
            <input type="range" id="input-left" min="0" max="100" value="0" />
            <input type="range" id="input-right" min="0" max="100" value="100" />
            <!-- 커스텀 슬라이더 -->
            <div class="slider">
                <div class="track"></div>
                <div class="range"></div>
                <div class="thumb left"></div>
                <div class="thumb right"></div>
            </div>
        </div>
    </div>
    <div style="margin-top: 50px;">
        <span>최저:<label id="priceMin">0</label></span>
        <span style="margin-left:300px;">최고:<label id="priceMax">100</label></span>
    </div>

    <!--별점-->
    <div id="myform">
        <fieldset>
            <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
            <input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
            <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
            <input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
            <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
        </fieldset>
    </div>

    <!--편의 시설-->
    

    <!--푸터-->
    <jsp:include page="../common/footer.jsp" />

    <!--자바스크립트-->
    <script src="resources/js/space/date.js"></script>
    <script src="resources/js/space/map.js"></script>
    <script src="resources/js/space/price.js"></script>
    <script>
        function stay(){
            location.href="stay.sp?spaceTitle="+$("#stay").val()+"&peopleCount="+$("#peopleCount").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val();
        }
    </script>
</body>

</html>
