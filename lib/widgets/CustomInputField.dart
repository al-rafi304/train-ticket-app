import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final double height;
  final double width;
  final IconData icon;
  final Function(String) onSaved;

  CustomInputField(
      {required this.hintText,
      required this.labelText,
      required this.onSaved,
      this.height = 45,
      this.width = double.infinity,
      this.icon = Icons.train_outlined,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // horizontal: 15, vertical: 12
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      onChanged: (result) => onSaved(result),
      decoration: InputDecoration(
          constraints: BoxConstraints(maxWidth: width, maxHeight: height),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Color(0xff44d2ed),),
          floatingLabelStyle: TextStyle(color: Color(0xFF0896ef)),
          labelStyle: TextStyle(color: Color(0xff444968)),
          hintStyle: TextStyle(color: Color(0xff444968)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xFF2a2d41)),
    );
  }
}
