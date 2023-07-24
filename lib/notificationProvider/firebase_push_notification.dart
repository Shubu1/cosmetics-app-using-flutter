import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_login/notificationProvider/firebase_background_messaging.dart';
import 'package:flutter_login/notificationProvider/firebase_messaging_provider.dart';
import 'package:flutter_login/notificationProvider/local_push_notification.dart';
import 'package:flutter_login/notificationProvider/routerProvider.dart';
import 'package:flutter_login/notification_model/received_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebasePushNotificationProvider =
    Provider<FirebasePushNotification>((ref) {
  final messaging = ref.watch(firebaseMessagingProviderr);
  final localPushNotification = ref.watch(localPushNotificationProvider);
  return FirebasePushNotification(messaging, localPushNotification, ref);
});

class FirebasePushNotification {
  final FirebaseMessaging _messaging;
  final LocalPushNotification _localPushNotification;
  final Ref _ref;
  FirebasePushNotification(
      this._messaging, this._localPushNotification, this._ref) {
    _init();
    _onFirebaseMessageReceived();
  }
  void _init() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    }

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  void _onFirebaseMessageReceived() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      Map<String, dynamic> data = message.data;
      print('got a message whlist in the foreground!');
      print('Message data : ${message.data}');
      if (notification != null && android != null) {
        _localPushNotification.showNotification(
          ReceivedNotification(
            id: notification.hashCode,
            title: notification.title!,
            body: notification.body!,
            imageUrl: android.imageUrl!,
            payload: jsonEncode(data),
          ),
        );
        print(
            'message also contained a notification : ${message.notification}');
      }
    });
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['link'] != null) {
      final String link = message.data['link'];
      _ref.read(routerProvider).changeRoute(link);
    }
  }
}
