import 'package:flutter/material.dart';

class CustomAutocompleteField extends StatefulWidget {
  final List<String> options;
  final String hintText;
  final String labelText;
  final double height;
  final double width;
  final IconData icon;
  final Function(String) onSaved;
  final Function(String) onSelected;

  CustomAutocompleteField({
    required this.options,
    required this.hintText,
    required this.labelText,
    required this.onSaved,
    required this.onSelected,
    this.height = 45,
    this.width = double.infinity,
    this.icon = Icons.train_outlined,
  });

  @override
  State<CustomAutocompleteField> createState() => _CustomAutocompleteFieldState();
}

class _CustomAutocompleteFieldState extends State<CustomAutocompleteField> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        // if (textEditingValue.text == '') {
        //   return const Iterable<String>.empty();
        // }
        return widget.options.where((String option) {
          return option.contains(textEditingValue.text.toUpperCase());
        });
      },
      onSelected: widget.onSelected,
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextFormField(
          // horizontal: 15, vertical: 12
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          onChanged: (result) => widget.onSaved(result),
          decoration: InputDecoration(
              constraints: BoxConstraints(maxWidth: widget.width, maxHeight: widget.height),
              labelText: widget.labelText,
              hintText: widget.hintText,
              prefixIcon: Icon(
                widget.icon,
                color: Color(0xff44d2ed),
              ),
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
      },
    );
  }
}
