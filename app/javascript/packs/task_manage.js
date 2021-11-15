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
            cb.closest('tr').addClass('checked');
        } else {
            cb.prop("checked", false);
            cb.closest('tr').removeClass('checked');
        }
    });

    $("#transfer-btn").on("click", function() {
        console.log("เข้า")
        let data = {"test": "korrawee"}
        $.ajax({
            type: "GET",
            url: '/tasks_manage/tranfer',
            dataType: "script",
            data: data,
            success:function(data){
                console.log("hello");
                console.log(data);
            }
        });
    });
});