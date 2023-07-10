import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/loginScreen", page: LoginScreen.page, initial: true),
        AutoRoute(
          path: '/appWrapper',
          page: AppWrapper.page,
          children: [
            AutoRoute(path: 'homeScreen', page: HomeScreen.page, initial: true),
            AutoRoute(path: 'newOrderScreen', page: NewOrderScreen.page),
            AutoRoute(path: 'searchScreen', page: SearchScreen.page),
            AutoRoute(path: 'testScreen', page: TestScreen.page),
          ],
        ),
        // AutoRoute(page: DummyScreenThreeChild.page, path: '/dummy3Child')
      ];
}

// ornek empty router, nested router icin kullanilir, silmeyin
// AutoRoute(
//               path: 'emptyRouter',
//               page: EmptyRouter.page,
//               children: [
//                 RedirectRoute(path: '', redirectTo: 'dummyScreenThree'),
//                 AutoRoute(path: 'dummyScreenThree', page: DummyScreenThree.page, initial: true),
//                 AutoRoute(path: 'dummy3Child', page: DummyScreenThreeChild.page),
//               ],
//             ),