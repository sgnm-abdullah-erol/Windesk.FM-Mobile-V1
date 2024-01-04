import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../product/screens/home/screens/detail_work_order/provider/work_order_add_notes_sheet_provider.dart';

class AddNotesModalBottomSheet extends StatelessWidget {
  AddNotesModalBottomSheet({super.key, required this.taskId, required this.function});

  final TextEditingController _textEditingController = TextEditingController();
  final String taskId;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: ChangeNotifierProvider(
          create: (context) => WorkOrderAddNotesProvider(),
          child: Consumer<WorkOrderAddNotesProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                if (value.addNoteSuccess) {
                  value.addNoteSuccess = false;
                  snackBar(context, LocaleKeys.NoteAdded.tr(), 'success');
                  Navigator.of(context).pop();
                }

                if (value.errorAccur) {
                  value.errorAccur = false;
                  snackBar(context, LocaleKeys.AddNoteError.tr(), 'error');
                  Navigator.of(context).pop();
                }
              });
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _BodyWidget(
                      textEditingController: _textEditingController,
                      function: function,
                      taskId: taskId,
                      value: value,
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({required this.function, required this.taskId, required this.value, required this.textEditingController});

  final TextEditingController textEditingController;
  final Function function;
  final String taskId;
  final WorkOrderAddNotesProvider value;

  @override
  Widget build(BuildContext context) {
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
              hintText: LocaleKeys.EnterYourNotes.tr(),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        const Expanded(child: SizedBox()),
        Expanded(
          child: CustomHalfButtons(
            leftTitle: (LocaleKeys.Cancel),
            rightTitle: (LocaleKeys.Approve),
            leftOnPressed: () => Navigator.of(context).pop(),
            rightOnPressed: () async {
              value.addNote(context, taskId, textEditingController.text);
            },
          ),
        )
      ],
    );
  }
}
