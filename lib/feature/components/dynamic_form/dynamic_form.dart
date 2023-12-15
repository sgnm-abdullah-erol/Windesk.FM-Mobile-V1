// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_field_date_picker.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

class FormTypes {
  static const BOOLYES = 'BOOLYES';
  static const DATE = 'DATE';
  static const TEXT = 'TEXT';
  static const NUMBER = 'NUMBER';
}

class DynamicForm {
  Widget formType(
    String checkListSituation,
    String inputType,
    dynamic inputValue,
    bool selectedValue,
    Function setSelectedValue,
    Function selectDate,
    Function setInitialController,
    TextEditingController textEditingController,
    TextEditingController numberEditingController,
  ) {
    switch (inputType) {
      case FormTypes.BOOLYES:
        return _YesNoWidget(selectedValue, setSelectedValue, checkListSituation);
      case FormTypes.DATE:
        return _DateWidget(setInitialController, selectDate, checkListSituation, inputValue);
      case FormTypes.TEXT:
        return _TextWidget(textEditingController, inputValue, checkListSituation);
      case FormTypes.NUMBER:
        return _NumberWidget(numberEditingController, inputValue, checkListSituation);
      default:
        return const Text('');
    }
  }
}

class _NumberWidget extends StatelessWidget {
  const _NumberWidget(this.numberEditingController, this.inputValue, this.checkListSituation);

  final TextEditingController numberEditingController;
  final dynamic inputValue;
  final String checkListSituation;

  @override
  Widget build(BuildContext context) {
    numberEditingController.text = inputValue.toString();
    return TextFormField(
      readOnly: checkListSituation == 'Finished',
      keyboardType: TextInputType.number,
      controller: numberEditingController,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: LocaleKeys.EnterNumber.tr(),
        labelStyle: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget(this.textEditingController, this.inputValue, this.checkListSituation);

  final TextEditingController textEditingController;
  final dynamic inputValue;
  final String checkListSituation;

  @override
  Widget build(BuildContext context) {
    textEditingController.text = inputValue.toString();
    return TextFormField(
      readOnly: checkListSituation == 'Finished',
      controller: textEditingController,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: LocaleKeys.EnterDescription.tr(),
        labelStyle: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget(this.setInitialController, this.selectDate, this.checkListSituation, this.inputValue);

  final Function setInitialController;
  final Function selectDate;
  final String checkListSituation;
  final dynamic inputValue;

  @override
  Widget build(BuildContext context) {
    return TextFieldDatePicker(
      readOnly: checkListSituation == 'Finished',
      label: inputValue ?? LocaleKeys.Date.tr(),
      onTap: (value) => selectDate(value),
      initialDate: DateTime(2015),
      initialControllerFunction: setInitialController,
    );
  }
}

class _YesNoWidget extends StatelessWidget {
  const _YesNoWidget(this.selectedValue, this.setSelectedValue, this.checkListSituation);

  final bool selectedValue;
  final Function setSelectedValue;
  final String checkListSituation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.width/3,
          child: ListTile(
            enabled: checkListSituation == 'Finished',
            title: Text(LocaleKeys.Yes.tr(), style: const TextStyle(color: Colors.black)),
            leading: Radio<bool>(
                value: true,
                groupValue: selectedValue,
                onChanged: (bool? value) => {
                      if (checkListSituation != 'Finished') {setSelectedValue()},
                    }),
          ),
        ),
        SizedBox(
          width: context.width/3,
          child: ListTile(
            enabled: checkListSituation == 'Finished',
            title: Text(LocaleKeys.No.tr(), style: const TextStyle(color: Colors.black)),
            leading: Radio<bool>(
              value: false,
              groupValue: selectedValue,
              onChanged: (bool? value) {
                if (checkListSituation != 'Finished') {
                  setSelectedValue();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
