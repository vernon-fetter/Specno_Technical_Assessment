import 'package:flutter/material.dart';

class ButtonControl extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Function onTap;
  final Color? fontColor;

  const ButtonControl({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.onTap,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const StadiumBorder(),
        fixedSize: const Size(
          180,
          50,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: fontColor,
        ),
      ),
    );
  }
}
