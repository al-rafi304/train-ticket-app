import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Function onPressed;

  const GradientElevatedButton({
    required this.child,
    required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.padding = const EdgeInsets.all(8),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => onPressed,
            borderRadius: BorderRadius.circular(15),
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
