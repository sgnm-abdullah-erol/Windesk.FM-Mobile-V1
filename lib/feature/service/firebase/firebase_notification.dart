// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import 'local_notification.dart';

class FirebaseNotification {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final onNotifications = BehaviorSubject<String?>();

    FirebaseMessaging.onBackgroundMessage(
      (message) => LocalNotification.showNotification(
          title: "message.notification?.title",
          body: "message.notification?.body",
          payload: 'asd'),
    );

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {}
      }
    });

    // NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: ((data) async {
      onNotifications.add(data);
    }));

    void onClickedNotification(String? payload) {
      print('Foreground Payload : $payload');
    }

    onNotifications.stream.listen(onClickedNotification);
  }
}
