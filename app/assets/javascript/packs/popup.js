$('.detail-btn').on("click", function(event){
    $(".popup").addClass("display");
    btnWidth = $(this).width() + $('.popup').width();
    console.log(btnWidth);
    $(".popup").css( {position:"absolute", top:event.pageY, left: (event.pageX - btnWidth)});
   });
$('.popup-exit').on("click", function(){
    $(".popup").removeClass('display');
});
$(".detail-btn").on("click",function(){
    console.log("detail button clicked");
    console.log($(this).val());
    console.log(window.location.href)
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