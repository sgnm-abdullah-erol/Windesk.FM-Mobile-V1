// ignore_for_file: unused_element

import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../feature/database/shared_manager.dart';
import '../../../feature/enums/shared_enums.dart';

class SplashProvider extends ChangeNotifier {
  String? deviceModel;
  String? deviceVersion;

  late Timer _timer;
  bool _isSplashFinished = false;
  bool get isSplashFinished => _isSplashFinished;

  bool _isUserAlreadyLoggedIn = false;
  bool get isUserAlreadyLoggedIn => _isUserAlreadyLoggedIn;

  void _getDeviceInformation() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    String? deviceId;
    String? deviceOS;

    // Gets device information from Android and iOS devices sparingly.
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceModel = androidInfo.model;
      deviceVersion = androidInfo.version.release;
      deviceId = androidInfo.id;
      deviceOS = 'Android';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.model;
      deviceVersion = iosInfo.systemVersion;
      deviceId = iosInfo.identifierForVendor ?? 'unknown ID';
      deviceOS = 'iOS';
    }

    // sets device information to shared preferences.
    if (deviceId != null && deviceOS != null) {
      await SharedManager().setString(SharedEnum.deviceId, deviceId);
      await SharedManager().setString(SharedEnum.deviceType, deviceOS);
    }
  }

  void _getFirebaseInformation() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    if (firebaseToken == null) return;
    await SharedManager().setString(SharedEnum.firebaseToken, firebaseToken);
  }

  String getDeviceModel() {
    if (deviceModel != null) {
      return deviceModel!;
    }
    return 'unknown';
  }

  String getDeviceVersion() {
    if (deviceVersion != null) {
      return deviceVersion!;
    }
    return 'unknown';
  }

  void checkUserAlreadyLoggedIn() async {
    await SharedManager().initInstances();
    _getDeviceInformation();
    // _getFirebaseInformation();

    final String userName = await SharedManager().getString(SharedEnum.userName);

    if (userName.isEmpty) {
      _isUserAlreadyLoggedIn = false;
    } else {
      _isUserAlreadyLoggedIn = true;
    }
  }

  void setSplashFinished() {
    if (_isSplashFinished == true) return;
    checkUserAlreadyLoggedIn();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 3) {
        _timer.cancel();
        _isSplashFinished = true;
        notifyListeners();
      }
    });
  }
}
