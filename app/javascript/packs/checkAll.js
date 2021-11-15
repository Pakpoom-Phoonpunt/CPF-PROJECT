$(document).ready(function(){
    $('.check-all').on("click", function() {
        var side = $(this).attr("id")
        var cb;
        if(side == "left-check-all"){
            cb = $("#left-checkbox")
        }else{
            cb = $("#right-checkbox")
        }
        
        if ($(this).prop("checked") == true){
            cb.prop("checked", true);
        } else {
            cb.prop("checked", false);
        }
    });

    $()
});