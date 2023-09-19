import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../../core/constants/style/border_radius.dart';
import '../../../generated/locale_keys.g.dart';

class WoWaitAcceptModalAlert {
  Future<bool?> showAlertDialog(BuildContext context, String textData, String title) async {
    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: Text(title, style: context.titleMedium).tr(),
          content: Flexible(
            child: Text(textData, style: context.bodySmall, maxLines: 3),
          ),
          actions: [
            TextButton(
              child: Text(LocaleKeys.Cancel.tr()),
              onPressed: () => context.router.pop<bool>(false),
            ),
            TextButton(
              child: Text(LocaleKeys.Approve.tr()),
              onPressed: () => context.router.pop<bool>(true),
            ),
          ],
        );
      },
    );
  }
}
