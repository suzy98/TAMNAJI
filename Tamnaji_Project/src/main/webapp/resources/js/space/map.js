$(function () {
    let arr = new Set();
    $("#area_select_filter>svg").children().css('cursor', 'pointer').on('click', function () {
        if ($(this).attr('fill') == 'url(#filter_area_off)') {
            $(this).attr('fill', 'url(#filter_area_on)');
            arr.add($(this).data("valuejeju"));
        } else {
            $(this).attr('fill', 'url(#filter_area_off)');
            arr.delete($(this).data("valuejeju"));
        }
        $("#mapCheck").val(Array.from(arr));
    })
    
    
    
    $("#allCheck").on('click', function () {
        if ($(this).is(":checked")) {
            $("#area_select_filter>svg").children().attr('fill', 'url(#filter_area_on)');
        } else {
            $("#area_select_filter>svg").children().attr('fill', 'url(#filter_area_off)');
        }
    })
})