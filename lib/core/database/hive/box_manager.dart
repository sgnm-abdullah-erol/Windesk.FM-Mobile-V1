import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/database/hive/boxes/graphql_log_hive_model.dart';
import 'package:vm_fm_4/core/database/hive/boxes/http_log_hive_model.dart';

final class BoxManager {
  BoxManager._();

  static Future<void> init() async {
    // register adapter
    Hive.registerAdapter(HttpLogHiveModelAdapter());
    Hive.registerAdapter(GraphqlLogHiveModelAdapter());

    // open boxes
    await Hive.openBox<HttpLogHiveModel>('logBox');
    await Hive.openBox<GraphqlLogHiveModel>('graphqlLogBox');
  }

  static final Box<GraphqlLogHiveModel> _graphqlLogBox = Hive.box('graphqlLogBox');
  static final Box<HttpLogHiveModel> _logBox = Hive.box('logBox');

  static Box<HttpLogHiveModel> get logBox => _logBox;
  static Box<GraphqlLogHiveModel> get graphqlLogBox => _graphqlLogBox;
}
