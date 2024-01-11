import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vm_fm_4/core/database/hive/box_manager.dart';

import '../feature/injection.dart';
import '../feature/service/firebase/firebase_notification.dart';
import 'localization/app_localization.dart';

@immutable
final class Init {
  const Init._();

  static Future<void> init() async {
    await Injection().initInstances();
    // firebase error occur when app is in background
    FirebaseNotification.init();
    await AppLocalization.init();

    // open hive and boxes
    await Hive.initFlutter();
    await BoxManager.init();
  }
}
