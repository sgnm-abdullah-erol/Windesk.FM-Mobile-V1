import 'package:flutter/material.dart';

import 'localization/app_localization.dart';
import '../feature/injection.dart';
import '../feature/service/firebase/firebase_notification.dart';

@immutable
final class Init {
  const Init._();

  static Future<void> init() async {
    await Injection().initInstances();
    // firebase error occur when app is in background
    FirebaseNotification.init();
    await AppLocalization.init();
  }
}
