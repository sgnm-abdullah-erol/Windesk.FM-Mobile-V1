import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/localization/app_localization.dart';
import 'package:vm_fm_4/core/themes/custom_dark_theme.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';

import 'core/constants/other/app_strings.dart';
import 'feature/global_providers/global_provider.dart';
import 'feature/injection.dart';
import 'core/route/app_route.dart';
import 'feature/service/firebase/firebase_notification.dart';
import 'core/themes/custom_light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection().initInstances();
  FirebaseNotification.init();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.localizationJsonPath,
      fallbackLocale: AppLocalization.supportedLocales.first,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: Consumer(
        builder: (context, ThemeProvider value, child) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            title: AppStrings.appName,
            theme: value.isDark ? CustomDarkTheme().darkTheme : CustomLightTheme().lightTheme,
          );
        },
      ),
    );
  }
}
