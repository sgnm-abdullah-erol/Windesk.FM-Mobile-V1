// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:vm_fm_4/feature/route/empty_router.dart' as _i1;
import 'package:vm_fm_4/product/screens/auth/login_screen.dart' as _i2;
import 'package:vm_fm_4/product/screens/home/home_screen.dart' as _i3;
import 'package:vm_fm_4/product/screens/new_order/new_order_screen.dart' as _i4;
import 'package:vm_fm_4/product/screens/search/search_screen.dart' as _i5;
import 'package:vm_fm_4/product/screens/splash/splash_screen.dart' as _i6;
import 'package:vm_fm_4/product/screens/test/test_screen.dart' as _i7;
import 'package:vm_fm_4/product/wrapper/app_wrapper.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    EmptyRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouter(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NewOrderScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SearchScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TestScreen(),
      );
    },
    AppWrapper.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AppWrapper(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyRouter]
class EmptyRouter extends _i9.PageRouteInfo<void> {
  const EmptyRouter({List<_i9.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i9.PageRouteInfo<void> {
  const LoginScreen({List<_i9.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i9.PageRouteInfo<void> {
  const HomeScreen({List<_i9.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NewOrderScreen]
class NewOrderScreen extends _i9.PageRouteInfo<void> {
  const NewOrderScreen({List<_i9.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SearchScreen]
class SearchScreen extends _i9.PageRouteInfo<void> {
  const SearchScreen({List<_i9.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashScreen extends _i9.PageRouteInfo<void> {
  const SplashScreen({List<_i9.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TestScreen]
class TestScreen extends _i9.PageRouteInfo<void> {
  const TestScreen({List<_i9.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AppWrapper]
class AppWrapper extends _i9.PageRouteInfo<void> {
  const AppWrapper({List<_i9.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
