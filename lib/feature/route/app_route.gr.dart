// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:vm_fm_4/feature/route/empty_router.dart' as _i1;
import 'package:vm_fm_4/product/screens/auth/view/login_screen.dart' as _i2;
import 'package:vm_fm_4/product/screens/home/home_screen.dart' as _i3;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/view/work_order_list_screen.dart'
    as _i4;
import 'package:vm_fm_4/product/screens/new_order/new_order_screen.dart' as _i5;
import 'package:vm_fm_4/product/screens/search/search_screen.dart' as _i6;
import 'package:vm_fm_4/product/screens/splash/splash_screen.dart' as _i7;
import 'package:vm_fm_4/product/screens/test/view/test_screen.dart' as _i8;
import 'package:vm_fm_4/product/wrapper/app_wrapper.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    EmptyRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouter(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WorkOrderListScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewOrderScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SearchScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TestScreen(),
      );
    },
    AppWrapper.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.AppWrapper(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyRouter]
class EmptyRouter extends _i10.PageRouteInfo<void> {
  const EmptyRouter({List<_i10.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i10.PageRouteInfo<void> {
  const LoginScreen({List<_i10.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i10.PageRouteInfo<void> {
  const HomeScreen({List<_i10.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WorkOrderListScreen]
class WorkOrderListScreen extends _i10.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i10.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewOrderScreen]
class NewOrderScreen extends _i10.PageRouteInfo<void> {
  const NewOrderScreen({List<_i10.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SearchScreen]
class SearchScreen extends _i10.PageRouteInfo<void> {
  const SearchScreen({List<_i10.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashScreen extends _i10.PageRouteInfo<void> {
  const SplashScreen({List<_i10.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TestScreen]
class TestScreen extends _i10.PageRouteInfo<void> {
  const TestScreen({List<_i10.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AppWrapper]
class AppWrapper extends _i10.PageRouteInfo<void> {
  const AppWrapper({List<_i10.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
