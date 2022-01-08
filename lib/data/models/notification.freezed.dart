// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

  _Notification call(
      {String? id,
      @DatetimeConverter() DateTime? createdAt,
      bool isReaded = false,
      User? toUser,
      User? fromUser,
      String body = "",
      String notificationType = "",
      String? doneId}) {
    return _Notification(
      id: id,
      createdAt: createdAt,
      isReaded: isReaded,
      toUser: toUser,
      fromUser: fromUser,
      body: body,
      notificationType: notificationType,
      doneId: doneId,
    );
  }

  Notification fromJson(Map<String, Object> json) {
    return Notification.fromJson(json);
  }
}

/// @nodoc
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  String? get id => throw _privateConstructorUsedError;
  @DatetimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get isReaded => throw _privateConstructorUsedError;
  User? get toUser => throw _privateConstructorUsedError;
  User? get fromUser => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get notificationType => throw _privateConstructorUsedError;
  String? get doneId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @DatetimeConverter() DateTime? createdAt,
      bool isReaded,
      User? toUser,
      User? fromUser,
      String body,
      String notificationType,
      String? doneId});

  $UserCopyWith<$Res>? get toUser;
  $UserCopyWith<$Res>? get fromUser;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? isReaded = freezed,
    Object? toUser = freezed,
    Object? fromUser = freezed,
    Object? body = freezed,
    Object? notificationType = freezed,
    Object? doneId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isReaded: isReaded == freezed
          ? _value.isReaded
          : isReaded // ignore: cast_nullable_to_non_nullable
              as bool,
      toUser: toUser == freezed
          ? _value.toUser
          : toUser // ignore: cast_nullable_to_non_nullable
              as User?,
      fromUser: fromUser == freezed
          ? _value.fromUser
          : fromUser // ignore: cast_nullable_to_non_nullable
              as User?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      doneId: doneId == freezed
          ? _value.doneId
          : doneId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get toUser {
    if (_value.toUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.toUser!, (value) {
      return _then(_value.copyWith(toUser: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get fromUser {
    if (_value.fromUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.fromUser!, (value) {
      return _then(_value.copyWith(fromUser: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) then) =
      __$NotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @DatetimeConverter() DateTime? createdAt,
      bool isReaded,
      User? toUser,
      User? fromUser,
      String body,
      String notificationType,
      String? doneId});

  @override
  $UserCopyWith<$Res>? get toUser;
  @override
  $UserCopyWith<$Res>? get fromUser;
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(
      _Notification _value, $Res Function(_Notification) _then)
      : super(_value, (v) => _then(v as _Notification));

  @override
  _Notification get _value => super._value as _Notification;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? isReaded = freezed,
    Object? toUser = freezed,
    Object? fromUser = freezed,
    Object? body = freezed,
    Object? notificationType = freezed,
    Object? doneId = freezed,
  }) {
    return _then(_Notification(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isReaded: isReaded == freezed
          ? _value.isReaded
          : isReaded // ignore: cast_nullable_to_non_nullable
              as bool,
      toUser: toUser == freezed
          ? _value.toUser
          : toUser // ignore: cast_nullable_to_non_nullable
              as User?,
      fromUser: fromUser == freezed
          ? _value.fromUser
          : fromUser // ignore: cast_nullable_to_non_nullable
              as User?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      doneId: doneId == freezed
          ? _value.doneId
          : doneId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification implements _Notification {
  const _$_Notification(
      {this.id,
      @DatetimeConverter() this.createdAt,
      this.isReaded = false,
      this.toUser,
      this.fromUser,
      this.body = "",
      this.notificationType = "",
      this.doneId});

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationFromJson(json);

  @override
  final String? id;
  @override
  @DatetimeConverter()
  final DateTime? createdAt;
  @JsonKey(defaultValue: false)
  @override
  final bool isReaded;
  @override
  final User? toUser;
  @override
  final User? fromUser;
  @JsonKey(defaultValue: "")
  @override
  final String body;
  @JsonKey(defaultValue: "")
  @override
  final String notificationType;
  @override
  final String? doneId;

  @override
  String toString() {
    return 'Notification(id: $id, createdAt: $createdAt, isReaded: $isReaded, toUser: $toUser, fromUser: $fromUser, body: $body, notificationType: $notificationType, doneId: $doneId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Notification &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.isReaded, isReaded) ||
                const DeepCollectionEquality()
                    .equals(other.isReaded, isReaded)) &&
            (identical(other.toUser, toUser) ||
                const DeepCollectionEquality().equals(other.toUser, toUser)) &&
            (identical(other.fromUser, fromUser) ||
                const DeepCollectionEquality()
                    .equals(other.fromUser, fromUser)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.notificationType, notificationType) ||
                const DeepCollectionEquality()
                    .equals(other.notificationType, notificationType)) &&
            (identical(other.doneId, doneId) ||
                const DeepCollectionEquality().equals(other.doneId, doneId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(isReaded) ^
      const DeepCollectionEquality().hash(toUser) ^
      const DeepCollectionEquality().hash(fromUser) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(notificationType) ^
      const DeepCollectionEquality().hash(doneId);

  @JsonKey(ignore: true)
  @override
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationToJson(this);
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {String? id,
      @DatetimeConverter() DateTime? createdAt,
      bool isReaded,
      User? toUser,
      User? fromUser,
      String body,
      String notificationType,
      String? doneId}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @DatetimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  bool get isReaded => throw _privateConstructorUsedError;
  @override
  User? get toUser => throw _privateConstructorUsedError;
  @override
  User? get fromUser => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  String get notificationType => throw _privateConstructorUsedError;
  @override
  String? get doneId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationCopyWith<_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
