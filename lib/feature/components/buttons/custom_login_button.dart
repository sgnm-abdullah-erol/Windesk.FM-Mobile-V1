import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';
import '../../constants/style/custom_paddings.dart';
import '../../constants/style/font_sizes.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key, required this.title, required this.onPressed});

  final String title;
  final Function onPressed;

  final double _buttonWidth = 180;
  final double _buttonHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddings.onlyBottomMedium,
      child: Center(
        child: SizedBox(
          height: _buttonHeight,
          width: _buttonWidth,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: APPColors.Main.blue,
                foregroundColor: APPColors.Main.white,
                shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.largeBorderRadius),
                textStyle: const TextStyle(fontSize: FontSizes.button, fontFamily: 'Roboto', letterSpacing: 1)),
            onPressed: () {
              onPressed(context);
            },
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
