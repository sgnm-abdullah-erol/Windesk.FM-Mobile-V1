final class SplashQueryVariables {
  static Map<String, dynamic> getVersion() {
    return {
      "where": {"isDeleted": false, "isActive": true},
      "versionMainConnectionWhere2": {
        "edge": {"isDeleted": false},
        "node": {"realm": "IFM", "isDeleted": false}
      }
    };
  }
}
