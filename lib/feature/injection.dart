import 'package:get_it/get_it.dart';
import 'package:vm_fm_4/feature/service/service_manager.dart';

import 'log/log_manager.dart';

class Injection {
  static final GetIt getIt = GetIt.instance;

  void initInstances() {
    getIt
      ..registerSingleton<ServiceManager>(ServiceManager())
      ..registerSingleton<LogManager>(LogManager());
  }
}
