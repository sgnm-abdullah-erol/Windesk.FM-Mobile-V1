import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/style/border_radius.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

class CustomRowAccordionButton extends StatelessWidget {
  const CustomRowAccordionButton({super.key, required this.onPressed, required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: CustomBorderRadius.mediumBorderRadius,
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(buttonTitle),
      ),
    );
  }
}
