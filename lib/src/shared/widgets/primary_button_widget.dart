import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue.shade300,
        shape: StadiumBorder(),
        shadowColor: Colors.blue.shade300,
      ),
    );
  }
}
