import 'package:flutter/material.dart';

class SlaTimeLineProvider extends ChangeNotifier {
  bool initState = true;
  bool isLoading = false;

  Future<void> init() async {
    if (initState) {
      initState = false;
      _changeLoading();

      await Future.delayed(const Duration(seconds: 2));
      // TODO SERVIS ÇAĞIRILACAK, Alinan data ui'ya aktarilacak
      _changeLoading();
    }
  }

  //* loading
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
