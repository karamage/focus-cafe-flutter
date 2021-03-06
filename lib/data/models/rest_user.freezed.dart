// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'rest_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestUser _$RestUserFromJson(Map<String, dynamic> json) {
  return _RestUser.fromJson(json);
}

/// @nodoc
class _$RestUserTearOff {
  const _$RestUserTearOff();

  _RestUser call(
      {String? id,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int? chairId,
      bool isOnline = false}) {
    return _RestUser(
      id: id,
      startDate: startDate,
      user: user,
      chairId: chairId,
      isOnline: isOnline,
    );
  }

  RestUser fromJson(Map<String, Object> json) {
    return RestUser.fromJson(json);
  }
}

/// @nodoc
const $RestUser = _$RestUserTearOff();

/// @nodoc
mixin _$RestUser {
  String? get id => throw _privateConstructorUsedError;
  @DatetimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  int? get chairId => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestUserCopyWith<RestUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestUserCopyWith<$Res> {
  factory $RestUserCopyWith(RestUser value, $Res Function(RestUser) then) =
      _$RestUserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int? chairId,
      bool isOnline});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$RestUserCopyWithImpl<$Res> implements $RestUserCopyWith<$Res> {
  _$RestUserCopyWithImpl(this._value, this._then);

  final RestUser _value;
  // ignore: unused_field
  final $Res Function(RestUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? user = freezed,
    Object? chairId = freezed,
    Object? isOnline = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      chairId: chairId == freezed
          ? _value.chairId
          : chairId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOnline: isOnline == freezed
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
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
abstract class _$RestUserCopyWith<$Res> implements $RestUserCopyWith<$Res> {
  factory _$RestUserCopyWith(_RestUser value, $Res Function(_RestUser) then) =
      __$RestUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int? chairId,
      bool isOnline});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$RestUserCopyWithImpl<$Res> extends _$RestUserCopyWithImpl<$Res>
    implements _$RestUserCopyWith<$Res> {
  __$RestUserCopyWithImpl(_RestUser _value, $Res Function(_RestUser) _then)
      : super(_value, (v) => _then(v as _RestUser));

  @override
  _RestUser get _value => super._value as _RestUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? user = freezed,
    Object? chairId = freezed,
    Object? isOnline = freezed,
  }) {
    return _then(_RestUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      chairId: chairId == freezed
          ? _value.chairId
          : chairId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOnline: isOnline == freezed
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestUser implements _RestUser {
  const _$_RestUser(
      {this.id,
      @DatetimeConverter() this.startDate,
      this.user,
      this.chairId,
      this.isOnline = false});

  factory _$_RestUser.fromJson(Map<String, dynamic> json) =>
      _$_$_RestUserFromJson(json);

  @override
  final String? id;
  @override
  @DatetimeConverter()
  final DateTime? startDate;
  @override
  final User? user;
  @override
  final int? chairId;
  @JsonKey(defaultValue: false)
  @override
  final bool isOnline;

  @override
  String toString() {
    return 'RestUser(id: $id, startDate: $startDate, user: $user, chairId: $chairId, isOnline: $isOnline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.chairId, chairId) ||
                const DeepCollectionEquality()
                    .equals(other.chairId, chairId)) &&
            (identical(other.isOnline, isOnline) ||
                const DeepCollectionEquality()
                    .equals(other.isOnline, isOnline)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(chairId) ^
      const DeepCollectionEquality().hash(isOnline);

  @JsonKey(ignore: true)
  @override
  _$RestUserCopyWith<_RestUser> get copyWith =>
      __$RestUserCopyWithImpl<_RestUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestUserToJson(this);
  }
}

abstract class _RestUser implements RestUser {
  const factory _RestUser(
      {String? id,
      @DatetimeConverter() DateTime? startDate,
      User? user,
      int? chairId,
      bool isOnline}) = _$_RestUser;

  factory _RestUser.fromJson(Map<String, dynamic> json) = _$_RestUser.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @DatetimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  int? get chairId => throw _privateConstructorUsedError;
  @override
  bool get isOnline => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RestUserCopyWith<_RestUser> get copyWith =>
      throw _privateConstructorUsedError;
}
