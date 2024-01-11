// ignore_for_file: unused_element, use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';

import '../../../core/database/shared_manager.dart';
import '../../../core/enums/shared_enums.dart';

class SplashProvider extends ChangeNotifier {
  final AuthServiceRepositoryImpl _authService = AuthServiceRepositoryImpl();

  String? deviceModel;
  String? deviceVersion;

  late Timer _timer;
  bool _isSplashFinished = false;
  bool get isSplashFinished => _isSplashFinished;

  bool _isUserAlreadyLoggedIn = false;
  bool get isUserAlreadyLoggedIn => _isUserAlreadyLoggedIn;

  Future<void> _getDeviceInformation() async {
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

  Future<void> _getFirebaseInformation() async {
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

  void checkUserAlreadyLoggedIn(BuildContext context) async {
    await SharedManager().initInstances();
    await _getDeviceInformation();
    await _getFirebaseInformation();

    final String userName = await SharedManager().getString(SharedEnum.userName);

    if (userName.isNotEmpty) {
      final String userToken = await SharedManager().getString(SharedEnum.userToken);
      await _authService.checkAccessToken(userToken).then((value) {
        value.fold((l) {
          if (l.isTokenValid == true) {
            _isUserAlreadyLoggedIn = true;
          } else {
            _isUserAlreadyLoggedIn = false;
          }
        }, (r) {
          _isUserAlreadyLoggedIn = false;
        });
      });

      // set global properties
      String userName = await SharedManager().getString(SharedEnum.userName);
      String userId = await SharedManager().getString(SharedEnum.userId);
      String userTokenn = await SharedManager().getString(SharedEnum.userToken);

      context.read<GlobalProvider>().setUserName(userName);
      context.read<GlobalProvider>().setUserId(userId);
      context.read<GlobalProvider>().setGlobalUserToken(userTokenn);
    } else {
      _isUserAlreadyLoggedIn = false;
    }
  }

  void setSplashFinished(BuildContext context) async {
    if (_isSplashFinished == true) {}

    if (_isSplashFinished == true) return;

    checkUserAlreadyLoggedIn(context);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 3) {
        _timer.cancel();
        _isSplashFinished = true;
        notifyListeners();
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      _isSplashFinished = false;
    });
  }
}
