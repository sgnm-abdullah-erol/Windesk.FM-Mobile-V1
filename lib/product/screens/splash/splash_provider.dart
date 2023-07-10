import 'dart:async';

import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  late Timer _timer;
  bool _isSplashFinished = false;
  bool get isSplashFinished => _isSplashFinished;

  bool _isUserAlreadyLoggedIn = false;
  bool get isUserAlreadyLoggedIn => _isUserAlreadyLoggedIn;

  void checkUserAlreadyLoggedIn() {}

  void setSplashFinished() {
    if (_isSplashFinished == true) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 3) {
        _timer.cancel();
        _isSplashFinished = true;
        _isUserAlreadyLoggedIn = true;
        _isSplashFinished = true;
        notifyListeners();
      }
    });
  }
}
