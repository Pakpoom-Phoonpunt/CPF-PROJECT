let department = window.location.href.split("/").at(-3);
console.log(department);

$.ajax({
    type: 'GET',
    url: window.location.href,
    dataType: 'script',
    data: {
            'departmentName': department
        },
    success:function(data){ 
        console.log("Done In manage"); 
    }
});

$('#transfer-btn[name ="add"]').on("click", function() {
    let accId = []
    $('input:checked').each(function(){
        $(this).prop('checked',false);
        accId.push($(this).val())
    });

    ajaxCommu("add", accId, 0)
});

$('#transfer-btn[name ="delete"]').on("click", function() {
    let taskId = []
    $('input:checked').each(function(){
        $(this).prop('checked',false);
        taskId.push($(this).val())
    });
    console.log(taskId.length);

    ajaxCommu("delete", taskId, 0);
})

$('#assign').on("click", function() {
    let taskId = [];
    let value = $('#otTime').val();
    $('input:checked').each(function(){
        $(this).prop('checked',false);
        taskId.push($(this).val());
    });
    ajaxCommu("ot", taskId, value);
})

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

$('#search-input').bind("change keyup", function() {
    let val = $(this).val()
    console.log(val)
    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                "act": "search",
                "word": val
            },
        success:function(data){ 
            console.log("SUCCESS communication event");
        }
    });

});

function ajaxCommu(func, Id, value,  callbackMsg="SUCCESS communication event"){
    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                "act": func,
                "Id": Id,
                "value": value
            },
        success:function(data){ 
            console.log(callbackMsg);
        }
    });
}

    
// Responsive //
if(isMobileWidth()){
    let shift = window.location.href.split('/').at(-1)
    let depart_shift = department + " : " + shift
    $("#num").html(depart_shift);
    $('#free-btn').on('click',function(){
        $.ajax({
            type: "GET",
            url: window.location.href,
            dataType: "script",
            data: {
                    "departmentName": department,
                    "freeTable": true,
                    "mobile": true
                },
            success:function(data){ 
                console.log("Done In Free btn"); 
            }
        });
    });

    $('#plan-btn').on('click',function(){
        $.ajax({
            type: "GET",
            url: window.location.href,
            dataType: "script",
            data: {
                    "departmentName": department,
                    "freeTable": false,
                    "mobile": true
                },
            success:function(data){ 
                console.log("Done In Free btn"); 
            }
        });
    });


}

function isMobileWidth() {
    return $('#mobile-indicator').is(':visible');
}
