$('.detail-btn').on("click", function(event){
    $(".popup").addClass("display");
    btnWidth = $(this).width() + $('.popup').width();
    $(".popup").css( {position:"absolute", top:event.pageY, left: (event.pageX - btnWidth)});
   });
$('.popup-exit').on("click", function(){
    $(".popup").removeClass('display');
});
$(".detail-btn").on("click",function(){
    $.ajax({
        async: true,
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                "account_id": $(this).val(),
                "status": "detail"
            },
        success:function(data){ 
            console.log("success send id");
        }
    });
});