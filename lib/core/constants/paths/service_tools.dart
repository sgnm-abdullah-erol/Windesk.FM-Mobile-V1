// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/enums/task_response_enums.dart';

@immutable
class ServiceTools {
  const ServiceTools._();

  static const String baseUrlV1 =
      'https://demo.signumtte.com/windesk/app/webroot/integration/WindeskMobile.php?use_rest=1&wsusername=wdmobile&wspassword=wdsgnm1017_&token=';
  static const String baseUrlV2 = 'http://windeskmobile.signumtte.com';
  static const String tokenV1 = 'wddemo!_';
  static const String tokenV2 = 'demo!';
  static const String attachPath = "http://10.126.12.21/esh/";
  static const String attachPathLive = "http://10.32.12.42/windesktest/xreadattach.php?token=$tokenV1&id=";
  static const String facilityName = "İstanbul Finans Merkezi";
  static const bool isWorkOrderExist = true;

  static const bool _isProduction = true;

  static Url get url {
    if (_isProduction) {
      return const Url(
        facility_url: "https://facility-server.ifm.gov.tr",
        location_url: "https://facility-server.ifm.gov.tr",
        users_url: "https://user-server.ifm.gov.tr",
        asset_url: "https://asset-server.ifm.gov.tr",
        workorder_url: "https://workorder-server.ifm.gov.tr",
        generalGraphql_url: "https://workorder-server.ifm.gov.tr/general-graphql",
        graphql_url: "https://workorder-server.ifm.gov.tr/graphql",
      );
    } else {
      return const Url(
        facility_url: "http://10.0.2.2:3010",
        location_url: "http://10.0.2.2:3010",
        users_url: "http://10.0.2.2:3012",
        asset_url: "http://10.0.2.2:3014",
        workorder_url: "http://10.0.2.2:3015",
        generalGraphql_url: "http://10.0.2.2:3015/general-graphql",
        graphql_url: "http://10.0.2.2:3015/graphql",
      );
    }
  }
}
// facility_url: "http://localhost:3010",
// location_url: "http://localhost:3010",
// users_url: "http://localhost:3012",
// asset_url: "http://localhost:3014",
// workorder_url: "http://localhost:3015",
// generalGraphql_url: "http://localhost:3015/general-graphql",
// graphql_url: "http://localhost:3015/graphql",

// facility_url: "http://10.0.2.2:3010",
// location_url: "http://10.0.2.2:3010",
// users_url: "http://10.0.2.2:3012",
// asset_url: "http://10.0.2.2:3014",
// workorder_url: "http://10.0.2.2:3015",
// generalGraphql_url: "http://10.0.2.2:3015/general-graphql",
// graphql_url: "http://10.0.2.2:3015/graphql",

// facility_url: "https://facility-server.ifm.gov.tr",
// location_url: "https://facility-server.ifm.gov.tr",
// users_url: "https://user-server.ifm.gov.tr",
// asset_url: "https://asset-server.ifm.gov.tr",
// workorder_url: "https://workorder-server.ifm.gov.tr",
// generalGraphql_url: "https://workorder-server.ifm.gov.tr/general-graphql",
// graphql_url: "https://workorder-server.ifm.gov.tr/graphql",

// facility_url: "http://138.201.186.190:30052",
// location_url: "http://138.201.186.190:30052",
// users_url: "http://138.201.186.190:30054",
// asset_url: "http://138.201.186.190:30051",
// workorder_url: "http://138.201.186.190:30056",
// generalGraphql_url: "http://138.201.186.190:30056/general-graphql",
// graphql_url: "http://138.201.186.190:30056/graphql",

@immutable
class Url {
  final String facility_url;
  final String users_url;
  final String asset_url;
  final String location_url;
  final String workorder_url;
  final String generalGraphql_url;
  final String graphql_url;

  const Url({
    required this.facility_url,
    required this.users_url,
    required this.location_url,
    required this.asset_url,
    required this.workorder_url,
    required this.generalGraphql_url,
    required this.graphql_url,
  });
}
