// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:vm_fm_4/feature/route/empty_router.dart' as _i10;
import 'package:vm_fm_4/product/screens/auth/view/login_screen.dart' as _i7;
import 'package:vm_fm_4/product/screens/home/home_screen.dart' as _i4;
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/view/detail_work_order_screen.dart'
    as _i11;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart'
    as _i14;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/tabs/my_work_orders.dart'
    as _i2;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/view/work_order_list_screen.dart'
    as _i3;
import 'package:vm_fm_4/product/screens/new_order/new_order_screen.dart' as _i9;
import 'package:vm_fm_4/product/screens/search/search_screen.dart' as _i8;
import 'package:vm_fm_4/product/screens/splash/splash_screen.dart' as _i5;
import 'package:vm_fm_4/product/screens/test/view/test_screen.dart' as _i6;
import 'package:vm_fm_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    MyWorkOrders.name: (routeData) {
      final args = routeData.argsAs<MyWorkOrdersArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.MyWorkOrders(
          key: args.key,
          provider: args.provider,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WorkOrderListScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TestScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.NewOrderScreen(),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouter(),
      );
    },
    DetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<DetailWorkOrderScreenArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DetailWorkOrderScreen(
          workOrderCode: args.workOrderCode,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i12.PageRouteInfo<void> {
  const AppWrapper({List<_i12.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyWorkOrders]
class MyWorkOrders extends _i12.PageRouteInfo<MyWorkOrdersArgs> {
  MyWorkOrders({
    _i13.Key? key,
    required _i14.WorkOrderListProvider provider,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MyWorkOrders.name,
          args: MyWorkOrdersArgs(
            key: key,
            provider: provider,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkOrders';

  static const _i12.PageInfo<MyWorkOrdersArgs> page =
      _i12.PageInfo<MyWorkOrdersArgs>(name);
}

class MyWorkOrdersArgs {
  const MyWorkOrdersArgs({
    this.key,
    required this.provider,
  });

  final _i13.Key? key;

  final _i14.WorkOrderListProvider provider;

  @override
  String toString() {
    return 'MyWorkOrdersArgs{key: $key, provider: $provider}';
  }
}

/// generated route for
/// [_i3.WorkOrderListScreen]
class WorkOrderListScreen extends _i12.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i12.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i12.PageRouteInfo<void> {
  const HomeScreen({List<_i12.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashScreen extends _i12.PageRouteInfo<void> {
  const SplashScreen({List<_i12.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TestScreen]
class TestScreen extends _i12.PageRouteInfo<void> {
  const TestScreen({List<_i12.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginScreen extends _i12.PageRouteInfo<void> {
  const LoginScreen({List<_i12.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchScreen]
class SearchScreen extends _i12.PageRouteInfo<void> {
  const SearchScreen({List<_i12.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewOrderScreen]
class NewOrderScreen extends _i12.PageRouteInfo<void> {
  const NewOrderScreen({List<_i12.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.EmptyRouter]
class EmptyRouter extends _i12.PageRouteInfo<void> {
  const EmptyRouter({List<_i12.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.DetailWorkOrderScreen]
class DetailWorkOrderScreen
    extends _i12.PageRouteInfo<DetailWorkOrderScreenArgs> {
  DetailWorkOrderScreen({
    required String workOrderCode,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          DetailWorkOrderScreen.name,
          args: DetailWorkOrderScreenArgs(
            workOrderCode: workOrderCode,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailWorkOrderScreen';

  static const _i12.PageInfo<DetailWorkOrderScreenArgs> page =
      _i12.PageInfo<DetailWorkOrderScreenArgs>(name);
}

class DetailWorkOrderScreenArgs {
  const DetailWorkOrderScreenArgs({
    required this.workOrderCode,
    this.key,
  });

  final String workOrderCode;

  final _i13.Key? key;

  @override
  String toString() {
    return 'DetailWorkOrderScreenArgs{workOrderCode: $workOrderCode, key: $key}';
  }
}
