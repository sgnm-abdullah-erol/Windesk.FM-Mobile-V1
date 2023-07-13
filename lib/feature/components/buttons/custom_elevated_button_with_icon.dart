import 'package:flutter/material.dart';

class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon(
      {super.key,
      required this.bgColor,
      required this.onPressFunction,
      required this.textValue,
      required this.textColor,
      required this.iconColor,
      required this.icon});
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function onPressFunction;
  final String textValue;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ElevatedButton.icon(
      onPressed: () => onPressFunction(),
      icon: Icon(icon, color: iconColor), //icon data for elevated button
      label: Text(
        textValue,
        style: TextStyle(color: textColor),
      ), //label text
    ));
  }
}
