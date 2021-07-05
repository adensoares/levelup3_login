import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.icon,
    this.labelText,
    this.border,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.hintText,
  }) : super(key: key);

  final String? labelText;
  final Widget? icon;
  final InputBorder? border;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        icon: widget.icon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: InputBorder.none,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
