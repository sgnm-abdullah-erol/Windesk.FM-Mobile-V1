import 'package:flutter/material.dart';

import '../../constants/style/border_radius.dart';

class TextFieldsInput extends StatelessWidget {
  const TextFieldsInput({
    super.key,
    required this.onChangedFunction,
    required this.labelText,
    this.enabled,
  });
  final Function onChangedFunction;
  final String labelText;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled ?? true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: CustomBorderRadius.textFieldBorderRadius),
        labelText: labelText,
      ),
      onChanged: (inputValue) => onChangedFunction(inputValue),
      
    );
  }
}
