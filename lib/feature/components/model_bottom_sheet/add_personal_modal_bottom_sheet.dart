import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';

class AddPersonalModalBottomSheet extends StatelessWidget {
  const AddPersonalModalBottomSheet({
    super.key,
    required this.personalList,
    required this.shiftList,
    required this.selectPersonalFunction,
    required this.selectShiftFunction,
    required this.addPersonalFunction,
  });
  final List<String> personalList;
  final List<String> shiftList;
  final Function selectPersonalFunction;
  final Function selectShiftFunction;
  final Function addPersonalFunction;

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            _inputS(context, personalList, shiftList, selectPersonalFunction, selectShiftFunction),
            _buttons(context, addPersonalFunction),
          ],
        ),
      ),
    );
  }

  Expanded _inputS(context, personalList, shiftList, selectPersonalFunction, selectShiftFunction) {
    return Expanded(
      flex: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Text(
              AppStrings.personelEkle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.personelSeciniz,
                onChangedFunction: selectPersonalFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: personalList),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.vardiyaSeciniz,
                onChangedFunction: selectShiftFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: shiftList),
          ),
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
    properties.add(DiagnosticsProperty<Function>('saveEffort', addPersonalFunction));
  }
}
