if(window.location.href.split('/').at(-1) != "dashboard"){
    $("#current-date").hide();
    $('#already-in-responsive').hide();
}else{
    $("#current-date").show();
    $("#current-time-details li").hide();
    $('#already-in-responsive').show();

    $('.nav-icon').on('click',function(){

});
}
