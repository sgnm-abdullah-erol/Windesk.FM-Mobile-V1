import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../input_fields/text_fields_input_underline.dart';
import '../../extensions/context_extension.dart';
import '../../../product/screens/home/screens/detail_work_order/provider/work_order_request_material_sheet_provider.dart';

import '../../../product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/snackbar_strings.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../snackBar/snackbar.dart';

class RequestMaterialBottomSheet extends StatelessWidget {
  const RequestMaterialBottomSheet({super.key, required this.taskId, required this.workSpaceId});

  final String taskId;
  final String workSpaceId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.65,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderRequestMaterialSheetProvider(),
          child: Consumer<WorkOrderRequestMaterialSheetProvider>(builder: ((context, value, child) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              value.isInventoryFetched ? null : value.fetchRequestedMaterials();
              value.isWorkOrderMaterialRequested ? snackBar(context, SnackbarStrings.materialRequested, 'success') : null;
            });

            return value.isLoading ? const CustomLoadingIndicator() : _BodyWidget(value: value, workSpaceId: workSpaceId, taskId: taskId);
          })),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({required this.value, required this.workSpaceId, required this.taskId});

  final WorkOrderRequestMaterialSheetProvider value;
  final String workSpaceId;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 80, child: _Inputs(value: value)),
        Expanded(
          flex: 20,
          child: CustomHalfButtons(
            leftTitle: const Text(AppStrings.cancel),
            rightTitle: const Text(AppStrings.approve),
            leftOnPressed: () {
              Navigator.of(context).pop();
            },
            rightOnPressed: () {
              value.addRequestedMaterial(workSpaceId, taskId);
            },
          ),
        ),
      ],
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({required this.value});

  final WorkOrderRequestMaterialSheetProvider value;

  final String _subjectHint = 'Konu';
  final String _descriptionHint = 'Açıklama';
  final String _materialList = 'Malzeme Listesi';
  final String _wantedMaterialAmount = 'İstenen Malzeme Miktarı';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: TextFieldsInputUnderline(
            onChanged: value.changeSubject,
            hintText: _subjectHint,
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: value.changeSubject,
            hintText: _descriptionHint,
            maxLines: 3,
          ),
        ),
        Expanded(
          flex: 30,
          child: DropDownInputFields(
            labelText: _materialList,
            onChangedFunction: value.changeHintTexts,
            rightIcon: Icons.arrow_downward,
            dropDownArray: value.workSpaceUserInventoryLabelList,
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
