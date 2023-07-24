import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/font_sizes.dart';

class TextFieldsInputUnderline extends StatelessWidget {
  const TextFieldsInputUnderline({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.enabled,
  });

  final String _validatorHintText = 'Lütfen bu alanı doldurunuz';

  final String hintText;
  final Function onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(border: const UnderlineInputBorder(), hintText: hintText),
      onChanged: (inputValue) => onChanged(inputValue),
      style: TextStyle(fontSize: FontSizes.body, letterSpacing: 1, fontFamily: 'Roboto', color: APPColors.Main.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _validatorHintText;
        }
        return null;
      },
    );
  }
}
