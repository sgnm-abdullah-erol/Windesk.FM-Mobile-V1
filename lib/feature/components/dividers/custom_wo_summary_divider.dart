import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

class CustomWoSummaryDivider extends StatelessWidget {
  const CustomWoSummaryDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: APPColors.Main.black, indent: 5, endIndent: 5, thickness: 1);
  }
}
