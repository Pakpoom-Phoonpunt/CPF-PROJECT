function addShiftSelector() {
    var element = document.getElementById('shift-select'),
        df = document.createDocumentFragment();

    
    for (var number = 1 ; number < limit_showDay; number++) { 
        var option = document.createElement('option');
        option.value = number;

        if (number == 1 ){
            option.appendChild(document.createTextNode("Day " + current_day + "(Current)"));
            option.setAttribute ("selected", true); 
        }else { 
            if ( current_day == number_Month ){ 
                current_day = 1 ;
            }
            option.appendChild(document.createTextNode("Shift " + current_day)); //Create  <option> Day _ </option>  
        }
        option.classList.add('day');
        var date = today.getFullYear().toString()+"-"+(today.getMonth()+1).toString()+"-"+current_day.toString(); //->  yyyy-mm-dd
        option.setAttribute ("value", date ); 

        current_day +=1 ;
        df.appendChild(option);
    }
    element.appendChild(df);
};