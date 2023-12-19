// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:vm_fm_4/core/route/empty_router.dart' as _i5;
import 'package:vm_fm_4/core/route/empty_router2.dart' as _i6;
import 'package:vm_fm_4/core/route/empty_router3.dart' as _i7;
import 'package:vm_fm_4/feature/models/home_page_models/asset_document_model.dart'
    as _i28;
import 'package:vm_fm_4/feature/models/home_page_models/asset_image_model.dart'
    as _i27;
import 'package:vm_fm_4/feature/models/home_page_models/asset_list_model.dart'
    as _i26;
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart'
    as _i32;
import 'package:vm_fm_4/feature/models/work_order_support_models/support_model.dart'
    as _i34;
import 'package:vm_fm_4/feature/models/work_space/work_space_appendings.dart'
    as _i31;
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart'
    as _i29;
import 'package:vm_fm_4/product/screens/auth/view/login_screen.dart' as _i9;
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/view/detail_work_order_screen.dart'
    as _i4;
import 'package:vm_fm_4/product/screens/home/screens/pending_detail_work_order/pending_detail_work_order_screen.dart'
    as _i12;
import 'package:vm_fm_4/product/screens/home/screens/search_work_order/view/search_work_order_screen.dart'
    as _i16;
import 'package:vm_fm_4/product/screens/home/screens/work_order_group_detail/work_order_group_detail_screen.dart'
    as _i22;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart'
    as _i30;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/tabs/my_work_orders.dart'
    as _i10;
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/view/work_order_list_screen.dart'
    as _i23;
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart'
    as _i33;
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/view/scope_detail.dart'
    as _i13;
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/view/scope_list.dart'
    as _i14;
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/models/start_check_list_value_model.dart'
    as _i35;
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/view/support_detail.dart'
    as _i19;
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/view/support_list.dart'
    as _i20;
import 'package:vm_fm_4/product/screens/home/view/home_screen.dart' as _i8;
import 'package:vm_fm_4/product/screens/new_order/view/new_order_screen.dart'
    as _i11;
import 'package:vm_fm_4/product/screens/search/view/asset_detail_screen.dart'
    as _i2;
import 'package:vm_fm_4/product/screens/search/view/asset_search_screen.dart'
    as _i3;
import 'package:vm_fm_4/product/screens/search/view/search_screen.dart' as _i15;
import 'package:vm_fm_4/product/screens/search/view/space_search_screen.dart'
    as _i17;
