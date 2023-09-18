import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/app_icons.dart';
import '../../../core/constants/other/colors.dart';
import '../../../generated/locale_keys.g.dart';
import '../../extensions/context_extension.dart';
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
          title: Text(LocaleKeys.Warning.tr(), style: context.bodyMedium.copyWith(color: APPColors.Main.red)),
          content: DropDownInputFields(
            labelText: inputArrayLabelText.tr(),
            onChangedFunction: inputArrayOnChangedFunction,
            rightIcon: AppIcons.arrowDown,
            dropDownArray: inputArray,
          ),
          actions: [
            TextButton(
              child: const Text(LocaleKeys.Reject).tr(),
              onPressed: () => context.router.pop<bool>(false),
            ),
            TextButton(
              child: const Text(LocaleKeys.Approve).tr(),
              onPressed: () => context.router.pop<bool>(true),
            ),
          ],
        );
      },
    );
  }
}
