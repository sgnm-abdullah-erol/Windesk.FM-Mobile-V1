import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/database/hive/box_manager.dart';
import 'package:vm_fm_4/core/database/hive/boxes/graphql_log_hive_model.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/models/log/graphql_log_service_model.dart';
import 'package:vm_fm_4/feature/service/service_manager.dart';

final class GraphqlLogService {
  static Future<void> log(GraphqlLogServiceModel model) async {
    String url = '${ServiceTools.url.log_url}/mobile/log';
    Dio dio = ServiceManager().dio;
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    try {
      await dio.post(
        url,
        data: {
          'url': model.url,
          'query': model.query,
          'variables': model.variables,
          'result': model.result,
          'error': model.error ?? '',
          'date': model.date ?? '',
        },
        options: Options(
          headers: {
            'authorization': 'Bearer $userToken',
          },
        ),
      );
    } catch (error) {
      final Box<GraphqlLogHiveModel> logBox = BoxManager.graphqlLogBox;
      final logHiveModel = GraphqlLogHiveModel(
        url: model.url,
        query: model.query,
        variables: model.variables,
        result: model.result,
        error: model.error,
        logCatchError: error.toString(),
        date: DateTime.now().toIso8601String(),
        userToken: userToken,
      );

      logBox.add(logHiveModel);
    }
  }
}
