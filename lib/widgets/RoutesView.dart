import 'package:flutter/material.dart';
import 'package:train_ticket_checker/model/TimeConverter.dart';

class RoutesView extends StatelessWidget {
  final List route;

  RoutesView({required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
      decoration: BoxDecoration(
        color: Color(0xff2c3043),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ROUTES",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: route.map((station) {
                  return _Station(
                    stationName: station['int_stn'].replaceAll('_', ' '),
                    arvTime: station['dpt_time'] != null ? TimeConverter.to24(station['dpt_time']) : 'null',
                    lastStation: route.length - 1 == route.indexOf(station) ? true : false,
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}

class _Station extends StatelessWidget {
  final String stationName;
  final String arvTime;
  final bool lastStation;

  const _Station(
      {required this.stationName,
      required this.arvTime,
      this.lastStation = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Color(0xffecea4a),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                stationName,
                style: TextStyle(
                    color: Color(0xff1e212c),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                arvTime,
                style: TextStyle(
                  color: Color(0xff1e212c),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        !lastStation
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ">",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
