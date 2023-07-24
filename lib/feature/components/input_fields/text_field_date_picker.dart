import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/app_icons.dart';

class TextFieldDatePicker extends StatefulWidget {
  const TextFieldDatePicker({super.key, required this.label, required this.onTap});

  final String label;
  final Function onTap;

  @override
  State<TextFieldDatePicker> createState() => _TextFieldDatePickerState();
}

class _TextFieldDatePickerState extends State<TextFieldDatePicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        icon: const Icon(AppIcons.calendarToday),
        hintText: widget.label,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      readOnly: true,
      onTap: () async {
        final DateTime? date = await _datePicker(context);

        if (date != null) {
          setState(() {
            _controller.text = date.toString().split(' ')[0];
          });
        }
        widget.onTap(_controller.text);
      },
    );
  }

  Future<DateTime?> _datePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
  }
}
