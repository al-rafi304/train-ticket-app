import 'package:flutter/material.dart';
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

  var routeData;
  List<String> fromStations = [];
  List<String> toStations = [];
  List<String> seats = [];

  @override
  void initState() {
    super.initState();
    setFromStations();
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
              hintText: 'Station name',
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
              hintText: 'Station name',
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
              child: CustomInputField(
                  hintText: '15/01/2021',
                  labelText: 'Date',
                  icon: Icons.date_range_rounded,
                  width: 175,
                  onSaved: (result) {
                    setState(() {
                      date = result;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, InputForm.verticalPadding,
                  InputForm.horizontalPadding, InputForm.verticalPadding),
              child: CustomAutocompleteField(
                  options: seats,
                  hintText: 'Enter class name',
                  labelText: 'Pick a Class',
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
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.onPress(
                      departure, arrival, date, seat_class, seat_count);
                },
                height: 45,
                width: 150,
                padding: EdgeInsets.fromLTRB(InputForm.horizontalPadding,
                    InputForm.verticalPadding, 0, InputForm.verticalPadding),
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
            ),
          ],
        ),
        // Autocomplete(
        //   optionsBuilder: (TextEditingValue textEditingValue) {
        //     if (textEditingValue.text == '') {
        //       return const Iterable<String>.empty();
        //     }
        //     return fromStations.where((String option) {
        //       return option.contains(textEditingValue.text.toUpperCase());
        //     });
        //   },
        //   fieldViewBuilder:
        //       (context, controller, focusNode, onEditingComplete) {
        //     return TextFormField(
        //       controller: controller,
        //       focusNode: focusNode,
        //       onEditingComplete: onEditingComplete,
        //       cursorColor: Colors.white,
        //       style: const TextStyle(color: Colors.white),
        //       onChanged: (result) => {print(result)},
        //       decoration: InputDecoration(
        //           constraints: BoxConstraints(maxWidth: 250),
        //           labelText: 'lable',
        //           hintText: 'hint',
        //           floatingLabelStyle: TextStyle(color: Color(0xFF0896ef)),
        //           labelStyle: TextStyle(color: Color(0xff444968)),
        //           hintStyle: TextStyle(color: Color(0xff444968)),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(15),
        //             borderSide: BorderSide.none,
        //           ),
        //           filled: true,
        //           fillColor: Color(0xFF2a2d41)),
        //     );
        //   },
        // )
      ],
    );
  }
}
