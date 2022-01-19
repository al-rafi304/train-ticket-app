class TimeConverter {
  // Converts HH:MM to HH:MM am/pm
  static to24(String time) {
    String status = ' AM';
    String result = time + status;
    var hour = int.parse(time.split(':')[0]);
    if (hour > 12) {
      status = ' PM';
      hour = hour - 12;
    }
    result = hour.toString() + ':' + time.split(':')[1] + status;
    return result;
  }

  // time has to be 'HH:MM'
  // duration has to be 'H hours M minutes'
  static addTime(String time, String duration) {
    String arv_time = '';
    int arv_mins = 0;

    // Converting time to minutes
    int dpt_mins =
        (int.parse(time.split(':')[0]) * 60) + int.parse(time.split(':')[1]);

    // Handles case for ' MM minutes'
    if (duration.split(' ').length == 4) {
      arv_mins = (int.parse(duration.split(' ')[0]) * 60) +
          int.parse(duration.split(' ')[2]);
    } else {
      arv_mins = int.parse(duration.split(' ')[1]);
    }
    
    // Adding all the minutes
    int total_mins = dpt_mins + arv_mins;

    // if time crosses 24 hour
    if (total_mins > 1440) {
      total_mins -= 1440;
    }

    // Calculating result
    String hour = (total_mins / 60).floor().toString();
    String mins = (total_mins % 60).toString();

    // Adding 0 if result if single digit; 5 => 05
    if (hour.length < 2) {
      hour = '0' + hour;
    }
    if (mins.length < 2) {
      mins = '0' + mins;
    }

    arv_time = hour + ':' + mins;
    return arv_time;
  }
}
