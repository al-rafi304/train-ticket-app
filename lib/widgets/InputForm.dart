import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:train_ticket_checker/model/StationDate.dart';
import 'package:train_ticket_checker/widgets/GradientElevatedButton.dart';
import 'package:train_ticket_checker/widgets/CustomInputField.dart';
import 'package:train_ticket_checker/widgets/CustomAutocompleteField.dart';

class InputForm extends StatefulWidget {
  static const double horizontalPadding = 15;
  static const double verticalPadding = 10;

  Function onPress;

  InputForm({required this.onPress});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String departure = '';

  String arrival = '';

  String date = '';

  String seat_class = '';

  String seat_count = '';

  String selectedDate = '';

  var routeData;
  List<String> fromStations = [];
  List<String> toStations = [];
  List<String> seats = [];

  @override
  void initState() {
    super.initState();
    setFromStations();
  }

  setDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 4)));

    if (selected != null) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(selected);
        print(selectedDate);
      });
    }
  }

  void setFromStations() async {
    var response = await StationData.fromStationsList();
    setState(() {
      fromStations = response;
    });
    print(fromStations);
  }

  void setRouteData(dpt) async {
    List<String> temp = [];
    var response = await StationData.routeData(dpt);

    for (var i = 0; i < response.length; i++) {
      temp.add(response[i]['dest']);
    }

    setState(() {
      routeData = response;
      toStations = temp;
      departure = dpt;
    });

    print('ROUTE DATA: ' + routeData[0].toString());
  }

  void setClassList(arv) {
    List<String> temp = [];
    for (var i = 0; i < routeData.length; i++) {
      if (routeData[i]['dest'] == arv) {
        for (var j = 0; j < routeData[i]['classes'].length; j++) {
          temp.add(routeData[i]['classes'][j]['class']);
        }
      }
    }

    setState(() {
      seats = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: InputForm.horizontalPadding,
              vertical: InputForm.verticalPadding),
          child: CustomAutocompleteField(
              options: fromStations,
              hintText: 'Pick Station',
              labelText: 'Departure',
              icon: Icons.arrow_back_rounded,
              onSelected: (result) {
                print(result);
                departure = result;
                setRouteData(result);
              },
              onSaved: (result) {
                setState(() {
                  departure = result;
                });
              }),
        ),
        // SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: InputForm.horizontalPadding,
              vertical: InputForm.verticalPadding),
          child: CustomAutocompleteField(
              options: toStations,
              hintText: 'Pick Station',
              labelText: 'Arrival',
              icon: Icons.arrow_forward_rounded,
              onSelected: (result) {
                arrival = result;
                setClassList(result);
              },
              onSaved: (result) {
                setState(() {
                  arrival = result;
                });
              }),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(InputForm.horizontalPadding,
                    InputForm.verticalPadding, 0, InputForm.verticalPadding),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: InputForm.horizontalPadding,
                      vertical: InputForm.verticalPadding),
                  height: 45,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Color(0xff2B2F42),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setDate(context);
                      },
                      child: Row(
                          children: selectedDate == ''
                              ? <Widget>[
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Color(0xff44D1EC),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "Select date",
                                      style: TextStyle(
                                          color: Color(0xff434867),
                                          fontSize: 17),
                                    ),
                                  ),
                                ]
                              : <Widget>[
                                  Icon(
                                    Icons.date_range_rounded,
                                    color: Color(0xff44D1EC),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      selectedDate,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                ]),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, InputForm.verticalPadding,
                  InputForm.horizontalPadding, InputForm.verticalPadding),
              child: CustomAutocompleteField(
                  options: seats,
                  hintText: 'Pick a class',
                  labelText: 'Seat Class',
                  width: 175,
                  onSelected: (result) {
                    setState(() {
                      seat_class = result;
                    });
                  },
                  onSaved: (result) {
                    setState(() {
                      seat_class = result;
                    });
                  }),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(InputForm.horizontalPadding,
                  InputForm.verticalPadding, 0, InputForm.verticalPadding),
              child: CustomInputField(
                  hintText: 'Maximum 4',
                  labelText: 'Ticket Count',
                  icon: Icons.chair_alt_rounded,
                  width: 175,
                  onSaved: (result) {
                    setState(() {
                      seat_count = result;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, InputForm.verticalPadding,
                  InputForm.horizontalPadding, InputForm.verticalPadding),
              child: GradientElevatedButton(
                lable: "CHECK",
                enabled: departure != '' &&
                        arrival != '' &&
                        selectedDate != '' &&
                        seat_class != '' &&
                        seat_count != ''
                    ? true
                    : false,
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.onPress(
                      departure, arrival, selectedDate, seat_class, seat_count);
                },
                height: 45,
                width: 150,
                padding: EdgeInsets.fromLTRB(InputForm.horizontalPadding,
                    InputForm.verticalPadding, 0, InputForm.verticalPadding),
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff0896ef), Color(0xff44d2ed)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
