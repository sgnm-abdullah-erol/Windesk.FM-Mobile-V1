import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../../core/constants/style/font_sizes.dart';

class DropDownInputFields extends StatelessWidget {
  const DropDownInputFields({
    super.key,
    required this.labelText,
    required this.onChangedFunction,
    required this.rightIcon,
    required this.dropDownArray,
    this.leftIcon,
    this.leftIconExist = false,
    this.type,
  });

  final String labelText;
  final Function onChangedFunction;
  final IconData rightIcon;
  final List<String> dropDownArray;
  final IconData? leftIcon;
  final bool? leftIconExist;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: CustomBorderRadius.textFieldBorderRadius,
          borderSide: BorderSide(color: APPColors.Main.grey, width: 4),
        ),
        labelText: labelText.tr(),
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSizes.subtitle),
      ),
      items: dropDownArray.map(
        (String items) {
          return DropdownMenuItem(
            value: items,
            child: Row(
              children: [
                leftIconExist == false ? Container() : Icon(leftIcon),
                Text(items, style: TextStyle(color: APPColors.Main.black)),
              ],
            ),
          );
        },
      ).toList(),
      onChanged: (newValue) => {onChangedFunction(newValue)},
    );
  }
}
