import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../../core/constants/other/app_icons.dart';

class TextFieldDatePicker extends StatefulWidget {
  const TextFieldDatePicker({super.key, required this.label, required this.onTap, required this.initialDate, this.initialControllerFunction});

  final String label;
  final Function onTap;
  final DateTime initialDate;
  final Function? initialControllerFunction;

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
        labelText: widget.label,
        icon: const Icon(AppIcons.calendarToday),
        hintText: widget.label,
        hintStyle: context.bodyMedium,
        labelStyle: context.bodyMedium,
      ),
      readOnly: true,
      onTap: () async {
        final DateTime? date = await _datePicker(context, widget.initialDate);
        print('date: ');
        print(date);

        if (date != null) {
          setState(() {
            if (widget.initialControllerFunction != null) {
              widget.initialControllerFunction!(date.toLocal().toString());
            }
            _controller.text = date.toString().split(' ')[0];
          });
        }
        widget.onTap(_controller.text);
      },
    );
  }

  Future<DateTime?> _datePicker(BuildContext context, DateTime initialDate) {
    print(initialDate);
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: initialDate,
      lastDate: DateTime.now(),
    );
  }
}
