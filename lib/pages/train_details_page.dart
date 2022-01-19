import 'package:flutter/material.dart';
import 'package:train_ticket_checker/model/TimeConverter.dart';
import 'package:train_ticket_checker/model/ticket_model.dart';
import 'package:train_ticket_checker/widgets/DetailsView.dart';
import 'package:train_ticket_checker/widgets/RoutesView.dart';
import 'package:train_ticket_checker/widgets/TrainStatusIcon.dart';

class DetailsPage extends StatelessWidget {
  Ticket trainsData;
  int seat_count;

  DetailsPage({required this.trainsData, required this.seat_count});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1e212c),
        centerTitle: true,
        title: Text(
          trainsData.dpt_station + ' - ' + trainsData.arv_station,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TrainStatusIcon(
                        train_left: trainsData.train_left,
                        train_on: trainsData.train_on,
                        size: 40,
                        showTextStatus: false,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                Text(
                                  trainsData.train_name.replaceAll('_', ' '),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                trainsData.train_on
                                    ? trainsData.train_left
                                        ? Text(
                                            '(Train already left the station !)',
                                            style: TextStyle(
                                                color: Color(0xffecea4a),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : SizedBox()
                                    : Text(
                                        '(Train is off today !)',
                                        style: TextStyle(
                                            color: Color(0xffec654a),
                                            fontWeight: FontWeight.bold),
                                      )
                              ],
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
                details: seat_count != 1
                    ? [
                        {
                          'lable': '1 SEAT:',
                          'valueText':
                              (int.parse(trainsData.costWithoutFormatting) /
                                          seat_count)
                                      .toStringAsFixed(2) +
                                  ' TK'
                        },
                        {
                          'lable': '${seat_count} SEAT:',
                          'valueText': trainsData.costSingle
                        }
                      ]
                    : [
                        {
                          'lable': '1 SEAT:',
                          'valueText':
                              (int.parse(trainsData.costWithoutFormatting) /
                                          seat_count)
                                      .toStringAsFixed(2) +
                                  ' TK'
                        }
                      ],
                color: Color(0xff2fde37),
              ),
              SizedBox(
                height: 15,
              ),
              DetailsView(
                details: [
                  {
                    'lable': 'DEPARTURE:',
                    'valueText': TimeConverter.to24(trainsData.dpt_time)
                  },
                  {
                    'lable': 'ARRIVAL:',
                    'valueText': TimeConverter.to24(trainsData.arv_time)
                  },
                  {
                    'lable': 'DURATION:',
                    'valueText': trainsData.duration.toUpperCase()
                  },
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
              RoutesView(route: trainsData.routes)
            ],
          ),
        ),
      ),
    );
  }
}
