import 'package:flutter/material.dart';

import '../../../core/constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../input_fields/text_field_date_picker.dart';
import '../input_fields/text_field_time_picker.dart';
import '../input_fields/text_fields_input_underline.dart';

class AddEffortsModalBottomSheet extends StatelessWidget {
  const AddEffortsModalBottomSheet({
    super.key,
    required this.selectedStartDate,
    required this.selectedEndtDate,
    required this.selectedEffortDuration,
    required this.selectedEffortType,
    required this.selectedDescription,
    required this.addEffortFunction,
  });
  final Function selectedStartDate;
  final Function selectedEndtDate;
  final Function selectedEffortDuration;
  final Function selectedEffortType;
  final Function selectedDescription;
  final Function addEffortFunction;

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              flex: 70,
              child: _Inputs(
                selectedStartDate: selectedStartDate,
                selectedEndDate: selectedEndtDate,
                selectedEffortDuration: selectedEffortDuration,
                selectedEffortType: selectedEffortType,
                selectedDescription: selectedDescription,
              ),
            ),
            Expanded(flex: 30, child: _InputButton(onPressed: addEffortFunction)),
          ],
        ),
      ),
    );
  }
}

class _InputButton extends StatelessWidget {
  const _InputButton({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomHalfButtons(
      leftTitle: const Text(AppStrings.cancel),
      rightTitle: const Text(AppStrings.approve),
      leftOnPressed: () => Navigator.pop(context),
      rightOnPressed: () {
        Navigator.pop(context);
        onPressed();
      },
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.selectedEffortDuration,
    required this.selectedEffortType,
    required this.selectedDescription,
  });

  final Function selectedStartDate;
  final Function selectedEndDate;
  final Function selectedEffortDuration;
  final Function selectedEffortType;
  final Function selectedDescription;

  final String _entryDate = 'Başlangıç Tarihi';
  final String _endDate = 'Bitiş Tarihi';
  final String _efortType = 'Çalışma Türü';
  final String _efortDuration = 'Çalışma Süresi';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: TextFieldDatePicker(
            label: _entryDate,
            onTap: (value) => selectedStartDate(value),
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldDatePicker(
            label: _endDate,
            onTap: (value) => selectedEndDate(value),
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldTimePicker(
            label: _efortDuration,
            onTap: (value) => selectedEffortDuration(value),
          ),
        ),
        Expanded(
          flex: 10,
          child: DropDownInputFields(
            labelText: _efortType,
            onChangedFunction: (value) => selectedEffortType(value),
            rightIcon: Icons.arrow_downward,
            dropDownArray: const ['Way', 'Working'],
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldsInputUnderline(
            hintText: 'Açıklama',
            onChanged: (value) => selectedDescription(value),
          ),
        )
      ],
    );
  }
}
