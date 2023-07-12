import 'package:animated_widgets/animated_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../feature/constants/paths/asset_paths.dart';
import '../../../feature/extensions/context_extension.dart';
import '../../../feature/global_providers/global_provider.dart';
import '../../../feature/route/app_route.gr.dart';
import 'splash_provider.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (context, SplashProvider splashProvider, child) {
          context.watch<SplashProvider>().setSplashFinished();
          _navigate(context);
          return _splashScreenBody(context);
        },
      ),
    );
  }

  void _navigate(BuildContext context) {
    context.read<GlobalProvider>().setDeviceModel(context.read<SplashProvider>().getDeviceModel());
    context.read<GlobalProvider>().setDeviceVersion(context.read<SplashProvider>().getDeviceVersion());
    context.watch<SplashProvider>().isSplashFinished
        ? context.watch<SplashProvider>().isUserAlreadyLoggedIn
            ? context.router.replace(const HomeScreen())
            : context.router.replace(const LoginScreen())
        : const SizedBox();
  }

  ScaleAnimatedWidget _splashScreenBody(BuildContext context) {
    return ScaleAnimatedWidget.tween(
      enabled: true,
      duration: const Duration(milliseconds: 3000),
      scaleDisabled: 0.5,
      scaleEnabled: 1,
      child: SizedBox(
        height: context.width / 1.5,
        width: context.width / 1.5,
        child: Image.asset(AssetPaths.logo),
      ),
    );
  }
}
