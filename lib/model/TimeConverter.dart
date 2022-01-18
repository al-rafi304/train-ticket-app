class TimeConverter{

  static to24(String time){
    String status = ' AM';
    String result = time + status;
    int hour = int.parse(time.split(':')[0]) ;
    if (hour > 12){
      status = ' PM';
      hour = hour - 12;
      result = hour.toString() + ':' + time.split(':')[1] + status;
    }
    return result;

  }
}