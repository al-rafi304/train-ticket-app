import 'package:flutter/material.dart';
import 'package:train_ticket_checker/widgets/DetailsView.dart';
import 'package:train_ticket_checker/widgets/RoutesView.dart';
import 'package:train_ticket_checker/widgets/TrainStatusIcon.dart';

class DetailsPage extends StatelessWidget {
  var trainsData;

  DetailsPage({required this.trainsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1e212c),
        centerTitle: true,
        title: Text(
          "DHAKA - RAJSHAHI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xff1e212c),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              //Title Container
              Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff2c3043),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TrainStatusIcon(
                        train_left: true,
                        train_on: true,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "DHUMKATU EXPRESS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 80,
                child: VerticalDivider(
                  thickness: 5,
                  color: Color(0xff2c3043),
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              DetailsView(
                details: [
                  {'lable': 'PRICE 1x', 'valueText': '360.00 TK'},
                  {'lable': 'PRICE 3x', 'valueText': '1080.00 TK'},
                ],
                color: Color(0xff2fde37),
              ),
              SizedBox(
                height: 15,
              ),
              DetailsView(
                details: [
                  {'lable': 'DEPARTURE:', 'valueText': '8:00 AM'},
                  {'lable': 'ARRIVAL:', 'valueText': '11:40 AM'},
                  {'lable': 'DURATION:', 'valueText': '5 HOUR 40 MINS'},
                ],
                color: Color(0xffec654a),
              ),
              SizedBox(
                height: 60,
                child: VerticalDivider(
                  thickness: 5,
                  color: Color(0xff2c3043),
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              RoutesView(
                route: [
                  {'int_stn': 'DHAKA', 'dpt_time': '6:30 AM'},
                  {
                    'int_stn': 'BIMAN BANDAR',
                    'dpt_time': '7:30 AM',
                  },
                  {
                    'int_stn': 'BIMAN BANDAR',
                    'dpt_time': '7:30 AM',
                    'last_stn': true
                  },
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
