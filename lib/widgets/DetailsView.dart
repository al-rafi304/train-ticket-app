import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final List details;
  final Color color;

  const DetailsView({required this.details, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff2c3043),
      ),
      child: Column(
          children: details.map((item) {
        return DetailsViewRow(
            label: item['lable'], valueText: item['valueText'], color: color);
      }).toList()),
    );
  }
}

class DetailsViewRow extends StatelessWidget {
  final String label;
  final String valueText;
  final Color color;

  const DetailsViewRow(
      {required this.label, required this.valueText, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(15)),
              constraints: BoxConstraints(minWidth: 105, minHeight: 30),
              child: Text(
                valueText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xfff6f9f8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
