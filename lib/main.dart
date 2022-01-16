// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './widgets/InputForm.dart';
import './widgets/TicketBar.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff1e212c),
          centerTitle: true,
          title: Text("TICKET", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Container(
          color: Color(0xff1e212c),
          child: ListView(
            children: [
              InputForm(),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                child: Text(
                  "FOUND 4 TRAINS !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2fde37)
                  ),
                ),
              ),
              TicketBar(trainName: 'DHUMKATU EXPRESS', time: "08:30 PM", price: "1550.00",),
              TicketBar(trainName: 'BANALATA EXPRESS', time: "11:00 AM", price: "850.00",),
              TicketBar(trainName: 'SILKCITY', time: "6:30 PM", price: "670.00",),
              TicketBar(trainName: 'PADMA EXPRESS', time: "10:45 PM", price: "1260.00",),
            ],
          ),
        ),
      )
    );
  }
}