import 'package:flutter/material.dart';

@immutable
final class SplashQuery {
  static const String versionControl = r'''
  query Versions($where: VersionWhere, $versionMainConnectionWhere2: VersionVersionMainConnectionWhere) {
  versions(where: $where) {
    versionNo
    versionMainConnection(where: $versionMainConnectionWhere2) {
      totalCount
    }
  }
}
  ''';
}
