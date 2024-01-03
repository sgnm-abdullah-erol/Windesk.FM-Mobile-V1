import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../../core/constants/other/app_icons.dart';

class TextFieldDatePicker extends StatefulWidget {
  const TextFieldDatePicker({
    super.key,
    required this.label,
    required this.onTap,
    required this.initialDate,
    this.initialControllerFunction,
    this.lastDate,
    this.readOnly,
  });

  final String label;
  final Function onTap;
  final DateTime initialDate;
  final DateTime? lastDate;
  final Function? initialControllerFunction;
  final bool? readOnly;

  @override
  State<TextFieldDatePicker> createState() => _TextFieldDatePickerState();
}

class _TextFieldDatePickerState extends State<TextFieldDatePicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: context.bodyMedium,
      decoration: InputDecoration(
        labelText: widget.label.tr(),
        icon: const Icon(AppIcons.calendarToday),
        hintText: widget.label.tr(),
        hintStyle: context.bodyMedium,
        labelStyle: context.bodyMedium,
      ),
      readOnly: true,
      onTap: () async {
        if (widget.readOnly ?? false) {
        } else {
          final DateTime? date = await _datePicker(
              context, widget.initialDate, widget.lastDate ?? DateTime.now());
          if (date != null) {
            setState(() {
              if (widget.initialControllerFunction != null) {
                widget.initialControllerFunction!(date.toLocal().toString());
              }
              _controller.text = date.toString().split(' ')[0];
            });
          }
          widget.onTap(_controller.text);
        }
      },
    );
  }

  Future<DateTime?> _datePicker(
      BuildContext context, DateTime initialDate, DateTime lastDate) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: initialDate,
      lastDate: lastDate,
    );
  }
}
