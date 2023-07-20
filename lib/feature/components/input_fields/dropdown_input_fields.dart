import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/border_radius.dart';

class DropDownInputFields extends StatelessWidget {
  const DropDownInputFields({
    super.key,
    required this.labelText,
    required this.onChangedFunction,
    required this.rightIcon,
    required this.dropDownArray,
  });

  final String labelText;
  final Function onChangedFunction;
  final IconData rightIcon;
  final List<String> dropDownArray;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: dropDownArray.first,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          
            borderRadius: CustomBorderRadius.textFieldBorderRadius,
            borderSide: BorderSide(color: APPColors.Main.black, width: 4)),
        labelText: labelText,
      ),
      icon: Icon(rightIcon),
      items: dropDownArray.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: TextStyle(color: APPColors.Main.black),
          ),
        );
      }).toList(),
      onChanged: (newValue) => onChangedFunction(newValue),
    );
  }
}
