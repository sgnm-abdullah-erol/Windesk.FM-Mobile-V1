// ignore: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_image_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/create_check_item_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/custom_scope_check_item_card.dart';

mixin CustomScopeCheckItemCardMixin on State<CustomScopeCheckItemCard> {
  // controllers
  final TextEditingController initialController = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();

  // variables
  bool selectedValue = false;
  bool isDocumentMutation = false;
  String token = '';

  CreateCheckItemValue? _setCreateCheckItemModel(Map<String, dynamic>? data) {
    if (data != null || data?['createCheckItemValue'] != null) {
      return CreateCheckItemValue.fromJson(data?['createCheckItemValue']);
    }
    return null;
  }

  void completedMutationAction(BuildContext context, Map<String, dynamic>? data) {
    if (!isDocumentMutation && data != null) {
      final model = _setCreateCheckItemModel(data);
      if (model != null && model.id != null) {
        snackBar(context, LocaleKeys.SuccessProcess.tr(), 'success');
      } else {
        snackBar(context, LocaleKeys.UnSuccessProcess.tr(), 'error');
      }
    } else {
      setState(() => isDocumentMutation = false);
      // fix this
      ShowModalBottomSheet().show(
        context,
        AddImageModalBottomSheet(
          taskId: data?['createCheckItemValue']['id'].toString() ?? '',
          taskKey: data?['createCheckItemValue']['key'] ?? '',
          saveImage: widget.provider.saveImage,
        ),
      );
    }
  }
}
