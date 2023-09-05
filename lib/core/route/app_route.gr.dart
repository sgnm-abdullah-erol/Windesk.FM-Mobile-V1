// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:vm_fm_4/feature/models/home_page_models/asset_document_model.dart' as _i21;
import 'package:vm_fm_4/feature/models/home_page_models/asset_image_model.dart' as _i20;
import 'package:vm_fm_4/feature/models/home_page_models/asset_list_model.dart' as _i19;
import 'package:vm_fm_4/feature/models/work_space/work_space_appendings.dart' as _i23;
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart' as _i22;
import 'package:vm_fm_4/core/route/empty_router.dart' as _i1;
import 'package:vm_fm_4/core/route/empty_router2.dart' as _i2;
import 'package:vm_fm_4/product/screens/auth/view/login_screen.dart' as _i15;
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/view/detail_work_order_screen.dart' as _i7;
import 'package:vm_fm_4/product/screens/home/screens/pending_detail_work_order/pending_detail_work_order_screen.dart' as _i8;
import 'package:vm_fm_4/product/screens/home/screens/search_work_order/view/search_work_order_screen.dart' as _i12;
import 'package:vm_fm_4/product/screens/home/screens/work_order_group_detail/work_order_group_detail_screen.dart' as _i9;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart' as _i24;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/tabs/my_work_orders.dart' as _i10;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/view/work_order_list_screen.dart' as _i11;
import 'package:vm_fm_4/product/screens/home/view/home_screen.dart' as _i13;
import 'package:vm_fm_4/product/screens/new_order/view/new_order_screen.dart' as _i5;
import 'package:vm_fm_4/product/screens/search/view/asset_detail_screen.dart' as _i3;
import 'package:vm_fm_4/product/screens/search/view/search_screen.dart' as _i4;
import 'package:vm_fm_4/product/screens/splash/splash_screen.dart' as _i14;
import 'package:vm_fm_4/product/screens/test/view/test_screen.dart' as _i6;
import 'package:vm_fm_4/product/wrapper/app_wrapper.dart' as _i16;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    EmptyRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouter(),
      );
    },
    EmptyRouter2.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouter2(),
      );
    },
    AssetDetailScreen.name: (routeData) {
      final args = routeData.argsAs<AssetDetailScreenArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AssetDetailScreen(
          key: args.key,
          assetListModel: args.assetListModel,
          assetImageModel: args.assetImageModel,
          assetDocumentModel: args.assetDocumentModel,
          imageExist: args.imageExist,
          documentExist: args.documentExist,
        ),
      );
    },
    SearchMaterialScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SearchMaterialScreen(),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewOrderScreen(),
      );
    },
    TestScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TestScreen(),
      );
    },
    DetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<DetailWorkOrderScreenArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DetailWorkOrderScreen(
          key: args.key,
          workSpaceDetail: args.workSpaceDetail,
        ),
      );
    },
    PendingDetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<PendingDetailWorkOrderScreenArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PendingDetailWorkOrderScreen(
          key: args.key,
          workSpacePendiks: args.workSpacePendiks,
        ),
      );
    },
    WorkOrderGroupDetailScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderGroupDetailScreenArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WorkOrderGroupDetailScreen(
          key: args.key,
          requestCode: args.requestCode,
          appTitle: args.appTitle,
        ),
      );
    },
    MyWorkOrders.name: (routeData) {
      final args = routeData.argsAs<MyWorkOrdersArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.MyWorkOrders(
          key: args.key,
          provider: args.provider,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.WorkOrderListScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SearchWorkOrderScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoginScreen(),
      );
    },
    AppWrapper.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.AppWrapper(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyRouter]
