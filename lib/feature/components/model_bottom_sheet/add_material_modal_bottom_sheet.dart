import 'package:easy_localization/easy_localization.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../product/screens/home/screens/detail_work_order/provider/work_order_add_material_sheet_provider.dart';
import '../../../product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/text_fields_input_underline.dart';

class AddMaterialModalBottomSheet extends StatelessWidget {
  const AddMaterialModalBottomSheet({super.key, required this.taskId, required this.function});

  final String taskId;
  final Function function;

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
            leftTitle: Text(LocaleKeys.Cancel.tr()),
            rightTitle: Text(LocaleKeys.Approve.tr()),
            leftOnPressed: () => Navigator.of(context).pop(),
            rightOnPressed: () async {
              // Navigator.of(context).pop();
              value.addSparepart(context, taskId);
              // function(context, value.wantedMaterialAmount, value.choosenMaterial, taskId);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              searchDelay: const Duration(milliseconds: 0),
              showSearchBox: true,
              showSelectedItems: true,
              listViewProps: const ListViewProps(scrollDirection: Axis.vertical, shrinkWrap: true),
              itemBuilder: (BuildContext context, String item, bool isSelected) {
                return ListTile(
                  title: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isSelected ? APPColors.Main.red : APPColors.Main.black),
                  ),
                );
              },
            ),
            items: wareHouseList.isEmpty ? [''] : wareHouseList,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.left,
              dropdownSearchDecoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.bodySmall,
                labelText: LocaleKeys.MaterialList.tr(),
              ),
            ),
            onChanged: (String? val) {
              if (val != null) value.setHintTexts(val);
            },
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
            hintText: LocaleKeys.WantedMaterialAmount.tr(),
            enabled: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ],
    );
  }
}
