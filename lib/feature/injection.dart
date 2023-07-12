import 'package:get_it/get_it.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

import 'log/log_manager.dart';
import 'service/service_manager.dart';

class Injection {
  static final GetIt getIt = GetIt.instance;

  void initInstances() {
    getIt
      ..registerLazySingleton<ServiceManager>(() => ServiceManager())
      ..registerSingleton<LogManager>(LogManager())
      ..registerSingleton<GlobalProvider>(GlobalProvider())

      // services
      ..registerLazySingleton<WorkOrderServiceRepositoryImpl>(() => WorkOrderServiceRepositoryImpl());
  }
}
