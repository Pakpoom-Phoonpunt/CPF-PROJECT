if(window.location.href.split('/').at(-1) === "dashboard"){
    $("#current-date").show();
    $("#current-time-details li").hide();
    $('#already-in-responsive').show();

}else if (window.location.href.split('/').at(-4) === 'tasks_manage'){
    $('#already-in-responsive').show();
    $("#current-date").show();
}else{
    $("#current-date").hide();
    $('#already-in-responsive').hide();
}
