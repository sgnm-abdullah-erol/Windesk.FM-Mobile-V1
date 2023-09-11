import 'package:flutter/material.dart';

import 'localization/app_localization.dart';
import '../feature/injection.dart';
import '../feature/service/firebase/firebase_notification.dart';

@immutable
final class Init {
  const Init._();

  static Future<void> init() async {
    await Injection().initInstances();
    await FirebaseNotification.init();
    await AppLocalization.init();
  }
}
