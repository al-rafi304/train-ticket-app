import 'package:flutter/material.dart';

class TrainStatusIcon extends StatelessWidget {
  final bool train_on;
  final bool train_left;
  final double size;
  final bool showTextStatus;

  const TrainStatusIcon({required this.train_left, required this.train_on, this.size = 35, this.showTextStatus = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.train_outlined,
            size: size,
            color: train_on
                ? train_left
                    ? Color(0xffecea4a) /*YELLOW*/ : Color(
                        0xff44d2ed) /*BLUE*/ : Color(0xffec654a) /*ORANGE*/
            ),
        showTextStatus ?
        train_on
            ? train_left
                ? Text("LEFT",
                    style: TextStyle(
                        color: Color(0xffecea4a) /*YELLOW*/,
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
                : SizedBox()
            : Text("OFF",
                style: TextStyle(
                    color: Color(0xffec654a) /*ORANGE*/,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))
            : SizedBox()
      ],
    );
  }
}
