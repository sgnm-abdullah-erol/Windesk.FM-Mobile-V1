import 'package:flutter/material.dart';

import '../../constants/style/border_radius.dart';

class DropDownInputFields extends StatelessWidget {
  const DropDownInputFields(
      {super.key,
      required this.labelText,
      required this.onChangedFunction,
      required this.rightIcon,
      required this.dropDownArray});
  final String labelText;
  final Function onChangedFunction;
  final IconData rightIcon;
  final List<String> dropDownArray;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        value: dropDownArray[0],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: CustomBorderRadius.textFieldBorderRadius,
          ),
          labelText: labelText,
        ),
        icon: Icon(rightIcon),
        items: dropDownArray.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (newValue) => onChangedFunction(newValue));
  }
}
