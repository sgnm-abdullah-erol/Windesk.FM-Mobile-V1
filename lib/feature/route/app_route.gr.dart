// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:vm_fm_4/product/screens/dummy_screen.dart' as _i1;
import 'package:vm_fm_4/product/screens/dummy_screen_2.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DummyScreen.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DummyScreen(),
      );
    },
    DummyScreenTwo.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyScreenTwo(),
      );
    },
  };
}

/// generated route for
/// [_i1.DummyScreen]
class DummyScreen extends _i3.PageRouteInfo<void> {
  const DummyScreen({List<_i3.PageRouteInfo>? children})
      : super(
          DummyScreen.name,
          initialChildren: children,
        );

  static const String name = 'DummyScreen';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyScreenTwo]
class DummyScreenTwo extends _i3.PageRouteInfo<void> {
  const DummyScreenTwo({List<_i3.PageRouteInfo>? children})
      : super(
          DummyScreenTwo.name,
          initialChildren: children,
        );

  static const String name = 'DummyScreenTwo';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
