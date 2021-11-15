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

        // collect selected workers
        let workers_list = $('#table-left .checked');
        console.log(workers_list);



        let data = {"test": "korrawee"}
        $.ajax({
            type: "GET",
            url: window.location.href,
            dataType: "script",
            data: data,
            success:function(data){
            }
        });
    });
});