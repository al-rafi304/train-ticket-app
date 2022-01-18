class TimeConverter {
  static to24(String time) {
    String status = ' AM';
    String result = time + status;
    int hour = int.parse(time.split(':')[0]);
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

    int dpt_mins = (int.parse(time.split(':')[0]) * 60) +
        int.parse(time.split(':')[1]);
    int arv_mins = (int.parse(duration.split(' ')[0]) * 60) +
        int.parse(duration.split(' ')[2]);
    int total_mins = dpt_mins + arv_mins;

    if (total_mins > 1140) {
      total_mins -= 1440;
    }

    int hour = (total_mins / 60).floor();
    int mins = total_mins % 60;

    arv_time = hour.toString() + ':' + mins.toString();
    return arv_time;
  }
}
