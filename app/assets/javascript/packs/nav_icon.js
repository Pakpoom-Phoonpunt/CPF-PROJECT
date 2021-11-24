$("#hamberg-menu").hide();
$('.nav-icon').on('click',function(){
    $(this).toggleClass("change");
    if($("#hamberg-menu").is(':visible')){
        $("#hamberg-menu").fadeToggle(function(){
            $("#current-time-details").fadeToggle();
            if(window.location.href.split('/').length > 5){
                $('#already-in-responsive').fadeIn();
                }
        });
    }else{
        $("#current-time-details").fadeToggle("fast",function(){
            $('#already-in-responsive').hide();
            $("#hamberg-menu").fadeToggle();
        });
    }
});

$('.nav-icon-worker').on('click',function(){
    $(this).toggleClass("change");
    if($("#hamberg-menu").is(':visible')){
        $("#hamberg-menu").fadeToggle(function(){
            $("#current-time-details").fadeToggle();
            if(window.location.href.split('/').length > 5){
                $('#already-in-responsive').fadeIn();
                }
        });
    }else{

        $('#already-in-responsive').hide();
        $("#hamberg-menu").fadeToggle();
    }
});


