import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {required this.text, this.onPressed, this.isActive = true, Key? key})
      : super(key: key);
  final String text;
  final Function()? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: primarycolor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: isActive ? onPressed : null,
        child: Text("$text"));
  }
}
