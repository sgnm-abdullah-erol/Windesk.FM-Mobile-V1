import 'package:flutter/material.dart';

import '../../constants/other/app_icons.dart';
import '../../constants/style/font_sizes.dart';

class TextInputFieldsPasswordInputUnderline extends StatelessWidget {
  const TextInputFieldsPasswordInputUnderline({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.changeVisibility,
    required this.showPassword,
  });

  final String hintText;
  final Function onChanged;
  final Function changeVisibility;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: () => changeVisibility(),
          icon: showPassword ? const Icon(AppIcons.visibilityOff) : const Icon(AppIcons.visibility),
        ),
      ),
      style: const TextStyle(fontSize: FontSizes.button, fontFamily: 'Roboto', letterSpacing: 1),
      onChanged: (String value) => onChanged(value),
    );
  }
}
