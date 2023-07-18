// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart'
    as _i15;
import 'package:vm_fm_4/feature/route/empty_router.dart' as _i12;
import 'package:vm_fm_4/product/screens/auth/view/login_screen.dart' as _i9;
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/view/detail_work_order_screen.dart'
    as _i2;
import 'package:vm_fm_4/product/screens/home/screens/search_work_order/view/search_work_order_screen.dart'
    as _i3;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart'
    as _i16;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/tabs/my_work_orders.dart'
    as _i4;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/view/work_order_list_screen.dart'
    as _i5;
import 'package:vm_fm_4/product/screens/home/view/home_screen.dart' as _i6;
import 'package:vm_fm_4/product/screens/new_order/new_order_screen.dart'
    as _i11;
import 'package:vm_fm_4/product/screens/search/search_screen.dart' as _i10;
import 'package:vm_fm_4/product/screens/splash/splash_screen.dart' as _i7;
import 'package:vm_fm_4/product/screens/test/view/test_screen.dart' as _i8;
import 'package:vm_fm_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    DetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<DetailWorkOrderScreenArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailWorkOrderScreen(
          key: args.key,
          workSpaceDetail: args.workSpaceDetail,
        ),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SearchWorkOrderScreen(),
      );
    },
    MyWorkOrders.name: (routeData) {
      final args = routeData.argsAs<MyWorkOrdersArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MyWorkOrders(
          key: args.key,
          provider: args.provider,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WorkOrderListScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TestScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    SearchScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SearchScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NewOrderScreen(),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouter(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i13.PageRouteInfo<void> {
  const AppWrapper({List<_i13.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailWorkOrderScreen]
class DetailWorkOrderScreen
    extends _i13.PageRouteInfo<DetailWorkOrderScreenArgs> {
  DetailWorkOrderScreen({
    _i14.Key? key,
    required _i15.WorkSpaceDetail workSpaceDetail,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          DetailWorkOrderScreen.name,
          args: DetailWorkOrderScreenArgs(
            key: key,
            workSpaceDetail: workSpaceDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailWorkOrderScreen';

  static const _i13.PageInfo<DetailWorkOrderScreenArgs> page =
      _i13.PageInfo<DetailWorkOrderScreenArgs>(name);
}

class DetailWorkOrderScreenArgs {
  const DetailWorkOrderScreenArgs({
    this.key,
    required this.workSpaceDetail,
  });

  final _i14.Key? key;

  final _i15.WorkSpaceDetail workSpaceDetail;

  @override
  String toString() {
    return 'DetailWorkOrderScreenArgs{key: $key, workSpaceDetail: $workSpaceDetail}';
  }
}

/// generated route for
/// [_i3.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i13.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i13.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MyWorkOrders]
class MyWorkOrders extends _i13.PageRouteInfo<MyWorkOrdersArgs> {
  MyWorkOrders({
    _i14.Key? key,
    required _i16.WorkOrderListProvider provider,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MyWorkOrders.name,
          args: MyWorkOrdersArgs(
            key: key,
            provider: provider,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkOrders';

  static const _i13.PageInfo<MyWorkOrdersArgs> page =
      _i13.PageInfo<MyWorkOrdersArgs>(name);
}

class MyWorkOrdersArgs {
  const MyWorkOrdersArgs({
    this.key,
    required this.provider,
  });

  final _i14.Key? key;

  final _i16.WorkOrderListProvider provider;

  @override
  String toString() {
    return 'MyWorkOrdersArgs{key: $key, provider: $provider}';
  }
}

/// generated route for
/// [_i5.WorkOrderListScreen]
class WorkOrderListScreen extends _i13.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i13.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i13.PageRouteInfo<void> {
  const HomeScreen({List<_i13.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashScreen extends _i13.PageRouteInfo<void> {
  const SplashScreen({List<_i13.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TestScreen]
class TestScreen extends _i13.PageRouteInfo<void> {
  const TestScreen({List<_i13.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginScreen extends _i13.PageRouteInfo<void> {
  const LoginScreen({List<_i13.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SearchScreen]
class SearchScreen extends _i13.PageRouteInfo<void> {
  const SearchScreen({List<_i13.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NewOrderScreen]
class NewOrderScreen extends _i13.PageRouteInfo<void> {
  const NewOrderScreen({List<_i13.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.EmptyRouter]
class EmptyRouter extends _i13.PageRouteInfo<void> {
  const EmptyRouter({List<_i13.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
