import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../product/screens/home/screens/detail_work_order/provider/work_order_add_documant_sheet_provider.dart';
import '../../../product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/other/snackbar_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_circular_with_icon_button.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/text_fields_input.dart';
import '../snackBar/snackbar.dart';

class AddDocumentsModalBottomSheet extends StatelessWidget {
  const AddDocumentsModalBottomSheet({super.key, required this.taskId, required this.taskKey});

  final String taskId;
  final String taskKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderAddDocumantSheetProvider(),
          child: Consumer<WorkOrderAddDocumantSheetProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                if (value.isPdfAdded) {
                  snackBar(context, SnackbarStrings.pdfAdded, 'success');
                }
              });
              return value.isLoading
                  ? const Center(child: CustomLoadingIndicator())
                  : Column(
                      children: [
                        Expanded(flex: 20, child: _PickPdf(provider: value)),
                        value.isPdfPicked ? Expanded(flex: 20, child: Text(value.pdfPath.split('/').last)) : const SizedBox(),
                        Expanded(flex: 20, child: _DescField(value)),
                        Expanded(flex: 40, child: _ActionButtons(value, taskId, taskKey)),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _DescField extends StatelessWidget {
  const _DescField(this.provider);

  final WorkOrderAddDocumantSheetProvider provider;
  final String _description = 'Açıklama giriniz.';

  @override
  Widget build(BuildContext context) {
    return TextFieldsInput(
      labelText: _description,
      onChangedFunction: (val) => provider.changeDesc,
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons(this.provider, this.taskId, this.taskKey);

  final String taskId;
  final String taskKey;
  final WorkOrderAddDocumantSheetProvider provider;

  @override
  Widget build(BuildContext context) {
    return CustomHalfButtons(
      leftTitle: const Text(AppStrings.cancel),
      rightTitle: const Text(AppStrings.approve),
      leftOnPressed: () => Navigator.of(context).pop(),
      rightOnPressed: () {
        provider.savePdf(taskId, taskKey);
        Navigator.of(context).pop();
      },
    );
  }
}

class _PickPdf extends StatelessWidget {
  const _PickPdf({required this.provider});

  final WorkOrderAddDocumantSheetProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircularWithIconButton(
          bgColor: APPColors.Main.blue,
          icon: Icons.add_box,
          onPressFunction: provider.getPdf,
          iconColor: APPColors.Main.white,
        )
      ],
    );
  }
}
