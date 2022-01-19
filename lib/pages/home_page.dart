import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/InputForm.dart';
import '../widgets/TicketBar.dart';
import '../model/ticket_model.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ticket> trains = [];
  String status = '';

  void showResult(String deptature, String arrival, String date,
      String seat_class, String seat_count) {
    setState(() {
      status = 'Loading...';
      _showResult(deptature, arrival, date, seat_class, seat_count);
    });
  }

  Future _showResult(String deptature, String arrival, String date,
      String seat_class, String seat_count) async {
    print("$deptature $arrival $date $seat_class $seat_count");

    trains.clear();
    status = 'Loading';
    String url = 'www.esheba.cnsbd.com';
    final response = await http.get(Uri.https(url, '/v1/trains', {
      'journey_date': date,
      'from_station': deptature,
      'to_station': arrival,
      'class': seat_class,
      'adult': seat_count,
      'child': '0'
    }));
    var jsonData = jsonDecode(response.body);

    setState(() {
      for (var train in jsonData) {
        trains.add(Ticket(responseData: train));
      }
    });
    status = 'FOUND ${trains.length} TRAINS !';
    // print(trains[0].train_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1e212c),
        centerTitle: true,
        title: Text(
          "TICKET",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Color(0xff1e212c),
        child: ListView(
          children: [
            InputForm(
              onPress: (dept, arvl, date, s_class, s_count) =>
                  showResult(dept, arvl, date, s_class, s_count),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(15),
              child: Text(
                status,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff2fde37)),
              ),
            ),
            // TicketBar(trainName: 'DHUMKATU EXPRESS', time: "08:30 PM", price: "1550.00",),
            // TicketBar(trainName: 'BANALATA EXPRESS', time: "11:00 AM", price: "850.00",),
            // TicketBar(trainName: 'SILKCITY', time: "6:30 PM", price: "670.00",),
            // TicketBar(trainName: 'PADMA EXPRESS', time: "10:45 PM", price: "1260.00",),
            Column(
              children: trains.map((train) {
                return TicketBar(
                  id: trains.indexOf(train),
                  time: train.dpt_time,
                  trainName: train.train_name.replaceAll('_', ' '),
                  price: train.cost,
                  train_on: train.train_on,
                  train_left: train.train_left,
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}