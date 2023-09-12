import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon(
      {super.key,
      required this.bgColor,
      required this.onPressFunction,
      required this.textValue,
      required this.textColor,
      required this.iconColor,
      required this.icon,
      this.width,
      this.height});
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function onPressFunction;
  final String textValue;
  final Color textColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressFunction(),
      icon: Icon(icon, color: iconColor), //icon data for elevated button
      label: Text(textValue, style: context.bodySmall.copyWith(color: textColor)), //label text
    );
  }
}
