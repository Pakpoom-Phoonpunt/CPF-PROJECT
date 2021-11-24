ShiftSelector()

function ShiftSelector() {
    var element = document.getElementById('shift-select'),
        df = document.createDocumentFragment();
    
    var date = new Date();
    var current_time = date.getHours() //number type
    
    if (current_time >= 0 && current_time< 8) {
        current_shift = 1
        }        
    else if (current_time >= 8 && current_time< 16){
        current_shift = 2
    }
    else {
        current_shift = 3
    }

    for ( var num = 1 ; num <= 3 ; num++  ){
        var option = document.createElement('option');
        option.value = num;
         if ( num == current_shift ){
            option.appendChild(document.createTextNode("Shift " + num + "(Current)"));
            option.setAttribute ("selected", true); 
        }
        else {
            option.appendChild(document.createTextNode("Shift " + num ));
        }
        option.classList.add('shift');
        df.appendChild(option);
        }
        element.appendChild(df);
 
};

function isMobileWidth() {
    console.log($(window).width() < 872);
    return $(window).width() < 872
}