import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/other/snackbar_strings.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../product/screens/home/screens/detail_work_order/provider/work_order_add_material_sheet_provider.dart';
import '../../../product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../input_fields/text_fields_input_underline.dart';
import '../snackBar/snackbar.dart';

class AddMaterialModalBottomSheet extends StatelessWidget {
  const AddMaterialModalBottomSheet({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderAddMaterialSheetProvider(),
          child: Consumer<WorkOrderAddMaterialSheetProvider>(builder: ((context, value, child) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              value.isInventoryFetched ? null : value.getUserInventory();
              value.isMaterialAdded ? snackBar(context, SnackbarStrings.materialAdded, 'success') : null;
            });

            return value.isLoading ? const CustomLoadingIndicator() : _bodyWidget(context, value);
          })),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context, WorkOrderAddMaterialSheetProvider value) {
    return Column(
      children: [
        Expanded(flex: 70, child: _Inputs(value.workSpaceUserInventoryLabelList, value)),
        Expanded(
          flex: 70,
          child: CustomHalfButtons(
            leftTitle: const Text(LocaleKeys.Cancel).tr(),
            rightTitle: const Text(LocaleKeys.Approve).tr(),
            leftOnPressed: () => Navigator.of(context).pop(),
            rightOnPressed: () {
              value.addSparepart(taskId);
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs(this.wareHouseList, this.value);

  final List<String> wareHouseList;
  final WorkOrderAddMaterialSheetProvider value;

  final String _materialList = 'Malzeme Listesi';
  final String _wantedMaterialAmount = 'Malzeme Miktari';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: DropDownInputFields(
            labelText: _materialList,
            onChangedFunction: value.setHintTexts,
            rightIcon: Icons.arrow_downward,
            dropDownArray: wareHouseList.isEmpty ? [''] : wareHouseList,
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: (val) {},
            hintText: value.hintAmount,
            enabled: false,
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: (val) {},
            hintText: value.hintUnit,
            enabled: false,
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: value.changeWantedMaterialAmount,
            hintText: _wantedMaterialAmount,
            enabled: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ],
    );
  }
}
