import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import '../../../feature/database/shared_manager.dart';
import 'dart:developer' as logDev;

class SplashProvider extends ChangeNotifier {
  late Timer _timer;
  bool _isSplashFinished = false;
  bool get isSplashFinished => _isSplashFinished;

  bool _isUserAlreadyLoggedIn = false;
  bool get isUserAlreadyLoggedIn => _isUserAlreadyLoggedIn;

  void _getDeviceInformation() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      logDev.log(iosInfo.toString());
    }
    // final result = await deviceInfoPlugin.deviceInfo;
    // debugPrint(result.toString(), wrapWidth: 10000);
    // final deviceId = result.data['id'];
    // final deviceType = result.data['systemFeatures'];

    // print(deviceId);
    // print(deviceType);

    // await SharedManager().setString(SharedEnum.deviceId, deviceId);
    // await SharedManager().setString(SharedEnum.deviceType, deviceType);
  }

  void checkUserAlreadyLoggedIn() async {
    await SharedManager().initInstances();
    _getDeviceInformation();

    // print(await SharedManager().getString(SharedEnum.deviceId));
    // print(await SharedManager().getString(SharedEnum.deviceType));

    // final String? userName = await SharedManager().getString(SharedEnum.userName);
  }

  void setSplashFinished() {
    if (_isSplashFinished == true) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 3) {
        checkUserAlreadyLoggedIn();
        _timer.cancel();
        _isSplashFinished = true;
        _isUserAlreadyLoggedIn = true;
        _isSplashFinished = true;
        notifyListeners();
      }
    });
  }
}
