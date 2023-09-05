import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/app_icons.dart';
import '../../../core/constants/other/app_strings.dart';
import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/dropdown_input_fields.dart';

class WoWaitTaskRejectModalBottomSheet extends StatelessWidget {
  const WoWaitTaskRejectModalBottomSheet({
    super.key,
    required this.textData,
    required this.inputArray,
    required this.inputArrayOnChangedFunction,
    required this.rejectModalAcceptFunction,
    required this.reejctModalRejectFunction,
    required this.inputArrayTextLabel,
  });
  final String textData;
  final String inputArrayTextLabel;
  final List<String> inputArray;
  final Function inputArrayOnChangedFunction;

  final Function rejectModalAcceptFunction;
  final Function reejctModalRejectFunction;

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _inputS(textData, inputArray, inputArrayTextLabel, inputArrayOnChangedFunction),
              ),
              Expanded(
                child: _buttons(context, rejectModalAcceptFunction, reejctModalRejectFunction),
              )
            ],
          ),
        ),
      ),
    );
  }

  _inputS(textData, inputArray, inputArrayTextLabel, inputArrayOnChangedFunction) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            textData.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: APPColors.Main.black),
          ),
        ),
        Expanded(
          child: DropDownInputFields(
              labelText: inputArrayTextLabel,
              onChangedFunction: inputArrayOnChangedFunction,
              rightIcon: AppIcons.arrowDown,
              dropDownArray: inputArray),
        ),
      ],
    );
  }

  _buttons(context, Function acceptFunction, rejectFunction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomHalfButtons(
            leftTitle: const Text(AppStrings.cancel),
            rightTitle: const Text(AppStrings.save),
            leftOnPressed: rejectFunction,
            rightOnPressed: acceptFunction)
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('saveEffort', rejectModalAcceptFunction));
  }
}
