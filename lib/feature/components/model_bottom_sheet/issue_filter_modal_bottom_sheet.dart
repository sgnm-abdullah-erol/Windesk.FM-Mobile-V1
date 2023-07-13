import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_circular_with_text_button.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_elevated_button_with_icon.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';

class IssueFilterModalBottomSheet extends StatelessWidget {
  const IssueFilterModalBottomSheet({
    super.key,
    required this.stateList,
    required this.buildList,
    required this.floorList,
    required this.wingList,
    required this.selectStateFunction,
    required this.selectBuildFunction,
    required this.selectFloorFunction,
    required this.selectWingFunction,
    required this.filterStartFunction,
    required this.taskForMeFunction,
    required this.selectedParamList,
    required this.selectedParamListDeleteItem,
  });
  final List<String> stateList;
  final List<String> buildList;
  final List<String> floorList;
  final List<String> wingList;
  final Function selectStateFunction;
  final Function selectBuildFunction;
  final Function selectFloorFunction;
  final Function selectWingFunction;
  final Function filterStartFunction;
  final Function taskForMeFunction;
  final List<String> selectedParamList;
  final Function selectedParamListDeleteItem;

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            _inputS(
                context,
                stateList,
                buildList,
                floorList,
                wingList,
                selectStateFunction,
                selectBuildFunction,
                selectFloorFunction,
                selectWingFunction,
                taskForMeFunction),
            _selectedParamS(selectedParamList, selectedParamListDeleteItem),
            _buttons(context, filterStartFunction),
          ],
        ),
      ),
    );
  }

  Expanded _inputS(
      context,
      stateList,
      buildList,
      floorList,
      wingList,
      selectStateFunction,
      selectBuildFunction,
      selectFloorFunction,
      selectWingFunction,
      taskForMeFunction) {
    return Expanded(
      flex: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomCircularWithTextButton(
                bgColor: APPColors.Login.blue,
                onPressFunction: taskForMeFunction,
                textButton: AppStrings.taskForMe,
                textColor: APPColors.Main.white),
          )),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.durum,
                onChangedFunction: selectStateFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: stateList),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.bina,
                onChangedFunction: selectBuildFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: buildList),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.kat,
                onChangedFunction: selectFloorFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: floorList),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.kanat,
                onChangedFunction: selectWingFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: wingList),
          ),
        ],
      ),
    );
  }

  Expanded _selectedParamS(selectedParamList, selectedParamListDeleteItem) {
    return Expanded(
        flex: 20,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i in selectedParamList)
                CustomElevatedButtonWithIcon(
                    bgColor: APPColors.Main.white,
                    onPressFunction: selectedParamListDeleteItem,
                    textValue: i,
                    textColor: APPColors.Main.black,
                    iconColor: APPColors.Main.red,
                    icon: Icons.clear),
            ],
          ),
        ));
  }

  Expanded _buttons(context, Function filterStartFunction) {
    return Expanded(
      flex: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHalfButtons(
              leftTitle: const Text(AppStrings.vazgec),
              rightTitle: const Text(AppStrings.kaydet),
              leftOnPressed: () {
                Navigator.pop(context);
              },
              rightOnPressed: filterStartFunction)
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Function>('saveEffort', filterStartFunction));
  }
}