import 'package:vm_fm_4/product/screens/splash/splash_screen.dart' as _i18;
import 'package:vm_fm_4/product/screens/test/view/test_screen.dart' as _i21;
import 'package:vm_fm_4/product/wrapper/app_wrapper.dart' as _i1;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppWrapper(),
      );
    },
    AssetDetailScreen.name: (routeData) {
      final args = routeData.argsAs<AssetDetailScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AssetDetailScreen(
          key: args.key,
          assetListModel: args.assetListModel,
          assetImageModel: args.assetImageModel,
          assetDocumentModel: args.assetDocumentModel,
          imageExist: args.imageExist,
          documentExist: args.documentExist,
        ),
      );
    },
    AssetSearchScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AssetSearchScreen(),
      );
    },
    DetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<DetailWorkOrderScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DetailWorkOrderScreen(
          key: args.key,
          workSpaceDetail: args.workSpaceDetail,
        ),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouter(),
      );
    },
    EmptyRouter2.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouter2(),
      );
    },
    EmptyRouter3.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EmptyRouter3(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      final args = routeData.argsAs<LoginScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.LoginScreen(
          key: args.key,
          userName: args.userName,
        ),
      );
    },
    MyWorkOrders.name: (routeData) {
      final args = routeData.argsAs<MyWorkOrdersArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.MyWorkOrders(
          key: args.key,
          provider: args.provider,
        ),
      );
    },
    NewOrderScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NewOrderScreen(),
      );
    },
    PendingDetailWorkOrderScreen.name: (routeData) {
      final args = routeData.argsAs<PendingDetailWorkOrderScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.PendingDetailWorkOrderScreen(
          key: args.key,
          workSpacePendiks: args.workSpacePendiks,
        ),
      );
    },
    ScopeDetail.name: (routeData) {
      final args = routeData.argsAs<ScopeDetailArgs>(
          orElse: () => const ScopeDetailArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ScopeDetail(
          key: args.key,
          maintanenceList: args.maintanenceList,
          checkListValueModel: args.checkListValueModel,
          checkListSituation: args.checkListSituation,
        ),
      );
    },
    ScopeList.name: (routeData) {
      final args = routeData.argsAs<ScopeListArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.ScopeList(
          key: args.key,
          taskId: args.taskId,
        ),
      );
    },
    SearchScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SearchScreen(),
      );
    },
    SearchWorkOrderScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SearchWorkOrderScreen(),
      );
    },
    SpaceSearchScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SpaceSearchScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreen(),
      );
    },
    SupportDetail.name: (routeData) {
      final args = routeData.argsAs<SupportDetailArgs>(
          orElse: () => const SupportDetailArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.SupportDetail(
          key: args.key,
          supportList: args.supportList,
          checkListValueModel: args.checkListValueModel,
          checkListSituation: args.checkListSituation,
        ),
      );
    },
    SupportList.name: (routeData) {
      final args = routeData.argsAs<SupportListArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.SupportList(
          key: args.key,
          taskId: args.taskId,
        ),
      );
    },
    TestScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.TestScreen(),
      );
    },
    WorkOrderGroupDetailScreen.name: (routeData) {
      final args = routeData.argsAs<WorkOrderGroupDetailScreenArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.WorkOrderGroupDetailScreen(
          key: args.key,
          requestCode: args.requestCode,
          appTitle: args.appTitle,
        ),
      );
    },
    WorkOrderListScreen.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.WorkOrderListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i24.PageRouteInfo<void> {
  const AppWrapper({List<_i24.PageRouteInfo>? children})
      : super(
          AppWrapper.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapper';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AssetDetailScreen]
class AssetDetailScreen extends _i24.PageRouteInfo<AssetDetailScreenArgs> {
  AssetDetailScreen({
    _i25.Key? key,
    required _i26.AssetListModel assetListModel,
    List<_i27.AssetImageModel>? assetImageModel,
    List<_i28.AssetDocumentModel>? assetDocumentModel,
    required bool imageExist,
    required bool documentExist,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<AssetDetailScreenArgs> page =
      _i24.PageInfo<AssetDetailScreenArgs>(name);
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

  final _i25.Key? key;

  final _i26.AssetListModel assetListModel;

  final List<_i27.AssetImageModel>? assetImageModel;

  final List<_i28.AssetDocumentModel>? assetDocumentModel;

  final bool imageExist;

  final bool documentExist;

  @override
  String toString() {
    return 'AssetDetailScreenArgs{key: $key, assetListModel: $assetListModel, assetImageModel: $assetImageModel, assetDocumentModel: $assetDocumentModel, imageExist: $imageExist, documentExist: $documentExist}';
  }
}

/// generated route for
/// [_i3.AssetSearchScreen]
class AssetSearchScreen extends _i24.PageRouteInfo<void> {
  const AssetSearchScreen({List<_i24.PageRouteInfo>? children})
      : super(
          AssetSearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'AssetSearchScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DetailWorkOrderScreen]
class DetailWorkOrderScreen
    extends _i24.PageRouteInfo<DetailWorkOrderScreenArgs> {
  DetailWorkOrderScreen({
    _i25.Key? key,
    required _i29.WorkSpaceDetail workSpaceDetail,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          DetailWorkOrderScreen.name,
          args: DetailWorkOrderScreenArgs(
            key: key,
            workSpaceDetail: workSpaceDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailWorkOrderScreen';

  static const _i24.PageInfo<DetailWorkOrderScreenArgs> page =
      _i24.PageInfo<DetailWorkOrderScreenArgs>(name);
}

class DetailWorkOrderScreenArgs {
  const DetailWorkOrderScreenArgs({
    this.key,
    required this.workSpaceDetail,
  });

  final _i25.Key? key;

  final _i29.WorkSpaceDetail workSpaceDetail;

  @override
  String toString() {
    return 'DetailWorkOrderScreenArgs{key: $key, workSpaceDetail: $workSpaceDetail}';
  }
}

/// generated route for
/// [_i5.EmptyRouter]
class EmptyRouter extends _i24.PageRouteInfo<void> {
  const EmptyRouter({List<_i24.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EmptyRouter2]
class EmptyRouter2 extends _i24.PageRouteInfo<void> {
  const EmptyRouter2({List<_i24.PageRouteInfo>? children})
      : super(
          EmptyRouter2.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter2';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EmptyRouter3]
class EmptyRouter3 extends _i24.PageRouteInfo<void> {
  const EmptyRouter3({List<_i24.PageRouteInfo>? children})
      : super(
          EmptyRouter3.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter3';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeScreen extends _i24.PageRouteInfo<void> {
  const HomeScreen({List<_i24.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginScreen extends _i24.PageRouteInfo<LoginScreenArgs> {
  LoginScreen({
    _i25.Key? key,
    required String userName,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          LoginScreen.name,
          args: LoginScreenArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i24.PageInfo<LoginScreenArgs> page =
      _i24.PageInfo<LoginScreenArgs>(name);
}

class LoginScreenArgs {
  const LoginScreenArgs({
    this.key,
    required this.userName,
  });

  final _i25.Key? key;

  final String userName;

  @override
  String toString() {
    return 'LoginScreenArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i10.MyWorkOrders]
class MyWorkOrders extends _i24.PageRouteInfo<MyWorkOrdersArgs> {
  MyWorkOrders({
    _i25.Key? key,
    required _i30.WorkOrderListProvider provider,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          MyWorkOrders.name,
          args: MyWorkOrdersArgs(
            key: key,
            provider: provider,
          ),
          initialChildren: children,
        );

  static const String name = 'MyWorkOrders';

  static const _i24.PageInfo<MyWorkOrdersArgs> page =
      _i24.PageInfo<MyWorkOrdersArgs>(name);
}

class MyWorkOrdersArgs {
  const MyWorkOrdersArgs({
    this.key,
    required this.provider,
  });

  final _i25.Key? key;

  final _i30.WorkOrderListProvider provider;

  @override
  String toString() {
    return 'MyWorkOrdersArgs{key: $key, provider: $provider}';
  }
}

/// generated route for
/// [_i11.NewOrderScreen]
class NewOrderScreen extends _i24.PageRouteInfo<void> {
  const NewOrderScreen({List<_i24.PageRouteInfo>? children})
      : super(
          NewOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'NewOrderScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PendingDetailWorkOrderScreen]
class PendingDetailWorkOrderScreen
    extends _i24.PageRouteInfo<PendingDetailWorkOrderScreenArgs> {
  PendingDetailWorkOrderScreen({
    _i25.Key? key,
    required _i31.WorkSpacePendiks workSpacePendiks,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          PendingDetailWorkOrderScreen.name,
          args: PendingDetailWorkOrderScreenArgs(
            key: key,
            workSpacePendiks: workSpacePendiks,
          ),
          initialChildren: children,
        );

  static const String name = 'PendingDetailWorkOrderScreen';

  static const _i24.PageInfo<PendingDetailWorkOrderScreenArgs> page =
      _i24.PageInfo<PendingDetailWorkOrderScreenArgs>(name);
}

class PendingDetailWorkOrderScreenArgs {
  const PendingDetailWorkOrderScreenArgs({
    this.key,
    required this.workSpacePendiks,
  });

  final _i25.Key? key;

  final _i31.WorkSpacePendiks workSpacePendiks;

  @override
  String toString() {
    return 'PendingDetailWorkOrderScreenArgs{key: $key, workSpacePendiks: $workSpacePendiks}';
  }
}

/// generated route for
/// [_i13.ScopeDetail]
class ScopeDetail extends _i24.PageRouteInfo<ScopeDetailArgs> {
  ScopeDetail({
    _i25.Key? key,
    _i32.MaintanenceModel? maintanenceList,
    _i33.StartCheckListValueModel? checkListValueModel,
    String? checkListSituation,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ScopeDetail.name,
          args: ScopeDetailArgs(
            key: key,
            maintanenceList: maintanenceList,
            checkListValueModel: checkListValueModel,
            checkListSituation: checkListSituation,
          ),
          initialChildren: children,
        );

  static const String name = 'ScopeDetail';

  static const _i24.PageInfo<ScopeDetailArgs> page =
      _i24.PageInfo<ScopeDetailArgs>(name);
}

class ScopeDetailArgs {
  const ScopeDetailArgs({
    this.key,
    this.maintanenceList,
    this.checkListValueModel,
    this.checkListSituation,
  });

  final _i25.Key? key;

  final _i32.MaintanenceModel? maintanenceList;

  final _i33.StartCheckListValueModel? checkListValueModel;

  final String? checkListSituation;

  @override
  String toString() {
    return 'ScopeDetailArgs{key: $key, maintanenceList: $maintanenceList, checkListValueModel: $checkListValueModel, checkListSituation: $checkListSituation}';
  }
}

/// generated route for
/// [_i14.ScopeList]
class ScopeList extends _i24.PageRouteInfo<ScopeListArgs> {
  ScopeList({
    _i25.Key? key,
    required String taskId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ScopeList.name,
          args: ScopeListArgs(
            key: key,
            taskId: taskId,
          ),
          initialChildren: children,
        );

  static const String name = 'ScopeList';

  static const _i24.PageInfo<ScopeListArgs> page =
      _i24.PageInfo<ScopeListArgs>(name);
}

class ScopeListArgs {
  const ScopeListArgs({
    this.key,
    required this.taskId,
  });

  final _i25.Key? key;

  final String taskId;

  @override
  String toString() {
    return 'ScopeListArgs{key: $key, taskId: $taskId}';
  }
}

/// generated route for
/// [_i15.SearchScreen]
class SearchScreen extends _i24.PageRouteInfo<void> {
  const SearchScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SearchWorkOrderScreen]
class SearchWorkOrderScreen extends _i24.PageRouteInfo<void> {
  const SearchWorkOrderScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SearchWorkOrderScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchWorkOrderScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SpaceSearchScreen]
class SpaceSearchScreen extends _i24.PageRouteInfo<void> {
  const SpaceSearchScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SpaceSearchScreen.name,
          initialChildren: children,
        );

  static const String name = 'SpaceSearchScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashScreen]
class SplashScreen extends _i24.PageRouteInfo<void> {
  const SplashScreen({List<_i24.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SupportDetail]
class SupportDetail extends _i24.PageRouteInfo<SupportDetailArgs> {
  SupportDetail({
    _i25.Key? key,
    _i34.SupportModel? supportList,
    _i35.StartCheckListValueModel? checkListValueModel,
    String? checkListSituation,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SupportDetail.name,
          args: SupportDetailArgs(
            key: key,
            supportList: supportList,
            checkListValueModel: checkListValueModel,
            checkListSituation: checkListSituation,
          ),
          initialChildren: children,
        );

  static const String name = 'SupportDetail';

  static const _i24.PageInfo<SupportDetailArgs> page =
      _i24.PageInfo<SupportDetailArgs>(name);
}

class SupportDetailArgs {
  const SupportDetailArgs({
    this.key,
    this.supportList,
    this.checkListValueModel,
    this.checkListSituation,
  });

  final _i25.Key? key;

  final _i34.SupportModel? supportList;

  final _i35.StartCheckListValueModel? checkListValueModel;

  final String? checkListSituation;

  @override
  String toString() {
    return 'SupportDetailArgs{key: $key, supportList: $supportList, checkListValueModel: $checkListValueModel, checkListSituation: $checkListSituation}';
  }
}

/// generated route for
/// [_i20.SupportList]
class SupportList extends _i24.PageRouteInfo<SupportListArgs> {
  SupportList({
    _i25.Key? key,
    required String taskId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SupportList.name,
          args: SupportListArgs(
            key: key,
            taskId: taskId,
          ),
          initialChildren: children,
        );

  static const String name = 'SupportList';

  static const _i24.PageInfo<SupportListArgs> page =
      _i24.PageInfo<SupportListArgs>(name);
}

class SupportListArgs {
  const SupportListArgs({
    this.key,
    required this.taskId,
  });

  final _i25.Key? key;

  final String taskId;

  @override
  String toString() {
    return 'SupportListArgs{key: $key, taskId: $taskId}';
  }
}

/// generated route for
/// [_i21.TestScreen]
class TestScreen extends _i24.PageRouteInfo<void> {
  const TestScreen({List<_i24.PageRouteInfo>? children})
      : super(
          TestScreen.name,
          initialChildren: children,
        );

  static const String name = 'TestScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.WorkOrderGroupDetailScreen]
class WorkOrderGroupDetailScreen
    extends _i24.PageRouteInfo<WorkOrderGroupDetailScreenArgs> {
  WorkOrderGroupDetailScreen({
    _i25.Key? key,
    required String requestCode,
    required String appTitle,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<WorkOrderGroupDetailScreenArgs> page =
      _i24.PageInfo<WorkOrderGroupDetailScreenArgs>(name);
}

class WorkOrderGroupDetailScreenArgs {
  const WorkOrderGroupDetailScreenArgs({
    this.key,
    required this.requestCode,
    required this.appTitle,
  });

  final _i25.Key? key;

  final String requestCode;

  final String appTitle;

  @override
  String toString() {
    return 'WorkOrderGroupDetailScreenArgs{key: $key, requestCode: $requestCode, appTitle: $appTitle}';
  }
}

/// generated route for
/// [_i23.WorkOrderListScreen]
class WorkOrderListScreen extends _i24.PageRouteInfo<void> {
  const WorkOrderListScreen({List<_i24.PageRouteInfo>? children})
      : super(
          WorkOrderListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WorkOrderListScreen';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
