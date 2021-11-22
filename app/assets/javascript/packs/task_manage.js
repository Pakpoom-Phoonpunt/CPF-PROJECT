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
    let accId = collectSelected();
    console.log(accId.length);
    ajaxCommu("add", accId, 0)
});

$('#transfer-btn[name ="delete"]').on("click", function() {
    let taskId = collectSelected();
    console.log(taskId.length);

    ajaxCommu("delete", taskId, 0);
})

$('[id="otTime"]').on('change', function(){
    sessionStorage.setItem('ot-input',$(this).val());
});
$('[id="assign"]').on("click", function() {
    assignReply(isMobileWidth());
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
    let table = sessionStorage.getItem('freeTable');
     console.log(table)
    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                "act": "search",
                "word": val,
                "mobile": isMobileWidth(),
                "freeTable": table
            },
        success:function(data){ 
            console.log("SUCCESS communication event");
        }
    });

});

// DECLARE FUNCTIONs //

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

function isMobileWidth() {
    return $('#mobile-indicator').is(':visible');
}
function collectSelected(){
    collection = []
    $('input:checked').each(function(){
        if($(this).val() != "on"){
            $(this).prop('checked',false);
            collection.push($(this).val())
        }else{
            $(this).prop('checked',false);
        }
    });
    return collection;
}
function assignReply(isMobile){
    let taskId = collectSelected();
    let value = sessionStorage.getItem('ot-input');
    console.log(value);
    
    if (value != null){
        $.ajax({
            type: "GET",
            url: window.location.href,
            dataType: "script",
            data: {
                    "act": "ot",
                    "Id": taskId,
                    "value": value,
                    "mobile": isMobile,
                    "freeTable": "false"
                },
            success:function(data){ 
                sessionStorage.removeItem('ot-input');
                console.log("responed assign to");
            }
        });
    }
}

// Responsive //
if(isMobileWidth()){
    let shift = window.location.href.split('/').at(-1)
    let depart_shift = department + " : " + shift
    $("#num").html(depart_shift);
    
    $('#free-btn').on('click',function(){
        $('.selectall-checkbox').prop('checked', false);
        sessionStorage.setItem('freeTable', 'true');
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
        $('.selectall-checkbox').prop('checked', false);
        sessionStorage.setItem('freeTable', 'false');
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

    $('[id="assign"]').on("click", function() {
        assignReply(isMobileWidth());
    })


}


