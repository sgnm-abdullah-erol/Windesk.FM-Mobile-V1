import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import '../../../core/localization/app_localization.dart';
import '../../../generated/locale_keys.g.dart';

import '../../../core/constants/style/border_radius.dart';

enum DeleteItemType { effort, material, materialRequest, documant }

extension DeleteItemTypeExtension on DeleteItemType {
  String rawText(BuildContext context) {
    switch (this) {
      case DeleteItemType.effort:
        return LocaleKeys.Effort.tr();
      case DeleteItemType.material:
        return LocaleKeys.Material.tr();
      case DeleteItemType.materialRequest:
        return LocaleKeys.MaterialRequests.tr();
      case DeleteItemType.documant:
        return LocaleKeys.Document.tr();
      default:
        return "";
    }
  }
}

class WorkOrderDeleteItemAlertDialog {
  static Future<bool> deleteWorkOrderAlertDialog(BuildContext context, DeleteItemType type, int id) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: Text(LocaleKeys.DeleteWorkOrderItem.tr(), style: context.bodyMedium),
          content: Flexible(
            child: Text(
              context.locale == AppLocalization.supportedLocales.first
                  ? "$id id'li ${type.rawText(context)}  ${LocaleKeys.DeleteWorkOrderItemLabel.tr()}"
                  : '${LocaleKeys.DeleteWorkOrderItemLabel.tr()} ${type.rawText(context)} with $id id will be deleted.',
              style: context.labelMedium,
              maxLines: 3,
              textAlign: TextAlign.justify,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(LocaleKeys.Cancel.tr()),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(LocaleKeys.Delete.tr()),
            ),
          ],
        );
      },
    );
  }
}
