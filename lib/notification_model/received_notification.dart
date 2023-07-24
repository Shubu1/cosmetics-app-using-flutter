import 'package:freezed_annotation/freezed_annotation.dart';

part 'received_notification.freezed.dart';
part 'received_notification.g.dart';

@freezed
class ReceivedNotification with _$ReceivedNotification {
  factory ReceivedNotification(
      {@Default(0) int id,
      @Default("") String title,
      @Default("") String body,
      @Default("") String imageUrl,
      @Default("") String payload}) = _ReceivedNotification;

  factory ReceivedNotification.fromJson(Map<String, dynamic> json) =>
      _$ReceivedNotificationFromJson(json);
}
