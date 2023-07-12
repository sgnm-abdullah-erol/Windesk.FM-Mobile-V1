import 'package:flutter/material.dart';
import '../../constants/style/border_radius.dart';
import '../../extensions/context_extension.dart';

class CustomCircularWithIconButton extends StatelessWidget {
  const CustomCircularWithIconButton(
      {super.key,
      required this.bgColor,
      required this.icon,
      required this.onPressFunction,
      required this.iconColor});
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final Function onPressFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.18,
      height: context.width * 0.15,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(CustomBorderRadius.buttonWithIconRadius)),
        ),
        onPressed: () => onPressFunction(),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
