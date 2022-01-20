import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  final String lable;
  final Gradient gradient;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Function onPressed;
  final bool enabled;

  const GradientElevatedButton(
      {required this.lable,
      required this.gradient,
      this.width = double.infinity,
      this.height = 50.0,
      this.padding = const EdgeInsets.all(8),
      required this.onPressed,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
          border: !enabled
              ? Border.all(
                  color: Color(0xffec654a), width: 2, style: BorderStyle.solid)
              : Border.all(color: Colors.transparent)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            splashFactory:
                enabled ? InkSplash.splashFactory : NoSplash.splashFactory,
            onTap: enabled ? () => onPressed() : () {},
            borderRadius: BorderRadius.circular(15),
            child: Center(
              child: Text(
                lable,
                style: TextStyle(
                    color: Color(0xfff6f9f8),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )),
      ),
    );
  }
}
