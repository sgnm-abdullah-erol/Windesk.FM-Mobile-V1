import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/style/font_sizes.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';

class DropDownInputFields extends StatelessWidget {
  const DropDownInputFields({
    super.key,
    required this.labelText,
    required this.onChangedFunction,
    required this.rightIcon,
    required this.dropDownArray,
    this.value,
  });

  final String labelText;
  final Function onChangedFunction;
  final IconData rightIcon;
  final List<String> dropDownArray;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: CustomBorderRadius.textFieldBorderRadius,
          borderSide: BorderSide(color: APPColors.Main.black, width: 4),
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSizes.subtitle),
      ),
      items: dropDownArray.map((String items) {
        return DropdownMenuItem(
          value: value ?? items,
          child: Text(
            items,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSizes.body),
          ),
        );
      }).toList(),
      onChanged: (newValue) => onChangedFunction(newValue),
    );
  }
}
