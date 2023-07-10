import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../feature/components/input_fields/dropdown_input_fields.dart';
import '../../../feature/constants/other/app_icons.dart';

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
          rightIcon: AppIcons.arrowDown,
          dropDownArray: const ['dropDownArray', 'asd'],
        ),
      ),
    );
  }
}
