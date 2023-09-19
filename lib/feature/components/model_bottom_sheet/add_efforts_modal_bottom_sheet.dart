import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
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
  Widget build(BuildContext context) => _bodyWidget(context);

  Widget _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
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
      leftTitle: const Text(LocaleKeys.Cancel).tr(),
      rightTitle: const Text(LocaleKeys.Approve).tr(),
      leftOnPressed: () => Navigator.pop(context),
      rightOnPressed: () => {
        onPressed(context),
        Navigator.pop(context),
      },
    );
  }
}

class _Inputs extends StatefulWidget {
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

  @override
  State<_Inputs> createState() => _InputsState();
}

class _InputsState extends State<_Inputs> {
  final TextEditingController _initialController = TextEditingController();

  void setInitialController(String value) => setState(() {
        _initialController.text = value;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: TextFieldDatePicker(
            label: LocaleKeys.StartDate.tr(),
            onTap: (value) => widget.selectedStartDate(value),
            initialDate: DateTime(2015),
            initialControllerFunction: setInitialController,
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldDatePicker(
            label: LocaleKeys.EndDate.tr(),
            onTap: (value) => widget.selectedEndDate(value),
            initialDate: _initialController.text.isEmpty ? DateTime.now() : DateTime.parse(_initialController.text),
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldTimePicker(
            label: LocaleKeys.EffortDuration.tr(),
            onTap: (value) => widget.selectedEffortDuration(value),
          ),
        ),
        SizedBox(height: context.height * 0.02),
        Expanded(
          flex: 10,
          child: DropDownInputFields(
            labelText: LocaleKeys.EffortType.tr(),
            onChangedFunction: (value) => widget.selectedEffortType(value),
            rightIcon: Icons.arrow_downward,
            dropDownArray: [LocaleKeys.Way.tr(), LocaleKeys.Work.tr()],
          ),
        ),
        Expanded(
          flex: 10,
          child: TextFieldsInputUnderline(
            hintText: LocaleKeys.EnterDescription.tr(),
            onChanged: (value) => widget.selectedDescription(value),
          ),
        )
      ],
    );
  }
}
