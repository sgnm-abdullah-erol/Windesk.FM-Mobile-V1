import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_edit_sheet_provider.dart';

class EditNoteModalBottomSheet extends StatelessWidget {
  EditNoteModalBottomSheet({super.key, required this.taskId, required this.labelId, required this.hint});

  final TextEditingController _textEditingController = TextEditingController();
  final String taskId;
  final String labelId;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderEditSheetProvider(),
          child: Consumer<WorkOrderEditSheetProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                if (value.editNoteSuccess) {
                  value.editNoteSuccess = false;
                  snackBar(context, LocaleKeys.EditNoteSuccess.tr(), 'success');
                  Navigator.of(context).pop();
                }

                if (value.errorAccur) {
                  value.errorAccur = false;
                  snackBar(context, LocaleKeys.EditNoteError.tr(), 'error');
                  Navigator.of(context).pop();
                }
              });
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _BodyWidget(
                      textEditingController: _textEditingController,
                      taskId: taskId,
                      value: value,
                      labelId: labelId,
                      hint: hint,
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    required this.taskId,
    required this.value,
    required this.textEditingController,
    required this.labelId,
    required this.hint,
  });

  final TextEditingController textEditingController;
  final String taskId;
  final String labelId;
  final WorkOrderEditSheetProvider value;
  final String hint;

  @override
  Widget build(BuildContext context) {
    textEditingController.text = hint;
    return Column(
      children: [
        Expanded(
          child: TextFormField(
            controller: textEditingController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        const Expanded(child: SizedBox()),
        Expanded(
          child: CustomHalfButtons(
            leftTitle: Text(LocaleKeys.Cancel.tr()),
            rightTitle: Text(LocaleKeys.Approve.tr()),
            leftOnPressed: () => Navigator.of(context).pop(),
            rightOnPressed: () async {
              value.editNote(context, taskId, textEditingController.text, labelId);
            },
          ),
        )
      ],
    );
  }
}
