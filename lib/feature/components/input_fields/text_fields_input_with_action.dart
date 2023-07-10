import 'package:flutter/material.dart';
import '../../constants/style/border_radius.dart';

class TextFieldsInputWithAction extends StatelessWidget {
  const TextFieldsInputWithAction({
    super.key,
    required this.onChangedFunction,
    required this.labelText,
    required this.actionIcon,
    required this.actionFunction,
  });
  final Function onChangedFunction;
  final Function actionFunction;
  final String labelText;
  final IconData actionIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: CustomBorderRadius.textFieldBorderRadius),
            labelText: labelText,
          ),
          onChanged: (inputValue) => onChangedFunction(inputValue),
        ),
        IconButton(
          icon: Icon(actionIcon),
          onPressed: () => actionFunction,
        ),
      ],
    );
  }
}
