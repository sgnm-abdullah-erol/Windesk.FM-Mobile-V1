import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../../constants/other/app_icons.dart';
import '../../constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';

class AddMaterialModalBottomSheet extends StatelessWidget {
  const AddMaterialModalBottomSheet({
    super.key,
    required this.wareHouseList,
    required this.productList,
    required this.unitList,
    required this.selectWareHouseFunction,
    required this.selectProductFunction,
    required this.selectUnitFunction,
    required this.saveAmountFunction,
    required this.addMaterial,
  });
  final List<String> wareHouseList;
  final List<String> productList;
  final List<String> unitList;
  final Function selectWareHouseFunction;
  final Function selectProductFunction;
  final Function selectUnitFunction;
  final Function saveAmountFunction;
  final Function addMaterial;
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
            _inputS(
                context,
                wareHouseList,
                selectWareHouseFunction,
                productList,
                selectProductFunction,
                unitList,
                selectUnitFunction,
                saveAmountFunction),
            _buttons(context, addMaterial),
          ],
        ),
      ),
    );
  }

  Expanded _inputS(context, wareHouseList, selectWareHouseFunction, productList,
      selectProductFunction, unitList, selectUnitFunction, saveAmountFunction) {
    return Expanded(
      flex: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Text(
              AppStrings.addMaterial,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.chooseWareHouse,
                onChangedFunction: selectWareHouseFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: wareHouseList),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.chooseProduct,
                onChangedFunction: selectProductFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: productList),
          ),
          Expanded(
            child: DropDownInputFields(
                labelText: AppStrings.chooseUnit,
                onChangedFunction: selectUnitFunction,
                rightIcon: AppIcons.arrowDown,
                dropDownArray: unitList),
          ),
          Expanded(
              child: TextFieldsInput(
                  onChangedFunction: saveAmountFunction,
                  labelText: AppStrings.enterAmount))
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
    properties.add(DiagnosticsProperty<Function>('saveEffort', addMaterial));
  }
}
