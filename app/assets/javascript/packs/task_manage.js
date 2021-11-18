let department = window.location.href.split("/").at(-1)
console.log(department)



$.ajax({
    type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                 "departmentName": department,
            },
        success:function(data){ 
            console.log("Done In manage"); 
        }
})

$('#transfer-btn').on("click", function() {
    let checkbox = $("input:checked")
    let accId = []
    $('input:checked').each(function(){
        $(this).prop('checked',false);
        accId.push($(this).val())
    });
    $.ajax({
        type: "GET",
            url: window.location.href,
            dataType: "script",
            data: {
                     "accId": accId,
                },
            success:function(data){ 
                console.log("Done In manage"); 
            }
    })
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

    
