addDaySelector();
$("select#date-select").change(function(){
    let date = $(this).children(":selected").val();
    let department = "KFC" // debuggg 

    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {"date": date,
                "departName": department,
            },
        success:function(data){ 
            $("input[type='button'][value='KFC']").focus
        }
    });
});
$(".d-list").on("click", function(){
    let date = $("#date-select").val();
    let department = $(this).text();
    console.log(date);
    console.log(department);
    $.ajax({
        type: "GET",
        url: window.location.href,
        dataType: "script",
        data: {"current": "true",
                "date": date,
                 "departName": department,
            },
        success:function(data){ 
            console.log("success btn")
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
            option.appendChild(document.createTextNode("Day " + current_day + "(Current)"));
            option.setAttribute ("selected", true); 
        }else { 
            if ( current_day == number_Month ){ // last day of month  dd-mm-yyyy
                current_day = 1 ;
            }
            option.appendChild(document.createTextNode("Day " + current_day)); //Create  <option> Day _ </option>  
        }
        option.classList.add('day');
        var date = today.getFullYear().toString()+"-"+(today.getMonth()+1).toString()+"-"+current_day.toString(); //->  yyyy-mm-dd
        option.setAttribute ("value", date ); 

        current_day +=1 ;
        df.appendChild(option);
    }
    element.appendChild(df);
};