import 'package:train_ticket_checker/model/TimeConverter.dart';

class Ticket {
  var responseData;
  String train_name = '';
  String dpt_time = '';
  String cost = '';
  bool train_on = true;
  bool train_left = false;
  String duration = '';
  String arv_time = '';
  List<dynamic> routes = [];

  Ticket(
      {required this.responseData}) {
        this.dpt_time = responseData['dpt_time'];
        this.duration = responseData['duration'];
        this.arv_time = TimeConverter.addTime(dpt_time, duration);
        this.train_name = responseData['trn_name'];
        this.cost = responseData['fare'];
        this.train_on = responseData['off_day'] == 'ON' ? true : false;
        this.train_left = responseData['isTrainLeft'] == 'YES' ? true : false;
        this.arv_time = TimeConverter.addTime(dpt_time, duration);
        this.routes = responseData['routes'];
      }
}
