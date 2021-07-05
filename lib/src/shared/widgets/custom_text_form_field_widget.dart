import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.icon,
    this.labelText,
    this.border,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final String? labelText;
  final Widget? icon;
  final InputBorder? border;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        labelText: labelText,
        border: InputBorder.none,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
