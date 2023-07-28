import 'package:get_it/get_it.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/download/download_service_repository_impl.dart';
import 'package:vm_fm_4/product/screens/new_order/service/wo_create_service_repository_impl.dart';
import 'service/global_services.dart/auth_service/auth_service_repository_impl.dart';
import 'service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

import 'global_providers/global_provider.dart';
import 'log/log_manager.dart';
import 'service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';
import 'service/service_manager.dart';

class Injection {
  static final GetIt getIt = GetIt.instance;

  void initInstances() {
    getIt
      ..registerLazySingleton<ServiceManager>(() => ServiceManager())
      ..registerLazySingleton<LogManager>(() => LogManager())
      ..registerLazySingleton<GlobalProvider>(() => GlobalProvider())

      // services
      ..registerLazySingleton<WorkOrderServiceRepositoryImpl>(() => WorkOrderServiceRepositoryImpl())
      ..registerLazySingleton<AuthServiceRepositoryImpl>(() => AuthServiceRepositoryImpl())
      ..registerLazySingleton<WorkSpaceServiceRepositoryImpl>(() => WorkSpaceServiceRepositoryImpl())
      ..registerLazySingleton<WoCreateServiceRepositoryImpl>(() => WoCreateServiceRepositoryImpl())
      ..registerLazySingleton<DownloadServiceRepositoryImpl>(() => DownloadServiceRepositoryImpl());
  }
}
