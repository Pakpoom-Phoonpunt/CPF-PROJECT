(function() {
    var element = document.getElementById('date-select'),
        df = document.createDocumentFragment();

    var today = new Date();
    number_Month = new Date( today.getFullYear(), today.getMonth() , 0 ).getDate();

    for (var number = 1; number < number_Month; number++) { //day 0 of next month  is max day of this month
        var option = document.createElement('option');
        option.value = number;

        if ( number == today.getDate() ){
            option.appendChild(document.createTextNode("Day " + number + "(Current)"));
            option.setAttribute ("selected", true);
            option.addClass('day');
        }
        else { 
            option.appendChild(document.createTextNode("Day " + number)); //Create  <option> Day _ </option> 
            option.addClass('day');
        }
        option.setAttribute ("value", number ); 
        df.appendChild(option);
    }
    element.appendChild(df);
}());
