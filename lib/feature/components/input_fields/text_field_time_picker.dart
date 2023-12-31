import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/app_icons.dart';

class TextFieldTimePicker extends StatefulWidget {
  const TextFieldTimePicker(
      {super.key, required this.label, required this.onTap, this.disable});

  final bool? disable;
  final String label;
  final Function onTap;

  @override
  State<TextFieldTimePicker> createState() => _TextFieldTimePickerState();
}

class _TextFieldTimePickerState extends State<TextFieldTimePicker> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.bodyMedium,
      enabled: widget.disable ?? true,
      decoration: InputDecoration(
        icon: const Icon(AppIcons.time),
        labelText: widget.label.tr(),
        hintText: widget.label.tr(),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      readOnly: true,
      onTap: () async {
        final TimeOfDay? timeOfDay = await _timePicker(context);
        if (timeOfDay != null) {
          setState(() {
            _controller.text = '${timeOfDay.hour}:${timeOfDay.minute}';
          });
          widget.onTap(_controller.text);
        }
      },
    );
  }

  Future<TimeOfDay?> _timePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
  }
}
