import 'package:flutter/material.dart';

@immutable
class DynamicForm {
  Widget formType(String inputType, bool selectedValue, Function setSelectedValue) {
    switch (inputType) {
      case 'BOOLYES':
        return Column(
          children: [
            ListTile(
              title: const Text('True'),
              leading: Radio<bool>(
                value: true,
                groupValue: selectedValue,
                onChanged: (bool? value) =>
                  setSelectedValue(),
              ),
            ),
            ListTile(
              title: const Text('False'),
              leading: Radio<bool>(
                value: false,
                groupValue: selectedValue,
                onChanged: (bool? value) =>
                  setSelectedValue(),
              ),
            ),
          ],
        );
      // case 1:
      //   print('one!');
      //   break;
      // case 2:
      //   print('two!');
      //   break;
      default:
        return const Text('dasdsadsadsa');
    }
  }
}
