import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../../core/constants/style/border_radius.dart';
import '../../../generated/locale_keys.g.dart';

class TimePickerAlertDialog {
  static Future<String?> showAlertDialog(BuildContext context) async {
    int _hour = 0;
    int _minute = 0;
    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: Text('title', style: context.titleMedium).tr(),
          content: Row(
            children: [
              NumberPicker(
                minValue: 0,
                maxValue: 9999,
                value: _hour,
                onChanged: (val) {
                  _hour = val;
                },
              ),
              const SizedBox(width: 25),
              NumberPicker(
                minValue: 0,
                maxValue: 60,
                value: _minute,
                onChanged: (val) {
                  _minute = val;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(LocaleKeys.Cancel.tr()),
              onPressed: () => context.router.pop<String>(''),
            ),
            TextButton(
              child: Text(LocaleKeys.Approve.tr()),
              onPressed: () => context.router.pop<String>('00:00'),
            ),
          ],
        );
      },
    );
  }
}
