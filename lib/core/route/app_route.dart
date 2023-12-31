import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreen.page, path: '/splashScreen', initial: true),
        AutoRoute(path: '/loginScreen', page: LoginScreen.page),
        AutoRoute(path: '/workorderList', page: WorkOrderListScreen.page),
        AutoRoute(
          path: '/appWrapper',
          page: AppWrapper.page,
          children: [
            AutoRoute(
              path: 'emptyHomeScreen',
              page: EmptyRouter.page,
              children: [
                RedirectRoute(path: '', redirectTo: 'homeScreen'),
                AutoRoute(path: 'homeScreen', page: HomeScreen.page, initial: true),
                AutoRoute(path: 'workOrderListScreen', page: WorkOrderListScreen.page),
                AutoRoute(path: 'detailWorkOrderScreen', page: DetailWorkOrderScreen.page),
                AutoRoute(path: 'searchWorkOrderScreen', page: SearchWorkOrderScreen.page),
                AutoRoute(path: 'pendingDetailWorkOrderScreen', page: PendingDetailWorkOrderScreen.page),
                AutoRoute(path: 'workOrderGroupDetailScreen', page: WorkOrderGroupDetailScreen.page),
                AutoRoute(path: 'scopeList', page: ScopeList.page),
                AutoRoute(path: 'scopeDetail', page: ScopeDetail.page),
                AutoRoute(path: 'supportList', page: SupportList.page),
                AutoRoute(path: 'supportDetail', page: SupportDetail.page),
              ],
            ),
            AutoRoute(
              path: 'emptySearchScreen',
              page: EmptyRouter2.page,
              children: [
                RedirectRoute(path: '', redirectTo: 'searchScreen'),
                AutoRoute(path: 'searchScreen', page: SearchScreen.page, initial: true),
                AutoRoute(path: 'assetSearchScreen', page: AssetSearchScreen.page),
                AutoRoute(path: 'spaceSearchScreen', page: SpaceSearchScreen.page),
                AutoRoute(path: 'assetDetailScreen', page: AssetDetailScreen.page),
              ],
            ),
            AutoRoute(path: 'emptyNewOrderScreen', page: EmptyRouter3.page, children: [
              RedirectRoute(path: '', redirectTo: 'newOrderScreen'),
              AutoRoute(path: 'newOrderScreen', page: NewOrderScreen.page, initial: true),
              AutoRoute(path: 'searchWorkOrderScreen', page: SearchWorkOrderScreen.page),
              AutoRoute(path: 'detailWorkOrderScreen', page: DetailWorkOrderScreen.page),
            ]),
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
