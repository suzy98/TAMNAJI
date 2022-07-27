//체크인 체크아웃

$(function () {
    var dateFormat = "yy-mm-dd",
        from = $("#check-in")
            .datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                dateFormat: 'yy-mm-dd', //Input Display Format 변경
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //달력의 요일 텍스트
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], //달력의 요일 Tooltip
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
                , showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
                , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시         
                , yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                , minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            })
            .on("change", function () {
                to.datepicker("option", "minDate", getDate(this));
            }),
        to = $("#check-out").datepicker({
            defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 1,
            dateFormat: 'yy-mm-dd',
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //달력의 요일 텍스트
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], //달력의 요일 Tooltip
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
            , showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
            , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            , yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        })
        .on("change", function () {
            from.datepicker("option", "maxDate", getDate(this));
        });
    
    
    function getDate(element) {
        var date;
        try {
            date = $.datepicker.parseDate(dateFormat, element.value);
        } catch (error) {
            date = null;
        }
        return date;
    }    
    //$("#check-in").datepicker('setDate', 'today');
    //$("#check-out").datepicker('setDate', '+1D');
    
    var today = new Date();
    var year1 = today.getFullYear();
    var month1 = ('0' + (today.getMonth() + 1)).slice(-2);
    var day1 = ('0' + today.getDate()).slice(-2);
    var dateString1 = year1 + '-' + month1 + '-' + day1;
    $("#check-in").prop("placeholder", dateString1);

    var tomorrow = new Date(today.setDate(today.getDate() + 1));
    var year2 = tomorrow.getFullYear();
    var month2 = ('0' + (tomorrow.getMonth() + 1)).slice(-2);
    var day2 = ('0' + tomorrow.getDate()).slice(-2);
    var dateString2 = year2 + '-' + month2 + '-' + day2;
    $("#check-out").prop("placeholder",dateString2);
    
});

