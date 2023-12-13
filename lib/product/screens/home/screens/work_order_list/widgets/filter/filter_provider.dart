import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  bool initState = true;
  bool isLoading = false;

  String _space = '';
  String get space => _space;

  String _category = '';
  String get category => _category;

  String _date = '';
  String get date => _date;

  String _state = '';
  String get state => _state;

  String _priority = '';
  String get priority => _priority;

  Future<void> init() async {
    if (initState) {
      initState = false;
      _changeLoading();

      await Future.delayed(const Duration(seconds: 2));
      // TODO SERVIS ÇAĞIRILACAK
      _changeLoading();
    }
  }

  //* clear filter
  void clearFilter() {
    _space = '';
    _category = '';
    _date = '';
    _state = '';
    _priority = '';
    notifyListeners();
  }

  //* loading

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  //* setter
  void setSpace(String space) {
    _space = space;
  }

  void setCategory(String category) {
    _category = category;
  }

  void setDate(String date) {
    _date = date;
  }

  void setState(String state) {
    _state = state;
  }

  void setPriority(String priority) {
    _priority = priority;
  }
}
