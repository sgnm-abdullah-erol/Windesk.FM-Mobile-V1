import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../input_fields/dropdown_input_fields.dart';

class WoWaitRejectModalAlert {
  showAlertDialog(
      BuildContext context,
      String textData,
      String inputArrayLabelText,
      List<String> inputArray,
      Function inputArrayOnChangedFunction) {
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
      content: DropDownInputFields(
          labelText: inputArrayLabelText,
          onChangedFunction: inputArrayOnChangedFunction,
          rightIcon: AppIcons.arrowDown,
          dropDownArray: inputArray),
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
