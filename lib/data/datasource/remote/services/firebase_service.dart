import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseService {
  final _firebaseMessage = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  final _localNotification = FlutterLocalNotificationsPlugin();

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);
  }

  Future<void> initNotification() async {
    await _firebaseMessage.requestPermission();
    final fcmToken = await _firebaseMessage.getToken();
    print('Token => $fcmToken');
    //FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification == null) return;

      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/launcher_icon',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  // Future<void> handlerBackgroundMessage(RemoteMessage message) async {
  //   print('Title => ${message.notification?.title}');
  //   print('Title => ${message.notification?.body}');
  // }
}
