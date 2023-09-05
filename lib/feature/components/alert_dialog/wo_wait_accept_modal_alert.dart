import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../core/constants/style/border_radius.dart';

class WoWaitAcceptModalAlert {
  Future<bool?> showAlertDialog(BuildContext context, String textData, String title) async {
    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          content: Text(
            textData,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(overflow: TextOverflow.visible),
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
