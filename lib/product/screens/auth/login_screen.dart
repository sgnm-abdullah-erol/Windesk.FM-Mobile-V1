import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../feature/components/buttons/custom_circular_with_icon_button.dart';
import '../../../feature/constants/other/colors.dart';
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
          child: CustomCircularWithIconButton(
        icon: AppIcons.addPhoto,
        onPressFunction: test,
        bgColor: APPColors.Login.blue,
        iconColor: APPColors.Main.white,
      )),
    );
  }
}
