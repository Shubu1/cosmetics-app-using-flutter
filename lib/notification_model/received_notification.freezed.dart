// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceivedNotification _$ReceivedNotificationFromJson(Map<String, dynamic> json) {
  return _ReceivedNotification.fromJson(json);
}

/// @nodoc
mixin _$ReceivedNotification {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceivedNotificationCopyWith<ReceivedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedNotificationCopyWith<$Res> {
  factory $ReceivedNotificationCopyWith(ReceivedNotification value,
          $Res Function(ReceivedNotification) then) =
      _$ReceivedNotificationCopyWithImpl<$Res, ReceivedNotification>;
  @useResult
  $Res call(
      {int id, String title, String body, String imageUrl, String payload});
}

/// @nodoc
class _$ReceivedNotificationCopyWithImpl<$Res,
        $Val extends ReceivedNotification>
    implements $ReceivedNotificationCopyWith<$Res> {
  _$ReceivedNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? imageUrl = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceivedNotificationCopyWith<$Res>
    implements $ReceivedNotificationCopyWith<$Res> {
  factory _$$_ReceivedNotificationCopyWith(_$_ReceivedNotification value,
          $Res Function(_$_ReceivedNotification) then) =
      __$$_ReceivedNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String body, String imageUrl, String payload});
}

/// @nodoc
class __$$_ReceivedNotificationCopyWithImpl<$Res>
    extends _$ReceivedNotificationCopyWithImpl<$Res, _$_ReceivedNotification>
    implements _$$_ReceivedNotificationCopyWith<$Res> {
  __$$_ReceivedNotificationCopyWithImpl(_$_ReceivedNotification _value,
      $Res Function(_$_ReceivedNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? imageUrl = null,
    Object? payload = null,
  }) {
    return _then(_$_ReceivedNotification(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceivedNotification implements _ReceivedNotification {
  _$_ReceivedNotification(
      {this.id = 0,
      this.title = "",
      this.body = "",
      this.imageUrl = "",
      this.payload = ""});

  factory _$_ReceivedNotification.fromJson(Map<String, dynamic> json) =>
      _$$_ReceivedNotificationFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String body;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String payload;

  @override
  String toString() {
    return 'ReceivedNotification(id: $id, title: $title, body: $body, imageUrl: $imageUrl, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceivedNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, imageUrl, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceivedNotificationCopyWith<_$_ReceivedNotification> get copyWith =>
      __$$_ReceivedNotificationCopyWithImpl<_$_ReceivedNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceivedNotificationToJson(
      this,
    );
  }
}

abstract class _ReceivedNotification implements ReceivedNotification {
  factory _ReceivedNotification(
      {final int id,
      final String title,
      final String body,
      final String imageUrl,
      final String payload}) = _$_ReceivedNotification;

  factory _ReceivedNotification.fromJson(Map<String, dynamic> json) =
      _$_ReceivedNotification.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get imageUrl;
  @override
  String get payload;
  @override
  @JsonKey(ignore: true)
  _$$_ReceivedNotificationCopyWith<_$_ReceivedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
