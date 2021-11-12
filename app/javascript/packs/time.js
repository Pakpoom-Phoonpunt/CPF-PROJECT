function checkTime(i) {
    if (i < 10) {
      i = "0" + i;
    }
    return i;
  }
  function startTime() {
    var today = new Date();
    var date = today.getDate();
    var month = today.getMonth();
    var year = today.getFullYear();   
    var hour = today.getHours();
    var minute = today.getMinutes();
    var second = today.getSeconds();
    var weekday = today.toString().split(" ")
    // add a zero in front of numbers<10
    minute = checkTime(minute);
    second = checkTime(second);
    document.getElementById('current-date').innerHTML =  weekday[0] +" "+ date +"-"+month+"-"+year + " | " + "Time: "+ hour + ":" + minute + ":" + second;
    t = setTimeout(function() {
      startTime()
    }, 500);
  }
  startTime();