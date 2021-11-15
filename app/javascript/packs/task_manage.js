$(document).ready(function(){
    $('.selectall-checkbox').on("click", function() {
        var side = $(this).attr("id")
        var cb;
        if(side == "left-check-all"){
            cb = $("[id='left-checkbox']")
        }else{
            cb = $("[id='right-checkbox']")
        }
        
        if ($(this).prop("checked") == true){
            cb.each(function(){
                $(this).prop("checked", true);
            });
            $('#table-left .data').each(function(){
                $(this).addClass('checked');
            });
        } else {
            cb.each(function(){
                $(this).prop("checked", false);
            });
            $('#table-left .data').each(function(){
                $(this).removeClass('checked');
            });
        }
    });

});
