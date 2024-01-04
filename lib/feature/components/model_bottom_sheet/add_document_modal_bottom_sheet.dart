import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/other/colors.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../product/screens/home/screens/detail_work_order/provider/work_order_add_documant_sheet_provider.dart';
import '../../../product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_circular_with_icon_button.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/text_fields_input.dart';

class AddDocumentsModalBottomSheet extends StatelessWidget {
  const AddDocumentsModalBottomSheet({super.key, required this.taskId, required this.taskKey, required this.function, this.labels});

  final String taskId;
  final String taskKey;
  final String? labels;
  final Function function;

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
              return value.isLoading
                  ? const Center(child: CustomLoadingIndicator())
                  : Column(
                      children: [
                        Expanded(flex: 20, child: _PickPdf(provider: value)),
                        value.isPdfPicked ? Expanded(flex: 20, child: Text(value.pdfPath.split('/').last)) : const SizedBox(),
                        Expanded(flex: 20, child: _DescField(value)),
                        Expanded(flex: 40, child: _ActionButtons(value, taskId, taskKey, function,labels)),
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

  @override
  Widget build(BuildContext context) {
    return TextFieldsInput(
      labelText: LocaleKeys.EnterDescription.tr(),
      onChangedFunction: (val) => provider.changeDesc,
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons(this.provider, this.taskId, this.taskKey, this.function, this.labels);

  final Function function;
  final String taskId;
  final String taskKey;
  final String? labels;
  final WorkOrderAddDocumantSheetProvider provider;

  @override
  Widget build(BuildContext context) {
    return CustomHalfButtons(
      leftTitle:  (LocaleKeys.Cancel),
      rightTitle:  (LocaleKeys.Approve),
      leftOnPressed: () => Navigator.of(context).pop(),
      rightOnPressed: () {
        function(context, provider.pdfPath, provider.pdfName, provider.desc, taskId, taskKey, labels);
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
