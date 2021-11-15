(function() {
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
        var date = current_day.toString()+"-"+today.getMonth().toString()+"-"+today.getFullYear().toString(); //->  dd-mm-yyyy
        option.setAttribute ("value", date ); 

        current_day +=1 ;
        df.appendChild(option);
    }
    element.appendChild(df);
}());



$(document).ready(function(){
    $("select#date-select").change(function(){
        let date = $(this).children(":selected").val();
        $.ajax({
            type: "GET",
            url: window.location.href,
            dataType: "json",
            data: {"date": date},
            success:function(data){
            }
        });
    });
});