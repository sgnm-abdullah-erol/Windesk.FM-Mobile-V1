import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';

class WoWaitAcceptModalAlert {
  Future<bool?> showAlertDialog(BuildContext context, String textData) async {
    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.warning, style: TextStyle(color: APPColors.Main.black)),
          content: Text(textData, style: TextStyle(color: APPColors.Main.black)),
          actions: [
            TextButton(
              child: const Text(AppStrings.reject),
              onPressed: () {
                context.router.pop<bool>(false);
              },
            ),
            TextButton(
              child: const Text(AppStrings.approve),
              onPressed: () {
                context.router.pop<bool>(true);
              },
            ),
          ],
        );
      },
    );
  }
}
