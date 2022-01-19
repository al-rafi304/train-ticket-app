import 'package:train_ticket_checker/model/TimeConverter.dart';

class Ticket {
  var responseData;
  String train_name = '';
  String dpt_station = '';
  String arv_station = '';
  String dpt_time = '';
  String cost = '';
  String costWithoutFormatting = '';
  String costSingle = '';
  bool train_on = true;
  bool train_left = false;
  String duration = '';
  String arv_time = '';
  String ticket_count = '0';
  List<dynamic> routes = [];

  Ticket(
      {required this.responseData, required this.ticket_count}) {
        this.dpt_station = responseData['stn_from'].replaceAll('_', ' ');
        this.arv_station = responseData['stn_to'].replaceAll('_', ' ');
        this.dpt_time = responseData['dpt_time'];
        this.duration = responseData['duration'];
        this.arv_time = TimeConverter.addTime(dpt_time, duration);
        this.train_name = responseData['trn_name'];
        this.cost = responseData['fare'] != 0 ? responseData['fare'].toString() + ' TK' : 'Not Known';
        this.costWithoutFormatting = responseData['fareWithoutFormat'] == 'Not known' ? '0' : responseData['fareWithoutFormat'];
        this.costSingle = costWithoutFormatting != '0' ?(int.parse(costWithoutFormatting) / int.parse(ticket_count)).toString() + ' TK' : 'Not Known';
        this.train_on = responseData['off_day'] == 'ON' ? true : false;
        this.train_left = responseData['isTrainLeft'] == 'YES' ? true : false;
        this.arv_time = TimeConverter.addTime(dpt_time, duration);
        this.routes = responseData['routes'];
      }
}
