import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/service/firebase/firebase_notification.dart';

import 'feature/constants/other/app_strings.dart';
import 'feature/injection.dart';
import 'feature/route/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Injection().initInstances();
  FirebaseNotification.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}
