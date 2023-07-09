import 'package:get_it/get_it.dart';

import 'log/log_manager.dart';
import 'service/service_manager.dart';

class Injection {
  static final GetIt getIt = GetIt.instance;

  void initInstances() {
    getIt
      ..registerLazySingleton<ServiceManager>(() => ServiceManager())
      ..registerSingleton<LogManager>(LogManager());
  }
}
