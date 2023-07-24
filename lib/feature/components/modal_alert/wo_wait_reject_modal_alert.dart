import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../input_fields/dropdown_input_fields.dart';

class WoWaitRejectModalAlert {
  Future<bool?> showAlertDialog(
    BuildContext context,
    String textData,
    String inputArrayLabelText,
    List<String> inputArray,
    Function inputArrayOnChangedFunction,
  ) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.warning, style: TextStyle(color: APPColors.Main.black)),
          content: DropDownInputFields(
            labelText: inputArrayLabelText,
            onChangedFunction: inputArrayOnChangedFunction,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: inputArray,
          ),
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
