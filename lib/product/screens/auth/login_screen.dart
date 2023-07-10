import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input_with_action.dart';
import 'package:vm_fm_4/feature/constants/other/app_icons.dart';

import '../../../feature/route/app_route.gr.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  test() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
          child: DropDownInputFields(
              labelText: 'test',
              onChangedFunction: test,
              rightIcon: AppIcons.arrow_down,
              dropDownArray: ['dropDownArray', 'asd'])),
    );
  }
}
