import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/style/font_sizes.dart';

class TextFieldsInputUnderline extends StatelessWidget {
  const TextFieldsInputUnderline({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String _validatorHintText = 'Lütfen bu alanı doldurunuz';

  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(border: const UnderlineInputBorder(), hintText: hintText),
      onChanged: (inputValue) => onChanged(inputValue),
      style: const TextStyle(fontSize: FontSizes.body, letterSpacing: 1, fontFamily: 'Roboto'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _validatorHintText;
        }
        return null;
      },
    );
  }
}
