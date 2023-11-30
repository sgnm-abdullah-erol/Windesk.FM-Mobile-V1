import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class CustomCircleWithIconButton extends StatelessWidget {
  const CustomCircleWithIconButton({super.key, required this.bgColor, required this.icon, required this.onPressFunction, required this.iconColor, this.iconSize});
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final Function onPressFunction;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.15,
      height: context.width * 0.15,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.width * 0.3),
          ),
        ),
        onPressed: () => onPressFunction(),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize ?? 25.0,
        ),
      ),
    );
  }
}
