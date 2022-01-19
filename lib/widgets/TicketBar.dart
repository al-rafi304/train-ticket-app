import 'package:flutter/material.dart';
import 'package:train_ticket_checker/model/TimeConverter.dart';
import 'package:train_ticket_checker/widgets/TrainStatusIcon.dart';

class TicketBar extends StatelessWidget {
  final String time;
  final String trainName;
  final String price;
  final int id;
  final bool train_on;
  final bool train_left;

  TicketBar(
      {required this.id,
      required this.time,
      required this.trainName,
      required this.price,
      required this.train_on,
      required this.train_left});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      // padding: EdgeInsets.all(5),
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF2c3043),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TrainStatusIcon(train_left: train_left, train_on: train_on)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.amber,
                              constraints: BoxConstraints(maxWidth: 120),
                              child: Text(
                                trainName,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xfff6f9f8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                              child: Text(
                                "More >",
                                style: TextStyle(
                                    color: Color(0xff44d2ed), fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff2fde37),
                            borderRadius: BorderRadius.circular(15)),
                        constraints: BoxConstraints(minWidth: 100),
                        child: Text(
                          price + ' TK',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff6f9f8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xffec654a),
                            borderRadius: BorderRadius.circular(15)),
                        constraints: BoxConstraints(minWidth: 100),
                        child: Text(
                          TimeConverter.to24(time),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff6f9f8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
