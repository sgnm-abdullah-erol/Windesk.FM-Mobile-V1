import 'package:flutter/material.dart';

@immutable
class ServiceTools {
  const ServiceTools._();

  static const String baseUrlV1 =
      'http://10.32.12.22/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  static const String baseUrlV2 = 'http://windeskmobile.eskisehir.yerel';
  static const tokenV1 = 'wdeshprod!_';
  static const tokenV2 = 'eshtest!';
  static const attachPath = "http://10.126.12.141/windesk/";
  static const attachPathLive = "http://10.126.12.141/windesk/xreadattach.php?token=$tokenV1&id=";
}
