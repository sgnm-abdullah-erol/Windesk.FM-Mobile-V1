import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

import '../../constants/other/app_icons.dart';
import '../../constants/style/font_sizes.dart';

class TextInputFieldsPasswordInputUnderline extends StatelessWidget {
  const TextInputFieldsPasswordInputUnderline({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.changeVisibility,
    required this.showPassword,
    this.labelText,
  });

  final String _validatorHintText = 'Lütfen bu alanı doldurunuz';

  final String hintText;
  final String? labelText;
  final Function onChanged;
  final Function changeVisibility;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: IconButton(
          onPressed: () => changeVisibility(),
          icon: showPassword ? const Icon(AppIcons.visibilityOff) : const Icon(AppIcons.visibility),
        ),
      ),
      style: TextStyle(fontSize: FontSizes.button, fontFamily: 'Roboto', letterSpacing: 1, color: APPColors.Main.black),
      onChanged: (String value) => onChanged(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _validatorHintText;
        }
        return null;
      },
    );
  }
}
