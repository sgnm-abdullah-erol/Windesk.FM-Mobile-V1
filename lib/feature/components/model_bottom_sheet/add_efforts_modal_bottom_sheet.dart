import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';

class AddEffortsModalBottomSheet extends StatelessWidget {
  const AddEffortsModalBottomSheet(this.saveTime,
      {super.key,
      required this.addEffortFunction,
      required this.selectedTime,
      required this.dayArray,
      required this.hoursArray,
      required this.minuteArray});
  final Function saveTime;
  final Function addEffortFunction;
  final String selectedTime;
  final List<String> dayArray;
  final List<String> hoursArray;
  final List<String> minuteArray;
  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    final List<String> times = [
      "Lütfen Süre Seçiniz",
      "15 dk",
      "30 dk",
      "45 dk",
      "1 sa",
      "2 sa",
      "6 sa",
      "Serbest Seçim"
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            _inputS(context, saveTime, selectedTime, times, dayArray,
                hoursArray, minuteArray),
            _buttons(context, addEffortFunction),
          ],
        ),
      ),
    );
  }

  Expanded _inputS(context, Function saveTime, selectedTime, times, dayArray,
      hoursArray, minuteArray) {
    return Expanded(
      flex: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Text(
              AppStrings.addEffort,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.date,
                onChangedFunction: saveTime,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: times),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DropDownInputFields(
                      labelText: AppStrings.day,
                      onChangedFunction: saveTime,
                      rightIcon: AppIcons.arrowDown,
                      dropDownArray: dayArray),
                ),
                Expanded(
                  child: DropDownInputFields(
                      labelText: AppStrings.hour,
                      onChangedFunction: saveTime,
                      rightIcon: AppIcons.arrowDown,
                      dropDownArray: hoursArray),
                ),
                Expanded(
                  child: DropDownInputFields(
                      labelText: AppStrings.minute,
                      onChangedFunction: saveTime,
                      rightIcon: AppIcons.arrowDown,
                      dropDownArray: minuteArray),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buttons(context, Function addPhotoFunction) {
    return Expanded(
      flex: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHalfButtons(
              leftTitle: const Text(AppStrings.cancel),
              rightTitle: const Text(AppStrings.save),
              leftOnPressed: () {
                Navigator.pop(context);
              },
              rightOnPressed: addPhotoFunction)
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Function>('saveEffort', addEffortFunction));
  }
}
