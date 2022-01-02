// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'focus_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FocusUser _$FocusUserFromJson(Map<String, dynamic> json) {
  return _FocusUser.fromJson(json);
}

/// @nodoc
class _$FocusUserTearOff {
  const _$FocusUserTearOff();

  _FocusUser call(
      {String? id,
      RealtimeUpdateType? updateType,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int focusTime = INIT_FOCUS_TIME_SEC,
      int? remainingTime,
      bool isOnline = false,
      int? todayCount,
      bool isQuest = false,
      bool isPublicQuest = false}) {
    return _FocusUser(
      id: id,
      updateType: updateType,
      startDate: startDate,
      user: user,
      focusTime: focusTime,
      remainingTime: remainingTime,
      isOnline: isOnline,
      todayCount: todayCount,
      isQuest: isQuest,
      isPublicQuest: isPublicQuest,
    );
  }

  FocusUser fromJson(Map<String, Object> json) {
    return FocusUser.fromJson(json);
  }
}

/// @nodoc
const $FocusUser = _$FocusUserTearOff();

/// @nodoc
mixin _$FocusUser {
  String? get id => throw _privateConstructorUsedError;
  RealtimeUpdateType? get updateType => throw _privateConstructorUsedError;
  @DatetimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  int get focusTime => throw _privateConstructorUsedError;
  int? get remainingTime => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  int? get todayCount => throw _privateConstructorUsedError;
  bool get isQuest => throw _privateConstructorUsedError;
  bool get isPublicQuest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FocusUserCopyWith<FocusUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusUserCopyWith<$Res> {
  factory $FocusUserCopyWith(FocusUser value, $Res Function(FocusUser) then) =
      _$FocusUserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      RealtimeUpdateType? updateType,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int focusTime,
      int? remainingTime,
      bool isOnline,
      int? todayCount,
      bool isQuest,
      bool isPublicQuest});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$FocusUserCopyWithImpl<$Res> implements $FocusUserCopyWith<$Res> {
  _$FocusUserCopyWithImpl(this._value, this._then);

  final FocusUser _value;
  // ignore: unused_field
  final $Res Function(FocusUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? updateType = freezed,
    Object? startDate = freezed,
    Object? user = freezed,
    Object? focusTime = freezed,
    Object? remainingTime = freezed,
    Object? isOnline = freezed,
    Object? todayCount = freezed,
    Object? isQuest = freezed,
    Object? isPublicQuest = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      updateType: updateType == freezed
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as RealtimeUpdateType?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      focusTime: focusTime == freezed
          ? _value.focusTime
          : focusTime // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: remainingTime == freezed
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isOnline: isOnline == freezed
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      todayCount: todayCount == freezed
          ? _value.todayCount
          : todayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isQuest: isQuest == freezed
          ? _value.isQuest
          : isQuest // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublicQuest: isPublicQuest == freezed
          ? _value.isPublicQuest
          : isPublicQuest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$FocusUserCopyWith<$Res> implements $FocusUserCopyWith<$Res> {
  factory _$FocusUserCopyWith(
          _FocusUser value, $Res Function(_FocusUser) then) =
      __$FocusUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      RealtimeUpdateType? updateType,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int focusTime,
      int? remainingTime,
      bool isOnline,
      int? todayCount,
      bool isQuest,
      bool isPublicQuest});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$FocusUserCopyWithImpl<$Res> extends _$FocusUserCopyWithImpl<$Res>
    implements _$FocusUserCopyWith<$Res> {
  __$FocusUserCopyWithImpl(_FocusUser _value, $Res Function(_FocusUser) _then)
      : super(_value, (v) => _then(v as _FocusUser));

  @override
  _FocusUser get _value => super._value as _FocusUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? updateType = freezed,
    Object? startDate = freezed,
    Object? user = freezed,
    Object? focusTime = freezed,
    Object? remainingTime = freezed,
    Object? isOnline = freezed,
    Object? todayCount = freezed,
    Object? isQuest = freezed,
    Object? isPublicQuest = freezed,
  }) {
    return _then(_FocusUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      updateType: updateType == freezed
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as RealtimeUpdateType?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      focusTime: focusTime == freezed
          ? _value.focusTime
          : focusTime // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTime: remainingTime == freezed
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isOnline: isOnline == freezed
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      todayCount: todayCount == freezed
          ? _value.todayCount
          : todayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isQuest: isQuest == freezed
          ? _value.isQuest
          : isQuest // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublicQuest: isPublicQuest == freezed
          ? _value.isPublicQuest
          : isPublicQuest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FocusUser implements _FocusUser {
  const _$_FocusUser(
      {this.id,
      this.updateType,
      @DatetimeConverter() this.startDate,
      this.user,
      this.focusTime = INIT_FOCUS_TIME_SEC,
      this.remainingTime,
      this.isOnline = false,
      this.todayCount,
      this.isQuest = false,
      this.isPublicQuest = false});

  factory _$_FocusUser.fromJson(Map<String, dynamic> json) =>
      _$_$_FocusUserFromJson(json);

  @override
  final String? id;
  @override
  final RealtimeUpdateType? updateType;
  @override
  @DatetimeConverter()
  final DateTime? startDate;
  @override
  final User? user;
  @JsonKey(defaultValue: INIT_FOCUS_TIME_SEC)
  @override
  final int focusTime;
  @override
  final int? remainingTime;
  @JsonKey(defaultValue: false)
  @override
  final bool isOnline;
  @override
  final int? todayCount;
  @JsonKey(defaultValue: false)
  @override
  final bool isQuest;
  @JsonKey(defaultValue: false)
  @override
  final bool isPublicQuest;

  @override
  String toString() {
    return 'FocusUser(id: $id, updateType: $updateType, startDate: $startDate, user: $user, focusTime: $focusTime, remainingTime: $remainingTime, isOnline: $isOnline, todayCount: $todayCount, isQuest: $isQuest, isPublicQuest: $isPublicQuest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FocusUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.updateType, updateType) ||
                const DeepCollectionEquality()
                    .equals(other.updateType, updateType)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.focusTime, focusTime) ||
                const DeepCollectionEquality()
                    .equals(other.focusTime, focusTime)) &&
            (identical(other.remainingTime, remainingTime) ||
                const DeepCollectionEquality()
                    .equals(other.remainingTime, remainingTime)) &&
            (identical(other.isOnline, isOnline) ||
                const DeepCollectionEquality()
                    .equals(other.isOnline, isOnline)) &&
            (identical(other.todayCount, todayCount) ||
                const DeepCollectionEquality()
                    .equals(other.todayCount, todayCount)) &&
            (identical(other.isQuest, isQuest) ||
                const DeepCollectionEquality()
                    .equals(other.isQuest, isQuest)) &&
            (identical(other.isPublicQuest, isPublicQuest) ||
                const DeepCollectionEquality()
                    .equals(other.isPublicQuest, isPublicQuest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(updateType) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(focusTime) ^
      const DeepCollectionEquality().hash(remainingTime) ^
      const DeepCollectionEquality().hash(isOnline) ^
      const DeepCollectionEquality().hash(todayCount) ^
      const DeepCollectionEquality().hash(isQuest) ^
      const DeepCollectionEquality().hash(isPublicQuest);

  @JsonKey(ignore: true)
  @override
  _$FocusUserCopyWith<_FocusUser> get copyWith =>
      __$FocusUserCopyWithImpl<_FocusUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FocusUserToJson(this);
  }
}

abstract class _FocusUser implements FocusUser {
  const factory _FocusUser(
      {String? id,
      RealtimeUpdateType? updateType,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int focusTime,
      int? remainingTime,
      bool isOnline,
      int? todayCount,
      bool isQuest,
      bool isPublicQuest}) = _$_FocusUser;

  factory _FocusUser.fromJson(Map<String, dynamic> json) =
      _$_FocusUser.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  RealtimeUpdateType? get updateType => throw _privateConstructorUsedError;
  @override
  @DatetimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  int get focusTime => throw _privateConstructorUsedError;
  @override
  int? get remainingTime => throw _privateConstructorUsedError;
  @override
  bool get isOnline => throw _privateConstructorUsedError;
  @override
  int? get todayCount => throw _privateConstructorUsedError;
  @override
  bool get isQuest => throw _privateConstructorUsedError;
  @override
  bool get isPublicQuest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FocusUserCopyWith<_FocusUser> get copyWith =>
      throw _privateConstructorUsedError;
}
