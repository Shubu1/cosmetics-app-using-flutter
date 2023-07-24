import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login/notificationProvider/message_provider.dart';
import 'package:riverpod/riverpod.dart';

final firebaseMessagingProvider = Provider<FirebaseMessagingService>((ref) {
  final localNotificationsPlugin = ref.read(localNotificationsPluginProvider);
  final messageTitleProvider = ref.read(messagetitleProvider.notifier);
  final messageBodyProvider = ref.read(messagebodyProvider.notifier);

  return FirebaseMessagingService(
    localNotificationsPlugin,
    messageTitleProvider,
    messageBodyProvider,
  );
});

final localNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
  return FlutterLocalNotificationsPlugin();
});

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  final MessageTitleProvider _messageTitleProvider;
  final MessageBodyProvider _messageBodyProvider;

  FirebaseMessagingService(
    this._localNotificationsPlugin,
    this._messageTitleProvider,
    this._messageBodyProvider,
  );

  Future<void> initializeFirebaseMessaging() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      displayNotification(message);
      _messageTitleProvider.updateMessage(message.notification?.title ?? '');
      _messageBodyProvider.updateMessage(message.notification?.body ?? '');
    });
  }

  Future<void> displayNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      // 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
    );
  }
}
