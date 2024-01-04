import 'package:flutter/material.dart';

import '../../../../../../core/constants/other/colors.dart';

class CustomLoadingIndicator2 extends StatelessWidget {
  const CustomLoadingIndicator2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(color: APPColors.Main.blue)),
        ],
      ),
    );
  }
}
