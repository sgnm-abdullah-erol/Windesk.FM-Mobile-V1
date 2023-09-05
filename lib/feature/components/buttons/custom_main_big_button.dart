import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../../core/constants/style/font_sizes.dart';
import '../../extensions/context_extension.dart';

class CustomMainBigButton extends StatelessWidget {
  const CustomMainBigButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.buttonBackgroundColor,
    this.buttonTextColor,
  });

  final Function onPressed;
  final String title;
  final Color? buttonBackgroundColor;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.4,
      height: context.height * 0.085,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor ?? APPColors.Login.blue,
          foregroundColor: buttonTextColor ?? APPColors.Main.white,
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(title, style: const TextStyle(fontSize: FontSizes.title)),
      ),
    );
  }
}
