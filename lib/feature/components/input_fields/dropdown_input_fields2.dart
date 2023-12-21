import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/constants/style/border_radius.dart';
import '../../extensions/context_extension.dart';

class DropDownInputFields2 extends StatelessWidget {
  const DropDownInputFields2({
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
    //dropDownArray.insert(0, 'Seçim yapınız');
    return dropDownArray.isNotEmpty
        ? DropdownButtonFormField(
            value: dropDownArray[0],
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: CustomBorderRadius.textFieldBorderRadius,
                borderSide: BorderSide(color: APPColors.Main.grey, width: 4),
              ),
              labelText: labelText.tr(),
              labelStyle: context.bodySmall.copyWith(
                  color: context.theme
                      ? APPColors.Main.white
                      : APPColors.Main.black),
            ),
            items: dropDownArray.map(
              (String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Row(
                    children: [
                      leftIconExist == false ? Container() : Icon(leftIcon),
                      Flexible(
                        child: Text(
                          items,
                          style: context.labelMedium.copyWith(
                              color: context.theme
                                  ? APPColors.Main.white
                                  : APPColors.Main.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) => {onChangedFunction(newValue)},
          )
        : DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: CustomBorderRadius.textFieldBorderRadius,
                borderSide: BorderSide(color: APPColors.Main.grey, width: 4),
              ),
              labelText: labelText.tr(),
              labelStyle: context.bodySmall.copyWith(
                  color: context.theme
                      ? APPColors.Main.white
                      : APPColors.Main.black),
            ),
            items: dropDownArray.map(
              (String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Row(
                    children: [
                      leftIconExist == false ? Container() : Icon(leftIcon),
                      Flexible(
                        child: Text(
                          items,
                          style: context.labelMedium.copyWith(
                              color: context.theme
                                  ? APPColors.Main.white
                                  : APPColors.Main.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) => {onChangedFunction(newValue)},
          );
  }
}
