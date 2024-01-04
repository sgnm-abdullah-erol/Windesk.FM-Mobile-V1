import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../extensions/context_extension.dart';

class CustomHalfButtons extends StatelessWidget {
  const CustomHalfButtons({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftOnPressed,
    required this.rightOnPressed,
    this.leftColor,
    this.rightColor,
    this.buttonsWidth,
  });

  final String leftTitle;
  final String rightTitle;
  final Function leftOnPressed;
  final Function rightOnPressed;
  final Color? leftColor;
  final Color? rightColor;
  final double? buttonsWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonsWidth ?? context.width * 0.75,
      child: Row(
        children: [_leftButton(), const SizedBox(width: 10), _rightButton()],
      ),
    );
  }

  Expanded _leftButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => leftOnPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: leftColor ?? APPColors.Login.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: CustomBorderRadius.buttonMediumRadius,
              bottomLeft: CustomBorderRadius.buttonMediumRadius,
            ),
          ),
        ),
        child: Text(
          leftTitle,
          style: TextStyle(color: APPColors.Main.white),
          textAlign: TextAlign.center,
        ).tr(),
      ),
    );
  }

  Expanded _rightButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => rightOnPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: rightColor ?? APPColors.Login.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: CustomBorderRadius.buttonMediumRadius,
              bottomRight: CustomBorderRadius.buttonMediumRadius,
            ),
          ),
        ),
        child: Text(
          rightTitle,
          style: TextStyle(color: APPColors.Main.white),
          textAlign: TextAlign.center,
        ).tr(),
      ),
    );
  }
}
