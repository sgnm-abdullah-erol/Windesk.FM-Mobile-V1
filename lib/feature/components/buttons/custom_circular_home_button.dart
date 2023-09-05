import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../../core/constants/style/font_sizes.dart';
import '../../extensions/context_extension.dart';

class CustomCircularHomeButton extends StatelessWidget {
  const CustomCircularHomeButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
    required this.isBadgeVisible,
    required this.badgeCount,
  });

  final Function onPressed;
  final String title;
  final Icon icon;
  final bool isBadgeVisible;
  final String badgeCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Stack(icon: icon, onPressed: onPressed, badgeCount: badgeCount, isBadgeVisible: isBadgeVisible),
        const SizedBox(height: 10),
        _Title(title: title),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: FontSizes.button, color: APPColors.Accent.blue),
      textAlign: TextAlign.center,
    ).tr();
  }
}

class _Stack extends StatelessWidget {
  const _Stack({required this.icon, required this.onPressed, required this.isBadgeVisible, required this.badgeCount});

  final Function onPressed;
  final Icon icon;
  final bool isBadgeVisible;
  final String badgeCount;
  final double _elevation = 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 8,
      width: context.height / 8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _elevatedButton(context),
          isBadgeVisible ? _badge() : const SizedBox(),
        ],
      ),
    );
  }

  Align _badge() {
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        backgroundColor: APPColors.Main.red,
        child: Text(badgeCount, style: TextStyle(color: APPColors.Main.white)),
      ),
    );
  }

  SizedBox _elevatedButton(BuildContext context) {
    return SizedBox(
      width: context.height / 9,
      height: context.height / 9,
      child: ElevatedButton(
        style: _elevatedButtonCustomStyle(),
        onPressed: () => onPressed(),
        child: icon,
      ),
    );
  }

  ButtonStyle _elevatedButtonCustomStyle() {
    return ElevatedButton.styleFrom(
      elevation: _elevation,
      shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.circularBorderRadius, side: BorderSide(color: APPColors.Secondary.blue)),
      backgroundColor: APPColors.Secondary.blue,
      foregroundColor: APPColors.Accent.blue,
    );
  }
}
