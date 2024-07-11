import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.obscure = false,
      this.inputType})
      : super(key: key);

  String? hintText;
  TextInputType? inputType;
  bool? obscure;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType, // to specify the type of the keyboard
      obscureText: obscure!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
