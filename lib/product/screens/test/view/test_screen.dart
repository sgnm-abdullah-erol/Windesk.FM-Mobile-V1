// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vm_fm_4/core/constants/other/app_strings.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../../feature/extensions/context_extension.dart';
import '../../../../feature/global_providers/global_provider.dart';

import '../test_provider.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final RoundedLoadingButtonController _controllerButton =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TestProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Consumer2<TestProvider, ThemeProvider>(builder: (context,
          TestProvider testProvider, ThemeProvider themeProvider, child) {
        themeProvider.getPreferences();
        testProvider.getInfoLoad == false
            ? testProvider.getTestScreenInfo()
            : null;
        return WillPopScope(
          child: Scaffold(
            appBar: const CustomMainAppbar(title: Text('Test')),
            body: Center(
                child: _bodyWidget(context, testProvider, themeProvider)),
          ),
          onWillPop: () async => false,
        );
      }),
    );
  }

  _bodyWidget(BuildContext context, TestProvider testProvider,
      ThemeProvider themeProvider) {
    return Column(
      children: [
        _headerWidget(context),
        _infoWidget(context, testProvider),
        _buttonsAndTestResultWidget(context, testProvider, themeProvider),
      ],
    );
  }

  Widget _pictureWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Image.asset(
          'assets/images/profile3.png',
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _pictureWidget(context),
            const Text(
              AppStrings.ifmHelp,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(context.read<GlobalProvider>().userName),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget(BuildContext context, TestProvider testProvider) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              ServiceTools.facilityName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(LocaleKeys.Device.tr() +
                context.read<TestProvider>().deviceModel.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(LocaleKeys.OS.tr() +
                ' : ' +
                context.read<TestProvider>().deviceOS.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(LocaleKeys.AppVersion.tr() +
                context.read<TestProvider>().appVersion.toString()),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.ConnectionTime.tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //Text(AppStrings.serverTime + testProvider.serverTime),
                  Text(LocaleKeys.PhoneTime.tr() +
                      ' : ' +
                      testProvider.phoneTime),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonsAndTestResultWidget(BuildContext context,
      TestProvider testProvider, ThemeProvider themeProvider) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) {
      return Expanded(
        child: Column(
          children: [
            // buttonNotify(context, AppStrings.issueNotify, onPressFunction,
            //     _controllerButton),
            // CustomElevatedButtonWithIcon(
            //     bgColor: Colors.greenAccent,
            //     onPressFunction: () {
            //       themeProvider.setTheme(!themeProvider.isDark);
            //     },
            //     textValue: 'Dark theme',
            //     textColor: Colors.red,
            //     iconColor: Colors.black,
            //     icon: Icons.abc),
            buttonTest(context, LocaleKeys.AccessTest.tr(), testProvider,
                _controllerButton),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: testProvider.accessTestV1 == 'true'
                        ?  Text(
                            LocaleKeys.ConnectionSuccess.tr(),
                            style: TextStyle(color: Colors.green),
                          )
                        : testProvider.accessTestV1 == 'false'
                            ?  Text(
                                LocaleKeys.ConnectionUnSuccess.tr(),
                                style: TextStyle(color: Colors.red),
                              )
                            : const Text(
                                AppStrings.ifmConnWait,
                                style: TextStyle(color: Colors.orange),
                              ),
                  ),
                  // Container(
                  //   child: testProvider.accessTestV2 == 'true'
                  //       ? const Text(
                  //           AppStrings.mobilServerSuccess,
                  //           style: TextStyle(color: Colors.green),
                  //         )
                  //       : testProvider.accessTestV2 == 'false'
                  //           ? const Text(
                  //               AppStrings.mobilServerConnFail,
                  //               style: TextStyle(color: Colors.red),
                  //             )
                  //           : const Text(
                  //               AppStrings.mobilServerConnWait,
                  //               style: TextStyle(color: Colors.orange),
                  //             ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget buttonTest(BuildContext context, String buttonText,
    TestProvider testProvider, controllerButton) {
  return Consumer<ThemeProvider>(
    builder: (context, ThemeProvider themeProvider, child) {
      return SizedBox(
        width: context.width * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedLoadingButton(
            color: APPColors.Main.red,
            successColor: Colors.amber,
            controller: controllerButton,
            onPressed: () {
              controllerButton.success();
              testProvider.accessTestV1Function();
              //testProvider.accessTestV2Function();

              controllerButton.reset();
            },
            valueColor: Colors.white,
            borderRadius: 12,
            child: Center(
              child: Text(
                  buttonText == LocaleKeys.AccessTest.tr()
                      ? LocaleKeys.AccessTest.tr()
                      : LocaleKeys.AccessTest.tr(),
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      );
    },
  );
}

SizedBox buttonNotify(BuildContext context, String buttonText, onPressFunction,
    controllerButton) {
  return SizedBox(
    width: context.width * 0.7,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedLoadingButton(
        color: APPColors.Main.red,
        successColor: Colors.amber,
        controller: controllerButton,
        onPressed: () => onPressFunction(),
        valueColor: Colors.white,
        borderRadius: 12,
        child: Center(
          child: Text(
              buttonText == LocaleKeys.AccessTest.tr()
                  ? LocaleKeys.AccessTest.tr()
                  : LocaleKeys.AccessTest.tr(),
              style: const TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}
