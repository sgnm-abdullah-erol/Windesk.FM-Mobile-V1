import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../../core/constants/style/custom_paddings.dart';
import '../../../core/constants/style/font_sizes.dart';
import '../../extensions/context_extension.dart';

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
              textStyle: context.labelLarge.copyWith(color: APPColors.Main.white, fontSize: FontSizes.button, letterSpacing: 1),
            ),
            onPressed: () {
              onPressed(context);
            },
            child: Text(title).tr(),
          ),
        ),
      ),
    );
  }
}
