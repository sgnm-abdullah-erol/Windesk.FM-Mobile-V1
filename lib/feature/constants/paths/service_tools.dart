import 'package:flutter/material.dart';

@immutable
class ServiceTools {
  const ServiceTools._();

  static const String baseUrlV1 =
      'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  static const String baseUrlV2 = 'http://windeskmobile.signumtte.com';
  static const tokenV1 = 'wddemo!_';
  static const tokenV2 = 'demo!';
  static const attachPath = "http://10.126.12.21/esh/";
  static const attachPathLive = "http://10.32.12.42/windesktest/xreadattach.php?token=$tokenV1&id=";
  static const facilityName = "İstanbul Finans Merkezi";
}
