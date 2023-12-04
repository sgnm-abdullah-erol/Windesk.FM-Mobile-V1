import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_field_date_picker.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

@immutable
class DynamicForm {
  Widget formType(String inputType, bool selectedValue, Function setSelectedValue, Function selectDate, Function setInitialController,
      TextEditingController textEditingController, TextEditingController numberEditingController) {
    switch (inputType) {
      case 'BOOLYES':
        return Column(
          children: [
            ListTile(
              title: const Text('True'),
              leading: Radio<bool>(
                value: true,
                groupValue: selectedValue,
                onChanged: (bool? value) => setSelectedValue(),
              ),
            ),
            ListTile(
              title: const Text('False'),
              leading: Radio<bool>(
                value: false,
                groupValue: selectedValue,
                onChanged: (bool? value) => setSelectedValue(),
              ),
            ),
          ],
        );
      case 'DATE':
        return TextFieldDatePicker(
          label: LocaleKeys.Date.tr(),
          onTap: (value) => selectDate(value),
          initialDate: DateTime(2015),
          initialControllerFunction: setInitialController,
        );
      case 'TEXT':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Lütfen açıklama giriniz.',
            ),
          ),
        );
      case 'NUMBER':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: numberEditingController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Lütfen sayı giriniz.',
            ),
          ),
        );
      default:
        return const Text('');
    }
  }
}
