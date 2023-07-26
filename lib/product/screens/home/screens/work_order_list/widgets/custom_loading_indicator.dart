import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
      child: Align(alignment: Alignment.center, child: CircularProgressIndicator(color: APPColors.Main.blue)),
    );
  }
}
