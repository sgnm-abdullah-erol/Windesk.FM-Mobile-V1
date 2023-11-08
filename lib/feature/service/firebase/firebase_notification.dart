// ignore_for_file: avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/database/shared_manager.dart';
import '../../../core/enums/shared_enums.dart';
import 'local_notification.dart';

class FirebaseNotification {
  static Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final onNotifications = BehaviorSubject<String?>();

    FirebaseMessaging.onBackgroundMessage((message) =>
        LocalNotification.showNotification(
            title: "message.notification?.title",
            body: "message.notification?.body",
            payload: 'asd'));
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {}
      }
    });
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    //FirebaseMessaging.onBackgroundMessage((message) =>      NotificationApi.showNotification(title:"message.notification?.title",body:"message.notification?.body",payload:'asd'));
    print('fcm.token : ');
    print(await messaging.getToken());

    String? fbtoken = await messaging.getToken();
    print(fbtoken);
    await SharedManager()
        .setString(SharedEnum.firebaseToken, fbtoken.toString());
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {}
      }
    });

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitializationSetting = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      requestCriticalPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSetting,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // void onClickedNotification(String? payload) {
    //   print('Foreground HOME Payload : $payload');
    //   String data = payload.toString();
    //   final splittedData = data.split('/-*-/');
    //   String title = splittedData[0];
    //   String body = splittedData[1];
    //   String module = splittedData[2];
    //   String code = splittedData[3];
    // }

    // onNotifications.stream.listen(onClickedNotification);

// Lisitnening to the background messages
    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      await Firebase.initializeApp();

      print("Handling a background message: ${message.messageId}");
    }

// Lisitnening to the background messages
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Listneing to the foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data Home: ${message.data}');
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
          '1',
          'channel name',
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      );

      LocalNotification.showNotification(
          title: message.notification!.title.toString(),
          body: message.notification!.body.toString(),
          payload: message.data.toString());
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Opened1');
      // print('Firebase notification opened');

      //FlutterLocalNotificationsPlugin().show(message.notification.messageId, message.notification?.title, message.notification?.body,);
    });
  }
}
