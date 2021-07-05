import 'package:flutter/material.dart';

class ToggleVisibility extends StatelessWidget {
  const ToggleVisibility({
    Key? key,
    this.visible = false,
    this.onPressed,
  }) : super(key: key);

  final bool visible;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.visibility : Icons.visibility_off,
        color: Colors.blue.shade300,
      ),
      onPressed: onPressed,
    );
  }
}
