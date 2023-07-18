import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

class WoWaitRejectModalAlert {
  showAlertDialog(BuildContext context, String textData) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Reddet"),
      onPressed: () {
        context.router.pop<bool>(false);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Onayla"),
      onPressed: () {
        context.router.pop<bool>(true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'Uyarı',
        style: TextStyle(color: APPColors.Main.black),
      ),
      content: Text(
        textData,
        style: TextStyle(color: APPColors.Main.black),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
