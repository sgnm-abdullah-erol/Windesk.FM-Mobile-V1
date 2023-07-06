import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:vm_fm_4/feature/models/work_order_models/work_order_loads.dart';

void main() {
  Dio dio = Dio();
  Logger logger = Logger();

  test('workorder-workloads', () async {
    List<WorkOrderLoads> loads = [];

    final response = await dio.get(
      'http://windeskmobile.signumtte.com/workorder/wo00002989/workloads',
      options: Options(
        headers: {'xusercode': "sgnm1040", 'xtoken': "demo!"},
        responseType: ResponseType.json,
      ),
    );
    print(response);

    if (response.data['result'] == 'success') {
      final data = response.data['records'];

      for (var item in data) {
        loads.add(WorkOrderLoads.fromJson(item));
      }

      logger.e(loads);
    } else {
      print(response.data['message']);
    }
  });
}
