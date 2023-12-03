import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/paths/asset_paths.dart';
import '../../../../core/constants/style/custom_paddings.dart';
import '../../../../core/route/app_route.gr.dart';
import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/buttons/custom_login_button.dart';
import '../../../../feature/components/input_fields/text_fields_input_underline.dart';
import '../../../../feature/components/input_fields/text_fields_password_input_underline.dart';
import '../../../../feature/components/loading/custom_main_loading.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/extensions/context_extension.dart';
import '../../../../feature/global_providers/global_provider.dart';
import '../../../../generated/locale_keys.g.dart';
import '../provider/login_provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginPassword()),
        ChangeNotifierProvider(create: (context) => LoginProvider(), lazy: false),
      ],
      child: Consumer<LoginProvider>(
        builder: (context, LoginProvider loginProvider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            loginProvider.setUserName(userName);
            if (loginProvider.isErrorActive) {
              snackBar(context, LocaleKeys.LoginError.tr(), 'error');
            }
            if (loginProvider.textFieldEmptyError) {
              snackBar(context, LocaleKeys.LoginTextFieldsEmpty.tr(), 'error');
            }
            if (loginProvider.isLoginSuccess) {
              snackBar(context, LocaleKeys.LoginSuccess.tr(), 'success');
              context.read<GlobalProvider>().setUserId(loginProvider.userId);
              context.read<GlobalProvider>().setGlobalUserToken(loginProvider.userToken);

            }
          });

          return _LoginScreenBody(provider: loginProvider, userName: userName);
        },
      ),
    );
  }
}

class _LoginScreenBody extends StatefulWidget {
  const _LoginScreenBody({required this.provider, required this.userName});
  final LoginProvider provider;
  final String userName;

  @override
  State<_LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<_LoginScreenBody> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    widget.provider.isLoginSuccess ? context.router.push(const HomeScreen()) : null;
    return Scaffold(
      key: _globalKey,
      appBar: CustomMainAppbar(title: _loginAppbarTitle(context), returnBack: false),
      body: widget.provider.loading
          ? const CustomMainLoading()
          : Column(
              children: <Widget>[
                _loginImage(context),
                const SizedBox(height: 20),
                _loginTitleWidget(context),
                _textFields(context, widget.provider),
                //_rememberMeButton(context),
                _loginButton(),
              ],
            ),
    );
  }

  // Padding _rememberMeButton(BuildContext context) {
  //   return Padding(
  //     padding: CustomPaddings.onlyHorizontalHigh,
  //     child: Row(
  //       children: [
  //         Text(LocaleKeys.HintRememberMe, style: context.bodyMedium).tr(),
  //         Checkbox(
  //           checkColor: Colors.white,
  //           value: widget.provider.rememberMe,
  //           onChanged: (bool? value) => (value != null) ? setState(() => widget.provider.setRememberMe(value)) : null,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Expanded _loginButton() {
    return Expanded(
      flex: 2,
      child: CustomLoginButton(title: LocaleKeys.HintLogin, onPressed: widget.provider.logIn),
    );
  }

  Widget _textFields(BuildContext context, LoginProvider loginProvider) {
    return Consumer(
      builder: (context, LoginPassword provider, child) {
        return Expanded(
          flex: 3,
          child: Padding(
            padding: CustomPaddings.onlyHorizontalHigh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFieldsInputUnderline(
                  hintText: LocaleKeys.HintUserName.tr(),
                  onChanged: loginProvider.setUserName,
                  controller: loginProvider.userNameController,
                ),
                TextInputFieldsPasswordInputUnderline(
                  hintText: LocaleKeys.HintPassword,
                  onChanged: loginProvider.setPassword,
                  changeVisibility: provider.setShowPassword,
                  showPassword: provider.showPassword,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _loginTitleWidget(BuildContext context) => Expanded(flex: 1, child: Text(LocaleKeys.HintLogin.tr(), style: context.titleLarge));

  Expanded _loginImage(BuildContext context) => Expanded(
        flex: 4,
        child: Image.asset(AssetPaths.loginPic, height: context.width, width: context.width / 1, fit: BoxFit.cover),
      );

  Image _loginAppbarTitle(BuildContext context) =>
      Image.asset(AssetPaths.windesk, width: context.width / 1.5, height: context.width / 1.5, fit: BoxFit.cover);
}
