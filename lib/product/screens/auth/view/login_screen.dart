import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/buttons/custom_circular_with_icon_button.dart';
import '../../../../feature/components/buttons/custom_circular_with_text_button.dart';
import '../../../../feature/components/buttons/custom_elevated_button_with_icon.dart';
import '../../../../feature/components/buttons/custom_login_button.dart';
import '../../../../feature/components/input_fields/text_fields_input_underline.dart';
import '../../../../feature/components/input_fields/text_fields_password_input_underline.dart';
import '../../../../feature/components/loading/custom_main_loading.dart';
import '../../../../feature/components/model_bottom_sheet/issue_filter_modal_bottom_sheet.dart';
import '../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import '../../../../feature/constants/other/colors.dart';
import '../../../../feature/constants/paths/asset_paths.dart';
import '../../../../feature/constants/style/custom_paddings.dart';
import '../../../../feature/constants/style/font_sizes.dart';
import '../../../../feature/extensions/context_extension.dart';
import '../../../../feature/route/app_route.gr.dart';
import '../login_provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, LoginProvider loginProvider, child) {
          return _LoginScreenBody(provider: loginProvider);
        },
      ),
    );
  }
}

class _LoginScreenBody extends StatelessWidget {
  const _LoginScreenBody({required this.provider});

  final LoginProvider provider;
  final String _userNameHint = 'Kullanıcı Adı';
  final String _passwordHint = 'Şifre';
  final String _login = 'Giriş Yap';

  @override
  Widget build(BuildContext context) {
    provider.isLoginSuccess ? context.router.push(const HomeScreen()) : null;
    return Scaffold(
      appBar: CustomMainAppbar(title: _loginAppbarTitle(context), returnBack: false),
      body: provider.loading
          ? const CustomMainLoading()
          : Column(
              children: <Widget>[
                CustomCircularWithIconButton(
                    bgColor: Colors.red,
                    icon: Icons.add_a_photo,
                    onPressFunction: () {
                      ShowModalBottomSheet().show(
                          context,
                           IssueFilterModalBottomSheet(
                              stateList: const ['stateList'],
                              buildList: const ['buildList'],
                              floorList: const ['floorList'],
                              wingList: const ['wingList'],
                              selectStateFunction: () {},
                              selectBuildFunction: () {},
                              selectFloorFunction: () {},
                              selectWingFunction: () {},
                              filterStartFunction: () {},
                              taskForMeFunction: () {},
                              selectedParamList: const [
                                'selectedItem',
                                'sgnm1032',
                                'Üzerinde Çalışılıyor'
                              ],
                              selectedParamListDeleteItem: () {}));
                    },
                    iconColor: Colors.white),
                CustomCircularWithTextButton(
                  bgColor: APPColors.Main.blue,
                  onPressFunction: () {},
                  textButton: 'textButton',
                  textColor: APPColors.Main.white,
                ),
                CustomElevatedButtonWithIcon(
                    bgColor: Colors.red,
                    onPressFunction: () {},
                    textValue: 'tet',
                    textColor: Colors.black,
                    iconColor: Colors.red,
                    icon: Icons.abc)
              ],
            ),
    );
  }

  Expanded _loginButton() {
    return Expanded(
      flex: 2,
      child: CustomLoginButton(title: _login, onPressed: provider.logIn),
    );
  }

  Expanded _textFields() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: CustomPaddings.onlyHorizontalHigh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFieldsInputUnderline(hintText: _userNameHint, onChanged: provider.setUserName),
            TextInputFieldsPasswordInputUnderline(
              hintText: _passwordHint,
              onChanged: provider.setPassword,
              changeVisibility: provider.setShowPassword,
              showPassword: provider.showPassword,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _loginTitleWidget() {
    return Expanded(
      flex: 1,
      child: Text(
        _login,
        style: const TextStyle(fontSize: FontSizes.titleLarge, fontFamily: 'Roboto'),
      ),
    );
  }

  Expanded _loginImage(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Image.asset(
        AssetPaths.loginPic,
        height: MediaQuery.of(context).size.width / 1,
        width: MediaQuery.of(context).size.width / 1,
        fit: BoxFit.cover,
      ),
    );
  }

  Image _loginAppbarTitle(BuildContext context) {
    return Image.asset(
      AssetPaths.windesk,
      width: context.width / 1.5,
      height: context.width / 1.5,
      fit: BoxFit.cover,
    );
  }
}
