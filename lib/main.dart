import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'core/constants/other/app_strings.dart';
import 'core/init.dart';
import 'core/localization/app_localization.dart';
import 'core/route/app_route.dart';
import 'core/themes/custom_dark_theme.dart';
import 'core/themes/custom_light_theme.dart';
import 'core/themes/theme_provider.dart';
import 'feature/global_providers/global_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Init.init();
  // Plugin must be initialized before using
  // await FlutterDownloader.initialize(
  //   debug: true, // optional: set to false to disable printing logs to console (default: true)
  // );
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  String dir = (await getApplicationDocumentsDirectory()).path;

  const filenameEn = 'en-US.json';
  var bytes = await rootBundle.load("assets/translations/en-US.json");
  print('$dir/$filenameEn');
  writeToFile(bytes, '$dir/$filenameEn');

  const filenameTr = 'tr-TR.json';
  var bytesTr = await rootBundle.load("assets/translations/test.json");

  print('$dir/$filenameTr');
  writeToFile(bytesTr, '$dir/$filenameTr');

  // final file = File('$dir/$filenameEn');
  // final contents = await file.readAsString();
  // print(contents);
  String pathTr = '$dir/$filenameTr';
  final fileTr = File('$dir/$filenameTr');

  // const filenameNewTr = 'test.json';
  // var bytesNewTr = await rootBundle.load("assets/translations/test.json");

  // writeToFile(bytesNewTr, pathTr);
  fileTr.writeAsStringSync(' {"View":"Gör","WorkOrderList":"Bu"}');
  final contents2 = await fileTr.readAsString();
  print(contents2);

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: Consumer(
        builder: (context, ThemeProvider value, child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: AppLocalization.supportedLocales,
            locale: context.locale,
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: value.isDark ? CustomDarkTheme().darkTheme : CustomLightTheme().lightTheme,
          );
        },
      ),
    );
  }
}
