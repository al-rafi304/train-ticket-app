import 'dart:convert';

import 'package:flutter/services.dart';

class StationData{

  static Future getCode(String name) async{
    String response = await rootBundle.loadString('assets/StationData/StationNames.json');
    var data = await jsonDecode(response);

    for(int i=0; i<data.length; i++){
      if (data[i]['stn_name'] == name.toUpperCase()){
        print('Checking ${data[i]['stn_name']}');
        return data[i]['stn_code'];
      }
    }
    return 'NOT FOUND';
  }

  static Future fromStationsList() async{
    
    List<String> stations = [];

    String response = await rootBundle.loadString('assets/StationData/StationNames.json');
    var data = await jsonDecode(response);

    for(int i=0; i<data.length; i++){
      stations.add(data[i]['stn_name']);
    }
    return stations;
  }

  static Future routeData(String departure) async{
    
    String stationCode = await getCode(departure);
    String response = await rootBundle.loadString('assets/StationData/${stationCode}.json');
    var data = await jsonDecode(response);
    return data;
  }

  static Future toStationsList(var routeData) async{
    List<String> stations = [];
    for (var i = 0; i < routeData.length; i++) {
      stations.add(routeData[i]['dest']);
    }
  }

  static Future seatClassList(var routeData) async{
    List<String> seats = [];
    for (var i = 0; i < routeData.length; i++) {
      for (var j = 0; j < routeData[i]['classes'].length; j++) {
        seats.add(routeData[i]['classes'][j]['class']);
      }
    }
    return seats;

  }

}