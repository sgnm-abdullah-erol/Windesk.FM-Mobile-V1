import 'package:flutter/material.dart';
import '../../constants/style/border_radius.dart';
import '../../extensions/context_extension.dart';

class CustomCircularWithTextButton extends StatelessWidget {
  const CustomCircularWithTextButton(
      {super.key,
      required this.bgColor,
      required this.onPressFunction,
      required this.textButton,
      required this.textColor});
  final Color bgColor;
  final Function onPressFunction;
  final String textButton;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * 0.15,
      width: context.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(CustomBorderRadius.buttonWithIconRadius)),
          ),
          onPressed: () => onPressFunction(),
          child: Text(
            textButton,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
