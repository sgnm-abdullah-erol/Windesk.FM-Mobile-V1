// ignore: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/create_check_item_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/widgets/custom_support_check_item_card.dart';

mixin CustomSupportCheckItemCardMixin on State<CustomSupportCheckItemCard> {
  // controllers
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();
  final TextEditingController initialController = TextEditingController();

  // variables
  bool isDocumentMutation = false;
  String token = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
  }

  CreateCheckItemValue? _setCreateCheckItemModel(Map<String, dynamic>? data) {
    if (data != null || data?['createCheckItemValue'] != null) {
      return CreateCheckItemValue.fromJson(data?['createCheckItemValue']);
    }
    return null;
  }

  void completedMutationAction(BuildContext context, Map<String, dynamic>? data) {
    if (data != null) {
      final model = _setCreateCheckItemModel(data);
      if (model != null && model.id != null) {
        snackBar(context, LocaleKeys.SuccessProcess.tr(), 'success');
        _isLoading = true;
      } else {
        snackBar(context, LocaleKeys.UnSuccessProcess.tr(), 'error');
      }
    }
  }
}
