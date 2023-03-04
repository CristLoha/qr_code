import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final int? maxLenght;
  final bool obscureText;
  final bool autoCorrect;
  final String labelText;
  const AppInput({
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.maxLenght,
    required this.autoCorrect,
    required this.obscureText,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      maxLength: maxLenght,
      controller: controller,
      obscureText: obscureText,
      autocorrect: autoCorrect,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
