// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceivedNotification _$$_ReceivedNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_ReceivedNotification(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      body: json['body'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      payload: json['payload'] as String? ?? "",
    );

Map<String, dynamic> _$$_ReceivedNotificationToJson(
        _$_ReceivedNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'imageUrl': instance.imageUrl,
      'payload': instance.payload,
    };
