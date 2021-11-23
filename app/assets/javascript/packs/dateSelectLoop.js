addDaySelector();
sessionStorage.setItem("status",'actual', 'absent');
sessionStorage.removeItem("date");
sessionStorage.removeItem("department");
sessionStorage.removeItem("shift");

 //  SELECT PLAN ,ACTUAL ,ABSENT
 
$(".status").on("click",function(){
    let date = $('#date-select').val(); // get recent selected day
    let shift = $("#shift-select").val(); // get recent selected shift
    let status = $(this).text(); // get current status

    console.log(status)
    // get current department and shift
    let department = sessionStorage.getItem("department"); //get selected department
     
    ajaxCommu(date, department, shift, status, "Done status event");
});

// SELECT SHIFT

$("#shift-select").on('change', function(){ 
    let date = $('#date-select').val(); // get recent selected day
    let shift = $("#shift-select").val(); // get recent selected shift
    let status = sessionStorage.getItem('status'); // get current status


    // get current department and shift
    let department = sessionStorage.getItem("department"); //get selected department
    
    ajaxCommu(date, department, shift, status, "Done shift event");

});

// SELECT DAY

$("select#date-select").on('change',function(){ 
    let date = $(this).val(); // get recent selected day
    let shift = $('#shift-select').val(); // get recent selected shift
    let status = sessionStorage.getItem('status'); // get current status
    // save current department
    sessionStorage.setItem("date", date);

    // get current department and shift
    let department = sessionStorage.getItem("department");
    
    ajaxCommu(date,department, shift, status, "Done day event");
});

//SHOW Current Shift ,Workerin time of each Department on Department list 
$(".d-list").each(function(){ 
    var today = new Date();
    var current_day = today.getDate()
    

    sessionStorage.setItem("department", department);

    ajaxCommu(date, department, shift, status);
});

// SELECT DEPARTMENT

$(".d-list").on("click", function(){ 
    let date = $("#date-select").val();   // get recent selected day
    let shift = $("#shift-select").val(); // get recent selected shift
    let department = $(this).text(); // get selected department
    let status = sessionStorage.getItem('status'); // get current status

    sessionStorage.setItem("department", department);

    ajaxCommu(date, department, shift, status);
});

// SELECT MANAGE SHIFT

$("#manage-shift-btn").on("click",function(){

    let status = "manage";
    //get selected department
    let department = sessionStorage.getItem("department"); // get current status
    let date = $("#date-select").val();
    let shift = $("#shift-select").val();
    console.log(date)
    console.log(shift)
    let url = ''

    if(department == null){
        url = window.location.href
    }else{
        url = window.location.href + "/tasks_manage/" +department +"/"+ date + "/" + shift
    }
    $.ajax({
        type: "GET",
        url: url,
        dataType: "script",
        data: {
                "date": date,
                 "depart": department,
                 "shift": shift,
            },
        success:function(data){ 
            console.log("Done mange event");
            window.location.href = url
        }
    });
});

function addDaySelector() {
    var element = document.getElementById('date-select'),
        df = document.createDocumentFragment();

    var today = new Date();
    var number_Month = new Date( today.getFullYear(), today.getMonth() , 0 ).getDate();

    var limit_showDay = 20 ; //Limit show future day
    var current_day = today.getDate()
    
    for (var number = 1 ; number < limit_showDay; number++) { //day 0 of next month  is max day of this month
        var option = document.createElement('option');
        option.value = number;
        if (number == 1 ){
            if(isMobileWidth()){
                option.appendChild(document.createTextNode(current_day)); //Create  <option> _ </option>
            }else{
                option.appendChild(document.createTextNode("Day " + current_day + "(Current)"));
                option.setAttribute ("selected", true); 
            }
        }else { 
            if ( current_day == number_Month ){ // last day of month  dd-mm-yyyy
                current_day = 1 ;
            }
            if(isMobileWidth()){
                option.appendChild(document.createTextNode(current_day)); //Create  <option> _ </option>
            }else{
                option.appendChild(document.createTextNode("Day " + current_day)); //Create  <option> Day _ </option>   
            }
        }
        option.classList.add('day');
        var date = today.getFullYear().toString()+"-"+(today.getMonth()+1).toString()+"-"+current_day.toString(); //->  yyyy-mm-dd
        option.setAttribute ("value", date ); 

        current_day +=1 ;
        df.appendChild(option);
    }
    element.appendChild(df);
};

function ajaxCommu(date, department, shift, status, callbackMsg="SUCCESS communication event"){
    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {
                "date": date,
                 "departName": department,
                 "shift": shift,
                 "status": status,
            },
        success:function(data){ 
            console.log(callbackMsg);
        }
    });
}

// RESPONSIVE //

$("#current-date").show();
$("#current-time-details li").hide();

$('.nav-icon').on('click',function(){
        $('#already-in .responsive').toggle();

});

function isMobileWidth() {
    return $('#mobile-indicator').is(':visible');
}