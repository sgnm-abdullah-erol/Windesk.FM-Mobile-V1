// ignore_for_file: avoid_print

import 'dart:io';

import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vm_fm_4/core/database/hive/box_manager.dart';
import 'package:vm_fm_4/core/database/hive/boxes/log_hive_model.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/service/log/log_service.dart';
import 'package:vm_fm_4/feature/service/log/log_service_model.dart';
import 'package:vm_fm_4/feature/service/service_manager.dart';

class InternetListenerClass {
  internetConnection(context) async {
    // Simple check to see if we have internet

    var durum = 1;

    InternetConnectionChecker().addresses = <AddressCheckOptions>[
      AddressCheckOptions(
        address: InternetAddress(
          '1.1.1.1', //10.86.4.46 aeh
          // 1.1.1.1 cihaz interneti
          type: InternetAddressType.IPv4,
        ),
        port: 80,
      ),
    ];

    InternetConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          if (durum != 1) {
            // clear hive box log and send logs to server
            snackBar(context, 'İnternet bağlantısı sağlandı. ', 'success');
            _internetReconnected();
          }
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          durum = 0;
          snackBar(context, 'İnternet bağlantısı bulunamadı. Lütfen kontrol ediniz.', 'error');
          await _internetConnectionLost();
          break;
      }
    });
  }

  void _internetReconnected() async {
    // add reconnected information to log box
    final Box<LogHiveModel> logBox = BoxManager.logBox;
    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final logHiveModel = LogHiveModel(
      response: 'Internet connection reconnected.',
      requestPath: 'mobile',
      statusCode: 500,
      headers: 'no headers',
      error: 'Internet connection reconnected.',
      logCatchError: 'Internet connection reconnected.',
      date: DateTime.now().toIso8601String(),
      userToken: userToken,
    );

    logBox.add(logHiveModel);

    // send logs to server
    List<LogHiveModel> logList = [];

    // first clear log box
    for (LogHiveModel log in logBox.values) {
      logList.add(log);
    }

    print('logList: $logList');

    await logBox.clear();

    // send logs to server
    for (LogHiveModel log in logList) {
      LogService.singleLogServiceRequest(
        ServiceManager().dio,
        userToken,
        LogServiceModel(
          response: log.response,
          requestPath: log.requestPath,
          statusCode: log.statusCode,
          headers: log.headers,
          date: log.date,
          logCatchError: log.logCatchError,
          error: log.error,
        ),
      );
    }
  }

  Future<void> _internetConnectionLost() async {
    final Box<LogHiveModel> logBox = BoxManager.logBox;
    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final logHiveModel = LogHiveModel(
      response: 'Internet connection error.',
      requestPath: 'mobile',
      statusCode: 500,
      headers: 'no headers',
      error: 'Internet connection error.',
      logCatchError: 'Internet connection error.',
      date: DateTime.now().toIso8601String(),
      userToken: userToken,
    );

    logBox.add(logHiveModel);
  }
}
