import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login/logging/logger_provider.dart';
import 'package:flutter_login/notificationProvider/flutter_local_notification_provider.dart';
import 'package:flutter_login/notificationProvider/routerProvider.dart';
import 'package:flutter_login/notification_model/received_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class LocalPushNotification {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  final Logger _logger;
  final Ref _ref;
  LocalPushNotification(
      this._localNotificationsPlugin, this._logger, this._ref) {
    _init();
  }
  void _init() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('ic_launcher'),
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_notificationChannelMax());
    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        _logger.info(details.toString());
        handleMessage(details.payload);
      },
    );
  }

  void showNotification(ReceivedNotification message) async {
    // final String largeIcon = await _base14EncodedImage(message.imageUrl);
    final String bigPicture = await _base14EncodedImage(message.imageUrl);
    await _localNotificationsPlugin.show(
      message.id,
      message.title,
      message.body,
      NotificationDetails(
        android: _androidNotificationDetails(
          BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(bigPicture),
          ),
        ),
      ),
      payload: message.payload,
    );
  }

  Future<String> _base14EncodedImage(String url) async {
    final response = await Dio().get<List<int>>(url,
        options: Options(responseType: ResponseType.bytes));
    final String base14Data = base64Encode(response.data ?? []);
    return base14Data;
  }

  AndroidNotificationDetails _androidNotificationDetails(
      StyleInformation? styleInformation) {
    return AndroidNotificationDetails(
      '1001',
      'General Notification',
      channelDescription: 'This is a general notification channel',
      importance: Importance.max,
      priority: Priority.max,
      channelShowBadge: true,
      styleInformation: styleInformation,
    );
  }

  AndroidNotificationChannel _notificationChannelMax() {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', 'High Importance Notifications',
        description: 'This channel is used for important notifications.',
        importance: Importance.max);
    return channel;
  }

  void handleMessage(String? payload) {
    final Map<String, dynamic> data = jsonDecode(payload ?? '');

    if (data['link'] != null) {
      final String link = data['link'];
      _ref.read(routerProvider).changeRoute(link);
    }
  }
}

final localPushNotificationProvider = Provider<LocalPushNotification>((ref) {
  final localNotificationsPlugin = ref.watch(flutterLocalNotificationProvider);
  final logger = ref.watch(loggerProvider('LocalPushNotification'));
  return LocalPushNotification(localNotificationsPlugin, logger, ref);
});
