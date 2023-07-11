import 'package:flutter/material.dart';

import 'feature/constants/other/app_strings.dart';
import 'feature/injection.dart';
import 'feature/route/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Injection().initInstances();

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
