import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/database/hive/boxes/log_hive_model.dart';

final class BoxManager {
  BoxManager._();

  static Future<void> init() async {
    Hive.registerAdapter(LogHiveModelAdapter());
    await Hive.openBox<LogHiveModel>('logBox');
  }

  static final Box<LogHiveModel> _logBox = Hive.box('logBox');

  static Box<LogHiveModel> get logBox => _logBox;
}
