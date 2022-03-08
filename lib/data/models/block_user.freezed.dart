// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'block_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlockUser _$BlockUserFromJson(Map<String, dynamic> json) {
  return _BlockUser.fromJson(json);
}

/// @nodoc
class _$BlockUserTearOff {
  const _$BlockUserTearOff();

  _BlockUser call(
      {String? id,
      String name = "",
      String photoUrl = "",
      @DatetimeConverter() DateTime? createdAt}) {
    return _BlockUser(
      id: id,
      name: name,
      photoUrl: photoUrl,
      createdAt: createdAt,
    );
  }

  BlockUser fromJson(Map<String, Object> json) {
    return BlockUser.fromJson(json);
  }
}

/// @nodoc
const $BlockUser = _$BlockUserTearOff();

/// @nodoc
mixin _$BlockUser {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  @DatetimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockUserCopyWith<BlockUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockUserCopyWith<$Res> {
  factory $BlockUserCopyWith(BlockUser value, $Res Function(BlockUser) then) =
      _$BlockUserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String photoUrl,
      @DatetimeConverter() DateTime? createdAt});
}

/// @nodoc
class _$BlockUserCopyWithImpl<$Res> implements $BlockUserCopyWith<$Res> {
  _$BlockUserCopyWithImpl(this._value, this._then);

  final BlockUser _value;
  // ignore: unused_field
  final $Res Function(BlockUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$BlockUserCopyWith<$Res> implements $BlockUserCopyWith<$Res> {
  factory _$BlockUserCopyWith(
          _BlockUser value, $Res Function(_BlockUser) then) =
      __$BlockUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String photoUrl,
      @DatetimeConverter() DateTime? createdAt});
}

/// @nodoc
class __$BlockUserCopyWithImpl<$Res> extends _$BlockUserCopyWithImpl<$Res>
    implements _$BlockUserCopyWith<$Res> {
  __$BlockUserCopyWithImpl(_BlockUser _value, $Res Function(_BlockUser) _then)
      : super(_value, (v) => _then(v as _BlockUser));

  @override
  _BlockUser get _value => super._value as _BlockUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_BlockUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BlockUser implements _BlockUser {
  const _$_BlockUser(
      {this.id,
      this.name = "",
      this.photoUrl = "",
      @DatetimeConverter() this.createdAt});

  factory _$_BlockUser.fromJson(Map<String, dynamic> json) =>
      _$_$_BlockUserFromJson(json);

  @override
  final String? id;
  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String photoUrl;
  @override
  @DatetimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'BlockUser(id: $id, name: $name, photoUrl: $photoUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlockUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$BlockUserCopyWith<_BlockUser> get copyWith =>
      __$BlockUserCopyWithImpl<_BlockUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BlockUserToJson(this);
  }
}

abstract class _BlockUser implements BlockUser {
  const factory _BlockUser(
      {String? id,
      String name,
      String photoUrl,
      @DatetimeConverter() DateTime? createdAt}) = _$_BlockUser;

  factory _BlockUser.fromJson(Map<String, dynamic> json) =
      _$_BlockUser.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get photoUrl => throw _privateConstructorUsedError;
  @override
  @DatetimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BlockUserCopyWith<_BlockUser> get copyWith =>
      throw _privateConstructorUsedError;
}
