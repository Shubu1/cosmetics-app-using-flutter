// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appstate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool? loading) loading,
    required TResult Function(T? data) error,
    required TResult Function(T? data, Map<String, dynamic>? extra) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool? loading)? loading,
    TResult? Function(T? data)? error,
    TResult? Function(T? data, Map<String, dynamic>? extra)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool? loading)? loading,
    TResult Function(T? data)? error,
    TResult Function(T? data, Map<String, dynamic>? extra)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitial<T> value) initial,
    required TResult Function(AppLoading<T> value) loading,
    required TResult Function(AppError<T> value) error,
    required TResult Function(AppSuccess<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitial<T> value)? initial,
    TResult? Function(AppLoading<T> value)? loading,
    TResult? Function(AppError<T> value)? error,
    TResult? Function(AppSuccess<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitial<T> value)? initial,
    TResult Function(AppLoading<T> value)? loading,
    TResult Function(AppError<T> value)? error,
    TResult Function(AppSuccess<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<T, $Res> {
  factory $AppStateCopyWith(
          AppState<T> value, $Res Function(AppState<T>) then) =
      _$AppStateCopyWithImpl<T, $Res, AppState<T>>;
}

/// @nodoc
class _$AppStateCopyWithImpl<T, $Res, $Val extends AppState<T>>
    implements $AppStateCopyWith<T, $Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppInitialCopyWith<T, $Res> {
  factory _$$AppInitialCopyWith(
          _$AppInitial<T> value, $Res Function(_$AppInitial<T>) then) =
      __$$AppInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AppInitialCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$AppInitial<T>>
    implements _$$AppInitialCopyWith<T, $Res> {
  __$$AppInitialCopyWithImpl(
      _$AppInitial<T> _value, $Res Function(_$AppInitial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppInitial<T> implements AppInitial<T> {
  const _$AppInitial();

  @override
  String toString() {
    return 'AppState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool? loading) loading,
    required TResult Function(T? data) error,
    required TResult Function(T? data, Map<String, dynamic>? extra) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool? loading)? loading,
    TResult? Function(T? data)? error,
    TResult? Function(T? data, Map<String, dynamic>? extra)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool? loading)? loading,
    TResult Function(T? data)? error,
    TResult Function(T? data, Map<String, dynamic>? extra)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitial<T> value) initial,
    required TResult Function(AppLoading<T> value) loading,
    required TResult Function(AppError<T> value) error,
    required TResult Function(AppSuccess<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitial<T> value)? initial,
    TResult? Function(AppLoading<T> value)? loading,
    TResult? Function(AppError<T> value)? error,
    TResult? Function(AppSuccess<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitial<T> value)? initial,
    TResult Function(AppLoading<T> value)? loading,
    TResult Function(AppError<T> value)? error,
    TResult Function(AppSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AppInitial<T> implements AppState<T> {
  const factory AppInitial() = _$AppInitial<T>;
}

/// @nodoc
abstract class _$$AppLoadingCopyWith<T, $Res> {
  factory _$$AppLoadingCopyWith(
          _$AppLoading<T> value, $Res Function(_$AppLoading<T>) then) =
      __$$AppLoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool? loading});
}

/// @nodoc
class __$$AppLoadingCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$AppLoading<T>>
    implements _$$AppLoadingCopyWith<T, $Res> {
  __$$AppLoadingCopyWithImpl(
      _$AppLoading<T> _value, $Res Function(_$AppLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
  }) {
    return _then(_$AppLoading<T>(
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$AppLoading<T> implements AppLoading<T> {
  const _$AppLoading({this.loading});

  @override
  final bool? loading;

  @override
  String toString() {
    return 'AppState<$T>.loading(loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLoading<T> &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLoadingCopyWith<T, _$AppLoading<T>> get copyWith =>
      __$$AppLoadingCopyWithImpl<T, _$AppLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool? loading) loading,
    required TResult Function(T? data) error,
    required TResult Function(T? data, Map<String, dynamic>? extra) success,
  }) {
    return loading(this.loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool? loading)? loading,
    TResult? Function(T? data)? error,
    TResult? Function(T? data, Map<String, dynamic>? extra)? success,
  }) {
    return loading?.call(this.loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool? loading)? loading,
    TResult Function(T? data)? error,
    TResult Function(T? data, Map<String, dynamic>? extra)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this.loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitial<T> value) initial,
    required TResult Function(AppLoading<T> value) loading,
    required TResult Function(AppError<T> value) error,
    required TResult Function(AppSuccess<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitial<T> value)? initial,
    TResult? Function(AppLoading<T> value)? loading,
    TResult? Function(AppError<T> value)? error,
    TResult? Function(AppSuccess<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitial<T> value)? initial,
    TResult Function(AppLoading<T> value)? loading,
    TResult Function(AppError<T> value)? error,
    TResult Function(AppSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AppLoading<T> implements AppState<T> {
  const factory AppLoading({final bool? loading}) = _$AppLoading<T>;

  bool? get loading;
  @JsonKey(ignore: true)
  _$$AppLoadingCopyWith<T, _$AppLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppErrorCopyWith<T, $Res> {
  factory _$$AppErrorCopyWith(
          _$AppError<T> value, $Res Function(_$AppError<T>) then) =
      __$$AppErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$AppErrorCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$AppError<T>>
    implements _$$AppErrorCopyWith<T, $Res> {
  __$$AppErrorCopyWithImpl(
      _$AppError<T> _value, $Res Function(_$AppError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AppError<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$AppError<T> implements AppError<T> {
  const _$AppError({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'AppState<$T>.error(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppError<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppErrorCopyWith<T, _$AppError<T>> get copyWith =>
      __$$AppErrorCopyWithImpl<T, _$AppError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool? loading) loading,
    required TResult Function(T? data) error,
    required TResult Function(T? data, Map<String, dynamic>? extra) success,
  }) {
    return error(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool? loading)? loading,
    TResult? Function(T? data)? error,
    TResult? Function(T? data, Map<String, dynamic>? extra)? success,
  }) {
    return error?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool? loading)? loading,
    TResult Function(T? data)? error,
    TResult Function(T? data, Map<String, dynamic>? extra)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitial<T> value) initial,
    required TResult Function(AppLoading<T> value) loading,
    required TResult Function(AppError<T> value) error,
    required TResult Function(AppSuccess<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitial<T> value)? initial,
    TResult? Function(AppLoading<T> value)? loading,
    TResult? Function(AppError<T> value)? error,
    TResult? Function(AppSuccess<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitial<T> value)? initial,
    TResult Function(AppLoading<T> value)? loading,
    TResult Function(AppError<T> value)? error,
    TResult Function(AppSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AppError<T> implements AppState<T> {
  const factory AppError({final T? data}) = _$AppError<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$AppErrorCopyWith<T, _$AppError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppSuccessCopyWith<T, $Res> {
  factory _$$AppSuccessCopyWith(
          _$AppSuccess<T> value, $Res Function(_$AppSuccess<T>) then) =
      __$$AppSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data, Map<String, dynamic>? extra});
}

/// @nodoc
class __$$AppSuccessCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res, _$AppSuccess<T>>
    implements _$$AppSuccessCopyWith<T, $Res> {
  __$$AppSuccessCopyWithImpl(
      _$AppSuccess<T> _value, $Res Function(_$AppSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$AppSuccess<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      extra: freezed == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$AppSuccess<T> implements AppSuccess<T> {
  const _$AppSuccess({this.data, final Map<String, dynamic>? extra})
      : _extra = extra;

  @override
  final T? data;
  final Map<String, dynamic>? _extra;
  @override
  Map<String, dynamic>? get extra {
    final value = _extra;
    if (value == null) return null;
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppState<$T>.success(data: $data, extra: $extra)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_extra));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSuccessCopyWith<T, _$AppSuccess<T>> get copyWith =>
      __$$AppSuccessCopyWithImpl<T, _$AppSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool? loading) loading,
    required TResult Function(T? data) error,
    required TResult Function(T? data, Map<String, dynamic>? extra) success,
  }) {
    return success(data, extra);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool? loading)? loading,
    TResult? Function(T? data)? error,
    TResult? Function(T? data, Map<String, dynamic>? extra)? success,
  }) {
    return success?.call(data, extra);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool? loading)? loading,
    TResult Function(T? data)? error,
    TResult Function(T? data, Map<String, dynamic>? extra)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, extra);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitial<T> value) initial,
    required TResult Function(AppLoading<T> value) loading,
    required TResult Function(AppError<T> value) error,
    required TResult Function(AppSuccess<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppInitial<T> value)? initial,
    TResult? Function(AppLoading<T> value)? loading,
    TResult? Function(AppError<T> value)? error,
    TResult? Function(AppSuccess<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitial<T> value)? initial,
    TResult Function(AppLoading<T> value)? loading,
    TResult Function(AppError<T> value)? error,
    TResult Function(AppSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AppSuccess<T> implements AppState<T> {
  const factory AppSuccess({final T? data, final Map<String, dynamic>? extra}) =
      _$AppSuccess<T>;

  T? get data;
  Map<String, dynamic>? get extra;
  @JsonKey(ignore: true)
  _$$AppSuccessCopyWith<T, _$AppSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
