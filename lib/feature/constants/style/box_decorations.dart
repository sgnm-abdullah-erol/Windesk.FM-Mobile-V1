import 'package:flutter/material.dart';

import '../other/colors.dart';
import 'border_radius.dart';


class WoListCardDecoration extends BoxDecoration {
  WoListCardDecoration()
      : super(
          borderRadius: CustomBorderRadius.mediumBorderRadius,
          boxShadow: const [BoxShadow(color: Color(0x19025273), blurRadius: 50, offset: Offset(6, 8))],
          color: APPColors.Main.white,
        );
}
