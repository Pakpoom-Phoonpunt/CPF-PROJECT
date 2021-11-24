ShiftSelector()

function ShiftSelector() {
    var element = document.getElementById('shift-select'),
        df = document.createDocumentFragment();
    
    var date = new Date();
    var current_time = date.getHours()+":"+date.getMinutes()
    var current_shift = 0 
    
    if (current_time > "00:00" && current_time< "08:00") {
        current_shift = 1
        }        
    else if (current_time > "08:00" && current_time< "16:00"){
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

        //<option value="1" label="Shift 1">Shift 1</option>
        //<option value="2" label="Shift 2">Shift 2</option>
        //<option value="3" label="Shift 3">Shift 3</option>    
};

function isMobileWidth() {
    console.log($(window).width() < 872);
    return $(window).width() < 872
}