import 'package:flutter/material.dart';
import 'package:train_ticket_checker/widgets/GradientElevatedButton.dart';
import 'package:train_ticket_checker/widgets/CustomInputField.dart';

class InputForm extends StatelessWidget {
  static const double horizontalPadding = 15;
  static const double verticalPadding = 10;

  Function onPress;

  String departure = '';
  String arrival = '';
  String date = '';
  String seat_class = '';
  String seat_count = '';

  InputForm({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: CustomInputField(
            hintText: 'Station name',
            labelText: 'Departure',
            icon: Icons.arrow_back_rounded,
            onSaved: (result) => departure = result,
          ),
        ),
        // SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: CustomInputField(
            hintText: 'Station name',
            labelText: 'Arrival',
            icon: Icons.arrow_forward_rounded,
            onSaved: (result) => arrival = result,
          ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  horizontalPadding, verticalPadding, 0, verticalPadding),
              child: CustomInputField(
                hintText: '15/01/2021',
                labelText: 'Date',
                icon: Icons.date_range_rounded,
                width: 175,
                onSaved: (result) => date = result,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  0, verticalPadding, horizontalPadding, verticalPadding),
              child: CustomInputField(
                hintText: 'Enter class name',
                labelText: 'Pick a Class',
                width: 175,
                onSaved: (result) => seat_class = result,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  horizontalPadding, verticalPadding, 0, verticalPadding),
              child: CustomInputField(
                  hintText: '1-4',
                  labelText: 'Ticket Count',
                  icon: Icons.chair_alt_rounded,
                  width: 175,
                  onSaved: (result) => seat_count = result),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  0, verticalPadding, horizontalPadding, verticalPadding),
              child: GradientElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  onPress(departure, arrival, date, seat_class, seat_count);
                },
                height: 45,
                width: 150,
                padding: EdgeInsets.fromLTRB(
                    horizontalPadding, verticalPadding, 0, verticalPadding),
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff0896ef), Color(0xff44d2ed)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                child: Text(
                  "CHECK",
                  style: TextStyle(
                      color: Color(0xfff6f9f8),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