class EmptyRouter extends _i17.PageRouteInfo<void> {
  const EmptyRouter({List<_i17.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EmptyRouter2]
class EmptyRouter2 extends _i17.PageRouteInfo<void> {
  const EmptyRouter2({List<_i17.PageRouteInfo>? children})
      : super(
          EmptyRouter2.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter2';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AssetDetailScreen]
class AssetDetailScreen extends _i17.PageRouteInfo<AssetDetailScreenArgs> {
  AssetDetailScreen({
    _i18.Key? key,
    required _i19.AssetListModel assetListModel,
    List<_i20.AssetImageModel>? assetImageModel,
    List<_i21.AssetDocumentModel>? assetDocumentModel,
    required bool imageExist,
    required bool documentExist,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          AssetDetailScreen.name,
          args: AssetDetailScreenArgs(
            key: key,
            assetListModel: assetListModel,
            assetImageModel: assetImageModel,
            assetDocumentModel: assetDocumentModel,
            imageExist: imageExist,
            documentExist: documentExist,
          ),
          initialChildren: children,
        );

  static const String name = 'AssetDetailScreen';

  static const _i17.PageInfo<AssetDetailScreenArgs> page = _i17.PageInfo<AssetDetailScreenArgs>(name);
}

class AssetDetailScreenArgs {
  const AssetDetailScreenArgs({
    this.key,
    required this.assetListModel,
    this.assetImageModel,
    this.assetDocumentModel,
    required this.imageExist,
    required this.documentExist,
  });

  final _i18.Key? key;

  final _i19.AssetListModel assetListModel;

  final List<_i20.AssetImageModel>? assetImageModel;

  final List<_i21.AssetDocumentModel>? assetDocumentModel;

  final bool imageExist;

  final bool documentExist;

  @override
  String toString() {
    return 'AssetDetailScreenArgs{key: $key, assetListModel: $assetListModel, assetImageModel: $assetImageModel, assetDocumentModel: $assetDocumentModel, imageExist: $imageExist, documentExist: $documentExist}';
  }
}

/// generated route for
/// [_i4.SearchMaterialScreen]
class SearchMaterialScreen extends _i17.PageRouteInfo<void> {
  const SearchMaterialScreen({List<_i17.PageRouteInfo>? children})
      : super(
          SearchMaterialScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchMaterialScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewOrderScreen]
class NewOrderScreen extends _i17.PageRouteInfo<void> {
  const NewOrderScreen({List<_i17.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TestScreen]
class TestScreen extends _i17.PageRouteInfo<void> {
  const TestScreen({List<_i17.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DetailWorkOrderScreen]
class DetailWorkOrderScreen extends _i17.PageRouteInfo<DetailWorkOrderScreenArgs> {
  DetailWorkOrderScreen({
    _i18.Key? key,
    required _i22.WorkSpaceDetail workSpaceDetail,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          DetailWorkOrderScreen.name,
          args: DetailWorkOrderScreenArgs(
            key: key,
            workSpaceDetail: workSpaceDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailWorkOrderScreen';

  static const _i17.PageInfo<DetailWorkOrderScreenArgs> page = _i17.PageInfo<DetailWorkOrderScreenArgs>(name);
}

class DetailWorkOrderScreenArgs {
  const DetailWorkOrderScreenArgs({
    this.key,
    required this.workSpaceDetail,
  });

  final _i18.Key? key;

  final _i22.WorkSpaceDetail workSpaceDetail;

  @override
  String toString() {
    return 'DetailWorkOrderScreenArgs{key: $key, workSpaceDetail: $workSpaceDetail}';
  }
}

/// generated route for
/// [_i8.PendingDetailWorkOrderScreen]
class PendingDetailWorkOrderScreen extends _i17.PageRouteInfo<PendingDetailWorkOrderScreenArgs> {
  PendingDetailWorkOrderScreen({
    _i18.Key? key,
    required _i23.WorkSpacePendiks workSpacePendiks,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          PendingDetailWorkOrderScreen.name,
          args: PendingDetailWorkOrderScreenArgs(
            key: key,
            workSpacePendiks: workSpacePendiks,
          ),
          initialChildren: children,
        );

  static const String name = 'PendingDetailWorkOrderScreen';

  static const _i17.PageInfo<PendingDetailWorkOrderScreenArgs> page = _i17.PageInfo<PendingDetailWorkOrderScreenArgs>(name);
}

class PendingDetailWorkOrderScreenArgs {
  const PendingDetailWorkOrderScreenArgs({
    this.key,
    required this.workSpacePendiks,
  });

  final _i18.Key? key;

  final _i23.WorkSpacePendiks workSpacePendiks;

  @override
  String toString() {
    return 'PendingDetailWorkOrderScreenArgs{key: $key, workSpacePendiks: $workSpacePendiks}';
  }
}

/// generated route for
/// [_i9.WorkOrderGroupDetailScreen]
class WorkOrderGroupDetailScreen extends _i17.PageRouteInfo<WorkOrderGroupDetailScreenArgs> {
  WorkOrderGroupDetailScreen({
    _i18.Key? key,
    required String requestCode,
    required String appTitle,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          WorkOrderGroupDetailScreen.name,
          args: WorkOrderGroupDetailScreenArgs(
            key: key,
            requestCode: requestCode,
            appTitle: appTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkOrderGroupDetailScreen';

  static const _i17.PageInfo<WorkOrderGroupDetailScreenArgs> page = _i17.PageInfo<WorkOrderGroupDetailScreenArgs>(name);
}

class WorkOrderGroupDetailScreenArgs {
  const WorkOrderGroupDetailScreenArgs({
    this.key,
    required this.requestCode,
    required this.appTitle,
  });

  final _i18.Key? key;

  final String requestCode;

  final String appTitle;

  @override
  String toString() {
    return 'WorkOrderGroupDetailScreenArgs{key: $key, requestCode: $requestCode, appTitle: $appTitle}';
  }
}

/// generated route for
/// [_i10.MyWorkOrders]
class MyWorkOrders extends _i17.PageRouteInfo<MyWorkOrdersArgs> {
  MyWorkOrders({
    _i18.Key? key,
    required _i24.WorkOrderListProvider provider,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          MyWorkOrders.name,
          args: MyWorkOrdersArgs(
            key: key,
            provider: provider,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkOrders';

  static const _i17.PageInfo<MyWorkOrdersArgs> page = _i17.PageInfo<MyWorkOrdersArgs>(name);
}

class MyWorkOrdersArgs {
  const MyWorkOrdersArgs({
    this.key,
    required this.provider,
  });

  final _i18.Key? key;

  final _i24.WorkOrderListProvider provider;

  @override
  String toString() {
    return 'MyWorkOrdersArgs{key: $key, provider: $provider}';
  }
}

/// generated route for
/// [_i11.WorkOrderListScreen]
class WorkOrderListScreen extends _i17.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i17.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i17.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i17.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.HomeScreen]
class HomeScreen extends _i17.PageRouteInfo<void> {
  const HomeScreen({List<_i17.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SplashScreen]
class SplashScreen extends _i17.PageRouteInfo<void> {
  const SplashScreen({List<_i17.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.LoginScreen]
class LoginScreen extends _i17.PageRouteInfo<void> {
  const LoginScreen({List<_i17.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.AppWrapper]
class AppWrapper extends _i17.PageRouteInfo<void> {
  const AppWrapper({List<_i17.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
