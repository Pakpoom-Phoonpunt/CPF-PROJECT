function checkTime(i) {
    if (i < 10) {
      i = "0" + i;
    }
    return i;
  }
  function startTime() {
    const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];
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
    try {
      document.getElementById('current-time').innerHTML =  hour + ":" + minute + ":" + second;
      $('[id="current-date"]').html(weekday[0] +" "+ date +" "+monthNames[month]+" "+year); 
      t = setTimeout(function() {
        startTime()
      }, 500);
    } catch (error) {
  
    }
  }
  startTime();