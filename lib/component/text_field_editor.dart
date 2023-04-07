import 'package:flutter/material.dart';
import 'package:project_name/themes/themes_colors.dart';

class TextFieldEditor extends StatelessWidget {
  TextFieldEditor({
    super.key,
    required this.controller,
    required this.labelText,
    required this.suffixIcon,
    required this.keyboardType,
  });
  TextEditingController controller;
  String labelText;
  Widget suffixIcon;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: ThemeColors.a.withOpacity(0.9)),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: ThemeColors.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: ThemeColors.a), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: ThemeColors.t), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
