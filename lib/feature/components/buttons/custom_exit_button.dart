import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({required this.title, required this.onTap, super.key});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Text(
          title,
          style: TextStyle(color: APPColors.Main.white, fontSize: 16),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
