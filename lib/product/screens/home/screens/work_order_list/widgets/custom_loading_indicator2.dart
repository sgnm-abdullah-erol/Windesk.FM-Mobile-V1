import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../feature/extensions/context_extension.dart';

class CustomLoadingIndicator2 extends StatelessWidget {
  const CustomLoadingIndicator2({super.key});

  final String _windesk = 'Windesk';
  final String _fm = 'FM';

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
