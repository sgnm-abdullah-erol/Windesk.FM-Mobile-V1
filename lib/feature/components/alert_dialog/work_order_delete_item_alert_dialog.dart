import 'package:flutter/material.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../core/constants/style/border_radius.dart';

enum DeleteItemType { effort, material, materialRequest, workOrder }

class WorkOrderDeleteItemAlertDialog {
  Future<bool> deleteWorkOrderAlertDialog(BuildContext context, DeleteItemType type) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
          title: const Text(LocaleKeys.DeliveredMaterialsList),
        );
      },
    );
  }
}
