import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login/notificationProvider/firebase_notification.dart';
import 'package:flutter_login/notificationProvider/firebase_push_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notificationProvider/message_provider.dart';

final localNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
  return FlutterLocalNotificationsPlugin();
});

class NotificationPage extends ConsumerWidget {
  // final notification = container.read(firebasePushNotificationProvider);
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.watch(firebasePushNotificationProvider);
    final firebaseMessagingService = ref.watch(firebaseMessagingProvider);
    final localNotificationsPlugin =
        ref.watch(localNotificationsPluginProvider);

    final messageTitle = ref.watch(messagetitleProvider);
    final messageBody = ref.watch(messagebodyProvider);

    firebaseMessagingService.initializeFirebaseMessaging();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Page"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 80,
        width: 400,
        child: Card(
          child: Column(
            children: [
              Text(messageTitle),
              Text(messageBody),
            ],
          ),
        ),
      ),
    );
  }
}
