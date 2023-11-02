import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'service/test_service_repo_impl.dart';

class TestProvider extends ChangeNotifier {
  final TestServiceRepositoryImpl testServices = TestServiceRepositoryImpl();
  void checkUserAlreadyLoggedIn() {}

  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _accessTestV1 = 'loading';
  get accessTestV1 => _accessTestV1;

  set setAccessTestV1(String accessTestV1) {
    _accessTestV1 = accessTestV1;
    notifyListeners();
  }

  String _accessTestV2 = 'loading';
  get accessTestV2 => _accessTestV2;

  set setAccessTestV2(String accessTestV2) {
    _accessTestV2 = accessTestV2;
  }

  bool _getInfoLoad = false;
  get getInfoLoad => _getInfoLoad;
  set setGetInfoLoad(bool getInfoLoad) {
    _getInfoLoad = getInfoLoad;
  }

  String _deviceModel = '';
  get deviceModel => _deviceModel;
  set setDeviceModel(String deviceModel) {
    _deviceModel = deviceModel;
  }

  String _deviceOS = '';
  get deviceOS => _deviceOS;
  set setDeviceOS(String deviceOS) {
    _deviceOS = deviceOS;
  }

  String _appVersion = '';
  get appVersion => _appVersion;
  set setAppVersion(String appVersion) {
    _appVersion = appVersion;
  }

  String _serverTime = '';
  get serverTime => _serverTime;
  set setServerTime(String serverTime) {
    String yil = serverTime[0] + serverTime[1] + serverTime[2] + serverTime[3];
    String ay = serverTime[4] + serverTime[5];
    String gun = serverTime[6] + serverTime[7];
    String saat = serverTime[8] + serverTime[9];
    String dakika = serverTime[10] + serverTime[11];
    String saniye = serverTime[12] + serverTime[13];
    _serverTime = '$gun/$ay/$yil $saat:$dakika:$saniye';
  }

  String _phoneTime = '';
  get phoneTime => _phoneTime;
  set setPhoneTime(String phoneTime) {
    _phoneTime = phoneTime;
  }

  void getTestScreenInfo() async {
    setGetInfoLoad = true;
    setDeviceModel = await SharedManager().getString(SharedEnum.deviceModel);
    setDeviceOS = await SharedManager().getString(SharedEnum.deviceType);
    setAppVersion = await SharedManager().getString(SharedEnum.appVersion);
    notifyListeners();
  }

  void getServerTime() async {
    String token = await SharedManager().getString(SharedEnum.deviceId);
    var getServerTimeResult = await testServices.getServerTime(token);
    getServerTimeResult.fold(
      (l) => {setServerTime = l},
      (r) => null,
    );
  }

  void getPhoneTime() {
    DateTime now = DateTime.now();
    int gun = now.day;
    int ay = now.month;
    int yil = now.year;

    int hour = now.hour;
    int minute = now.minute;
    int second = now.second;
    setPhoneTime = '$gun/$ay/$yil $hour:$minute:$second';
    notifyListeners();
  }

  void accessTestV1Function() async {
    //getServerTime();
    getPhoneTime();
    setAccessTestV1 = 'loading';
    notifyListeners();
    var accesTestResult = await testServices.accessTestWindesk();
    accesTestResult.fold(
        (l) => {setAccessTestV1 = 'true'}, (r) => setAccessTestV1 = 'false');
    notifyListeners();
  }

  void accessTestV2Function() async {
    setAccessTestV2 = 'loading';
    notifyListeners();

    var accesTestResult = await testServices.accessTestMobileService();
    accesTestResult.fold(
        (l) => {setAccessTestV2 = 'true'}, (r) => setAccessTestV2 = 'false');

    notifyListeners();
  }
}
