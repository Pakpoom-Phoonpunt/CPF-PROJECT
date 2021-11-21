$.ajax({
    type: "GET",
    url: window.location.href,
    dataType: "script",
    data: {
            "act": func,
            "Id": Id,
        },
    success:function(data){ 
        console.log(callbackMsg);
    }
});

$("#edit").on('click', function(){
    ajaxCommu("edit", $(this).val())
})

function ajaxCommu(func, Id, callbackMsg="SUCCESS communication event"){
    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                "act": func,
                "Id": Id,
            },
        success:function(data){ 
            console.log(callbackMsg);
        }
    });
}