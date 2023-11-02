// ignore_for_file: non_constant_identifier_names

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
  static const attachPathLive =
      "http://10.32.12.42/windesktest/xreadattach.php?token=$tokenV1&id=";
  static const facilityName = "İstanbul Finans Merkezi";

  static const bool _isProduction = true;

  static Url get url {
    if (_isProduction) {
      return const Url(
        facility_url: "https://facility-server.ifm.gov.tr",
        users_url: "https://user-server.ifm.gov.tr",
        asset_url: "https://asset-server.ifm.gov.tr",
        workorder_url: "https://workorder-server.ifm.gov.tr",
      );
    } else {
      return const Url(
        facility_url: "http://10.0.2.2:3000",
        users_url: "http://10.0.2.2:3012",
        asset_url: "http://10.0.2.2:3014",
        workorder_url: "http://10.0.2.2:3015",
      );
    }
  }
}

@immutable
class Url {
  final String facility_url;
  final String users_url;
  final String asset_url;
  final String workorder_url;

  const Url({
    required this.facility_url,
    required this.users_url,
    required this.asset_url,
    required this.workorder_url,
  });
}
