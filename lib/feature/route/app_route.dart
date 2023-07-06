import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/dummyScreen", page: DummyScreen.page, initial: true),
        AutoRoute(path: "/dummyScreen/dummyScreenTwo", page: DummyScreenTwo.page)
      ];
}
