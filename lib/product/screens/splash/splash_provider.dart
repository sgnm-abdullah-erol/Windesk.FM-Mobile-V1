import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/database/shared_manager.dart';

class SplashProvider extends ChangeNotifier {
  late Timer _timer;
  bool _isSplashFinished = false;
  bool get isSplashFinished => _isSplashFinished;

  bool _isUserAlreadyLoggedIn = false;
  bool get isUserAlreadyLoggedIn => _isUserAlreadyLoggedIn;

  void checkUserAlreadyLoggedIn() async {
    await SharedManager().initInstances();
    print(await SharedManager().getString('isUserLoggedIn'));
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
