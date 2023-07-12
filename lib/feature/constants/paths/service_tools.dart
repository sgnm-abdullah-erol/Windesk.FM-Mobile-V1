import 'package:flutter/material.dart';

@immutable
class ServiceTools {
  const ServiceTools._();

  static const String baseUrlV1 =
      'http://10.126.12.21/esh/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  static const String baseUrlV2 = 'http://windeskmobiletest.eskisehir.yerel';
  static const tokenV1 = 'wdeshtest!_';
  static const tokenV2 = 'eshtest!';
  static const attachPath = "http://10.126.12.21/esh/";
  static const attachPathLive = "http://10.126.12.21/esh/xreadattach.php?token=$tokenV1&id=";
}
