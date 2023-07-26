import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/other/colors.dart';
import '../../constants/style/font_sizes.dart';

class TextFieldsInputUnderline extends StatelessWidget {
  const TextFieldsInputUnderline({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.enabled,
    this.keyboardType,
    this.inputFormatters,
  });

  final String _validatorHintText = 'Lütfen bu alanı doldurunuz';

  final String hintText;
  final Function onChanged;
  final bool? enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(border: const UnderlineInputBorder(), hintText: hintText),
      inputFormatters: inputFormatters,
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
