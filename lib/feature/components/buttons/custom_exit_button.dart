import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({required this.title, required this.onTap, super.key});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Text(title, style: context.labelMedium.copyWith(color: APPColors.Main.white)),
        onTap: () => onTap(),
      ),
    );
  }
}
